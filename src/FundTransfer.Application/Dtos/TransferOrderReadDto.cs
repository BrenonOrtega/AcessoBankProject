using System;
using System.ComponentModel.DataAnnotations;
using FundTransfer.Domain.Enum;
using FundTransfer.Domain.Models;

namespace FundTransfer.Application.Dtos
{
    public class TransferOrderReadDto
    {
        public Guid TransactionId { get; private set; }

        [EnumDataType(typeof(TransferOrderStatus))]
        public string Status { get; init; }

        public string ErrorMessage { get; init; }

        public TransferOrderReadDto(string errorMessage)
        {
            TransactionId = Guid.Empty;
            Status = TransferOrderStatus.Error.ToString();
            ErrorMessage = errorMessage;
        }

        public TransferOrderReadDto(TransferOrder order)
        {
            TransactionId = order.TransactionId;
            Status = order.Status.ToString();
            ErrorMessage = order.ErrorMessage;
        }
    }
}
