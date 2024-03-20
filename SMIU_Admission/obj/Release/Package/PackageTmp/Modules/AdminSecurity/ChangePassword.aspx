<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master"
    AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="SMIU_Admission.Modules.AdminSecurity.ChangePassword" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Change Password</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <br />
    <br />
    <fieldset>
        <legend>Change Password </legend>
        <table class="contentTable GridSpace">
            <tr>
                <td>
                    <asp:ChangePassword ID="chngPassword" runat="server" OnChangedPassword="chngPassword_ChangedPassword"
                        ContinueButtonStyle-CssClass="btn" ContinueButtonStyle-Font-Bold="False" ContinueDestinationPageUrl="~/Dashboard.aspx">
                        <CancelButtonStyle CssClass="btn" />
                        <ChangePasswordButtonStyle CssClass="btn" />
                    </asp:ChangePassword>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
