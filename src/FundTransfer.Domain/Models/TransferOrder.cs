using System;
using System.ComponentModel.DataAnnotations;
using FundTransfer.Domain.Enum;

namespace FundTransfer.Domain.Models
{
    public class TransferOrder
    {
        [Key]
        [Required]
        public Guid TransactionId { get; init; } = new Guid();

        public DateTime CreatedAt { get; init; } = DateTime.Now;

        public DateTime UpdatedAt { get; private set; } = DateTime.Now;

        [Required, MinLength(5)]
        public string SourceAccountNumber { get; init; }

        [Required, MinLength(5)]
        public string DestinationAccountNumber { get; init; }

        [Required]
        public decimal Value { get; init; }

        private TransferOrderStatus _status;

        [EnumDataType(typeof(TransferOrderStatus))]
        public TransferOrderStatus Status
        {
            get => _status;
            private set
            {
                _status = value;
                NotifyPropertyChanged();
            }
        }

        public string ErrorMessage { get; set; }

        private void NotifyPropertyChanged()
        {
            UpdatedAt = DateTime.Now;
        }

        public bool IsValid()
        {
            return !(  TransactionId.Equals(Guid.Empty)
                    &&(String.IsNullOrEmpty(SourceAccountNumber) || String.IsNullOrEmpty(DestinationAccountNumber))
                    && Value >= Decimal.Zero
                    && CreatedAt <= UpdatedAt
                );
        }

        public void SetProcessingStatus() => Status = TransferOrderStatus.Processing;

        public void ConfirmStatus() => Status = TransferOrderStatus.Confirmed;

        public void SetErrorStatus(string errorMessage)
        {
            Status = TransferOrderStatus.Error;
            ErrorMessage = errorMessage;
        }
    }
}