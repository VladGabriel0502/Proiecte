<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaginaEroare.aspx.cs" Inherits="Sala_de_fitnessDB.PaginaEroare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pagina de Eroare</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        #form1 {
            text-align: center;
        }

        #lblMesajEroare {
            font-size: 2em; /* Mărimea fontului */
            color: red; /* Culoarea textului */
            font-weight: bold; /* Textul în bold */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Eroare</h1>
            <asp:Label ID="lblMesajEroare" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
