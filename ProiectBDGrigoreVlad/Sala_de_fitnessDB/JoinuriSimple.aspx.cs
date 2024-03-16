using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sala_de_fitnessDB
{
    public partial class JoinuriSimple : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifică dacă este postback pentru a evita reexecutarea logică la fiecare postback
            if (!IsPostBack)
            {
                // Obține numărul total de clienți din sala 1
                AfiseazaNumarulTotalDeClientiS1();

                // Obține și afișează cel mai în vârstă angajat din sala 1
                AfiseazaCelMaiBatranAngajatS1();

                // Obtine Angajatii din Prahova
                AfiseazaAngajatiiClienti();

                //Salariul mediu al angajatilor din aceeasi sala
                SalariuMediu();

                //Lista cu Salile ce incep cu S in denumire
                ClientiEchip();

                //Dropdownlist cu angajatii
                PopuleazaDropDownListAngajati();
            }
        }

        private void AfiseazaNumarulTotalDeClientiS1()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False"; // Înlocuiește cu conexiunea reală către baza de date
            string query = "SELECT COUNT(S.ID_Sala) AS NumarClienti FROM Sala_de_fitness.dbo.Client C INNER JOIN  Sala_de_fitness.dbo.Sala S ON S.ID_Sala = 1 AND S.ID_Sala = C.ID_Sala GROUP BY S.ID_Sala";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    int numarClienti = Convert.ToInt32(reader["NumarClienti"]);
                    Label1.Text += $" {numarClienti}<br />";
                }

                reader.Close();
            }
        }

        private void AfiseazaCelMaiBatranAngajatS1()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False"; // Înlocuiește cu conexiunea reală către baza de date
            string query = "SELECT TOP 1 A.Nume + ' ' + A.Prenume AS NumeComplet FROM Sala_de_fitness.dbo.Angajat A INNER JOIN Sala_de_fitness.dbo.Sala S ON A.ID_Sala = S.ID_Sala AND S.ID_Sala = 1 ORDER BY Varsta DESC";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    string numeComplet = reader["NumeComplet"].ToString();
                    Label2.Text += $" {numeComplet}<br />";
                }

                reader.Close();
            }
        }
        private void AfiseazaAngajatiiClienti()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";
            string query = "SELECT DISTINCT A.Nume + ' ' + A.Prenume AS NumeComplet FROM Sala_de_fitness.dbo.Angajat A INNER JOIN Sala_de_fitness.dbo.Client C ON  A.ID_Angajat = C.ID_Angajat";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                // Verificăm dacă există angajați în Prahova
                if (reader.HasRows)
                {
                    // Începem lista neordonată
                   
                    Label3.Text += "<ul>";

                    while (reader.Read())
                    {
                        string numeComplet = reader["NumeComplet"].ToString();

                        // Adăugăm fiecare angajat ca un element de listă
                        Label3.Text += $"<li>{numeComplet}</li>";
                    }

                    // Închidem lista neordonată
                    Label3.Text += "</ul>";
                }
                else
                {
                    Label3.Text = "Nu există angajați în Prahova.";
                }

                reader.Close();
            }
        }
        private void SalariuMediu()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False"; // Înlocuiește cu conexiunea reală către baza de date
            string query = "SELECT AVG( A1.Salariu ) AS Medie FROM Sala_de_fitness.dbo.Angajat A1 INNER JOIN Sala_de_fitness.dbo.Angajat A2 ON A1.ID_Sala = A2.ID_Sala AND A1.ID_Angajat != A2.ID_Angajat ";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    int media = Convert.ToInt32(reader["Medie"]);
                    Label4.Text += $" {media} lei <br />";
                }

                reader.Close();
            }
        }
        private void ClientiEchip()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";
            string query = "SELECT C.Nume + ' ' + C.Prenume AS NumeComplet FROM Sala_de_fitness.dbo.Client C INNER JOIN Sala_de_fitness.dbo.Exercitiu E ON C.ID_Client = E.ID_Client INNER JOIN Sala_de_fitness.dbo.Echipament EC ON E.ID_Echipament = EC.ID_Echipament WHERE E.Complexitate = 'Usor'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                // Verificăm dacă există angajați în Prahova
                if (reader.HasRows)
                {
                    // Începem lista neordonată
                    
                    Label5.Text += "<ol>";

                    while (reader.Read())
                    {
                        string nume = reader["NumeComplet"].ToString();

                        // Adăugăm fiecare angajat ca un element de listă
                        Label5.Text += $"<li>{nume}</li>";
                    }

                    // Închidem lista neordonată
                    Label5.Text += "</ol>";
                }
                else
                {
                    Label5.Text = "Nu există angajați în Prahova.";
                }

                reader.Close();
            }
        }

        private void PopuleazaDropDownListAngajati()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";
            string query = "SELECT ID_Angajat, Nume + ' ' + Prenume AS NumeComplet FROM Sala_de_fitness.dbo.Angajat";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                ddlAngajati.DataSource = reader;
                ddlAngajati.DataTextField = "NumeComplet";
                ddlAngajati.DataValueField = "ID_Angajat";
                ddlAngajati.DataBind();

                reader.Close();
            }
        }

        protected void ddlAngajati_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Afișăm ID_Sala corespunzător angajatului selectat
            string selectedAngajatID = ddlAngajati.SelectedValue;
            AfiseazaIdSalaPentruAngajat(selectedAngajatID);
        }

        private void AfiseazaIdSalaPentruAngajat(string angajatID)
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";
            string query = $"SELECT COUNT( A.ID_Sala ) AS NR FROM Sala_de_fitness.dbo.Angajat A INNER JOIN Sala_de_fitness.dbo.Echipament E ON A.ID_Sala = E.ID_Sala WHERE A.ID_Angajat = {angajatID}";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    string idSala = reader["NR"].ToString();
                    lblIdSala.Text = $"Numar de echipamente in sala unde lucreaza angajatul respectiv: {idSala}";
                }

                reader.Close();
            }
        }
    }
}

