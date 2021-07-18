using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using FundTransfer.Infra.Services;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Commands;
using FundTransfer.Domain.Enum;
using System;

namespace FundTransfer.Infra.Repositories.Commands
{
    public class HttpBalanceAdjustmentCommandRepository : IBalanceAdjustmentCommandRepository
    {
        private readonly BalanceAdjustmentService _service;
        private readonly ILogger<HttpBalanceAdjustmentCommandRepository> _logger;

        public HttpBalanceAdjustmentCommandRepository(BalanceAdjustmentService service, ILogger<HttpBalanceAdjustmentCommandRepository> logger)
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

             var date = DateTime.Now;
            _logger.LogInformation("{OperationType} operation executed at {date} Account Number: {accountNumber} - Value: {value}",
                BalanceAdjustmentOperations.Debit,
                date, 
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

            var date = DateTime.Now;
            _logger.LogInformation("{OperationType} operation executed at {date} Account Number: {accountNumber} - Value: {value}",
                BalanceAdjustmentOperations.Credit,
                date,
                accountNumber,
                value
            );
        }
    }
}