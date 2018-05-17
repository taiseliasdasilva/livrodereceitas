using LivroDeReceitas.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LivroDeReceitas
{
    public partial class VisualizarReceitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (Validar())
            {

                Salvar();

                LimparCampos();

                Response.Redirect("~/CadReceitas.aspx");
            }
        }

        protected void btnCurtida_Click(object sender, EventArgs e)
        {

        }

        private void LimparCampos()
        {
            txtComentarios.Text = string.Empty;
        }

        private bool Validar()
        {
            if (string.IsNullOrWhiteSpace(txtComentarios.Text))
                return false;


            return true;
        }

        private void Salvar()
        {
            var obj = new Visualizar();
            obj.Comentarios = txtComentarios.Text;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString))
            {
                string strSQL = @"INSERT INTO visualizar(comentarios) 
                                  VALUES (@comentarios)";

                using (SqlCommand cmd = new SqlCommand(strSQL))
                {
                    cmd.Connection = conn;
                    cmd.Parameters.Add("@comentarios", SqlDbType.VarChar).Value = obj.Comentarios;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }
    }
}