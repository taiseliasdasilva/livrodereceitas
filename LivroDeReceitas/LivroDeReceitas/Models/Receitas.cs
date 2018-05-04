using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LivroDeReceitas.Models
{
    public class Receitas
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public Tipo_Receita Tipo { get; set; }
        public string Ingredientes { get; set; }
        public string ModoPreparo { get; set; }
        public string Url { get; set; }
    }
}