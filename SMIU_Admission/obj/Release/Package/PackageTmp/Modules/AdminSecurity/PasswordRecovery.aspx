<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master"
    AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="SMIU_Admission.Modules.AdminSecurity.PasswordRecovery" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Password Recovery</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">  
    <br />
    <br />
    <fieldset>
        <legend>Password Recovery </legend>
        <br />
        <table>
            <tr>
                <td>
                    <asp:PasswordRecovery ID="PassRecovery" runat="server" OnSendingMail="PassRecovery_SendingMail"
                        SubmitButtonStyle-CssClass="btn" SubmitButtonStyle-Font-Bold="True" ToolTip="Password Recovery"
                        MailDefinition-Priority="High" UserNameLabelText="User Name">
                        <MailDefinition From="do-not-reply@smiu.edu.pk" IsBodyHtml="True" Priority="High"
                            Subject="Your new password" BodyFileName="~/Modules/AdminSecurity/EmailBodyforRecoveryPassword.txt">
                        </MailDefinition>
                        <SubmitButtonStyle CssClass="btn" Font-Bold="False"></SubmitButtonStyle>
                    </asp:PasswordRecovery>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
