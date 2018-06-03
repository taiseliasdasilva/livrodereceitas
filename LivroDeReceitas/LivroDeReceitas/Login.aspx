<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LivroDeReceitas.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <form runat="server" class="form-horizontal">
                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <img class="img-circle" src="Images/avatar_2x.png" width="140" height="140" />
                            </div>
                        </div>
                        <asp:Panel ID="pnlMsg" runat="server" Visible="false">
                            <div class="form-group">
                                <div class="col-md-12 text-center">
                                    <div class="alert alert-danger" role="alert" style="margin-bottom: 0px !important;">
                                        E-mail ou senha inválido!
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:Label ID="lblEmail" runat="server"
                                    CssClass="control-label">Email:</asp:Label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control input-lg" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:Label ID="lblSenha" runat="server"
                                    CssClass="control-label">Senha:</asp:Label>
                                <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control input-lg" TextMode="Password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <a href="CadUsuario.aspx">Não possui cadastro?<br />
                                    Clique aqui para se cadastrar!</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:Button ID="btnEntrar" runat="server" CssClass="btn btn-primary btn-lg btn-block" Text="Entrar" OnClick="btnEntrar_Click1" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
