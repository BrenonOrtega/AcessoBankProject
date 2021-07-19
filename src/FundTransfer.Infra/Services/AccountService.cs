using System;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using FundTransfer.Domain.Services;

namespace FundTransfer.Infra.Services
{
    public class AccountService : IAccountService<HttpResponseMessage>
    {
        private const string ACCOUNT_API_CONFIG_BASE_URL = "AccountApi";
        private const string ACCOUNT_API_CONFIG_GET_BY_NUMBER_ENDPOINT = "AccountApi-GetAccount";

        private readonly string getAccountEndpoint;

        private readonly HttpClient _client;

        public AccountService(HttpClient client, IConfiguration config)
        {
            client.BaseAddress = new Uri(config.GetValue<string>(ACCOUNT_API_CONFIG_BASE_URL));
            client.DefaultRequestHeaders.Add("Accept", "application/json");
            client.DefaultRequestHeaders.Add("User-Agent", "FundTransferApplication");

            getAccountEndpoint = config.GetValue<string>(ACCOUNT_API_CONFIG_GET_BY_NUMBER_ENDPOINT);
            _client = client;
        }

        public async Task<HttpResponseMessage> GetAccounts()
        {
            var response = await _client.GetAsync(getAccountEndpoint);
            response.EnsureSuccessStatusCode();

            return response;
        }

        public async Task<HttpResponseMessage> GetByAccountNumber(string accountNumber)
        {
            var response = await _client.GetAsync($"{ getAccountEndpoint }/{ accountNumber }", HttpCompletionOption.ResponseContentRead);
            response.EnsureSuccessStatusCode();

            return response;
        }
    }
}