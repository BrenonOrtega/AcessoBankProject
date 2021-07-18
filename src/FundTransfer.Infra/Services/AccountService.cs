using System;
using System.Text;
using System.Text.Json;
using System.Net;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using System.Collections.Generic;
using Microsoft.Extensions.Configuration;
using FundTransfer.Domain.Models;
using FundTransfer.Domain.Services;

namespace FundTransfer.Infra.Services
{
    public class AccountService : IAccountService
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

        public async Task<IEnumerable<Account>> GetAccounts()
        {
            return await _client.GetFromJsonAsync<IEnumerable<Account>>(getAccountEndpoint);
        }

        public async Task<Account> GetByAccountNumber(string accountNumber)
        {
            var response = await _client.GetAsync($"{ getAccountEndpoint }/{ accountNumber }", HttpCompletionOption.ResponseContentRead);

            if (response.StatusCode.Equals(HttpStatusCode.NotFound))
            {
                return new Account();
            }

            var content = await response.Content.ReadAsByteArrayAsync();
            var encodedContent = Encoding.UTF8.GetString(content);
            var account = JsonSerializer.Deserialize<Account>(encodedContent, new JsonSerializerOptions(JsonSerializerDefaults.Web));

            return account;
        }
    }
}