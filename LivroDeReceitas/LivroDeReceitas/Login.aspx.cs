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


        protected void btnEntrar_Click1(object sender, EventArgs e)
        {
            if (Validar())
            {

                Salvar();

                LimparCampos();

                Response.Redirect("~/CadUsuario.aspx");
            }
        }

        private void LimparCampos()
        {
            txtEmail.Text = string.Empty;
            txtSenha.Text = string.Empty;

        }

        private bool Validar()
        {
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
                return false;

            if (string.IsNullOrWhiteSpace(txtSenha.Text))
                return false;

            return true;
        }

        private void Salvar()
        {
            var obj = new Usuario();
            obj.Email = string.Empty;
            obj.Senha = string.Empty;


            using (SqlConnection conn =
                new SqlConnection(@"Initial Catalog=RECEITAS;
                        Data Source=localhost;
                        Integrated Security=SSPI;"))
            {
                string strSQL = "select * from usuario where email = @email and senha = @senha;";


                using (SqlCommand cmd = new SqlCommand(strSQL))
                {
                    cmd.Connection = conn;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = obj.Email;
                    cmd.Parameters.Add("@senha", SqlDbType.VarChar).Value = obj.Senha;
                    cmd.CommandText = strSQL;

                    var dataReader = cmd.ExecuteReader();
                    var dt = new DataTable();
                    dt.Load(dataReader);
                    conn.Close();

                    if (!(dt != null && dt.Rows.Count > 0))
                        return;

                    //converter os dados
                    var row = dt.Rows[0];
                    var usuario = new Usuario()
                    {
                        Id = Convert.ToInt32(row["id"]),
                        Nome = row["nome"].ToString(),
                        Email = row["email"].ToString(),
                        DataNascimento = Convert.ToDateTime(row["dataNascimento"]),
                        Senha = row["senha"].ToString(),
                        Sexo = row["sexo"].ToString()
                    };
                }
            }
        }

        protected void btnCadastrar_Click1(object sender, EventArgs e)
        {

            Response.Redirect("~/CadUsuario.aspx");
        }

     
        }
    }
