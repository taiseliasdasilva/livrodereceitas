<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadReceitas.aspx.cs" Inherits="LivroDeReceitas.CadReceitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="form-horizontal">
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
                        <asp:Label ID="Label1" runat="server"
                            CssClass="control-label">URL do vídeo no YouTube:</asp:Label>
                        <asp:TextBox ID="txtUrl" runat="server"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <asp:Label ID="lblTipo" runat="server" CssClass="control-label">Tipo:</asp:Label>
                        <asp:DropDownList ID="ddlTipo" runat="server"
                            CssClass="form-control">
                        </asp:DropDownList>
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
                            CssClass="control-label">ModoPreparo:</asp:Label>
                        <asp:TextBox ID="txtModo" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12 text-right">
                        <asp:Button ID="btnCadastrar" runat="server"
                            Text="Cadastrar" CssClass="btn btn-primary" OnClick="btnCadastrar_Click" />
                        <asp:Button ID="btnCancelar" runat="server"
                            Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                </div>
            </div>
        </div>


    </form>
</asp:Content>


