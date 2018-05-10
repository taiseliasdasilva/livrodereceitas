using LivroDeReceitas.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LivroDeReceitas
{
    public partial class Login : System.Web.UI.Page
    {
        public string Senha { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
        }
    }
}

    

        