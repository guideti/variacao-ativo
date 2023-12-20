
using Variacao.Ativo.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace Variacao.Ativo.Infra.Data.Context
{
    public class SqlContext : DbContext
    {
        protected readonly IConfiguration Configuration;

        public SqlContext() { }

        public SqlContext(DbContextOptions<SqlContext> options) : base(options) { }
        public DbSet<ConsultAtivo> ConsultAtivos { get; set; }

       
    }
}
