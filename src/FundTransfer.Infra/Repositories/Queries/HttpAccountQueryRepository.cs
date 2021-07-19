using System.Net;
using System.Text;
using System.Text.Json;
using System.Net.Http;
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
        public ILogger _logger;
        
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

            return accounts;
        }

        public async Task<Account> GetByAccountNumber(string accountNumber)
        {
            var response = await _service.GetByAccountNumber(accountNumber);
            
            if (response.StatusCode.Equals(HttpStatusCode.NotFound))
                return new Account();
            
            var content = await response.Content.ReadAsByteArrayAsync();
            var encodedContent = Encoding.UTF8.GetString(content);
            var account = JsonSerializer.Deserialize<Account>(encodedContent, new JsonSerializerOptions(JsonSerializerDefaults.Web));

            return account;
        }
    } 
}