<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InserirComentarios.aspx.cs" Inherits="LivroDeReceitas.InserirComentarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="form-horizontal">
        <div class="col-md-12">
            <h1>Inserir Comentários</h1>
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
                <div class="col-md-12">
                    <asp:Label ID="lblInserir" runat="server"
                        CssClass="control-label">Inserir Comentários</asp:Label>
                    <asp:TextBox ID="txtInserir" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                </div>
                <div class="form-group">
                    <div class="col-md-12 text-right">
                        <asp:Button ID="btnSalvar" runat="server"
                            Text="Salvar" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
