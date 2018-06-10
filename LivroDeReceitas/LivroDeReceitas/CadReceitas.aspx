<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadReceitas.aspx.cs" Inherits="LivroDeReceitas.CadReceitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h3>Cadastro de Receitas</h3>
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
                <div class="col-md-12">
                    <asp:Label ID="lblNome" runat="server" CssClass="control-label">Nome:</asp:Label>
                    <asp:TextBox ID="txtNome" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome" ErrorMessage="*" ForeColor="Red" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-6">
                    <asp:Label ID="lblUrlVideo" runat="server" CssClass="control-label">URL do vídeo no YouTube:</asp:Label>
                    <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUrlVideo" runat="server" ControlToValidate="txtUrl" ErrorMessage="*" ForeColor="Red" />
                </div>
                <div class="col-md-6">
                    <asp:Label ID="lblTipo" runat="server" CssClass="control-label">Tipo:</asp:Label>
                    <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvTipo" runat="server" ControlToValidate="ddlTipo" ErrorMessage="*" ForeColor="Red" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <asp:Label ID="lblIngredientes" runat="server" CssClass="control-label">Ingredientes:</asp:Label>
                    <asp:TextBox ID="txtIngredientes" runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvIngredientes" runat="server" ControlToValidate="txtIngredientes" ErrorMessage="*" ForeColor="Red" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <asp:Label ID="lblModoDePreparo" runat="server" CssClass="control-label">Modo de preparo:</asp:Label>
                    <asp:TextBox ID="txtModo" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvModo" runat="server" ControlToValidate="txtModo" ErrorMessage="*" ForeColor="Red" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-12">
                    <asp:FileUpload ID="fupArquivo" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12 text-right">
                    <hr />
                    <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn btn-roxo" OnClick="btnCadastrar_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-roxo" OnClick="btnCancelar_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
