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


        public bool IsValid()
        {
            return ValidTransactionId() && ValidAccountNumbers() && ValidTransactionValue();
        }

        private bool ValidTransactionId()
        {
            if (TransactionId.Equals(Guid.Empty))
            {
                SetErrorStatus("Transaction Id cannot be empty.");
                return false;
            }

            return true;
        }

        private bool ValidAccountNumbers()
        {
            if (String.IsNullOrEmpty(SourceAccountNumber))
            {
                SetErrorStatus("Invalid source account number");
                return false;
            }

            if (String.IsNullOrEmpty(DestinationAccountNumber))
            {
                SetErrorStatus("Invalid destination account number");
                return false;
            }

            return true;
        }

        private bool ValidTransactionValue()
        {
            if (Value <= Decimal.Zero)
            {
                SetErrorStatus("Invalid Transaction Value");
                return false;
            }
            return true;
        }

        public void SetErrorStatus(string errorMessage)
        {
            Status = TransferOrderStatus.Error;
            ErrorMessage = errorMessage;
        }

        public void SetProcessingStatus() => Status = TransferOrderStatus.Processing;

        public void ConfirmStatus() => Status = TransferOrderStatus.Confirmed;

        private void NotifyPropertyChanged() => UpdatedAt = DateTime.Now;

        public override string ToString() =>
            $"Id: { TransactionId } | From: { SourceAccountNumber } | To: { DestinationAccountNumber } | Value: { Value }";
    }
}