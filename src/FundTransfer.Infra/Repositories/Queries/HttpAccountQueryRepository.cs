using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Services;
using FundTransfer.Domain.Repositories.Queries;

namespace FundTransfer.Infra.Repositories.Queries
{
    public class HttpAccountQueryRepository : IAccountQueryRepository
    {
        private readonly IAccountService<HttpResponseMessage> _service;
        private readonly ILogger _logger;

        public HttpAccountQueryRepository(IAccountService<HttpResponseMessage> service, ILogger<HttpAccountQueryRepository> logger)
        {
            _service = service;
            _logger = logger;
        }

        public async Task<IEnumerable<Account>> GetAll()
        {
            var response = await _service.GetAccounts();
            var content = await response.Content.ReadAsByteArrayAsync();
            var encodedContent = Encoding.UTF8.GetString(content);
            var accounts = JsonSerializer.Deserialize<IEnumerable<Account>>(encodedContent, new JsonSerializerOptions(JsonSerializerDefaults.Web));

            _logger.LogInformation("{accountsCount} returned from query to Api-conta at {datetime}.", accounts.Count(), DateTime.Now);

            return accounts;
        }

        public async Task<Account> GetByAccountNumber(string accountNumber)
        {
            var response = await _service.GetByAccountNumber(accountNumber);

            if (response.StatusCode.Equals(HttpStatusCode.NotFound))
            {
                _logger.LogWarning(
                    "Account Number: {accountNumber} returned an Http Not Found Status Code (400)" +
                    "while reaching to Api-conta at {datetime}.",
                    accountNumber, DateTime.Now);

                return new Account();
            }

            var content = await response.Content.ReadAsByteArrayAsync();
            var encodedContent = Encoding.UTF8.GetString(content);
            var account = JsonSerializer.Deserialize<Account>(encodedContent, new JsonSerializerOptions(JsonSerializerDefaults.Web));

            _logger.LogInformation(
                "Account Number: {accountNumber} returned with a succesfull status code" +
                "while reaching to Api-conta at {datetime}.",
                accountNumber,
                DateTime.Now);

            return account;
        }
    }
}