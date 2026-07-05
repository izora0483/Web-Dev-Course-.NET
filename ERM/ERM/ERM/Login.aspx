<%@ Page Title="" Language="C#" MasterPageFile="~/ERM/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ERM.ERM.Login" %>
<asp:Content ID="MyContent" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">

    <table align="center">
        <tr>
            <td>Username:</td>
            <td width="10">&nbsp;</td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Password:</td>
            <td width="10">&nbsp</td>
            <td>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="3"></td>
        </tr>

        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </td>
        </tr>

    </table>

    <asp:Label ID="HashValue" runat="server"></asp:Label>
    <asp:Button ID="bthHash" runat="server" Text="Click Me" OnClick="bthHash_Click" />

</asp:Content>