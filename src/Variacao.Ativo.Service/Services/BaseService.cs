
using Variacao.Ativo.Domain.Entities;
using Variacao.Ativo.Domain.Interfaces;
using System;
using System.Collections.Generic;
using System.Net.Http;
using Newtonsoft.Json;
using System.Linq;

namespace Variacao.Ativo.Service.Services
{
    public class BaseService<T> : IService<T> where T : BaseEntity
    {
        private readonly IRepository<ConsultAtivo> _repository;
        private readonly HttpClient _httpClient;
        public BaseService(IRepository<ConsultAtivo> repository, HttpClient httpClient)
        {
            _repository = repository;
            _httpClient = httpClient;
        }
        public ConsultAtivo Add(ConsultAtivo obj)
        {
            _repository.Insert(obj);
            return obj;
        }
        public IList<ConsultAtivo> Get() =>
            _repository.SelectAll();


        public decimal GetValorAtivo()
        {
            try
            {   
                var responseString =  _httpClient.GetAsync(_httpClient.BaseAddress).GetAwaiter().GetResult();
                var result = responseString.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                dynamic dado = JsonConvert.DeserializeObject<object>(result);
                decimal valor = dado.chart.result[0].indicators.quote[0].open[0];


                return Convert.ToDecimal(valor.ToString("F"));
            }
            catch (Exception e)
            {

                throw e;
            }
           
        }

        public ConsultAtivo CreateConsultAtivo(decimal valor)
        {
            var ativos = _repository.SelectAll();
            var ultimoAtivo = ativos.OrderBy(c => c.Dia).FirstOrDefault();
            var primeiroAtivo = ativos.OrderByDescending(c => c.Dia).FirstOrDefault();
            var variacaoD = RetornaDMenos1(valor);
            var variacaoP = RetornaPrimeiraData(valor);

            var consultAtivo = new ConsultAtivo()
            {
                Data = DateTime.Now.ToString("dd/MM/yyyy"),
                Valor = valor,
                VariacaoDiaMenos1 = variacaoD,
                VariacaoPrimeiraData = variacaoP,
            };
            return consultAtivo;
        }
        public string RetornaDMenos1(decimal valorAtual)
        {
            var ativos = _repository.SelectAll();
            if (ativos.Count == 0) return null;
            
            var ultimoAtivo = ativos.OrderByDescending(c => c.Dia).FirstOrDefault();

            var variacao = (valorAtual - ultimoAtivo.Valor) / ultimoAtivo.Valor * 100;
            
            return _ = variacao.ToString("F") + "%";
        }

        public string RetornaPrimeiraData(decimal valorAtual)
        {
            var ativos = _repository.SelectAll();
            if (ativos.Count == 0) return null;

            var primeiroAtivo = ativos.OrderBy(c => c.Dia).FirstOrDefault();

            var variacao = (valorAtual - primeiroAtivo.Valor) / primeiroAtivo.Valor * 100;

            return _ = variacao.ToString("F") + "%";
        }
    }
}
