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
    public partial class CadUsuario : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

        }


        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            if (Validar())
            {

                Salvar();

                LimparCampos();

                Response.Redirect("~/Login.aspx");
            }
        }





       
        protected void btnCancelar_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/Login.aspx");
        }



        private void LimparCampos()
        {
            txtNome.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtData.Text = string.Empty;
            txtSenha.Text = string.Empty;
            rdoFeminino.Checked = false;
           
        }


        private bool Validar()
        {

            if (string.IsNullOrWhiteSpace(txtNome.Text))
                return false;


            if (string.IsNullOrWhiteSpace(txtData.Text))
                return false;

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
                return false;

            if (string.IsNullOrWhiteSpace(txtSenha.Text))
                return false;

            return true;
        }


        private void Salvar()
        {

            var obj = new Usuario();
            obj.Nome = txtNome.Text;
            obj.Email = txtEmail.Text;
            obj.DataNascimento = Convert.ToDateTime(txtData.Text);
            obj.Sexo = rdoFeminino.Checked ? "F" : "M";
            obj.Senha = txtSenha.Text;
           
           
            using (SqlConnection conn =
                new SqlConnection(@"Initial Catalog=RECEITAS;
                        Data Source=localhost;
                        Integrated Security=SSPI;"))
            {
                string strSQL = @"INSERT INTO usuario (nome, dataNascimento, email, senha, sexo ) 
                                  VALUES (@nome, @dataNascimento, @email, @senha, @sexo)";

              
                using (SqlCommand cmd = new SqlCommand(strSQL))
                {
                    cmd.Connection = conn;
                   
                    cmd.Parameters.Add("@nome", SqlDbType.VarChar).Value = obj.Nome;
                    cmd.Parameters.Add("@dataNascimento", SqlDbType.DateTime).Value = obj.DataNascimento;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = obj.Email;
                    cmd.Parameters.Add("@sexo", SqlDbType.VarChar).Value = obj.Sexo;
                    cmd.Parameters.Add("@senha", SqlDbType.VarChar).Value = obj.Senha;

                   
                    conn.Open();
                  
                    cmd.ExecuteNonQuery();
                  
                    conn.Close();
                }
            }
        }
    }
}

      
