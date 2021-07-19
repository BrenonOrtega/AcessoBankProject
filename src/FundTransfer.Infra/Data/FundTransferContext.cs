using FundTransfer.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace FundTransfer.Infra.Data
{
    public class FundTransferContext : DbContext
    {
        public FundTransferContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<TransferOrder> TransferOrders { get; set; }
    }
}