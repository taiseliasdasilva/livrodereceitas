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
            //mostrar o botão sair somente se tiver um usuário logado no site
            lnkSair.Visible = HttpContext.Current.User != null && HttpContext.Current.User.GetType() == typeof(Usuario);
            //mostrar o botão de cadastro de receita se tiver um usuário logado no site
            lnkCadReceita.Visible = HttpContext.Current.User != null && HttpContext.Current.User.GetType() == typeof(Usuario);
            //mostrar o botão de cadastro de usuário se não tiver nenhum usuário logado no site
            lnkCadUsuario.Visible = HttpContext.Current.User.GetType() != typeof(Usuario);
            //mostrar o botão de login se não tiver nenhum usuário logado no site
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