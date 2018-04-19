<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LivroDeReceitas.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOGIN</title>
    <style>
        body
        {
            background:#ccc;
        }
        .formclass
        {
            padding:10px;
            margin:0px auto;
            background:#fff;
            width:200px;
        }
        h2
        {
            text-align:center;
        }

        input
        {
            padding:2px;
            
            width:100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="formclass">
        <h2>Pagina de Login</h2>
          <asp:TextBox ID="txtUsuario" CssClass="input" runat="server"

          ></asp:TextBox>

        <asp:TextBox ID="txtSenha" CssClass="input" 
            runat="server"></asp:TextBox>

        <asp:Button ID="btnEntrar" CssClass="btn btn-primary" Text="Entrar" runat="server" OnClick="btnEntrar_Click" />   

    </div>
    <div>
    
    </div>
    </form>
</body>
</html>
