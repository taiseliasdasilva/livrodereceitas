using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace LivroDeReceitas.Models
{
    public interface ICustomPrincipal : IPrincipal
    {
        int Id { get; set; }
        string Nome { get; set; }
        string Email { get; set; }
    }
}