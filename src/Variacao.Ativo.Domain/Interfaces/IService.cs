using FluentValidation;
using Variacao.Ativo.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Variacao.Ativo.Domain.Interfaces
{
    public interface IService<T> where T : BaseEntity
    {
        ConsultAtivo Add(ConsultAtivo obj);
        IList<ConsultAtivo> Get();
        decimal GetValorAtivo();
        ConsultAtivo CreateConsultAtivo(decimal obj);
    }
}
