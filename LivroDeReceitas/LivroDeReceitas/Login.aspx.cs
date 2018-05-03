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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CadUsuario.aspx");

            if (Validar())
                Salvar();
            LimparCampos();
            Response.Redirect("~/CadUsuario.aspx");
        }

        private bool Validar()
        {
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
                return false;
            if (string.IsNullOrWhiteSpace(txtSenha.Text))
                return false;

            return true;
        }



        private void LimparCampos()
        {
            txtEmail.Text = string.Empty;
            txtSenha.Text = string.Empty;
        }

        private void Salvar()
        {
            var obj = new Usuario();
            obj.Email = txtEmail.Text;
            obj.Senha = txtSenha.Text;


            using (SqlConnection conn =
                new SqlConnection(@"Initial Catalog=RECEITAS;
                        Data Source=localhost;
                        Integrated Security=SSPI;"))
            {
                string strSQL = @"INSERT INTO usuario (email, senha) 
                                  VALUES (@email, @senha)";


                using (SqlCommand cmd = new SqlCommand(strSQL))
                {
                    cmd.Connection = conn;

                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = obj.Email;
                    cmd.Parameters.Add("@senha", SqlDbType.Int).Value = obj.Senha;



                    conn.Open();

                    cmd.ExecuteNonQuery();

                    conn.Close();

                }
            }
        }
    }
}