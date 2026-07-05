<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="QuotationApp.QuotationApp.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
       <h1>Confirmation</h1>
    <form id="frmConfirmation" runat="server">
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

        <p><asp:Button ID="btnBack" runat="server" Text="BACK" OnClick="btnBack_Click" />&nbsp;&nbsp;<asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" OnClick="btnSubmit_Click" /></p>
    </form>
</body>
</html>
