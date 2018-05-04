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

            CarregarTipos();

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

        private void CarregarTipos()
        {
            var lstTipos = new List<Tipo_Receita>();


            using (SqlConnection conn =
                new SqlConnection(@"Initial Catalog=RECEITAS;
                        Data Source=localhost;
                        Integrated Security=SSPI;"))
            {

                string strSQL = @"SELECT * FROM tipo_receita";


                using (SqlCommand cmd = new SqlCommand(strSQL))
                {

                    conn.Open();
                    cmd.Connection = conn;
                    cmd.CommandText = strSQL;

                    var dataReader = cmd.ExecuteReader();
                    var dt = new DataTable();
                    dt.Load(dataReader);

                    conn.Close();


                    foreach (DataRow row in dt.Rows)
                    {
                        var tipo_receita = new Tipo_Receita()
                        {
                            Id = Convert.ToInt32(row["id"]),
                            Nome = row["nome"].ToString(),

                        };
                        lstTipos.Add(tipo_receita);
                    }
                }
            }


            ddlTipo.DataTextField = "Nome";
            ddlTipo.DataValueField = "Id";
            ddlTipo.DataSource = lstTipos.OrderBy(o => o.Nome).ToList();
            ddlTipo.DataBind();
        }



        private void LimparCampos()
        {
            txtNome.Text = string.Empty;
            txtIngredientes.Text = string.Empty;
            txtModo.Text = string.Empty;
            txtUrl.Text = string.Empty;
        }

        private bool Validar()
        {
            if (string.IsNullOrWhiteSpace(txtNome.Text))
                return false;
            if (string.IsNullOrWhiteSpace(ddlTipo.SelectedValue))
                return false;
            if (string.IsNullOrWhiteSpace(txtIngredientes.Text))
                return false;
            if (string.IsNullOrWhiteSpace(txtModo.Text))
                return false;
            if (string.IsNullOrWhiteSpace(txtUrl.Text))
                return false;
            return true;
        }

        private void Salvar()
        {
            var obj = new Receitas();
            obj.Nome = txtNome.Text;
            obj.Tipo = new Tipo_Receita() { Id = Convert.ToInt32(ddlTipo.SelectedValue) };
            obj.Ingredientes = txtIngredientes.Text;
            obj.ModoPreparo = txtModo.Text;
            obj.Url = txtUrl.Text;


            using (SqlConnection conn =
                new SqlConnection(@"Initial Catalog=RECEITAS;
                        Data Source=localhost;
                        Integrated Security=SSPI;"))
            {
                string strSQL = @"INSERT INTO receitas (nome, id_tipo, ingredientes, modoPreparo,url_video) 
                                  VALUES (@nome, @id_tipo, @ingredientes, @modoPreparo,@url_video)";


                using (SqlCommand cmd = new SqlCommand(strSQL))
                {
                    cmd.Connection = conn;

                    cmd.Parameters.Add("@nome", SqlDbType.VarChar).Value = obj.Nome;
                    cmd.Parameters.Add("@id_tipo", SqlDbType.Int).Value = obj.Tipo.Id;
                    cmd.Parameters.Add("@ingredientes", SqlDbType.VarChar).Value = obj.Ingredientes;
                    cmd.Parameters.Add("@modoPreparo", SqlDbType.VarChar).Value = obj.ModoPreparo;
                    cmd.Parameters.Add("@url_video", SqlDbType.VarChar).Value = obj.Url;


                    conn.Open();

                    cmd.ExecuteNonQuery();

                    conn.Close();

                }
            }
        }

    }
}
   
  
