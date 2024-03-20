<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SMIU_Admission.Register"
    MasterPageFile="~/MasterPages/student.Master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h2 runat="server" id="headingRegister">
        
    </h2>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" href="/css/ui.theme.css" type="text/css" media="all" />
    <script src="/scripts/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/ui.core.js"></script>
    <script type="text/javascript" src="/scripts/ui.datepicker.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
                $(".date").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '1960:2010',
                    dateFormat: 'dd/mm/yy'
                });
            });
        });

    </script>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <b style="color: Red">Note: </b>
            <asp:BulletedList ID="lstInstructions" runat="server" BulletStyle="Numbered" Style="margin-left: 80px;">
                <asp:ListItem Value="1 ">Password will be sent in your email address.If you don't have an email address Please create first.</asp:ListItem>
                <asp:ListItem Value="2 ">Your email address will be considered as a login/username.</asp:ListItem>
                <asp:ListItem Value="3 ">Your name, date of birth and CNIC/B-Form mentioned here must be same, as mentioned in your degrees and transcripts i.e. Secondary, Intermediate level qualifications and CNIC/B-Form/Passport.</asp:ListItem>
            </asp:BulletedList>
            <br />
            <br />
            <fieldset>
                <legend>Personal Information</legend>
                <br />
                <table width="100%">
                    <tr>
                        <td>
                            First Name<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="ftxtname" runat="server" MaxLength="100" ToolTip=" First Name" Width="200px"
                                ValidationGroup="StudentForm"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFdValtxtname" runat="server" ControlToValidate="ftxtname"
                                Display="Static" ErrorMessage="First name is required." ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltrExtFName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="ftxtname">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Middle Name
                        </td>
                        <td>
                            <asp:TextBox ID="mtxtName" runat="server" MaxLength="100" ToolTip="Middle Name" Width="200px"
                                ValidationGroup="StudentForm"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="fltrExtMName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="mtxtName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name
                            <%--<span style="color: Red">*</span>--%>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="100" ToolTip="Last Name"
                                Width="200px" ValidationGroup="StudentForm"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="ReqFdValLtxtName" runat="server" ControlToValidate="txtLastName"
                                Display="Static" ErrorMessage="Please Enter Last Name" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>--%>
                            <cc1:FilteredTextBoxExtender ID="FltExttxtLastName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtLastName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="StudentForm" Width="200px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Male</asp:ListItem>
                                <asp:ListItem Value="0">Female</asp:ListItem>
                                <asp:ListItem Value="2">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlSGender" runat="server" ControlToValidate="ddlGender"
                                ErrorMessage="Gender is required." InitialValue="-1" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCNICNo" runat="server" Text="C.N.I.C No"></asp:Label>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNIC" runat="server" Width="200px" ValidationGroup="StudentForm"
                                MaxLength="15"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredtxtNIC" runat="server" ControlToValidate="txtNIC"
                                ErrorMessage="CNIC is required." SetFocusOnError="True" ValidationGroup="StudentForm"
                                InitialValue="_____-_______-_"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegrExpValCNICNo" runat="server" ErrorMessage="Invalid CNIC number format. Please Use dash"
                                ControlToValidate="txtNIC" Display="Static" ValidationExpression="^[0-9]{5}-[0-9]{7}-[0-9]{1}$"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>                            
                            <cc1:TextBoxWatermarkExtender ID="txtNIC_WatermarkExtender" runat="server" Enabled="True"
                                TargetControlID="txtNIC" WatermarkCssClass="txtwatermark" WatermarkText="CNIC Here">
                            </cc1:TextBoxWatermarkExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Date of Birth <span style="color: Red">*</span>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtDOB" runat="server" Width="110px" ValidationGroup="StudentForm"
                                CssClass="date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFlVtxtDOB" runat="server" ControlToValidate="txtDOB"
                                ErrorMessage="Date of Birth is required." ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>
                            <cc1:MaskedEditExtender ID="MaskedEditExtxtDOB" MaskType="Date" runat="server" TargetControlID="txtDOB"
                                Mask="99/99/9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft" AcceptNegative="Left"
                                DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                            </cc1:MaskedEditExtender>
                            <cc1:MaskedEditValidator ID="MaskedEditValidatortxtDOB" runat="server" ControlExtender="MaskedEditExtxtDOB"
                                ControlToValidate="txtDOB" InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                                ValidationGroup="StudentForm" ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                                EmptyValueMessage="*" Display="Dynamic"></cc1:MaskedEditValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-mail<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="E-mail address is required." ToolTip="E-mail is required." ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="E-mail address is incorrect." ValidationExpression="^([\w-\.&]+)@([\w-]+\.)+[\w-]+" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mobile Number<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="11" ToolTip="Mobile Number"
                                Width="200px" ValidationGroup="StudentForm"></asp:TextBox>
                            &nbsp;&nbsp; <strong>(Format: 03XXXXXXXXX)</strong>
                            <asp:RequiredFieldValidator ID="ReqFldMobileNo" runat="server" ControlToValidate="txtMobileNo"
                                ErrorMessage="Mobile number is required." ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExptxtLandLineNumber" runat="server" ErrorMessage="Mobile number format is incorrect."
                                ControlToValidate="txtMobileNo" Display="Static" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="EmpForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMobileNo" runat="server" TargetControlID="txtMobileNo"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phone Number
                            <%--<span style="color: Red">*</span>--%>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLandLineNumber" runat="server" ToolTip="Land Line Number" Width="140px"
                                MaxLength="11" ValidationGroup="StudentForm"></asp:TextBox>
                            &nbsp;&nbsp; <strong>(Format: 021XXXXXXXX)</strong>
                            <%-- <asp:RequiredFieldValidator ID="ReqLandLineNumber" runat="server" ControlToValidate="txtLandLineNumber"
                                ErrorMessage="Please Enter Land Line Number" ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter correct number"
                                ControlToValidate="txtLandLineNumber" Display="Dynamic" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="EmpForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredLandLineNumber" runat="server" TargetControlID="txtLandLineNumber"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="140px" MaxLength="50"
                                ValidationGroup="StudentForm" />
                            <asp:RequiredFieldValidator ID="req6" runat="server" ControlToValidate="txtPassword"
                                Text="Please Enter Password" SetFocusOnError="true" ValidationGroup="StudentForm"
                                Display="Dynamic" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Confirm Password<span style="color: Red">*</span>
                            <td>
                                <asp:TextBox ID="txtPasswordC" runat="server" TextMode="Password" Width="140px" MaxLength="50"
                                    ValidationGroup="StudentForm" />
                                <asp:RequiredFieldValidator ID="ReqFldValPasswordC" runat="server" ControlToValidate="txtPasswordC"
                                    Text="Please Re-Enter Password" SetFocusOnError="true" ValidationGroup="StudentForm"
                                    Display="Dynamic" />
                                <asp:CompareValidator runat="server" ID="Comp1" ControlToValidate="txtPassword" ControlToCompare="txtPasswordC"
                                    Text="Password mismatch" ValidationGroup="StudentForm" Display="Dynamic" />
                            </td>
                    </tr>
                    <tr>
                        <td>
                            What is the result of below calculation?<span style="color: Red">*</span>
                            <br />
                            <center>
                                <b>
                                    <asp:Label ID="lblStopSpam" runat="server"></asp:Label>
                                    = </b>
                            </center>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtSecurityCode" MaxLength="50" ToolTip="Enter Calculated Number"
                                Width="50px" ValidationGroup="StudentForm"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFlvtxtstopspam" ErrorMessage="Please enter your answer."
                                ValidationGroup="StudentForm" ControlToValidate="txtSecurityCode" runat="server"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CustomValidator runat="server" ID="cusCustom" ControlToValidate="txtSecurityCode"
                                OnServerValidate="cusCustom_ServerValidate" ErrorMessage="Invalid Security Code Please try again"
                                ValidationGroup="StudentForm" Display="Dynamic" SetFocusOnError="true" />
                        </td>
                    </tr>
                </table>
                <caption>
                    <br />
                    <table>
                        <tr>
                            <td>
                                &nbsp;<asp:Button ID="btnSubmit" runat="server" CommandName="Insert" CssClass="btn"
                                    OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="StudentForm" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                                    Text="Cancel" onclick="btnCancel_Click" />
                            </td>
                        </tr>
                    </table>
                </caption>
            </fieldset>
            </table> </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
