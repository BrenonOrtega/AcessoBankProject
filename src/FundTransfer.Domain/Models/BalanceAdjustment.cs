using System;
using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations;
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
        [JsonConverter(typeof(JsonStringEnumConverter))]
        public BalanceAdjustmentOperations Type { get; set; }

        public override string ToString() => 
            $"Account Number: { AccountNumber } | Operation Type: { Type } | Value: { Value } | ";

    }
}
