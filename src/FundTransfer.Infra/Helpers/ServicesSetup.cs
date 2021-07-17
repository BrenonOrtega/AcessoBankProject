using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Microsoft.EntityFrameworkCore;
using FundTransfer.Infra.Data;
using FundTransfer.Infra.Services;
using FundTransfer.Infra.Repositories.Commands;
using FundTransfer.Infra.Repositories.Queries;
using FundTransfer.Domain.Repositories.Commands;
using FundTransfer.Domain.Repositories.Queries;

namespace FundTransfer.Infra.Helpers
{
    public static class ServicesSetup
    {
        public static IServiceCollection SetupApplicationInfra(this IServiceCollection services, IConfiguration config)
        {
            services.AddDbContext<FundTransferContext>(optionsBuilder =>
            {
                optionsBuilder.UseNpgsql(config.GetConnectionString("postgres"), npgsqlBuilder => {
                    npgsqlBuilder.MigrationsAssembly("FundTransfer.Application");
                });
            });

            services.AddSingleton<TransferOrderPublisher>();

            services.AddTransient<IAccountQueryRepository, HttpAccountQueryRepository>();
            services.AddTransient<IBalanceAdjustmentCommandRepository, HttpBalanceAdjustmentCommandRepository>();
            services.AddTransient<ITransferOrderCommandRepository, TransferOrderCommandRepository>();
            services.AddTransient<ITransferOrderQueryRepository, TransferOrderQueryRepository>();

            return services;
        }
    }
}