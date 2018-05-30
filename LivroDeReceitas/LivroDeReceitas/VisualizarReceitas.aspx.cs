using LivroDeReceitas.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace LivroDeReceitas
{
    public partial class VisualizarReceitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            if (!string.IsNullOrWhiteSpace(Request.QueryString["id"]))
            {
                var id = Convert.ToInt32(Request.QueryString["id"]);

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString))
                {
                    string strSQL = @"SELECT * FROM RECEITAS WHERE ID = @ID;";

                    using (SqlCommand cmd = new SqlCommand(strSQL))
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                        cmd.CommandText = strSQL;

                        var dataReader = cmd.ExecuteReader();
                        var dt = new DataTable();
                        dt.Load(dataReader);
                        conn.Close();

                        if (!(dt != null && dt.Rows.Count > 0))
                            return;

                        var row = dt.Rows[0];
                        var receita = new Receitas()
                        {
                            Id = Convert.ToInt32(row["ID"]),
                            Nome = row["NOME"].ToString(),
                            Tipo = new Tipo_Receita() { Id = Convert.ToInt32(row["id_tipo"]) },
                            Ingredientes = row["ingredientes"].ToString(),
                            ModoDePreparo = row["modo_preparo"].ToString(),
                            UrlVideo = row["url_video"].ToString(),
                            Foto = row["foto"].ToString()
                        };

                        lblNomeReceita.Text = receita.Nome;
                        imagemUrl.ImageUrl = ResolveUrl(receita.FotoUrl);
                        if (!string.IsNullOrWhiteSpace(receita.UrlVideo))
                        {
                            playerVideo.Attributes.Add("src", string.Format("https://www.youtube.com/embed/{0}", receita.UrlVideo.Replace("https://www.youtube.com/watch?v=", string.Empty)));
                        }
                        lblIngredientes.Text = receita.Ingredientes;
                        lblModoDePreparo.Text = receita.ModoDePreparo;
                    }
                }

                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString))
                {
                    var lst = new List<Comentario>();
                    string strSQL = @"SELECT C.*, U.NOME AS NOME_USUARIO 
                                      FROM COMENTARIOS C 
                                      INNER JOIN USUARIO U ON (C.ID_USUARIO = U.ID) 
                                      WHERE ID_RECEITA = @ID_RECEITA;";

                    using (SqlCommand cmd = new SqlCommand(strSQL))
                    {
                        conn.Open();
                        cmd.Connection = conn;
                        cmd.Parameters.Add("@ID_RECEITA", SqlDbType.Int).Value = id;
                        cmd.CommandText = strSQL;

                        var dataReader = cmd.ExecuteReader();
                        var dt = new DataTable();
                        dt.Load(dataReader);
                        conn.Close();

                        if (!(dt != null && dt.Rows.Count > 0))
                            return;

                        foreach (DataRow row in dt.Rows)
                        {
                            var comentario = new Comentario()
                            {
                                Id = Convert.ToInt32(row["ID"]),
                                Receita = new Receitas() { Id = Convert.ToInt32(row["ID_RECEITA"]) },
                                Usuario = new Usuario()
                                {
                                    Id = Convert.ToInt32(row["ID_USUARIO"]),
                                    Nome = row["NOME_USUARIO"].ToString()
                                },
                                DataHora = Convert.ToDateTime(row["DATA_HORA"]),
                                Texto = row["TEXTO"].ToString()
                            };

                            lst.Add(comentario);
                        }

                        gridView.DataSource = lst;
                        gridView.DataBind();
                    }
                }
            }
        }

        protected void btnEnviarMsg_Click(object sender, EventArgs e)
        {
            if (Validar())
            {
                EnviarMsg();
            }
        }

        protected void btnCurtida_Click(object sender, EventArgs e)
        {

        }

        private bool Validar()
        {
            if (string.IsNullOrWhiteSpace(txtComentario.Text))
                return false;
            return true;
        }

        private void EnviarMsg()
        {
            var obj = new Comentario();
            obj.Receita = new Receitas() { Id = Convert.ToInt32(Request.QueryString["id"]) };
            obj.Usuario = new Usuario() { Id = ((Usuario)User).Id };
            obj.DataHora = DateTime.Now;
            obj.Texto = txtComentario.Text;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString))
            {
                string strSQL = @"INSERT INTO comentarios (id_receita, id_usuario, texto) VALUES (@id_receita, @id_usuario, @texto);";

                using (SqlCommand cmd = new SqlCommand(strSQL))
                {
                    cmd.Connection = conn;
                    cmd.Parameters.Add("@id_receita", SqlDbType.Int).Value = obj.Receita.Id;
                    cmd.Parameters.Add("@id_usuario", SqlDbType.Int).Value = obj.Usuario.Id;
                    cmd.Parameters.Add("@texto", SqlDbType.VarChar).Value = obj.Texto;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    
                }
            }

            Response.Redirect(string.Format("~/VisualizarReceitas?id={0}", obj.Receita.Id));
        }
    }
}