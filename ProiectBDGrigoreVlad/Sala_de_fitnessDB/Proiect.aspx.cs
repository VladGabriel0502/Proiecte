using System;
using System.Data.SqlClient;

namespace Sala_de_fitnessDB
{
    public partial class Proiect : System.Web.UI.Page
    {
        // Stringul de conexiune la baza de date (modifică-l conform configurației tale)
        private string connectionString = "Data Source=FLLFFL\\SQLEXPRESS;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Puteți adăuga cod suplimentar la încărcarea paginii, dacă este necesar.
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string enteredNume = txtNume.Text;
            string enteredPrenume = txtPrenume.Text;
            string enteredParola = txtParola.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Verificare în baza de date
                string query = "SELECT COUNT(*) FROM Angajat WHERE Nume = @Nume AND Prenume = @Prenume AND CNP = @CNP AND Nume = 'Popescu' AND Prenume = 'Ion' AND CNP = 2781102016344";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Nume", enteredNume); // Folosește valoarea introdusă
                    command.Parameters.AddWithValue("@Prenume", enteredPrenume); // Folosește valoarea introdusă
                    command.Parameters.AddWithValue("@CNP", enteredParola); // Folosește valoarea introdusă (deși e important să nu stochezi parolele în clar în producție)


                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        // Autentificare reușită - redirecționați către pagina de inserare
                        Response.Redirect("TableSelection.aspx");
                    }
                    else
                    {
                        // Autentificare eșuată - afișați un mesaj de eroare
                        Response.Redirect("PaginaEroare.aspx?mesaj=Autentificare esuata");
                    }
                }
            }
        }

    }
}
