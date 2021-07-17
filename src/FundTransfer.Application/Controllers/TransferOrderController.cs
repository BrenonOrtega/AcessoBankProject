using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Queries;
using FundTransfer.Domain.Repositories.Commands;
using System.Linq;
using System;
using FundTransfer.Application.Dtos;

namespace FundTransfer.Application.Controllers
{
    [ApiController]
    [Route("fund-transfer")]
    public class FundTransferController : ControllerBase
    {
        private readonly IAccountQueryRepository _accountQuerier;
        private readonly ITransferOrderCommandRepository _transferOrderCommander;
        private readonly ITransferOrderQueryRepository _transferOrderQuerier;
        private readonly ILogger<FundTransferController> _logger;

        public FundTransferController(
            IAccountQueryRepository accountQuerier,
            ITransferOrderCommandRepository transferOrderCommander,
            ITransferOrderQueryRepository transferOrderQuerier,
            ILogger<FundTransferController> logger)
        {
            _accountQuerier = accountQuerier;
            _transferOrderCommander = transferOrderCommander;
            _transferOrderQuerier = transferOrderQuerier;
            _logger = logger;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromBody]TransferOrderDto orderDto)
        {
            var (sourceAccount, destinationAccount) = await GetOrderAccounts(orderDto);

            if(IsOperationAccountsValid(sourceAccount, destinationAccount))
            {
                TransferOrder order = orderDto.ToTransferOrder();

                if (order.IsValid() is false)
                    return Problem();

                await _transferOrderCommander.Create(order);

                var result = new { order.TransactionId };
                return CreatedAtAction(nameof(Get), result, result);
            }

            return Problem();
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var orders = await _transferOrderQuerier.GetAll();
            var status = orders.Select(order => new { order.TransactionId, order.Status });
            return Ok(status);
        }

        private bool IsOperationAccountsValid(Account source, Account destination)
        {
            return source.IsValid() && destination.IsValid();
        }

        private async Task<(Account sourceAccount, Account destinationAccount)> GetOrderAccounts(TransferOrderDto orderDto)
        {
            var sourceAccountNumber = orderDto.SourceAccountNumber;
            var sourceAccount = await _accountQuerier.GetByAccountNumber(sourceAccountNumber);

            var destinationAccountNumber = orderDto.DestinationAccountNumber;
            var destinationAccount = await _accountQuerier.GetByAccountNumber(destinationAccountNumber);

            return (sourceAccount, destinationAccount);
        }
    }


}