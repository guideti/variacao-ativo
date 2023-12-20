using Variacao.Ativo.Domain.Entities;
using Variacao.Ativo.Domain.Interfaces;
using Variacao.Ativo.Infra.Data.Context;
using System.Collections.Generic;
using System.Linq;

namespace Variacao.Ativo.Infra.Data.Repository
{
    public class BaseRepository<TEntity> : IRepository<TEntity> where TEntity : BaseEntity
    {
        protected readonly SqlContext _sqlContext;

        public BaseRepository(SqlContext sqlContext)
        {
            _sqlContext = sqlContext;
        }

        public void Insert(TEntity obj)
        {
            _sqlContext.Set<TEntity>().Add(obj);
            _sqlContext.SaveChanges();
        }

        public IList<TEntity> SelectAll() {
            var result = _sqlContext.ConsultAtivos.OrderByDescending(c => c.Dia).Take(30);
            return (IList<TEntity>)result.ToList();
        }

    }
}
