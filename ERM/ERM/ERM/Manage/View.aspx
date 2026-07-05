<%@ Page Title="" Language="C#" MasterPageFile="~/ERM/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="ERM.ERM.Manage.View" %>
<asp:Content ID="MyContent" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">

    <h1>Symposium Registration</h1>
    <br />

    <!-- ## NAME & EMAIL ## -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-6">
                <p>
                    <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label> <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
                    
                </p>
            </div>
            <div class="col-6">
                <p>
                    <asp:Label ID="lblEmailAddress" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
    </div>
    <br />

    <!-- ## RATE ## -->
    <h1>Symposium Rates</h1>
    <br />

    <p>
        <asp:Label ID="lblRates" runat="server" Text=""></asp:Label>
    </p>
    <br />

    <!-- ## LUNCH OPTIONS -->
    <h1>Lunch Options</h1>
    <br />

    <p>I request the following lunch option:</p>
    <p>
        <asp:Label ID="lblLunch" runat="server" Text=""></asp:Label>
    </p>
    <br />

    <!-- ## DISABILITY OPTIONS -->
    <h1>Accessibility Options</h1>
    <br />

    <p>I require the following services</p>
    <p>
        Audio Assistance: <asp:Label ID="lblAudio" runat="server" Text=""></asp:Label> <br />
        Visual Assistance: <asp:Label ID="lblVisual" runat="server" Text=""></asp:Label> <br />
        Mobile Assistance: <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label>
    </p>
    <br />

    <p>
        <asp:Button ID="btnEdit" CssClass="btn btn-dark" runat="server" Text="Edit" OnClick="btnEdit_Click" />&nbsp;&nbsp;
        <asp:Button ID="btnDelete" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />&nbsp;&nbsp;
        <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"></asp:LinkButton>
    </p>

</asp:Content> 
