<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" MasterPageFile="~/MasterPages/FrontPage.master"
    CodeBehind="User.aspx.cs" Inherits="SMIU_Admission.Modules.AdminSecurity.User" %>

<script runat="server">
    void CustomValidator1_ServerValidate(Object source,
       ServerValidateEventArgs args)
    {
        CheckBoxList chkRole = new CheckBoxList();
        chkRole = (CheckBoxList)crtUserWizard.CreateUserStep.ContentTemplateContainer.FindControl("chkRole");
        args.IsValid = (chkRole.SelectedValue != "");
    }

</script>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Create User</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <br />
    <br />
    <fieldset>
        <legend>Create Account for New User </legend>
        <asp:CreateUserWizard ID="crtUserWizard" runat="server" OnCreatedUser="crtUserWizard_CreatedUser"
            CssClass="btn" CreateUserButtonStyle-CssClass="btn" ContinueDestinationPageUrl="User.aspx"
            BorderWidth="0px" Width="96%" PasswordRegularExpression="^[a-z]$">
            <ContinueButtonStyle CssClass="btn" />
            <CreateUserButtonStyle CssClass="btn"></CreateUserButtonStyle>
            <WizardSteps>
                <asp:CreateUserWizardStep>
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">
                                    User Name</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" MaxLength="30"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="crtUserWizard"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">
                                    Password</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="128"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="crtUserWizard"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">
                                    Confirm Password</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" MaxLength="128"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                        ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                                        ValidationGroup="crtUserWizard"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Password and Confirmation Password must match."
                                        ValidationGroup="crtUserWizard"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEmployeeNo" runat="server">Employee Number</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmpNo" runat="server" MaxLength="50" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblRole" runat="server">Roles</asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="chkRole" runat="server" RepeatColumns="2">
                                    </asp:CheckBoxList>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Select at least any one Role"
                                        OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="crtUserWizard">
                                    </asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">
                                    E-mail ID</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                        ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="crtUserWizard"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regExEmail" runat="server" ControlToValidate="Email"
                                        ErrorMessage="Invalid Email Address" ValidationExpression="^([\w-\.&]+)@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">
                                    Security Question</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question" runat="server" MaxLength="256"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                        ErrorMessage="Security question is required." ToolTip="Security question is required."
                                        ValidationGroup="crtUserWizard"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">
                                    Security Answer</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server" MaxLength="128"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                        ErrorMessage="Security answer is required." ToolTip="Security answer is required."
                                        ValidationGroup="crtUserWizard"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Department
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDepartment" runat="server" />
                                    <asp:RequiredFieldValidator ID="reqValDepartment" ErrorMessage="Department is required."
                                        ValidationGroup="crtUserWizard" ControlToValidate="ddlDepartment" InitialValue="Select Department"
                                        runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Designation
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDesignation" runat="server" />
                                    <asp:RequiredFieldValidator ID="reqValDesignation" ErrorMessage="Designation is required."
                                        ValidationGroup="crtUserWizard" ControlToValidate="ddlDesignation" InitialValue="Select Designation"
                                        runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <%-- <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                        ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                        ValidationGroup="crtUserWizard"></asp:CompareValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: red">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </fieldset>
</asp:Content>
