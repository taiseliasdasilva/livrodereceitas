<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VisualizarReceitas.aspx.cs" Inherits="LivroDeReceitas.VisualizarReceitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            border: none !important;
        }
    </style>
    <form runat="server" class="form-horizontal">
        <div class="row">
            <div class="col-md-12">
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="imagemUrl" runat="server" CssClass="img-responsive" Style="width: 150px;" />
                        </td>
                        <td style="padding-left: 20px;">
                            <h1>
                                <asp:Label ID="lblNomeReceita" runat="server" />
                            </h1>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-12">
                        <h2>INGREDIENTES</h2>
                        <asp:Literal ID="lblIngredientes" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2>MODO DE PREPARO</h2>
                        <asp:Literal ID="lblModoDePreparo" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <iframe id="playerVideo" runat="server" width="560" height="320"></iframe>
            </div>
        </div>
        <%--
        <div class="form-group">
            <div class="col-md-8 text-right">
                <button id="curtida" type="button" data-toggle="modal" data-target="#janela-resposta">
                <img src="Images/thumb-up.png" width="280" height="280"></button>
            </div>
        </div>
        --%>
        <hr />
        <div class="form-group">
            <div class="col-md-12">
                <label class="control-label">Comentários:</label>
                <asp:TextBox ID="txtComentario" runat="server" CssClass="form-control" MaxLength="1000" Rows="5" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-12 text-right">
                <asp:Button ID="btnEnviarMsg" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="btnEnviarMsg_Click" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-12">
                <asp:DataList ID="gridView" CssClass="table text-center" runat="server" RepeatColumns="1" RepeatLayout="Table">
                    <ItemTemplate>
                        <div class="form-group">
                            <div class="col-md-2">
                                <img class="img-circle" src="Images/avatar_2x.png" style="width: 100px;" />
                            </div>
                            <div class="col-md-10 text-left">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label><%# Eval("Usuario.Nome") %></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label><%# Eval("DataHora") %></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <span><%# Eval("Texto") %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </form>
</asp:Content>
