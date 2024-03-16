<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TableSelection.aspx.cs" Inherits="Sala_de_fitnessDB.TableSelection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Table Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            max-width: 1000px;
            width: 100%;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px; /* Ajustați această valoare pentru distanța dorită față de marginea de sus */
        }

        h2 {
            color: #333;
        }

        .panel {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .button-container {
            text-align: center; /* Centrare butonului */
            margin-top: 20px;
            margin-bottom: 20px; /* Ajustați această valoare pentru a crea spațiu între "Table Selection" și buton */
        }

        .redirect-button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .styled-dropdown {
            width: 100%;
            max-width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box; /* Adăugați această proprietate */
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <form runat="server">
        <div class="container">
            <div class="form-container">
            <h2>Table Selection</h2>
            <asp:DropDownList ID="ddlTables" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTables_SelectedIndexChanged" CssClass="styled-dropdown"></asp:DropDownList>

            <asp:Button ID="btnInsert" runat="server" Text="INSERT" OnClick="btnInsert_Click" Visible="false" />
            <asp:Button ID="btnDelete" runat="server" Text="DELETE" OnClick="btnDelete_Click" Visible="false" />
            <asp:Button ID="btnUpdate" runat="server" Text="UPDATE" OnClick="btnUpdate_Click" Visible="false" />


            <asp:Panel ID="pnlClient" runat="server" Visible="false">
               

                <asp:Panel ID="pnlInsertClient" runat="server" Visible="false">
                    <h3>Insert</h3>
                    <asp:TextBox ID="txtIdSala" runat="server" placeholder="ID Sala"></asp:TextBox><br />
                    <asp:TextBox ID="txtIdAngajat" runat="server" placeholder="ID Angajat"></asp:TextBox><br />
                    <asp:TextBox ID="txtVarsta" runat="server" placeholder="Varsta"></asp:TextBox><br />
                    <asp:TextBox ID="txtCNP" runat="server" placeholder="CNP"></asp:TextBox><br />
                    <asp:TextBox ID="txtNume" runat="server" placeholder="Nume"></asp:TextBox><br />
                    <asp:TextBox ID="txtPrenume" runat="server" placeholder="Prenume"></asp:TextBox><br />
                    <asp:TextBox ID="txtNrTelefon" runat="server" placeholder="Numar de Telefon"></asp:TextBox><br />
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox><br />
                    <asp:TextBox ID="txtSex" runat="server" placeholder="Sex"></asp:TextBox><br />
                   <asp:Button ID="btnSaveClient" runat="server" Text="Save" OnClick="btnSaveClient_Click" Visible="false" />
                    <asp:Button ID="btnCancel1" runat="server" Text="Cancel" OnClick="btnCancel_Click" Visible="false" />
                </asp:Panel>

                <asp:Panel ID="pnlDeleteClient" runat="server" Visible="false">
                    <h3>Delete</h3>
                    <asp:Label ID="lblDeleteClientId" runat="server" Text="Introduceți ID_Client pentru ștergere"></asp:Label><br />
                    <asp:TextBox ID="txtDeleteClientId" runat="server"></asp:TextBox><br />
                   <asp:Button ID="btnConfirmDeleteClient" runat="server" Text="Confirm Delete" OnClick="btnConfirmDeleteClient_Click" Visible="false" />
                    <asp:Button ID="btnCancel2" runat="server" Text="Cancel" OnClick="btnCancel_Click" Visible="false" />
                </asp:Panel>
            <asp:Panel ID="pnlUpdateClient" runat="server" Visible="false">
                <h3>Update</h3>
                <asp:Label ID="lblUpdateIdC" runat="server" Text="ID:"></asp:Label>
                <asp:TextBox ID="txtUpdateIdC" runat="server"></asp:TextBox><br />
                <asp:Label ID="lblUpdateFieldC" runat="server" Text="Selectează câmpul:"></asp:Label>
                <asp:DropDownList ID="ddlFieldsToUpdateC" runat="server"></asp:DropDownList><br />
                <asp:Label ID="lblUpdateValueC" runat="server" Text="Introduceți noua valoare:"></asp:Label>
                <asp:TextBox ID="txtUpdateValueC" runat="server"></asp:TextBox><br />
                <asp:Button ID="btnSaveUpdateC" runat="server" Text="Save" OnClick="btnSaveUpdateC_Click" Visible="false" />
                <asp:Button ID="btnCancelUpdateC" runat="server" Text="Cancel" OnClick="btnCancel_Click" Visible="false" />
            </asp:Panel>



            </asp:Panel>

            <asp:Panel ID="pnlExercitiu" runat="server" Visible="false">
                

                <asp:Panel ID="pnlInsertExercitiu" runat="server" Visible="false">
                    <h3>Insert</h3>
                    <asp:TextBox ID="txtIdExercitiu" runat="server" placeholder="ID Exercitiu"></asp:TextBox><br />
                    <asp:TextBox ID="txtIdClient" runat="server" placeholder="ID Client"></asp:TextBox><br />
                    <asp:TextBox ID="txtIdEchipament" runat="server" placeholder="ID Echipament"></asp:TextBox><br />
                    <asp:TextBox ID="txtNumeExercitiu" runat="server" placeholder="Nume Exercitiu"></asp:TextBox><br />
                    <asp:DropDownList ID="ddlComplexitate" runat="server" placeholder="Complexitate">
                        <asp:ListItem Text="Usor" Value="Usor" />
                        <asp:ListItem Text="Mediu" Value="Mediu" />
                        <asp:ListItem Text="Dificil" Value="Dificil" />
                    </asp:DropDownList><br />
                    <asp:Button ID="btnSaveExercitiu" runat="server" Text="Save" OnClick="btnSaveExercitiu_Click" Visible="false" />
                   <asp:Button ID="btnCancel3" runat="server" Text="Cancel" OnClick="btnCancel_Click" Visible="false" />
                </asp:Panel>

                <asp:Panel ID="pnlDeleteExercitiu" runat="server" Visible="false">
                    <h3>Delete</h3>
                    <asp:Label ID="lblDeleteExercitiuId" runat="server" Text="Introduceți ID_Exercitiu pentru ștergere"></asp:Label><br />
                    <asp:TextBox ID="txtDeleteExercitiuId" runat="server"></asp:TextBox><br />
                    <asp:Button ID="btnConfirmDeleteExercitiu" runat="server" Text="Confirm Delete" OnClick="btnConfirmDeleteExercitiu_Click" Visible="false" />
                     <asp:Button ID="btnCancel4" runat="server" Text="Cancel" OnClick="btnCancel_Click" Visible="false" />
                </asp:Panel>

             <asp:Panel ID="pnlUpdateExercitiu" runat="server" Visible="false">
                <h3>Update</h3>
                <asp:Label ID="lblUpdateIdE" runat="server" Text="ID:"></asp:Label>
                <asp:TextBox ID="txtUpdateIdE" runat="server"></asp:TextBox><br />
                <asp:Label ID="lblUpdateFieldE" runat="server" Text="Selectează câmpul:"></asp:Label>
                <asp:DropDownList ID="ddlFieldsToUpdateE" runat="server"></asp:DropDownList><br />
                <asp:Label ID="lblUpdateValueE" runat="server" Text="Introduceți noua valoare:"></asp:Label>
                <asp:TextBox ID="txtUpdateValueE" runat="server"></asp:TextBox><br />
                <asp:Button ID="btnSaveUpdateE" runat="server" Text="Save" OnClick="btnSaveUpdateE_Click" Visible="false" />
                <asp:Button ID="btnCancelUpdateE" runat="server" Text="Cancel" OnClick="btnCancel_Click" Visible="false" />
            </asp:Panel>

            </asp:Panel>

             

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>
        </div>
            <div class="button-container">
                <asp:Button ID="btnRedirect1" runat="server" Text="Go to JoinuriSimple Page" class="redirect-button" OnClick="btnRedirect1_Click" />
                 <asp:Button ID="btnRedirect2" runat="server" Text="Go to JoinuriComplexe Page" class="redirect-button" OnClick="btnRedirect2_Click" />
            </div>
      </div>
        
    </form>
     
</body>
</html>
