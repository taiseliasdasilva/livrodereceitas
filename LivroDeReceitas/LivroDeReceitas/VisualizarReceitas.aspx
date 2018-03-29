<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VisualizarReceitas.aspx.cs" Inherits="LivroDeReceitas.VisualizarVideos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h1>Visualizar Vídeos</h1>
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
                 <asp:TextBox ID="txtTipo" runat="server"
                        CssClass="form-control"></asp:TextBox>
            </div>
        </div
            <div class="form-group">
                <div class="col-md-12 text-right">
                    <asp:Button ID="btnSalvar" runat="server"
                        Text="Salvar" CssClass="btn btn-primary" />

                </div>
            </div>
        </div>
    </div>
</asp:Content>
