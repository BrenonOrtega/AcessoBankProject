using System;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using FundTransfer.Domain.Enum;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Services;
using FundTransfer.Domain.Repositories.Commands;

namespace FundTransfer.Infra.Repositories.Commands
{
    public class HttpBalanceAdjustmentCommandRepository : IBalanceAdjustmentCommandRepository
    {
        private readonly IBalanceAdjustmentService _service;

        private readonly ILogger<HttpBalanceAdjustmentCommandRepository> _logger;

        public HttpBalanceAdjustmentCommandRepository(IBalanceAdjustmentService service, ILogger<HttpBalanceAdjustmentCommandRepository> logger)
        {
            _service = service;
            _logger = logger;
        }

        public async Task PostAdjustment(BalanceAdjustment adjustment)
        {
            try
            {
                await _service.PostAdjustmentAsync(adjustment);
            }
            catch (HttpRequestException httpResEx)
            {
                _logger.LogCritical(httpResEx, httpResEx.Message);
            }
        }

        public async Task PostDebitAdjustment(string accountNumber, decimal value)
        {
            var debitAdjustment = new BalanceAdjustment()
            {
                AccountNumber = accountNumber,
                Type = BalanceAdjustmentOperations.Debit,
                Value = value
            };

            await PostAdjustment(debitAdjustment);

            _logger.LogInformation(
                "{OperationType} operation executed at {date}" +
                "Account Number: {accountNumber} - Value: {value}",
                BalanceAdjustmentOperations.Debit,
                DateTime.Now,
                accountNumber,
                value
            );
        }

        public async Task PostCreditAdjustment(string accountNumber, decimal value)
        {
            var creditAdjustment = new BalanceAdjustment()
            {
                AccountNumber = accountNumber,
                Type = BalanceAdjustmentOperations.Credit,
                Value = value
            };

            await PostAdjustment(creditAdjustment);

            _logger.LogInformation(
                "{OperationType} operation executed at {date}" +
                "Account Number: {accountNumber} - Value: {value}",
                BalanceAdjustmentOperations.Credit,
                DateTime.Now,
                accountNumber,
                value
            );
        }
    }
}