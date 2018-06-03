﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadUsuario.aspx.cs" Inherits="LivroDeReceitas.CadUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="form-horizontal">
        <div class="row">
            <div class="col-md-12">
                <h3>Cadastro de Usuário</h3>
                <hr />
                <asp:Panel ID="pnlMsg" runat="server" Visible="false">
                    <div class="form-group">
                        <div class="col-md-12 text-center">
                            <div class="alert alert-danger" role="alert" style="margin-bottom: 0px !important;">
                                <asp:Label ID="lblMsg" runat="server" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <div class="form-group">
                    <div class="col-md-8">
                        <asp:Label ID="lblNome" runat="server"
                            CssClass="control-label">Nome:</asp:Label>
                        <asp:TextBox ID="txtNome" runat="server"
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lblData" runat="server"
                            CssClass="control-label">Data de Nascimento:</asp:Label>
                        <asp:TextBox ID="txtData" type="date" runat="server"
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
                        <asp:Label ID="lblSenha" runat="server"
                            CssClass="control-label">Senha:</asp:Label>
                        <asp:TextBox ID="txtSenha" type="password" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
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
                        <hr />
                        <asp:Button ID="btnCadastrar" runat="server"
                            Text="Cadastrar" CssClass="btn btn-primary" OnClick="btnCadastrar_Click" />
                        <asp:Button ID="btnCancelar" runat="server"
                            Text="Cancelar" CssClass="btn btn-primary" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
