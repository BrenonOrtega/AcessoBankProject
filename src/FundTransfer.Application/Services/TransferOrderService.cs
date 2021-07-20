using System;
using System.Linq;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;
using FundTransfer.Application.Dtos;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Commands;
using FundTransfer.Domain.Repositories.Queries;

namespace FundTransfer.Application.Services
{
    public class TransferOrderService
    {
        private readonly IAccountQueryRepository _accountQuerier;

        private readonly ITransferOrderCommandRepository _orderCommander;

        private readonly ITransferOrderQueryRepository _orderQuerier;

        private readonly ILogger<TransferOrderService> _logger;

        public TransferOrderService(
            IAccountQueryRepository accountQuerier,
            ITransferOrderCommandRepository orderCommander,
            ITransferOrderQueryRepository orderQuerier,
            ILogger<TransferOrderService> logger)
        {
            _accountQuerier = accountQuerier;
            _orderCommander = orderCommander;
            _orderQuerier = orderQuerier;
            _logger = logger;
        }

        public async Task<IEnumerable<TransferOrderReadDto>> GetOrderStatus()
        {
            var orders = await _orderQuerier.GetAll();
            var readOrders = orders.Select(order => new TransferOrderReadDto(order));

            return readOrders;
        }

        public async Task<TransferOrderReadDto> GetById<T>(T orderId)
        {
            var order = await _orderQuerier.GetById(orderId);

            var orderDto = order is not null
                ? new TransferOrderReadDto(order)
                : new TransferOrderReadDto("Transfer order does not exist");

            _logger.LogInformation(
                "Transfer order queried:{order} Id: {transactionId} | Status: {status}",
                order,
                order.TransactionId,
                order.Status);

            return orderDto;
        }

        public async Task<TransferOrderReadDto> CreateOrder(TransferOrderDto orderDto)
        {
            try
            {
                TransferOrder order = orderDto.ToTransferOrder();
                var result = await ValidateOrder(order);
                var readDto = new TransferOrderReadDto(order);

                if (result is false)
                {
                    var errorMsg = $"Error while processing order Request Number {order.TransactionId}: {order.ErrorMessage}";
                    _logger.LogError(errorMsg, order.TransactionId, order.ErrorMessage, order);
                }

                _logger.LogInformation("Created Order {order} | Id: {transactionId}", order, order.TransactionId);
                return readDto;
            }
            catch (ArgumentException ae)
            {
                _logger.LogError(ae, ae.Message);
                return new TransferOrderReadDto(ae.Message);
            }
        }

        private async Task<bool> ValidateOrder(TransferOrder order)
        {
            var (source, destination) = await GetOrderAccounts(order);

            if (ValidAccounts(source, destination) && ValidTransfer(source, order))
            {
                await _orderCommander.Create(order);
                return true;
            }
            return false;
        }

        private bool ValidAccounts(Account source, Account destination) =>
            source.IsValid() && destination.IsValid();

        private bool ValidTransfer(Account sourceAccount, TransferOrder order) =>
            sourceAccount.Balance >= order.Value;

        private async Task<(Account sourceAccount, Account destinationAccount)> GetOrderAccounts(TransferOrder orderDto)
        {
            if (orderDto.IsValid())
            {
                var sourceAccountNumber = orderDto.SourceAccountNumber;
                var sourceAccount = await _accountQuerier.GetByAccountNumber(sourceAccountNumber);

                var destinationAccountNumber = orderDto.DestinationAccountNumber;
                var destinationAccount = await _accountQuerier.GetByAccountNumber(destinationAccountNumber);

                return (sourceAccount, destinationAccount);
            }
            throw new ArgumentException(orderDto.ErrorMessage);
        }
    }
}
