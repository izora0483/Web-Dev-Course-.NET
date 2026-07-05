using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuotationApp.QuotationApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtSalesPrice.Focus();
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnCalculate_Click1(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                double price = Convert.ToDouble(txtSalesPrice.Text);
                int discount = Convert.ToInt32(txtDiscountPercent.Text);

              double amount = price * (discount / 100.0);
                double total = price - amount;

                lblDiscountAmount.Text = amount.ToString("c");
                lblTotalPrice.Text = total.ToString("c");
            }

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Session["SalesPrice"] = txtSalesPrice.Text;
            Session["DiscountAmount"] = lblDiscountAmount.Text;
            Session["TotalPrice"] = lblTotalPrice.Text;

            Response.Redirect("Confirmation.aspx");
        }
    }
}