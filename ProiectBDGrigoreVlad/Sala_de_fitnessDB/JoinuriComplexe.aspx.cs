using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sala_de_fitnessDB
{
    public partial class JoinuriComplexe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Angajati ce au salariu mai mare decat media
                AngajatiMMMedie();

                //Numarul de angajati mai mari decat cel mai tanar
                AngajatiMMCMT();

                //Clientii care lucreaza exercitii medii
                ClientiExercitii();

                //Grupele musculara pentru un client
                // Populează DropDownList cu date din tabela Client
                PopuleazaDropDownListClienti();
            }
        }
        private void AngajatiMMMedie()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";
            string query = "SELECT A.Nume + ' ' + A.Prenume AS NumeComplet FROM Sala_de_fitness.dbo.Angajat A WHERE A.Salariu > ( SELECT AVG( A1.Salariu ) FROM Sala_de_fitness.dbo.Angajat A1)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                // Verificăm dacă există angajați în Prahova
                if (reader.HasRows)
                {
                    // Începem lista neordonată

                    Label1.Text += "<ul>";

                    while (reader.Read())
                    {
                        string numeComplet = reader["NumeComplet"].ToString();

                        // Adăugăm fiecare angajat ca un element de listă
                        Label1.Text += $"<li>{numeComplet}</li>";
                    }

                    // Închidem lista neordonată
                    Label1.Text += "</ul>";
                }
                else
                {
                    Label1.Text = "<br />Nu există angajați cu salarii mai mari decat media.";
                }

                reader.Close();
            }
        }

        private void AngajatiMMCMT()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False"; // Înlocuiește cu conexiunea reală către baza de date
            string query = "SELECT COUNT( C.ID_Client ) AS NR FROM Sala_de_fitness.dbo.Client C WHERE C.Varsta > ( SELECT TOP 1 C1.VARSTA FROM Sala_de_fitness.dbo.Client C1 WHERE C1.Varsta IS NOT NULL ORDER BY C1.Varsta)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    int nr = Convert.ToInt32(reader["NR"]);
                    Label2.Text += $" {nr} <br />";
                }

                reader.Close();
            }
        }

        private void ClientiExercitii()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";
            string query = "SELECT C.Nume + ' ' + C.Prenume AS NumeComplet FROM Sala_de_fitness.dbo.Client C WHERE C.ID_Client IN ( SELECT E.ID_Client FROM Sala_de_fitness.dbo.Exercitiu E WHERE E.Complexitate = 'Mediu' GROUP BY E.ID_Client)";

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
                    Label3.Text = "<br />Niciun client nu lucreaza exercitii medii.";
                }

                reader.Close();
            }
        }


        private void PopuleazaDropDownListClienti()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";
            string query = "SELECT ID_Client, Nume + ' ' + Prenume AS NumeComplet FROM Sala_de_fitness.dbo.Client";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                ddlClienti.DataSource = reader;
                ddlClienti.DataTextField = "NumeComplet";
                ddlClienti.DataValueField = "ID_Client";
                ddlClienti.DataBind();

                reader.Close();
            }
        }

        protected void ddlClienti_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblGM.Text = string.Empty; // Curăță eticheta pentru a afișa noile rezultate

            // Afișăm grupa musculară pentru clientul selectat
            string selectedClientID = ddlClienti.SelectedValue;
            AfiseazaGrupaMuscularaPentruClient(selectedClientID);
        }

        private void AfiseazaGrupaMuscularaPentruClient(string clientID)
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";
            string query = $"SELECT G.Nume AS Nume FROM Sala_de_fitness.dbo.Grupa_musculara G " +
                           $"WHERE G.ID_Grupa_musculara IN " +
                           $"(SELECT G.ID_Grupa_musculara FROM Sala_de_fitness.dbo.Grupa_musculara G " +
                           $"INNER JOIN Sala_de_fitness.dbo.Exercitiu_Grupa_musculara EG ON G.ID_Grupa_musculara = EG.ID_Grupa_musculara " +
                           $"INNER JOIN Sala_de_fitness.dbo.Exercitiu E ON EG.ID_Exercitiu = E.ID_Exercitiu " +
                           $"INNER JOIN Sala_de_fitness.dbo.Client C ON E.ID_Client = C.ID_Client " +
                           $"WHERE C.ID_Client = {clientID})";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    // Începe lista neordonată
                    lblGM.Text += "<ul>";

                    while (reader.Read())
                    {
                        string nume = reader["Nume"].ToString();

                        // Adăugăm fiecare element ca un element de listă
                        lblGM.Text += $"<li>{nume}</li>";
                    }

                    // Închide lista neordonată
                    lblGM.Text += "</ul>";
                }
                else
                {
                    lblGM.Text = "<br />Nu există rezultate pentru acest client.";
                }

                reader.Close();
            }
        }
    }
}


