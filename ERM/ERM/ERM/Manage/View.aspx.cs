using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERM.ERM.Manage
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getDetails(Request.QueryString["id"].ToString());
        }

        protected void getDetails(string id)
        {
            // setup and create the connection to the database
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ERM"].ConnectionString;
            string SQL = "SELECT * FROM Registrations_ERM_Acharya WHERE RegistrationID = '" + id + "';";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(SQL, connection);
                command.Connection = connection;
                command.Connection.Open();

                // create a data reader
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        lblFirstName.Text = reader["FirstName"].ToString();
                        lblLastName.Text = reader["LastName"].ToString();
                        lblEmailAddress.Text = TripleDESEncryption.Decrypt(reader["EmailAddress"].ToString());


                        switch (reader["Rate".ToString()])
                        {
                            case "M":
                                lblRates.Text = "Member Fee";
                                break;
                            case "N":
                                lblRates.Text = "Non-Member Fee";
                                break;
                            case "W":
                                lblRates.Text = "Dues Waiver Fee";
                                break;
                            default:
                                lblRates.Text = String.Empty;
                                break;
                        }

                        lblLunch.Text = reader["Lunch"].ToString();

                        if (reader["Audio"].ToString() == "1")
                        {
                            lblAudio.Text = "Yes";
                        }
                        else
                        {
                            lblAudio.Text = "No";
                        }
                        if (reader["Visual"].ToString() == "1")
                        {
                            lblVisual.Text = "Yes";
                        }
                        else
                        {
                            lblVisual.Text = "No";
                        }
                        if (reader["Mobile"].ToString() == "1")
                        {
                            lblMobile.Text = "Yes";
                        }
                        else
                        {
                            lblMobile.Text = "No";
                        }

                    }
                }

                // close the objects
                reader.Close();
                connection.Close();
            }

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx?id=" + Request.QueryString["id"]);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("Delete.aspx?id=" + Request.QueryString["id"]);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
}