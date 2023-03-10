using Variacao.Ativo.Domain.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Variacao.Ativo.Domain.Interfaces
{
    public interface IRepository<T> where T : BaseEntity
    {
        void Insert(T obj);
        IList<T> SelectAll();
    }
}
