using System;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using FundTransfer.Domain.Enum;

namespace FundTransfer.Domain.Models
{
    public class BalanceAdjustment
    {

        [Required]
        public string AccountNumber { get; set; }

        
        [Required, Range(0, double.PositiveInfinity)]
        public decimal Value { get; set; }
        

        [EnumDataType(typeof(BalanceAdjumentOperations))]
        [JsonConverter(typeof(BalanceAdjumentOperations))]
        public BalanceAdjumentOperations Type { get; set; }

    }
}
