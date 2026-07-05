using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuotationApp.QuotationApp
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SalesPrice"] != null && Session["DiscountAmount"] != null && (Session["TotalPrice"] != null))
            {
                decimal SalesPrice = Convert.ToDecimal(Session["SalesPrice"]);
                lblSalesPrice.Text = SalesPrice.ToString("c");

                lblDiscountAmount.Text = Session["DiscountAmount"].ToString();
                lblTotalPrice.Text = Session["TotalPrice"].ToString();
            }

            else
            {
                Response.Redirect("Default.aspx");
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
    
                if (txtName.Text == "" || txtEmail.Text == "")
                {
                    lblMessage.Text = "Enter name and email.";
                    return;
                }

                lblMessage.Text = "Quotation sent to " + txtName.Text + " at " + txtEmail.Text + ".";

                Session["SalesPrice"] = null;
                Session["DiscountAmount"] = null;
                Session["TotalPrice"] = null;
            }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}