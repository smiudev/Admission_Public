<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="SMIU_Admission.AdminLogin" MasterPageFile="~/MasterPages/LoginMaster.master" %>

<asp:Content ID="Login" ContentPlaceHolderID="LoginScreen" runat="Server">
    <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false">       
        <asp:Label ID="lblerror" runat="server"></asp:Label>
    </asp:Panel>
    <br />
    <br />
     <br />
     
    <div id="Div2" style="width: 518px; margin: 0 auto;">
        <div class="cp">
           </div>
           <div class="logintop"><span" style="margin-left: 180px;">Application Login</span"></div>
        <div class="loginSection" style="border: 1px solid #969696;">                  
            <div class="loginDiv">           
            <br />
                <asp:Login ID="LoggedIn" runat="server" DestinationPageUrl="~/Dashboard.aspx" ToolTip="Login"> 
                    <LayoutTemplate>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="false"
                            ValidationGroup="Login1" ShowSummary="False" />  
                        <table>
                            <tr>
                                <td style="padding: 0px 4px 0px 4px;">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name</asp:Label>
                                </td>
                                <td style="padding: 0px 4px 0px 4px;">
                                    <asp:TextBox ID="UserName" runat="server" TabIndex="1" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </tr>
                            <tr>
                                <td style="padding: 0px 4px 0px 4px;">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
                                </td>
                                <td style="padding: 0px 4px 0px 4px;">
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" TabIndex="2" Width="150px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                              <tr>
                    <td style="padding: 0px 4px 0px 4px;" colspan="3">
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1"
                            TabIndex="4" CssClass="logbtn" />
                    </td>
                </tr>
                            <tr>
                                <td style="padding: 0px 4px 0px 4px;" colspan="3">
                                    <asp:Label ID="FailureText" runat="server" Text="" ValidationGroup="Login1" TabIndex="5"
                                        ForeColor="#CC3300" />
                                </td>
                            </tr>                          
                            <tr>
                                <td colspan="3">
                                   <%-- <a href="#" style="margin-left: 35px;">Create account </a> --%>|  <a href="Modules/AdminSecurity/PasswordRecovery.aspx">Forgot your password </a> 
                                </td>
                            </tr>
                        </table>
                      
                   </LayoutTemplate>
                </asp:Login>
            </div>
        </div>
        <div class="loginFooter">
        <span">Contact: +92-021-99213307, E-mail: <a href="mailto:admission@smiu.edu.pk" style="color: white; font-size:12px;">admission@smiu.edu.pk</a> </span>
        </div>
    </div>
</asp:Content>
