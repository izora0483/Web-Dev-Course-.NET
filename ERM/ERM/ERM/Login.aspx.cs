using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERM.ERM
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected bool Authentication(string Username, string Password)
        {
            // setup the database connection
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ERM"].ConnectionString;
            string SQL = "SELECT UserID FROM Users WHERE Username = @Username AND Password = @Password;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                bool results = false;

                SqlCommand command = new SqlCommand(SQL, connection);

                command.Parameters.AddWithValue("@Username", Username);
                command.Parameters.AddWithValue("@Password", ComputeSha256Hash(Password));

                command.Connection.Open();

                // create a data reader
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows == true)
                {
                    results = true;
                }

                // close the database connection
                reader.Close();
                connection.Close();

                return results;
            }
        }

        public static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2")); // format as hexadecimal
                }
                return builder.ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Authentication(txtUsername.Text, txtPassword.Text) == true)
            {
                System.Web.Security.FormsAuthentication.SetAuthCookie(txtUsername.Text, false);
                Response.Redirect("/ERM/Manage/Dashboard.aspx");

            }
            else
            {
                txtUsername.Text = String.Empty;
                txtPassword.Text = String.Empty;
            }
        }

        protected void bthHash_Click(object sender, EventArgs e)
        {
            HashValue.Text = ComputeSha256Hash(txtPassword.Text);
        }
    }
}