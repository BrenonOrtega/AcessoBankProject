using System;
using FundTransfer.Domain.Repositories.Queries;

namespace FundTransfer.Domain.Models
{
    public class Account
    {
        public int Id { get; set; }

        public decimal Balance { get; set; }

        public string AccountNumber { get; set; }

        public bool IsValid()
        {
            if (Id.Equals(0) && Balance.Equals(decimal.Zero) && String.IsNullOrEmpty(AccountNumber))
            {
                return false;
            }

            return true;
        }
    }
}