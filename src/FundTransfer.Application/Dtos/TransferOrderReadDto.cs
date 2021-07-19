using System;
using System.ComponentModel.DataAnnotations;
using FundTransfer.Domain.Enum;
using FundTransfer.Domain.Models;

namespace FundTransfer.Application.Dtos
{
    public class TransferOrderReadDto
    {
        public Guid TransactionId { get; set; }

        [EnumDataType(typeof(TransferOrderStatus))]
        public string Status { get; set; }

        public string ErrorMessage { get; set; }

        public static implicit operator TransferOrderReadDto(TransferOrder order)
        {
            return new TransferOrderReadDto() 
            {
                TransactionId = order.TransactionId,
                Status = order.Status.ToString(),
                ErrorMessage = order.ErrorMessage
            };
        }
    }
}
