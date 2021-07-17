using System;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using FundTransfer.Domain.Models;
using Microsoft.Extensions.Configuration;

namespace FundTransfer.Infra.Services
{
    public class BalanceAdjustmentService
    {
        private const string accountApiConfigName = "AccountApi";
        private readonly HttpClient _client;

        public BalanceAdjustmentService(HttpClient client, IConfiguration config)
        {
            client.BaseAddress = new Uri(config.GetValue<string>(accountApiConfigName));
            client.DefaultRequestHeaders.Add("Accept", "application/json");
            client.DefaultRequestHeaders.Add("User-Agent", "FundTransferApplication");

            _client = client;
        }

        public async Task PostAdjustmentAsync(BalanceAdjustment adjustment)
        {
            var adjustmentJson = new StringContent(
                JsonSerializer.Serialize(
                    adjustment,
                    new JsonSerializerOptions()
                    {
                        AllowTrailingCommas = true,
                        PropertyNameCaseInsensitive = true,
                        WriteIndented = true
                    }
                ),
                Encoding.UTF8,
                "application/json");

            using var httpResponse = await _client.PostAsync("/api/Account", adjustmentJson);

            httpResponse.EnsureSuccessStatusCode();
        }
    }
}
