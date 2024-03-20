<%@ Page Language="C#" MasterPageFile="~/MasterPages/LoginMaster.master" AutoEventWireup="true" CodeBehind="_index.aspx.cs" Inherits="SMIU_Admission._index" %>

<asp:Content ID="Login" ContentPlaceHolderID="LoginScreen" runat="Server">

 <script language="javascript" type="text/javascript">
     window.history.forward(1);
     document.attachEvent("onkeydown", setClipBoardData);
     function setClipBoardData() {
         setInterval("window.clipboardData.setData('text','')", 20);
     }
     function blockError() {
         window.location.reload(true);
         return true;
     }
     window.onerror = blockError;             
 </script>


    <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false">
        <asp:Label ID="lblerror" runat="server"></asp:Label>
    </asp:Panel>
    <table  border="0" align="center" cellpadding="0" cellspacing="0" style="margin-left:100px; width: 960px; " >
        <tr>
            <td>                
                <div id="Div2" style="width: 518px; margin: 0 auto;">
                    <div class="cp">
                    </div>
                    <div class="logintop"><span style="margin-left:180px;">Application Login</span></div>
                    <div class="loginSection" style="border: 1px solid #969696;">
                        <div class="loginDiv">
                            <br />
                            <table>
                                <tr>
                                    <td style="padding: 0px 4px 0px 4px;">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email Address</asp:Label>
                                    </td>
                                    <td style="padding: 0px 4px 0px 4px;">
                                        <asp:TextBox ID="UserName" runat="server" TabIndex="1" Width="200px" autocomplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 0px 4px 0px 4px;">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
                                    </td>
                                    <td style="padding: 0px 4px 0px 4px;">
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" TabIndex="2" Width="200px" autocomplete="off"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 0px 4px 0px 4px;" colspan="3">
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" TabIndex="4" CssClass="logbtn" OnClick="LoginButton_Click" />
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
                                        <a href="PasswordRecovery.aspx">Forgot your password </a>
                                        <a href="Register.aspx">Create your Account</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br />
                    <div style="text-align:center">
                        <span>Click</span><a style="color:blue;padding-left:5px;padding-right:5px;" href="https://www.smiu.edu.pk/admissions/" target="_blank" >here</a><span>to Check Calender for Admissions Spring 2023</span>
                    </div>
                    <br />
                      <div class="loginFooter">
                            <span>Contact:  111-111-885 Ext 225, E-mail: <a href="mailto:queries@smiu.edu.pk" style="color: white; font-size:12px;">queries@smiu.edu.pk</a> </span>
                    </div>
                </div>
                <%--<p>
                    <strong style="color:darkgreen; font-size:medium;">Online Admission Instructions</strong>
                    <br />
                    <br />
                    <strong>Step 1. </strong>
                    <span>Create your account <a href="Register.aspx">Click Here</a></span>
                    <br />
                    <strong>Step 2. </strong>
                    <span>Login with email address and password and complete the Admission Form.</span>
                    <br />
                    <strong>Step 3. </strong>
                    <span>After final submission, get print of filled admission form with Fees Voucher.</span>
                    <br />
                    <strong>Step 4. </strong>
                    <span>Please note your Reference/Tracking Id for future correspondence.</span>
                    <br />
                    <br />
                </p>--%>
                </td>
                <td>
                    <%--<div style="padding:10px;">
                        <img alt="" src="Images/Fall2021_Ad.jpg" style="height:500px; width:500px; border-radius:10px;" />
                    </div>--%>



                        <%--<h1 class="page-title">
                            Merit List Admission Fall 2019 Announced</h1>
                        <h2>
                            Step 1
                        </h2>
                         <p>
                            <strong>Login with email address and Password</strong>
                        </p>
                          <h2>
                            Step 2
                        </h2>
                        <p>
                            <strong>Download the fee Voucher , and deposit in
                    any online Branch of HBL.</strong>
                            <br />
                            (Successful Candidates Only)
                        </p>
                        <h2>
                            Step 3
                        </h2>
                        <p>
                            <strong>Please do remember your Reference/Tracking Id for future correspondence. </strong>
                        </p>--%>

                        <h1 class="page-title">
                            Online Admission Instructions</h1>
                        <h2>
                            Step 1
                        </h2>
                        <p>
                            <strong>Create your Account </strong><a href="Register.aspx"><strong>Click Here</strong>
                            </a>
                        </p>
                        <h2>
                            Step 2
                        </h2>
                        <p>
                            <strong>Login with email address and Password and Complete the Admission Form </strong>
                        </p>
                        <h2>
                            Step 3
                        </h2>
                        <p>
                            <strong>After final submission Please get print of filled admission form with Fees Voucher </strong>
                        </p>
                        <h2>
                            Step 4
                        </h2>
                        <p>
                            <strong>Please note your Reference/Tracking Id for future correspondence. </strong>
                        </p>
                        </div>
                </td>
        </tr>        
    </table>
</asp:Content>
