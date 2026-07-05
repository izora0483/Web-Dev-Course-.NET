<%@ Page Title="" Language="C#" MasterPageFile="~/ALZ/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ALZ_WalkRegistrationForm.ALZ.Resigter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h1>Register</h1>
<br />

<!-- Purple Banner -->
<table style="background-color:#62398f; width:80%; margin:auto;" cellspacing="3" cellpadding="3">
    <tr>
        <td align="center" style="color:white;">
            To find your local chapter or walk, visit 
            <a href="http://www.alz.org/" style="color:white;">alz.org</a>
        </td>
    </tr>
</table>

<br />

<!-- Main Form -->
<table style="width:80%; margin:auto;">
    <tr>

        <!-- LEFT SIDE -->
        <td style="width:60%; vertical-align:top;">

            <table>
                <tr>
                    <td style="width:180px;">Walk location</td>
                    <td>
                        <asp:TextBox ID="txtLocation" runat="server" Width="400px" />
                    </td>
                </tr>

                <tr>
                    <td style="padding-top:15px;">Team name</td>
                    <td style="padding-top:15px;">
                        <asp:TextBox ID="txtTeam" runat="server" Width="400px" />
                    </td>
                </tr>
            </table>

        </td>

        <!-- RIGHT SIDE -->
        <td style="width:40%; vertical-align:top; font-size:14px;">

            I am a 
            <asp:CheckBox ID="chkCaptain" runat="server" /> team captain
            <asp:CheckBox ID="chkMember" runat="server" /> team member
            <asp:CheckBox ID="chkIndividual" runat="server" /> individual

            <br /><br />

            My goal is to raise $
            <asp:TextBox ID="txtGoal" runat="server" Width="120px" />
            to help end Alzheimer’s disease.

            <br />
            (The recommended minimum goal is $225.)

            <br /><br />

            <span style="font-style:italic; font-size:12px;">
                *Most Walk events ask for a fundraising minimum of $100 per participant to receive a T-shirt.<br />
                Contact your local chapter to confirm the T-shirt minimum for your Walk.
            </span>

        </td>

    </tr>
</table>

<table style="width:80%; margin:auto; border:1px solid #a88bc4; padding:20px;">
    
    <!-- First + Last Name -->
    <tr>
        <td style="width:180px;">First name</td>
        <td>
            <asp:TextBox ID="txtFirstName" runat="server" Width="400px" />
        </td>
    </tr>

    <tr>
        <td style="padding-top:10px;">Last name</td>
        <td style="padding-top:10px;">
            <asp:TextBox ID="txtLastName" runat="server" Width="400px" />
        </td>
    </tr>

    <!-- Address -->
    <tr>
        <td style="padding-top:10px;">Address</td>
        <td style="padding-top:10px;">
            <asp:TextBox ID="txtAddress" runat="server" Width="500px" />
        </td>
    </tr>

    <!-- City -->
    <tr>
        <td style="padding-top:10px;">City</td>
        <td style="padding-top:10px;">
            <asp:TextBox ID="txtCity" runat="server" Width="300px" />
        </td>
    </tr>

    <!-- State + Zip -->
    <tr>
        <td style="padding-top:10px;">State</td>
        <td style="padding-top:10px;">
            <asp:TextBox ID="txtState" runat="server" Width="60px" />
            &nbsp;&nbsp;&nbsp;
            Zip
            <asp:TextBox ID="txtZip" runat="server" Width="120px" />
        </td>
    </tr>

    <!-- Phone -->
    <tr>
        <td style="padding-top:10px;">Phone (Day)</td>
        <td style="padding-top:10px;">
            <asp:TextBox ID="txtPhoneDay" runat="server" Width="200px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            Phone (Evening)
            <asp:TextBox ID="txtPhoneEvening" runat="server" Width="200px" />
        </td>
    </tr>

    <!-- Email -->
    <tr>
        <td style="padding-top:10px;">E-mail address</td>
        <td style="padding-top:10px;">
            <asp:TextBox ID="txtEmail" runat="server" Width="400px" />
        </td>
    </tr>

    <!-- Company -->
    <tr>
        <td style="padding-top:10px;">Company name</td>
        <td style="padding-top:10px;">
            <asp:TextBox ID="txtCompany" runat="server" Width="500px" />
        </td>
    </tr>

    <!-- Job -->
    <tr>
        <td style="padding-top:10px;">Job title</td>
        <td style="padding-top:10px;">
            <asp:TextBox ID="txtJobTitle" runat="server" Width="500px" />
        </td>
    </tr>

    <!-- Checkbox -->
    <tr>
        <td></td>
        <td style="padding-top:15px;">
            <asp:CheckBox ID="chkMatching" runat="server" />
            Yes, my company has a matching gifts program.
        </td>
    </tr>

</table>

<br />

<!-- Donation -->
<table style="width:80%; margin:auto;">
    <tr>
        <td>
            I’m taking the first step by supporting the Alzheimer’s Association. Enclosed is my personal donation of:
            
            <asp:CheckBox ID="chk120" runat="server" /> $120
            <asp:CheckBox ID="chk60" runat="server" /> $60
            <asp:CheckBox ID="chk35" runat="server" /> $35
            <asp:CheckBox ID="chkOther" runat="server" /> Other 
            <asp:TextBox ID="txtOtherDonation" runat="server" Width="120px" />

            <br /><br />

            To make a credit card donation, please go online:
            <a href="http://www.alz.org/walk">www.alz.org/walk</a>
        </td>
    </tr>
</table>

<!-- Risk Section -->
<table style="width:80%; margin:auto; border:1px solid #a88bc4; padding:15px;">
    <tr>
        <td style="font-size:13px;">

            <b>Assumption of Risk, Release and Permission</b><br /><br />

            Walk to End Alzheimer’s involves walking — an activity which may include risks such as falls, interaction with other participants, 
            effects of weather, traffic and road conditions. I hereby assume all risks and agree not to hold the Alzheimer’s Association liable.

            <br /><br />

            I have read, understand and agree to the terms of this agreement.

            <br /><br />

            Signature 
            <asp:TextBox ID="txtSignature" runat="server" Width="300px" />

            &nbsp;&nbsp;&nbsp;

            Date 
            <asp:TextBox ID="txtDate" runat="server" Width="150px" />

        </td>
    </tr>
</table>

<!-- Demographics -->
<table style="width:80%; margin: auto;">
    <tr>
        <td>

            <b>Please help the Alzheimer’s Association better serve our community by completing the following:</b>
            <br /><br />

            <!-- Gender -->
            Gender 
            <asp:CheckBox ID="chkMale" runat="server" /> Male
            <asp:CheckBox ID="chkFemale" runat="server" /> Female
            <asp:CheckBox ID="chkNoGender" runat="server" /> Prefer not to answer

            <br /><br />

            <!-- Birthdate -->
            Birthdate 
            <asp:TextBox ID="txtBirthdate" runat="server" Width="150px" />

            <br /><br />

            <!-- Race -->
            Choose one 
            <asp:CheckBox ID="chkBlack" runat="server" /> African-American/Black
            <asp:CheckBox ID="chkAsian" runat="server" /> Asian
            <asp:CheckBox ID="chkWhite" runat="server" /> Caucasian/White
            <asp:CheckBox ID="chkHispanic" runat="server" /> Hispanic/Latino

            <br /><br />

            <!-- Education -->
            Education 
            <asp:CheckBox ID="chkHS" runat="server" /> High school
            <asp:CheckBox ID="chkCollege" runat="server" /> Some college
            <asp:CheckBox ID="chkBachelor" runat="server" /> Bachelor degree

            <br /><br />

            <!-- T-shirt -->
            T-shirt size 
            <asp:CheckBox ID="chkSmall" runat="server" /> Small
            <asp:CheckBox ID="chkMedium" runat="server" /> Medium
            <asp:CheckBox ID="chkLarge" runat="server" /> Large

            <br /><br />

            <!-- How heard -->
            How did you hear about this year’s Walk? 
            <asp:CheckBox ID="chkTV" runat="server" /> TV
            <asp:CheckBox ID="chkWeb" runat="server" /> Web
            <asp:CheckBox ID="chkFriend" runat="server" /> Friend

            <br /><br />

            <!-- Years -->
            How many years have you been participating? 
            <asp:TextBox ID="txtYears" runat="server" Width="80px" />

        </td>
    </tr>
</table>

<!-- Final Box -->
<table style="width:80%; margin: auto; border:1px solid #a88bc4; padding:15px;">
    <tr>
        <td>

            <b>What is your closest connection to the cause?</b>
            <br /><br />

            <asp:CheckBox ID="chkHave" runat="server" /> I have Alzheimer’s or dementia<br />
            <asp:CheckBox ID="chkCare" runat="server" /> I am supporting or caring for someone<br />
            <asp:CheckBox ID="chkLost" runat="server" /> I have lost someone<br />
            <asp:CheckBox ID="chkNone" runat="server" /> No close connection<br />
            <asp:CheckBox ID="chkPrefer" runat="server" /> Prefer not to answer

        </td>
    </tr>
</table>
    <p>
        <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" /></p>

</asp:Content>