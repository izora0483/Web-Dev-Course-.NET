<%@ Page Title="" Language="C#" MasterPageFile="~/ERM/Site.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="ERM.ERM.Manage.Delete" %>
<asp:Content ID="MyContent" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">

    <h1>Symposium Registration</h1>
    <br />

    <asp:Panel ID="ErrorPanel" Visible="false" runat="server">
        <div class="alert alert-danger" role="alert">
            <b>Error:</b> <asp:Label ID="ErrorMessage" runat="server"></asp:Label>
        </div>
    </asp:Panel>

    <p>
        If you are <b>ABSOLUTELY POSITIVE</b> that you want to <strong>DELETE</strong> this registration from the database, confirm your action and click the button below.
    </p>
    <br />

    <p>
        <asp:CheckBox ID="chkConfirm" runat="server" Text="&nbsp;Yes I am sure I want to remove this registration" />
        <br />
        <br />

        <asp:Button ID="btnDelete" CssClass="btn btn-danger" runat="server" Text="DELETE" OnClick="btnDelete_Click" />&nbsp;&nbsp;
        <asp:LinkButton ID="btnCancel" runat="server" OnClick="btnCancel_Click">CANCEL</asp:LinkButton>
    </p>

</asp:Content>
