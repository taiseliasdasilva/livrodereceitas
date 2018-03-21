<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LivroDeReceitas.Login" %>

<!DOCTYPE html>

<html lang="pt-br">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Receitas Divertidas</title>
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container body-content">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <form runat="server" class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:Label runat="server" CssClass="control-label">Login:</asp:Label>
                            <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:Label runat="server" CssClass="control-label">Senha:</asp:Label>
                            <asp:TextBox ID="txtSenha" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 text-center">
                            <asp:Button ID="btnEntrar" runat="server" CssClass="btn btn-primary" Text="ENTRAR" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
