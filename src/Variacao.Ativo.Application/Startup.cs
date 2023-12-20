using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Variacao.Ativo.Domain.Entities;
using Variacao.Ativo.Domain.Interfaces;
using Variacao.Ativo.Infra.Data.Context;
using Variacao.Ativo.Infra.Data.Repository;
using Variacao.Ativo.Service.Services;

namespace Variacao.Ativo.Application
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<SqlContext>(options =>
            options.UseSqlServer(Configuration.GetConnectionString("Conexao") ?? throw new InvalidOperationException("Connection string 'Context' not found.")));
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            services.AddScoped<SqlContext, SqlContext>();
            services.AddHttpClient<IService<ConsultAtivo>> ("", c =>
            {
                c.BaseAddress = new Uri(Configuration["ServiceUrls:BaseUrl"]);
                c.DefaultRequestHeaders.Add("Accept", "application/json");
                c.DefaultRequestHeaders.Add("User-Agent", "HttpClientFactury-sample");
            });
                   
                 
            services.AddControllers();
            services.AddScoped<IService<ConsultAtivo>,BaseService<ConsultAtivo>>();
            services.AddScoped<IRepository<ConsultAtivo>, BaseRepository<ConsultAtivo>>();
            services.AddHostedService<AtivoHostedService>();
            services.AddSwaggerGen();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Variacao.Ativo v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
