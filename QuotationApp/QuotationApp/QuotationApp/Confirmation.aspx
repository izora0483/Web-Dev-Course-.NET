<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="QuotationApp.QuotationApp.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quotation Confirmation</title>
</head>
<body>
       <h1>Confirmation</h1>
    <form id="frmConfirmation" runat="server">
<table>
    <tr>
        <td>Sales Price:</td>
        <td width ="25">&nbsp;</td>
        <td><asp:Label ID="lblSalesPrice" runat="server" Text="" Font-Bold="True"></asp:Label></td>
  </tr>
  <tr>
     <td>Discount Amount:</td>
     <td></td>
     <td> <asp:Label ID="lblDiscountAmount" runat="server" Text="" Font-Bold="True"></asp:Label></td>
 </tr>
  <tr>
     <td>Total Price:</td>
     <td></td>
     <td><asp:Label ID="lblTotalPrice" runat="server" Text="" Font-Bold="True"></asp:Label></td>
  </tr>
</table>
        <br />

<h3>Send confirmation to</h3>

<table>
    <tr>
        <td>Name:</td>
        <td width="25">&nbsp;</td>
        <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td>Email Address:</td>
        <td></td>
        <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
    </tr>
</table>
<br />
<p>
    <asp:Button ID="Button1" runat="server" Text="Send Quotation" OnClick="btnSubmit_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="Return" OnClick="btnBack_Click" CausesValidation="False" />
</p>

<br />

    <asp:Label ID="lblMessage" runat="server"
    Text="Click the Send Quotation button to send the quotation via email.">
    </asp:Label>

    </form>
</body>
</html>
