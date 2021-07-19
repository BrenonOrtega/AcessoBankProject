using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using FundTransfer.Domain.Repositories.Queries;
using System.Net;

namespace FundTransfer.Application.Controllers
{
    [ApiController]
    [Route("[Controller]")]
    public class AccountsController : ControllerBase
    {
        private readonly IAccountQueryRepository _accountRepository;

        public AccountsController(IAccountQueryRepository accountRepository)
        {
            _accountRepository = accountRepository;
        }

        [HttpGet]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.NoContent)]
        public async Task<IActionResult> Get()
        {
            var accounts = await _accountRepository.GetAll();
            return Ok(accounts);
        }

        [HttpGet("{accountNumber}")]
        [ProducesResponseType((int)HttpStatusCode.OK)]
        [ProducesResponseType((int)HttpStatusCode.NotFound)]
        public async Task<IActionResult> Get(string accountNumber)
        {
            var account = await _accountRepository.GetByAccountNumber(accountNumber);
            
            return account.IsValid()
                ? Ok(account)
                : NotFound()
                ;
        }

    }
}