<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QuotationApp.QuotationApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Price Quotation</title>
</head>
<body>
    <h1>Price Quotation</h1>
    <form id="frmPriceQuotation" runat="server">      
<table>
    <tr>
        <td>Sales Price:</td>
        <td width ="25">&nbsp;</td>
        <td><asp:TextBox ID="txtSalesPrice" runat="server"></asp:TextBox></td>
        <td width ="5">&nbsp;</td>
        <td><asp:RequiredFieldValidator ID="valRequiredSalesPrice" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="txtSalesPrice" ForeColor="Red" SetFocusOnError="True" EnableClientScript="False"></asp:RequiredFieldValidator></td>
        <td><asp:RangeValidator ID="valRangeSalesPrice" runat="server" ControlToValidate="txtSalesPrice" MinimumValue="10" MaximumValue="1000" Type="Double" ErrorMessage="Must be between 10 and 1000" ForeColor="Red" Display="Dynamic" EnableClientScript="False" /></td>
  </tr>
   <tr>
         <td colspan ="5">&nbsp;</td>
  </tr>
   <tr>
     <td>Discount Percent:</td>
     <td></td>
     <td><asp:TextBox ID="txtDiscountPercent" runat="server"></asp:TextBox></td>
     <td></td>
     <td><asp:RequiredFieldValidator ID="valRequiredDiscountPercent" runat="server" ErrorMessage="Required"  Display="Dynamic" ControlToValidate="txtDiscountPercent" ForeColor="Red" SetFocusOnError="True" EnableClientScript="False"></asp:RequiredFieldValidator></td>
     <td><asp:RangeValidator ID="valRangeDiscountPercent" runat="server" ControlToValidate="txtDiscountPercent" MinimumValue="10" MaximumValue="50" Type="Integer" ErrorMessage="Must be between 10 and 50" ForeColor="Red" Display="Dynamic" EnableClientScript="False" /></td>
 </tr>
  <tr>
     <td>Discount Amount:</td>
     <td></td>
     <td> <asp:Label ID="lblDiscountAmount" runat="server" Text="" Font-Bold="True"></asp:Label></td>
     <td></td>
     <td></td>
 </tr>
  <tr>
  <td colspan ="5">&nbsp;</td>
 </tr>
  <tr>
     <td>Total Price:</td>
     <td></td>
     <td><asp:Label ID="lblTotalPrice" runat="server" Text="" Font-Bold="True"></asp:Label></td>
     <td></td>
     <td></td>
  </tr>
</table>
<br  />
<p><asp:Button ID="btnCalculate1" runat="server" Text="CALCULATE" OnClick="btnCalculate_Click1" />&nbsp;&nbsp;<asp:Button ID="btnConfirm" runat="server" Text="CONFIRM" OnClick="btnConfirm_Click" CausesValidation="False" /></p>
    </form>
</body>
</html>


