using System.Text.Json.Serialization;

namespace FundTransfer.Domain.Enum
{
    public enum TransferOrderStatus
    {
        InQueue,
        Processing,
        Confirmed,
        Error
    }
}