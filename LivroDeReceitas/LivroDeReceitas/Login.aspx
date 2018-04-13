<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LivroDeReceitas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>


</head>
<body>
    <form id="form1" runat="server">
        <div class="formclass">

            <h1>Login</h1>
            <asp:TextBox ID="txtEmail" CssClass="input" placeholder="Email" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:TextBox ID="txtSenha" CssClass="input" placeholder="Senha" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="btnEntrar" CssClass="input" Width="100px" runat="server" Text="Entrar" />
        </div>


    </form>
</body>
</html>
