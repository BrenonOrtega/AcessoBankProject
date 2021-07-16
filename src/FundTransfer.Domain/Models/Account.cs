using System;

namespace FundTransfer.Domain.Models
{
    public class Account
    {
        public int Id { get; set;}

        public decimal Balance { get; set; }

        public string AccountNumber { get; set; }

        public bool IsEmpty()
        {
            return Id.Equals(0) 
                && Balance.Equals(decimal.Zero) 
                && String.IsNullOrEmpty(AccountNumber)
                ;
        }
    }
}