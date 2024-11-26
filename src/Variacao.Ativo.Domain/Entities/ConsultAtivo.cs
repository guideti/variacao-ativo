using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Variacao.Ativo.Domain.Entities
{
    [Table("Ativo")]
    public class ConsultAtivo : BaseEntity
    {
        public string Data { get; set; }
        public decimal Valor { get; set; }
        public string? VariacaoDiaMenos1 { get; set; }
        public string? VariacaoPrimeiraData { get; set; }
    }
}
