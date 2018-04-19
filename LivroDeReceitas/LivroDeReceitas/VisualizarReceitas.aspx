<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VisualizarReceitas.aspx.cs" Inherits="LivroDeReceitas.VisualizarReceitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server" class="form-horizontal">
        <div class="row">
            <div class="col-md-12">
                <table>
                    <tr>
                        <td>
                            <img class="img-responsive img-circle" src="Images/download.jpg" style="width: 150px;" />
                        </td>
                        <td style="padding-left: 20px;">
                            <h1>PANQUECA</h1>
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
                        <ul>
                            
                            <li>1 copo de leite</li>
                            <li>1 ovo</li>
                            <li>1 pitada de fermento em pó</li>
                            <li>1 pitada de sal</li>
                            <li>1 pitada de fermento em pó</li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2>MODO DE PREPARO</h2>
                        <ul>
                            <li>Bata no liquidificador todos os ingredientes até obter uma mistura homogênea</li>
                            <li>Em seguida desligue e, com uma colher, misture a farinha que grudou no copo do liquidificador</li>
                            <li>Bata novamente só para misturar, reserve</li>
                            <li>Unte a frigideira com um fio de óleo e leve ao fogo até aquecer</li>
                            <li>Depois, leve para fritar em uma frigideira em fogo médio</li>
                            <li>Recheie a gosto</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/BSsapX8omik" "0" "autoplay; encrypted-media" ></iframe>
            </div>
        </div>
            <div class="form-group">
                    <div class="col-md-12">
                      
                        <asp:TextBox ID="txtComentarios" runat="server"
                            CssClass="form-control" MaxLength="1000" Rows="10"
                            TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                          <div class="form-group">
                    <div class="col-md-12 text-right">
                        <asp:Button ID="btnSalvar" runat="server"
                            Text="Salvar" CssClass="btn btn-primary" OnClick="btnSalvar_Click"/>
                    </div>
                </div>
            
                       
    </form>
</asp:Content>
