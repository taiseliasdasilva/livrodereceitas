<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LivroDeReceitas.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1>Login</h1>
            <hr />
                <div class="form-group">
                    <div class="col-md-12">
                        <asp:Label ID="lblEmail" runat="server"
                            CssClass="control-label">E-mail:</asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                
                    <div class="col-md-4">
                        <asp:Label ID="lblSenha" runat="server"
                            CssClass="control-label">Senha:</asp:Label>
                        <asp:TextBox ID="txtSenha" runat="server"
                            CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                        <div class="col-md-12">
                            <asp:Button ID="btnEntrar" runat="server"
                                Text="Entrar" CssClass="btn btn-primary" OnClick="btnEntrar_Click" />
                    </div>
                </div>
        </div>


</asp:Content>
