using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LivroDeReceitas.Models
{
    public class Usuario
    {

        public int Id { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public DateTime DataNascimento { get; set; }
        public string Senha { get; set; }
        public string Sexo { get; set; }
       
    }
}