<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadUsuario.aspx.cs" Inherits="LivroDeReceitas.CadUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h1>Cadastro de Usuário</h1>
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
                <div class="col-md-8">
                    <asp:Label ID="lblEmail" runat="server"
                        CssClass="control-label">Email:</asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblIdade" runat="server"
                        CssClass="control-label">Idade:</asp:Label>
                    <asp:TextBox ID="txtIdade" runat="server"
                        CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-4">
                    <asp:Label ID="lblSexo" runat="server"
                        CssClass="control-label">Sexo:</asp:Label>
                    <br />
                    <asp:RadioButton ID="rdoMasculino" runat="server" GroupName="sexo" />
                    Masculino
                        <asp:RadioButton ID="rdoFeminino" runat="server" GroupName="sexo" />
                    Feminino
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
