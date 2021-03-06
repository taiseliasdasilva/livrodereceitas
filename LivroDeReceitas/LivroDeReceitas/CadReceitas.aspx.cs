﻿using LivroDeReceitas.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
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
            {
                Salvar();
                LimparCampos();
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                lblMsg.Text = "É necessário preencher os campos obrigatórios!";
                pnlMsg.Visible = true;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        private void CarregarTipos()
        {
            var lstTipos = new List<Tipo_Receita>();
            lstTipos.Add(new Tipo_Receita() { Nome = "-- [SELECIONE] --" });

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString))
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
                        var tipoReceita = new Tipo_Receita()
                        {
                            Id = Convert.ToInt32(row["id"]),
                            Nome = row["nome"].ToString()
                        };
                        lstTipos.Add(tipoReceita);
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
            if (!(Convert.ToInt32(ddlTipo.SelectedValue) > 0))
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
            obj.Usuario = new Usuario() { Id = ((Usuario)User).Id };
            obj.Ingredientes = txtIngredientes.Text;
            obj.ModoDePreparo = txtModo.Text;
            obj.UrlVideo = txtUrl.Text;
            obj.Foto = fupArquivo.FileName;

            if (fupArquivo.HasFile)
            {
                if (!Directory.Exists(Server.MapPath("~/Uploads")))
                    Directory.CreateDirectory(Server.MapPath("~/Uploads"));

                var fileName = Path.Combine(Server.MapPath("~/Uploads"), fupArquivo.FileName);
                fupArquivo.SaveAs(fileName);
            }

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString))
            {
                string strSQL = @"INSERT INTO receitas (nome, id_tipo, ingredientes, modo_preparo, url_video, foto, id_usuario) 
                                  VALUES (@nome, @id_tipo, @ingredientes, @modo_preparo, @url_video, @foto, @id_usuario)";

                using (SqlCommand cmd = new SqlCommand(strSQL))
                {
                    cmd.Connection = conn;
                    cmd.Parameters.Add("@nome", SqlDbType.VarChar).Value = obj.Nome;
                    cmd.Parameters.Add("@id_tipo", SqlDbType.Int).Value = obj.Tipo.Id;
                    cmd.Parameters.Add("@ingredientes", SqlDbType.VarChar).Value = obj.Ingredientes;
                    cmd.Parameters.Add("@modo_preparo", SqlDbType.VarChar).Value = obj.ModoDePreparo;
                    cmd.Parameters.Add("@url_video", SqlDbType.VarChar).Value = obj.UrlVideo;
                    cmd.Parameters.Add("@foto", SqlDbType.VarChar).Value = obj.Foto;
                    cmd.Parameters.Add("@id_usuario", SqlDbType.Int).Value = obj.Usuario.Id;

                    foreach (SqlParameter parameter in cmd.Parameters)
                    {
                        if (parameter.Value == null)
                        {
                            parameter.Value = DBNull.Value;
                        }
                    }

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
        }
    }
}