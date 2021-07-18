using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using FundTransfer.Domain.Models;
using Microsoft.Extensions.Configuration;

namespace FundTransfer.Infra.Services
{
    public class AccountService
    {
        private const string accountApiConfigName = "AccountApi";
        private readonly HttpClient _client;

        public AccountService(HttpClient client, IConfiguration config)
        {
            client.BaseAddress = new Uri(config.GetValue<string>(accountApiConfigName));
            client.DefaultRequestHeaders.Add("Accept", "application/json");
            client.DefaultRequestHeaders.Add("User-Agent", "FundTransferApplication");

            _client = client;
        }

        public async Task<IEnumerable<Account>> GetAccounts()
        {
            return await _client.GetFromJsonAsync<IEnumerable<Account>>("/api/Account");
        }

        public async Task<Account> GetByAccountNumber(string accountNumber)
        {
            var account = await _client.GetFromJsonAsync<Account>($"/api/Account/{ accountNumber }");

            return account;
        }
    }
}