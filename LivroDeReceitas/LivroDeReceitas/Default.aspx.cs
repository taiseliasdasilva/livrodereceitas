﻿using LivroDeReceitas.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace LivroDeReceitas
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString))
            {
                var lst = new List<Receitas>();
                string strSQL = @"SELECT * FROM receitas";

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
                        var receita = new Receitas()
                        {
                            Id = Convert.ToInt32(row["id"]),
                            Nome = row["nome"].ToString(),
                            Tipo = new Tipo_Receita() { Id = Convert.ToInt32(row["id_tipo"]) },
                            Ingredientes = row["ingredientes"].ToString(),
                            ModoDePreparo = row["modo_preparo"].ToString(),
                            UrlVideo = row["url_video"].ToString(),
                            Foto = row["foto"].ToString()
                        };
                        lst.Add(receita);
                    }
                }

                gridView.DataSource = lst;
                gridView.DataBind();
            }
        }
    }
}