<%@ Page Title="" Language="C#" MasterPageFile="~/ERM/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="ERM.ERM.Manage.Edit" %>
<asp:Content ID="MyContent" ContentPlaceHolderID="MyContentPlaceHolder" runat="server">

    <h1>Symposium Registration</h1>
    <br />

    <asp:Panel ID="ErrorPanel" Visible="false" runat="server">
        <div class="alert alert-danger" role="alert">
            <b>Error:</b> <asp:Label ID="ErrorMessage" runat="server"></asp:Label>
        </div>
    </asp:Panel>

    <!-- ## NAME ## -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-6">
                <p>
                    <asp:Label ID="lblFirstName" CssClass="field-label" runat="server" Text="First Name"></asp:Label> <span class="red field-label">*</span>
                    <br />
                    <asp:TextBox ID="txtFirstName" Width="425px" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="col-6">
                <p>
                    <asp:Label ID="lblLastName" CssClass="field-label" runat="server" Text="Last Name"></asp:Label> <span class="red field-label">*</span>
                    <br />
                    <asp:TextBox ID="txtLastName" Width="425px" runat="server"></asp:TextBox>
                </p>
            </div>
        </div>
    </div>
    <br />

    <!-- ## EMAIL ## -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-6">
                <p>
                    <asp:Label ID="lblEmailAddress" CssClass="field-label" runat="server" Text="Email Address"></asp:Label> <span class="red field-label">*</span>
                    <br />
                    <asp:TextBox ID="txtEmailAddress" Width="425px" runat="server"></asp:TextBox>
                </p>
            </div>
            <div class="col-6">
                <p>
                    <asp:Label ID="lblComfirmEmailAddress" CssClass="field-label" runat="server" Text="Confirm Email Address"></asp:Label> <span class="red field-label">*</span>
                    <br />
                    <asp:TextBox ID="txtConfirmEmailAddress" Width="425px" runat="server"></asp:TextBox>
                </p>
            </div>
        </div>
    </div>
    <br />

    <!-- ## RATE ## -->
    <h1>Symposium Rates</h1>
    <br />

    <p>
        <asp:DropDownList ID="lstRates" Width="425px" runat="server">
            <asp:ListItem Text="Select a Rate" Value="NULL" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Member Fee" Value="M"></asp:ListItem>
            <asp:ListItem Text="Non-member Fee" Value="N"></asp:ListItem>
            <asp:ListItem Text="Dues Waiver Fee" Value="W"></asp:ListItem>
        </asp:DropDownList>

    </p>
    <br />

    <!-- ## LUNCH OPTIONS -->
    <h1>Lunch Options</h1>
    <br />

    <p>I request the following lunch option:</p>
    <p>
        <asp:RadioButton ID="optRegular" GroupName="Lunch" runat="server" Text="&nbsp;Regular" />&nbsp;&nbsp;
        <asp:RadioButton ID="optKosher" GroupName="Lunch" runat="server" Text="&nbsp;Kosher" />&nbsp;&nbsp;
        <asp:RadioButton ID="optVegeterian" GroupName="Lunch" runat="server" Text="&nbsp;Vegeterian" />&nbsp;&nbsp;
        <asp:RadioButton ID="optVegan" GroupName="Lunch" runat="server" Text="&nbsp;Vegan" />&nbsp;&nbsp;
        <asp:RadioButton ID="optFruit" GroupName="Lunch" runat="server" Text="&nbsp;Fruit Plate" />&nbsp;&nbsp;
        <asp:RadioButton ID="optGlutenFree" GroupName="Lunch" runat="server" Text="&nbsp;Gluten Free" />&nbsp;&nbsp;
        <asp:RadioButton ID="optLactoseFree" GroupName="Lunch" runat="server" Text="&nbsp;Lactose Free" />&nbsp;&nbsp;
    </p>
    <br />

    <!-- ## DISABILITY OPTIONS -->
    <h1>Accessibility Options</h1>
    <br />

    <p>I require the following services</p>
    <p>
        <asp:CheckBox ID="chkAudo" runat="server" Text="&nbsp;Audio Assistance" />&nbsp;&nbsp;
        <asp:CheckBox ID="chkVisual" runat="server" Text="&nbsp;Visual Assistance" />&nbsp;&nbsp;
        <asp:CheckBox ID="chkMobile" runat="server" Text="&nbsp;Mobile Assistance" />&nbsp;&nbsp;
    </p>
    <br />
    
    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />&nbsp;&nbsp
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />


</asp:Content>