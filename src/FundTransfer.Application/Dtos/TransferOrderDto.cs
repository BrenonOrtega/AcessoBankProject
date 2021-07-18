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
            var sameAccountNumbers = SourceAccountNumber.Equals(DestinationAccountNumber);
            var sourceAccountValid = false.Equals(String.IsNullOrEmpty(SourceAccountNumber));
            var destinationAccountValud = false.Equals(String.IsNullOrEmpty(DestinationAccountNumber));
            var validValue = Value >= Decimal.Zero;

            return sameAccountNumbers == false && sourceAccountValid && destinationAccountValud &&  validValue;
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

            throw new ArgumentException();
        }
    }
}