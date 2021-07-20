using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using FundTransfer.Application.Dtos;
using System;
using System.Net;
using FundTransfer.Application.Services;
using FundTransfer.Domain.Enum;

namespace FundTransfer.Application.Controllers
{
    [ApiController]
    [Route("fund-transfer")]
    public class FundTransferController : ControllerBase
    {
        private readonly TransferOrderService _service;

        public FundTransferController(TransferOrderService service)
        {
            _service = service;
        }

        [HttpPost]
        [ProducesResponseType((int)HttpStatusCode.Created)]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> Post([FromBody] TransferOrderDto orderDto)
        {
            var order = await _service.CreateOrder(orderDto);

            if (order.Status != TransferOrderStatus.Error.ToString())
            {
                var response = new { order.TransactionId };
                return CreatedAtAction(nameof(Get), response, response);
            }
            return BadRequest(order);
        }

        [HttpGet]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.NoContent)]
        public async Task<IActionResult> Get()
        {
            var orders = await _service.GetOrderStatus();

            return orders.Any()
                ? Ok(orders.Select(order => new { order.TransactionId, order.Status }))
                : NoContent();
        }

        [HttpGet("{transactionId}")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public async Task<IActionResult> Get(Guid transactionId)
        {
            var order = await _service.GetById(transactionId);

            return order.Status != TransferOrderStatus.Error.ToString()
                ? Ok(new { order.Status })
                : NotFound(new { order.Status, order.ErrorMessage });
        }
    }
}