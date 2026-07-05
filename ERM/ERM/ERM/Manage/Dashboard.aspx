<%@ Page Title="" Language="C#" MasterPageFile="~/ERM/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="ERM.ERM.Manage.Dashboard" %>
<asp:Content ID="MyContent" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">
    <h1>Manage Registration Dashboard</h1>
    <br />

    <table width="1200" align="center">

        <tr>
            <td align="center">
                <asp:GridView ID="RegistrationGrid" CssClass="table table-striped" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" Gridlines="Both" Width="1200px" CellPadding="5" CellSpacing="5" DataKeyNames="RegistrationID"  OnPageIndexChanging="RegistrationGrid_PageIndexChanging" runat="server">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="RegistrationID" DataNavigateUrlFormatString="View.aspx?id={0}" DataTextField="Name" HeaderText="Registration Name" ItemStyle-Width="900px" />

                        <asp:BoundField DataField="DateTimeCreated" HeaderText="Registration Date" ItemStyle-Width="300px" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="300px" HeaderStyle-HorizontalAlign="Center" />
                    </Columns>
                </asp:GridView>

                <p>
                    <asp:Label ID="lblNoRecords" Text="There are no results to show in this view." Visible="false" runat="server"></asp:Label>
                </p>
            </td>
        </tr>

    </table>





</asp:Content>