<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LivroDeReceitas.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="form-horizontal">
        <div class="row">
            <div class="col-md-12">
                <hr />
                <div class="form-group">
                    <div class="col-md-4">
                        <asp:Label ID="lblEmail" runat="server"
                            CssClass="control-label"> E-mail </asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class=" col-md-4">
                        <asp:Label ID="lblSenha" runat="server"
                            CssClass="control-label">Senha </asp:Label>
                        <asp:TextBox ID="txtSenha" type="password" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                 <div class="form-group">
                    <div class="col-md-4 text-center">
                        <asp:Button ID="btnEntrar" runat="server"
                            Text="Cadastrar" CssClass="btn btn-primary" OnClick="btnEntrar_Click1" />
                        <asp:Button ID="btnCadastrar" runat="server"
                            Text="Cadastrar" CssClass="btn btn-primary" OnClick="btnCadastrar_Click1" />

                    </div>
                </div>
        </div>
    </form>

</asp:Content>
