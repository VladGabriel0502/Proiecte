using System;

namespace Sala_de_fitnessDB
{
    public partial class PaginaEroare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifică dacă există un parametru de query string numit "mesaj"
            if (!string.IsNullOrEmpty(Request.QueryString["mesaj"]))
            {
                string mesajEroare = Request.QueryString["mesaj"];
                lblMesajEroare.Text = mesajEroare;
            }
            else
            {
                // Dacă nu există un parametru de query string, afișează un mesaj implicit
                lblMesajEroare.Text = "A apărut o eroare.";
            }
        }
    }
}
