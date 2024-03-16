<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JoinuriSimple.aspx.cs" Inherits="Sala_de_fitnessDB.JoinuriSimple" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Joinuri Simple</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        #form1 {
            max-width: 800px;
            width: 100%;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        #form1 div {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .list-container {
            text-align: left;
            margin-left: 20px;
        }

        .list-container ul,
        .list-container ol {
            list-style-type: none;
            padding: 0;
        }

        .list-container ul li,
        .list-container ol li {
            font-size: 16px;
            margin-bottom: 8px;
        }

        #ddlAngajati {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
            color: #333;
        }

        #lblIdSala {
            display: block;
            font-size: 18px;
            font-weight: bold;
            color: #4CAF50;
            margin-top: 15px;
        }
         /* Stiluri pentru butoanele de redirect */
        .redirect-buttons {
            margin-top: 20px;
        }

        .redirect-button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="ddlAngajati">Selectează un angajat:</label>
            <asp:DropDownList ID="ddlAngajati" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAngajati_SelectedIndexChanged"></asp:DropDownList>
            <asp:Label ID="lblIdSala" runat="server" Text=""></asp:Label>
        </div>

        <div class="list-container">
            <label for="Label1">Numărul total de clienți din Sala cu ID-ul = 1:</label>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

            <label for="Label2">Cel mai în vârstă angajat din Sala cu ID-ul = 1:</label>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

            <label for="Label3">Angajații care au in intretinere clienti:</label>
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>

            <label for="Label4">Salariul mediu al angajatilor ce lucreaza la aceeasi sala:</label>
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>

            <label for="Label5">Clientii ce lucreaza la echipamente si fac exercitii medii:</label>
            <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
        </div>
        <!-- Butoanele de redirect -->
        <div class="redirect-buttons">
            <a href="TableSelection.aspx" class="redirect-button">Tabel de selecție</a>
            <a href="JoinuriComplexe.aspx" class="redirect-button">Joinuri Complexe</a>
        </div>
    </form>
</body>
</html>
