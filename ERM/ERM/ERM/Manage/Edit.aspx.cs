using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERM.ERM.Manage
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getDetails(Request.QueryString["id"].ToString());
            }
        }

        protected void DisplayError(string message)
        {
            ErrorPanel.Visible = true;
            ErrorMessage.Text = message;
        }

        protected bool verifyForn()
        {
            if (txtFirstName.Text == String.Empty)
            {
                //ErrorPanel.Visible = true;
                //ErrorMessage.Text = "Please provide your first name.";

                DisplayError("Please provide your first name");

                txtFirstName.Focus();

                return false;
            }
            else if (txtLastName.Text == String.Empty)
            {
                //ErrorPanel.Visible = true;
                //ErrorMessage.Text = "Please provide last first name.";

                DisplayError("Please provide your last name.");

                txtLastName.Focus();
                return false;
            }
            else if (txtEmailAddress.Text == String.Empty)
            {
                DisplayError("Please provide your email address");
                txtEmailAddress.Focus();

                return false;
            }
            else if (txtConfirmEmailAddress.Text == String.Empty)
            {
                DisplayError("Please confirm your email address.");
                txtConfirmEmailAddress.Focus();

                return false;
            }
            else if (txtEmailAddress.Text != txtConfirmEmailAddress.Text)
            {
                DisplayError("Please confirm your email address");
                txtConfirmEmailAddress.Text = String.Empty;
                txtConfirmEmailAddress.Focus();

                return false;
            }
            else if (lstRates.SelectedValue == "NULL")
            {
                DisplayError("Please select a symposium rate.");
                lstRates.Focus();

                return false;
            }
            else if (optRegular.Checked == false && optKosher.Checked == false && optVegeterian.Checked == false && optVegan.Checked == false && optFruit.Checked == false && optGlutenFree.Checked == false && optLactoseFree.Checked == false)
            {
                DisplayError("Please choose a lunch option.");
                lstRates.Focus();

                return false;
            }
            else
            {
                return true;
            }
        }

        protected bool UpdateRegistration(string id)
        {
            //try 
            //{
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ERM"].ConnectionString;
            //string SQL = "INSERT INTO Registrations_ERM_Acharya (RegistrationID, FirstName, LastName, EmailAddress, Rate, Lunch, Audio, Visual, Mobile, DateTimeCreated) VALUES (@RegistrationID, @FirstName, @LastName, @EmailAddress, @Rate, @Lunch, @Audio, @Visual, @Mobile, @DateTimeCreated);";
            string SQL = "UPDATE Registrations_ERM_Acharya SET FirstName = @FirstName, LastName = @LastName, EmailAddress = @EmailAddress, Rate = @Rate, Lunch = @Lunch, Audio = @Audio, Visual = @Visual, Mobile = @Mobile, DateTimeModified = @DateTimeModified WHERE RegistrationID = @RegistrationID;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(SQL, connection);

                command.Parameters.AddWithValue("@RegistrationID", id);

                command.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                command.Parameters.AddWithValue("@LastName", txtLastName.Text);
                command.Parameters.AddWithValue("@EmailAddress", TripleDESEncryption.Encrypt(txtEmailAddress.Text));
                command.Parameters.AddWithValue("@Rate", lstRates.SelectedValue.ToString());

                if (optRegular.Checked == true)
                {
                    command.Parameters.AddWithValue("@Lunch", "Regular");
                }
                else if (optKosher.Checked == true)
                {
                    command.Parameters.AddWithValue("@Lunch", "Kosher");
                }
                else if (optVegeterian.Checked == true)
                {
                    command.Parameters.AddWithValue("@Lunch", "Vegeterian");
                }
                else if (optVegan.Checked == true)
                {
                    command.Parameters.AddWithValue("@Lunch", "Vegan");
                }
                else if (optFruit.Checked == true)
                {
                    command.Parameters.AddWithValue("@Lunch", "Fruit Plate");
                }
                else if (optGlutenFree.Checked == true)
                {
                    command.Parameters.AddWithValue("@Lunch", "Gluten Free");
                }
                else if (optLactoseFree.Checked == true)
                {
                    command.Parameters.AddWithValue("@Lunch", "Lactose Free");
                }


                command.Parameters.AddWithValue("@Audio", chkAudo.Checked);
                command.Parameters.AddWithValue("@Visual", chkVisual.Checked);
                command.Parameters.AddWithValue("@Mobile", chkMobile.Checked);

                command.Parameters.AddWithValue("@DateTimeModified", DateTime.Now);

                connection.Open();
                command.ExecuteNonQuery();

            }

            return true;
            //}
            //catch
            //{
            //    return false;
            //}
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
                        txtFirstName.Text = reader["FirstName"].ToString();
                        txtLastName.Text = reader["LastName"].ToString();
                        txtEmailAddress.Text = TripleDESEncryption.Decrypt(reader["EmailAddress"].ToString());

                        lstRates.SelectedValue = reader["Rate"].ToString();

                        switch (reader["Lunch"].ToString())
                        {
                            case "Regular":
                                optRegular.Checked = true;
                                break;
                            case "Kosher":
                                optKosher.Checked = true;
                                break;
                            case "Vegeterian":
                                optVegeterian.Checked = true;
                                break;
                            case "Vegan":
                                optVegan.Checked = true;
                                break;
                            case "Fruit Plate":
                                optFruit.Checked = true;
                                break;
                            case "Gluten Free":
                                optGlutenFree.Checked = true;
                                break;
                            case "Lactose Free":
                                optLactoseFree.Checked = true;
                                break;
                            default:
                                break;
                        }

                        if (reader["Audio"].ToString() == "1")
                        {
                            chkAudo.Checked = true;
                        }

                        if (reader["Visual"].ToString() == "1")
                        {
                            chkVisual.Checked = true;
                        }

                        if (reader["Mobile"].ToString() == "1")
                        {
                            chkMobile.Checked = true;
                        }

                    }
                }

                // close the objects
                reader.Close();
                connection.Close();

            }

        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (verifyForn() == true)
            {

                if (UpdateRegistration(Request.QueryString["id"]) == true)
                {
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Redirect("Error.aspx");
                }
            }

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("View.aspx?id=" + Request.QueryString["id"]);
        }
    }
}
