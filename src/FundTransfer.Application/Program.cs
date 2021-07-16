using System;
using System.Linq;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Serilog;
using System.Security.Authentication;

namespace AcessoTest.FundTransfer.Application
{
    public class Program
    {
        public static void Main(string[] args)
        {
            

            CreateHostBuilder(args)
                .UseSerilog()
                .Build()
                .Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                     webBuilder.UseKestrel(kestrelOptions =>
                    {
                        kestrelOptions.ConfigureHttpsDefaults(httpsOptions =>
                        {
                            httpsOptions.SslProtocols = SslProtocols.Tls11 | SslProtocols.Tls12;
                        });
                    });
                    
                    webBuilder.UseStartup<Startup>();
                });
    }
}
