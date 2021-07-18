using Microsoft.EntityFrameworkCore.Migrations;

namespace FundTransfer.Application.Migrations
{
    public partial class errorMessageforTransferOrder : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ErrorMessage",
                table: "TransferOrders",
                type: "text",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ErrorMessage",
                table: "TransferOrders");
        }
    }
}
