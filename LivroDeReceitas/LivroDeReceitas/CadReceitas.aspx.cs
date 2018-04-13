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
    public partial class CadReceitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
            
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            if (Validar())
                Salvar();
            LimparCampos();
            Response.Redirect("~/VisualizarReceitas.aspx");
        }

       
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/VisualizarReceitas.aspx");
        }

        private void LimparCampos()
        {
            txtNome.Text = string.Empty;
            txtIngredientes.Text = string.Empty;
            txtModo.Text = string.Empty;
        }

        private bool Validar()
        {
            if (string.IsNullOrWhiteSpace(txtNome.Text))
                return false;
            if (string.IsNullOrWhiteSpace(txtIngredientes.Text))
                return false;
            if (string.IsNullOrWhiteSpace(txtModo.Text))
                return false;
        }

        private void Salvar()
        {
            throw new NotImplementedException();
        }

    }
}