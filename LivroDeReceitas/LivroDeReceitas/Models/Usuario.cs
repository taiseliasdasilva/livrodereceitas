using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Script.Serialization;

namespace LivroDeReceitas.Models
{
    public class Usuario : ICustomPrincipal
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Email { get; set; }
        public DateTime DataNascimento { get; set; }
        public string Senha { get; set; }
        public string Sexo { get; set; }

        [ScriptIgnore]
        public IIdentity Identity
        {
            get
            {
                return new GenericIdentity(this.Email, "Usuario");
            }
            set { }
        }

        public bool IsInRole(string role)
        {
            return (role == "Admin");
        }

        public Usuario()
        {

        }

        public Usuario(string myEmail)
        {
            Identity = new GenericIdentity(myEmail, "Usuario");
        }
    }
}