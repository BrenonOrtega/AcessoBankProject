using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using FundTransfer.Domain.Repositories.Queries;

namespace FundTransfer.Application.Controllers
{
    [ApiController]
    [Route("[Controller]")]
    public class AccountsController : ControllerBase
    {
        private readonly IAccountQueryRepository _accountRepository;
        private readonly ILogger _logger;


        public AccountsController(IAccountQueryRepository accountRepository, ILogger<AccountsController> logger)
        {
            _accountRepository = accountRepository;
            _logger = logger;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var accounts = await _accountRepository.GetAll();
            _logger.LogInformation($"Executed: {nameof(Get)} - Queried Accounts Count: { accounts.Count() } ");
            return Ok(accounts);
        }

        [HttpGet("{accountNumber}")]
        public async Task<IActionResult> Get(string accountNumber)
        {
            var account = await _accountRepository.GetByAccountNumber(accountNumber);

            return account.IsEmpty()
                ? NotFound()
                : Ok(account);
        }

        
    }
}