<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="proiect.aspx.cs" Inherits="Sala_de_fitnessDB.Proiect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            flex-direction: column; /* Așezare verticală */
        }

        form {
            text-align: center;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            margin-top: -180px; /* Ridică formularul puțin mai sus */
            margin-bottom: 20px; /* Spațiu între formular și mesajul de bun venit */
        }

        label, input {
            margin-bottom: 10px;
            height: 3vh;
        }

        #mesajBunVenit {
            font-size: 40px;
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div>
            <h2>Login</h2>
            <div>
                <label for="txtNume">Nume:</label>
                <asp:TextBox ID="txtNume" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtPrenume">Prenume:</label>
                <asp:TextBox ID="txtPrenume" runat="server"></asp:TextBox>
            </div>
            <div>
                <label for="txtParola">Parola:</label>
                <asp:TextBox ID="txtParola" TextMode="Password" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </div>
        </div>
    </form>
    <div id="mesajBunVenit">
        Bine ați venit!
    </div>
</body>
</html>
