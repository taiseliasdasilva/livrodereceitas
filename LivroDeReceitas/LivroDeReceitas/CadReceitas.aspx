﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadReceitas.aspx.cs" Inherits="LivroDeReceitas.CadReceitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1>Cadastro de Receitas</h1>
            <hr />
            <div class="form-group">
                <div class="col-md-12">
                    <asp:Label ID="lblNome" runat="server"
                        CssClass="control-label">Nome:</asp:Label>
                    <asp:TextBox ID="txtNome" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <asp:Label ID="lblTipo" runat="server" CssClass="control-label">Tipo:</asp:Label>
                    <select class="form-control">
                        <option>--[SELECIONE]--</option>
                        <option>Salgada</option>
                        <option>Doce</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <asp:Label ID="lblIngredientes" runat="server"
                        CssClass="control-label">Ingredientes:</asp:Label>
                    <asp:TextBox ID="txtIngredientes" runat="server" TextMode="MultiLine" Rows="10"
                        CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <asp:Label ID="lblModoDePreparo" runat="server"
                        CssClass="control-label">Modo De Preparo:</asp:Label>
                    <asp:TextBox ID="txtModo" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12 text-right">
                    <asp:Button ID="btnCadastrar" runat="server"
                        Text="Cadastrar" CssClass="btn btn-primary" />
                    <asp:Button ID="btnCancelar" runat="server"
                        Text="Cancelar" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>


