using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LivroDeReceitas.Models
{
    public class Comentario
    {
        public int Id { get; set; }
        public Receitas Receita { get; set; }
        public Usuario Usuario { get; set; }
        public DateTime DataHora { get; set; }
        public string Texto { get; set; }
    }
}