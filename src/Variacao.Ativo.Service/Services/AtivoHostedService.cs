using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Threading;
using System.Threading.Tasks;
using Variacao.Ativo.Domain.Entities;
using Variacao.Ativo.Domain.Interfaces;

namespace Variacao.Ativo.Service.Services
{
    public class AtivoHostedService : IHostedService, IDisposable
    {
        private Timer _timer;
        public IServiceProvider ServiceProvider { get; private set; }
        public AtivoHostedService(IServiceProvider serviceProvider)
        {
             ServiceProvider = serviceProvider;
        }
        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            _timer = new Timer(SaveAtivo, null, 0, 86400000);
            return Task.CompletedTask;
        }

        private void SaveAtivo(object state)
        {
            try
            {
                using(var scope = ServiceProvider.CreateScope())
                {
                    var service = scope.ServiceProvider.GetRequiredService<IService<ConsultAtivo>>();
                    var result = service.GetValorAtivo();
                    var ativo = service.CreateConsultAtivo(result);
                    service.Add(ativo);
                }
            }
            catch (Exception e)
            {

                throw e;
            }
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
