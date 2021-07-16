using System.Threading.Tasks;
using System.Collections.Generic;
using FundTransfer.Domain.Repositories.Commands;
using FundTransfer.Domain.Repositories;
using FundTransfer.Domain.Repositories.Queries;
using FundTransfer.Domain.Models;
using FundTransfer.Infra.Services;
using Microsoft.Extensions.Logging;

namespace FundTransfer.Infra.Repositories.Queries
{
    public class HttpAccountQueryRepository : IAccountQueryRepository
    {
        private readonly AccountService _service;
        public ILogger _logger;
        
        public HttpAccountQueryRepository(AccountService service, ILogger<HttpAccountQueryRepository> logger)
        {
            _service = service;
            _logger = logger;
        }

        public async Task<IEnumerable<Account>> GetAll()
        {
            var accounts = await _service.GetAccounts();
            return accounts;
        }

        public async Task<Account> GetByAccountNumber(string accountNumber)
        {
            var account = await _service.GetByAccountNumber(accountNumber);
            return account;
        }

       
    } 
    
}