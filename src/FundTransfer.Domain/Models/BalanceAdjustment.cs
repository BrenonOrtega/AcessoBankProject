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
        

        [EnumDataType(typeof(BalanceAdjustmentOperations))]
        [JsonConverter(typeof(BalanceAdjustmentOperations))]
        public BalanceAdjustmentOperations Type { get; set; }

    }
}
