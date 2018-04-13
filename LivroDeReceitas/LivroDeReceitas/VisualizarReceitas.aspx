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
                            <h1>FRICASSÊ DE FRANGO</h1>
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
                            <li>1 copo de leite de vaca</li>
                            <li>1 copo de farinha de trigo</li>
                            <li>1 ovo inteiro</li>
                            <li>1 pitada de sal</li>
                            <li>2 colheres de queijo parmesão ralado</li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2>MODO DE PREPARO</h2>
                        <ul>
                            <li>Bata todos os ingredientes líquidos e o sal no liquidificador.</li>
                            <li>Quando estiver homogêneo, acrescente a farinha aos poucos e bata mais.</li>
                            <li>Pegue uma concha da mistura e despeje em uma frigideira média em fogo médio. Espalhe virando a frigideira para que fique uma massa fina.</li>
                            <li>Quando um lado estiver dourado, vire e doure o outro. Sirva com qualquer molho e recheio.</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <iframe height="315" src="https://www.youtube.com/embed/op0Q73LXH7Q" style="width: 100%;"></iframe>
            </div>
        </div>
    </form>
</asp:Content>
