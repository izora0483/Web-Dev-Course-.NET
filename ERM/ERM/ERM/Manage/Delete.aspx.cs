using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ERM.ERM.Manage
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected bool VerifyForm()
        {
            if (chkConfirm.Checked == false)
            {
                ErrorPanel.Visible = true;
                ErrorMessage.Text = "Please confirm your removal request.";

                return false;
            }
            else
            {
                return true;
            }
        }

        protected bool DeleteRegistration(string id)
        {
            try
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ERM"].ConnectionString;
                //string SQL = "DELETE FROM Registrations_ERM_Acharya WHERE RegistrationID = @RegistrationID;";
                string SQL = "UPDATE Registrations_ERM_Acharya SET IsDeleted = 1, DateTimeDeleted = @DateTimeDeleted WHERE RegistrationID = @RegistrationID;";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(SQL, connection);

                    command.Parameters.AddWithValue("@RegistrationID", id);
                    command.Parameters.AddWithValue("@DateTimeDeleted", DateTime.Now);

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                return true;
            }
            catch
            {
                return false;
            }
        }





        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (VerifyForm() == true)
            {
                if (DeleteRegistration(Request.QueryString["id"]) == true)
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