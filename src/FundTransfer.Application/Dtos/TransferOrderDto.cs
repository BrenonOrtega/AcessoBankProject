using System;
using Microsoft.Extensions.Logging;
using System.ComponentModel.DataAnnotations;
using FundTransfer.Domain.Models;

namespace FundTransfer.Application.Dtos
{
    public class TransferOrderDto
    {
        private readonly ILogger<TransferOrderDto> _logger;

        [Required(AllowEmptyStrings = false), MinLength(5)]
        public string SourceAccountNumber { get; init; }

        [Required(AllowEmptyStrings = false), MinLength(5)]
        public string DestinationAccountNumber { get; init; }

        [Required, Range(0, double.PositiveInfinity)]
        public decimal Value { get; init; }

        public TransferOrderDto()
        {
            
        }
        public TransferOrderDto(ILogger<TransferOrderDto> logger)
        {
            _logger = logger;
        }

        public bool IsValid()
        {
            var nullOrEmpties = ! (String.IsNullOrEmpty(SourceAccountNumber) || String.IsNullOrEmpty(DestinationAccountNumber));
            var accountsEquals = SourceAccountNumber.Equals(DestinationAccountNumber);
            var invalidValue = Value <= Decimal.Zero;

            return !(nullOrEmpties && accountsEquals && invalidValue);
        }

        public TransferOrder ToTransferOrder()
        {
            if (IsValid())
                return new TransferOrder()
                {
                    SourceAccountNumber = SourceAccountNumber,
                    DestinationAccountNumber = SourceAccountNumber,
                    Value = Value,
                };

            _logger.LogError("Invalid information was provided for transfer order creation - {order}, {SourceAccountNumber}, {DestinationAccountNumber}",
                this,
                SourceAccountNumber,
                DestinationAccountNumber
            );

            throw new ArgumentException();
        }
    }
}