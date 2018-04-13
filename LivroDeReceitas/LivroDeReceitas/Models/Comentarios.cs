using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LivroDeReceitas.Models
{
    public class Comentarios
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Tipo { get; set; }
        public string Ingredientes { get; set; }
        public string ModoDePreparo { get; set; }
        public string InserirComentarios { get; set; }

    }
}