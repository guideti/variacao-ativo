
using System.ComponentModel.DataAnnotations;

namespace Variacao.Ativo.Domain.Entities
{
    public abstract class BaseEntity
    {
        [Key]
        public virtual int Dia { get; set; }
    }
}
