using LivroDeReceitas.Models;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

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
                var obj = new Usuario();
                obj.Email = txtEmail.Text;
                obj.Senha = txtSenha.Text;

                //acessa o banco de dados e procura por um usuário com aquele e-mail e senha
                var usuarioLogado = Logar(obj);

                //se não encontrar nenhum usuário com as credenciais informadas, 
                //mostra mensagem de login ou senha inválido
                if (usuarioLogado == null)
                {
                    pnlMsg.Visible = true;
                    return;
                }

                //armazena o usuário autenticado no cache do navegador
                var userData = new JavaScriptSerializer().Serialize(usuarioLogado);
                FormsAuthenticationUtil.SetCustomAuthCookie(usuarioLogado.Email, userData, false);

                //redireciona para a página inicial se foi logado com sucesso
                Response.Redirect("~/Default.aspx");
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

        private Usuario Logar(Usuario obj)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString))
            {
                string strSQL = "SELECT * FROM USUARIO WHERE EMAIL = @EMAIL AND SENHA = @SENHA;";

                using (SqlCommand cmd = new SqlCommand(strSQL))
                {
                    cmd.Connection = conn;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = obj.Email;
                    cmd.Parameters.Add("@senha", SqlDbType.VarChar).Value = obj.Senha;
                    cmd.CommandText = strSQL;

                    conn.Open();
                    var dataReader = cmd.ExecuteReader();
                    var dt = new DataTable();
                    dt.Load(dataReader);
                    conn.Close();

                    if (!(dt != null && dt.Rows.Count > 0))
                        return null;

                    //convertendo os dados do usuário baseado no retorno do select
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

                    return usuario;
                }
            }
        }
    }
}
