using System;
using System.Net.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using FundTransfer.Infra.Data;
using FundTransfer.Infra.Services;
using FundTransfer.Infra.Repositories.Commands;
using FundTransfer.Infra.Repositories.Queries;
using FundTransfer.Domain.Repositories.Commands;
using FundTransfer.Domain.Repositories.Queries;
using Polly.Extensions.Http;
using Polly;

namespace FundTransfer.Infra.Helpers
{
    public static class ServicesSetup
    {
        public static IServiceCollection AddFundTransferDb(this IServiceCollection services, IConfiguration config)
        {
            services.AddDbContext<FundTransferContext>(optionsBuilder =>
            {
                optionsBuilder.UseNpgsql(config.GetConnectionString("postgres"), npgsqlBuilder =>
                {
                    npgsqlBuilder.MigrationsAssembly("FundTransfer.Application");
                });
            });

            return services;
        }

        public static IServiceCollection AddRepositories(this IServiceCollection services)
        {
            services.AddTransient<IAccountQueryRepository, HttpAccountQueryRepository>();
            services.AddTransient<IBalanceAdjustmentCommandRepository, HttpBalanceAdjustmentCommandRepository>();
            services.AddTransient<ITransferOrderCommandRepository, TransferOrderCommandRepository>();
            services.AddTransient<ITransferOrderQueryRepository, TransferOrderQueryRepository>();

            return services;
        }

        public static IServiceCollection AddTransferOrderMessageQueue(this IServiceCollection services)
        {
            services.AddSingleton<TransferOrderPublisher>();

            return services;
        }

        public static IServiceCollection AddTransferOrderMessageConsumer(this IServiceCollection services)
        {
            services.AddHostedService<TransferOrderConsumerService>();

            return services;
        }

        public static IServiceCollection AddAccountApiIntegration(this IServiceCollection services)
        {
            var defaultTimeSpan = TimeSpan.FromMinutes(5);
            services.AddHttpClient<AccountService>()
                .SetHandlerLifetime(defaultTimeSpan)
                .AddPolicyHandler(GetRetryPolicy());

            services.AddHttpClient<BalanceAdjustmentService>()
                .SetHandlerLifetime(defaultTimeSpan)
                .AddPolicyHandler(GetRetryPolicy());

            return services;
        }

        private static IAsyncPolicy<HttpResponseMessage> GetRetryPolicy()
        {
            return HttpPolicyExtensions
                .HandleTransientHttpError()
                .OrResult(msg => msg.IsSuccessStatusCode.Equals(false))
                .WaitAndRetryAsync(10, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2, retryAttempt)))
                ;

        }    
    }
}