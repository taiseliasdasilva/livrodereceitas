using LivroDeReceitas.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LivroDeReceitas
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            lnkSair.Visible = HttpContext.Current.User != null && HttpContext.Current.User.GetType() == typeof(Usuario);
            lnkCadReceita.Visible = HttpContext.Current.User != null && HttpContext.Current.User.GetType() == typeof(Usuario);
            lnkCadUsuario.Visible = HttpContext.Current.User.GetType() != typeof(Usuario);
            lnkLogin.Visible = HttpContext.Current.User.GetType() != typeof(Usuario);
        }

        protected void lnkCadReceita_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CadReceitas.aspx");
        }

        protected void lnkCadUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CadUsuario.aspx");
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void lnkSair_Click(object sender, EventArgs e)
        {
            FormsAuthenticationUtil.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}