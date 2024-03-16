using System;
using System.Data;
using System.Data.SqlClient;

namespace Sala_de_fitnessDB
{
    public partial class TableSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTables();
                PopuleazaDropDownListC();
                PopuleazaDropDownListE();
            }
        }

        private void LoadTables()
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'", con))
                {
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlTables.DataSource = reader;
                        ddlTables.DataTextField = "TABLE_NAME";
                        ddlTables.DataValueField = "TABLE_NAME";
                        ddlTables.DataBind();
                    }
                }
            }
        }

        protected void ddlTables_SelectedIndexChanged(object sender, EventArgs e)
        {
           

            string selectedTableName = ddlTables.SelectedValue;
            DisplayTableRows(selectedTableName);
            ShowInsertForm(selectedTableName);

            // Actualizează vizibilitatea butoanelor în funcție de tabela selectată
            btnInsert.Visible = selectedTableName == "Client" || selectedTableName == "Exercitiu";
            btnDelete.Visible = selectedTableName == "Client" || selectedTableName == "Exercitiu";
            btnUpdate.Visible = selectedTableName == "Client" || selectedTableName == "Exercitiu";

        }

        private void DisplayTableRows(string tableName)
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = $"SELECT * FROM {tableName}";
                SqlDataAdapter adapter = new SqlDataAdapter(query, con);

                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        private void ShowInsertForm(string tableName)
        {
            pnlClient.Visible = tableName == "Client";
            pnlExercitiu.Visible = tableName == "Exercitiu";
        }

        protected void btnSaveClient_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Client (ID_Sala, ID_Angajat, Varsta, CNP, Nume, Prenume, Numar_de_telefon, Email, Sex) " +
                               "VALUES (@ID_Sala, @ID_Angajat, @Varsta, @CNP, @Nume, @Prenume, @Numar_de_telefon, @Email, @Sex)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    cmd.Parameters.AddWithValue("@ID_Sala", txtIdSala.Text);
                    cmd.Parameters.AddWithValue("@ID_Angajat", txtIdAngajat.Text);
                    cmd.Parameters.AddWithValue("@Varsta", txtVarsta.Text);
                    cmd.Parameters.AddWithValue("@CNP", txtCNP.Text);
                    cmd.Parameters.AddWithValue("@Nume", txtNume.Text);
                    cmd.Parameters.AddWithValue("@Prenume", txtPrenume.Text);
                    cmd.Parameters.AddWithValue("@Numar_de_telefon", txtNrTelefon.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Sex", txtSex.Text);

                    cmd.ExecuteNonQuery();
                }
            }

            DisplayTableRows("Client");
            ClearClientControls();
        }

        

        protected void btnConfirmDeleteClient_Click(object sender, EventArgs e)
        {
            int clientId;
            if (int.TryParse(txtDeleteClientId.Text, out clientId))
            {
                string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Client WHERE ID_Client = @ID_Client";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@ID_Client", clientId);
                        cmd.ExecuteNonQuery();
                    }
                }

                DisplayTableRows("Client");
                ClearClientControls();
            }
        }

        private void PopuleazaDropDownListC()
        {
            string[] campuri = { "Nume", "Prenume", "Varsta", "CNP", "ID_Sala", "ID_Angajat", "Numar_de_telefon", "Email", "Sex" };
            ddlFieldsToUpdateC.DataSource = campuri;
            ddlFieldsToUpdateC.DataBind();
        }

        protected void btnSaveUpdateC_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Obține câmpul selectat din DropDownList
                string campSelectat = ddlFieldsToUpdateC.SelectedValue;

                // Construiește interogarea SQL cu parametrii corespunzători
                string query = $"UPDATE Client SET {campSelectat} = @{campSelectat} WHERE ID_Client = @ID_Client";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@ID_Client", txtUpdateIdC.Text);
                    cmd.Parameters.AddWithValue($"@{campSelectat}", txtUpdateValueC.Text); // txtUpdateValueC ar trebui să fie un control corespunzător
                    cmd.ExecuteNonQuery();
                }

                DisplayTableRows("Client");
                ClearClientControls();
            }
        }


        protected void btnSaveExercitiu_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Exercitiu (ID_Exercitiu, ID_Client, ID_Echipament, Nume, Complexitate) " +
                               "VALUES (@ID_Exercitiu, @ID_Client, @ID_Echipament, @Nume, @Complexitate)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    string complexitate = ddlComplexitate.SelectedValue;

                    cmd.Parameters.AddWithValue("@ID_Exercitiu", txtIdExercitiu.Text);
                    cmd.Parameters.AddWithValue("@ID_Client", txtIdClient.Text);
                    cmd.Parameters.AddWithValue("@ID_Echipament", txtIdEchipament.Text);
                    cmd.Parameters.AddWithValue("@Nume", txtNumeExercitiu.Text);
                    cmd.Parameters.AddWithValue("@Complexitate", complexitate);

                    cmd.ExecuteNonQuery();
                }
            }

            DisplayTableRows("Exercitiu");
            ClearExercitiuControls();
        }

        protected void btnConfirmDeleteExercitiu_Click(object sender, EventArgs e)
        {
            int exercitiuId;
            if (int.TryParse(txtDeleteExercitiuId.Text, out exercitiuId))
            {
                string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Exercitiu_Grupa_musculara WHERE ID_Exercitiu = @ID_Exercitiu", con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@ID_Exercitiu", exercitiuId);
                        cmd.ExecuteNonQuery();
                    }

                    // Now you can safely delete the record in the Exercitiu table
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Exercitiu WHERE ID_Exercitiu = @ID_Exercitiu", con))
                    {
                        cmd.Parameters.AddWithValue("@ID_Exercitiu", exercitiuId);
                        cmd.ExecuteNonQuery();
                    }
                }

                DisplayTableRows("Exercitiu");
                ClearExercitiuControls();
            }
        }

        private void PopuleazaDropDownListE()
        {
            string[] campuri = { "ID_Client", "ID_Echipament", "Nume", "Complexitate" };
            ddlFieldsToUpdateE.DataSource = campuri;
            ddlFieldsToUpdateE.DataBind();
        }

        protected void btnSaveUpdateE_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=fllffl\\sqlexpress;Initial Catalog=Sala_de_fitness;Integrated Security=True;Encrypt=False";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Obține câmpul selectat din DropDownList
                string campSelectat = ddlFieldsToUpdateE.SelectedValue;

                // Construiește interogarea SQL cu parametrii corespunzători
                string query = $"UPDATE Exercitiu SET {campSelectat} = @{campSelectat} WHERE ID_Exercitiu = @ID_Exercitiu";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@ID_Exercitiu", txtUpdateIdE.Text);
                    cmd.Parameters.AddWithValue($"@{campSelectat}", txtUpdateValueE.Text);
                    cmd.ExecuteNonQuery();
                }

                DisplayTableRows("Exercitiu");
                ClearExercitiuControls();
            }
        }



        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string selectedTableName = ddlTables.SelectedValue;

            if (selectedTableName == "Client")
            {
                pnlInsertClient.Visible = true;
                btnSaveClient.Visible = true;
                btnCancel1.Visible = true;
                
            }
            else if (selectedTableName == "Exercitiu")
            {
                pnlInsertExercitiu.Visible = true;
                btnSaveExercitiu.Visible = true;
                btnCancel3.Visible = true;
                
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string selectedTableName = ddlTables.SelectedValue;

            if (selectedTableName == "Client")
            {
                pnlDeleteClient.Visible = true;
                btnConfirmDeleteClient.Visible = true;
                btnCancel2.Visible = true;
                
            }
            else if (selectedTableName == "Exercitiu")
            {
                pnlDeleteExercitiu.Visible = true;
                btnConfirmDeleteExercitiu.Visible = true;
                btnCancel4.Visible = true;
                
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string selectedTableName = ddlTables.SelectedValue;

            if (selectedTableName == "Client")
            {
                pnlUpdateClient.Visible = true;
                btnSaveUpdateC.Visible = true;
                btnCancelUpdateC.Visible = true;

            }
            else if (selectedTableName == "Exercitiu")
            {
                pnlUpdateExercitiu.Visible = true;
                btnSaveUpdateE.Visible = true;
                btnCancelUpdateE.Visible = true;

            }
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Hide both UpdateClient and UpdateExercitiu-specific elements
            pnlUpdateClient.Visible = false;
            lblUpdateIdC.Visible = true;
            txtUpdateIdC.Visible = true;
            lblUpdateFieldC.Visible = true;
            txtUpdateValueC.Visible = true;
            btnSaveUpdateC.Visible = false;
            btnCancelUpdateC.Visible = false;
            ClearClientControls();

            pnlUpdateExercitiu.Visible = false;
            lblUpdateIdE.Visible = true;
            txtUpdateIdE.Visible = true;
            lblUpdateFieldE.Visible = true;
            txtUpdateValueE.Visible = true;
            btnSaveUpdateE.Visible = false;
            btnCancelUpdateE.Visible = false;
            ClearExercitiuControls();

            string selectedTableName = ddlTables.SelectedValue;

            if (selectedTableName == "Client")
            {
                // Hide Exercitiu-specific elements
                pnlInsertExercitiu.Visible = false;
                btnSaveExercitiu.Visible = false;
                pnlDeleteExercitiu.Visible = false;
                lblDeleteExercitiuId.Visible = false;
                txtDeleteExercitiuId.Visible = false;
                btnConfirmDeleteExercitiu.Visible = false;

                // Show Client-specific elements
                pnlClient.Visible = true;
                pnlInsertClient.Visible = false;
                btnSaveClient.Visible = false;
                pnlDeleteClient.Visible = false;
                lblDeleteClientId.Visible = true;
                txtDeleteClientId.Visible = true;
                btnConfirmDeleteClient.Visible = false;
                ClearClientControls();
            }
            else if (selectedTableName == "Exercitiu")
            {
                // Hide Client-specific elements
                pnlInsertClient.Visible = false;
                btnSaveClient.Visible = false;
                pnlDeleteClient.Visible = false;
                lblDeleteClientId.Visible = false;
                txtDeleteClientId.Visible = false;
                btnConfirmDeleteClient.Visible = false;

                // Show Exercitiu-specific elements
                pnlClient.Visible = true;
                pnlInsertExercitiu.Visible = false;
                btnSaveExercitiu.Visible = false;
                pnlDeleteExercitiu.Visible = false;
                lblDeleteExercitiuId.Visible = true;
                txtDeleteExercitiuId.Visible = true;
                btnConfirmDeleteExercitiu.Visible = false;
                ClearExercitiuControls();
            }
        }


        private void ClearClientControls()
        {
            // Logica pentru resetarea controalelor din zona de Client
            txtIdSala.Text = string.Empty;
            txtIdAngajat.Text = string.Empty;
            txtVarsta.Text = string.Empty;
            txtCNP.Text = string.Empty;
            txtNume.Text = string.Empty;
            txtPrenume.Text = string.Empty;
            txtNrTelefon.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSex.Text = string.Empty;
            txtDeleteClientId.Text = string.Empty;

            // Clear Update controls for Client
            txtUpdateIdC.Text = string.Empty;
            txtUpdateValueC.Text = string.Empty;
        }

        private void ClearExercitiuControls()
        {
            // Logica pentru resetarea controalelor din zona de Exercitiu
            txtIdExercitiu.Text = string.Empty;
            txtIdClient.Text = string.Empty;
            txtIdEchipament.Text = string.Empty;
            txtNumeExercitiu.Text = string.Empty;
            ddlComplexitate.SelectedIndex = 0; // Resetează la prima opțiune
            txtDeleteExercitiuId.Text = string.Empty;

            // Clear Update controls for Exercitiu
            txtUpdateIdE.Text = string.Empty;
            txtUpdateValueE.Text = string.Empty;
        }
        protected void btnRedirect1_Click(object sender, EventArgs e)
        {
            // Redirecționează către pagina "JoinuriSimple.aspx"
            Response.Redirect("JoinuriSimple.aspx");
        }
        protected void btnRedirect2_Click(object sender, EventArgs e)
        {
            // Redirecționează către pagina "JoinuriSimple.aspx"
            Response.Redirect("JoinuriComplexe.aspx");
        }
    }
}


