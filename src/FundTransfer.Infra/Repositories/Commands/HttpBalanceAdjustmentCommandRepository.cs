using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using FundTransfer.Infra.Services;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Repositories.Commands;

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
    }
}