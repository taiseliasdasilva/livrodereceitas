<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LivroDeReceitas._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
            border: none !important;
            width: 25%;
        }
    </style>
    <asp:DataList ID="gridView" CssClass="table text-center" runat="server" RepeatColumns="4" RepeatLayout="Table">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <a href="<%# ResolveUrl(string.Format("~/VisualizarReceitas.aspx?id={0}", Eval("Id"))) %>">
                        <img class="img-responsive" src="<%# ResolveUrl((string)Eval("FotoUrl")) %>" />
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <a href="<%# ResolveUrl(string.Format("~/VisualizarReceitas.aspx?id={0}", Eval("Id"))) %>" style="color: #000000 !important;">
                        <h3 style="color: #000000 !important;"><%# Eval("Nome") %></h3>
                    </a>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
