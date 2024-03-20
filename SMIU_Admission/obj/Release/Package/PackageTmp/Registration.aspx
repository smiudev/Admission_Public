<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SMIU_Admission.Registration"
    MasterPageFile="~/MasterPages/student.Master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h2>
        <center>
            Registration for Pre Entry Test Preparation Classes, Fall 2018</center>
    </h2>
    <br />
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Personal Information</legend>
                <br />
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
                                Display="Static" ErrorMessage="Please Enter First Name" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
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
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="100" ToolTip="Last Name"
                                Width="200px" ValidationGroup="StudentForm"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FltExttxtLastName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtLastName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Father's Name<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFatherName" runat="server" MaxLength="100" ToolTip="Father Name"
                                Width="200px" ValidationGroup="StudentForm"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqtxtFatherName" runat="server" ControlToValidate="txtFatherName"
                                Display="Dynamic" ErrorMessage="Please Enter Father Name" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            &nbsp;
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtFatherName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtFatherName">
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
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlSGender" runat="server" ControlToValidate="ddlGender"
                                ErrorMessage="Select Gender" InitialValue="-1" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-mail<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please Enter E-mail" ToolTip="E-mail is required." ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Invalid Email Address" ValidationExpression="^([\w-\.&]+)@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator>
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
                                ErrorMessage="Please Enter Mobile Number" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExptxtLandLineNumber" runat="server" ErrorMessage="Please enter only digits with correct number"
                                ControlToValidate="txtMobileNo" Display="Static" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="EmpForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMobileNo" runat="server" TargetControlID="txtMobileNo"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Intrested In<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rdnIntrestedProgram" runat="server">
                                <asp:ListItem Value="Bachelor of Business Administration (BBA)">Bachelor of Business Administration (BBA)</asp:ListItem>
                                <asp:ListItem Value="BS Computer Science">BS Computer Science</asp:ListItem>
                                <asp:ListItem Value="BS Education">BS Education</asp:ListItem>
                                <asp:ListItem Value="BS Media Studies">BS Media Studies</asp:ListItem>
                                <asp:ListItem Value="BS Environmental Sciences">BS Environmental Sciences</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="ReqFldVDegreeProgram" runat="server" ControlToValidate="rdnIntrestedProgram"
                                Display="Dynamic" ErrorMessage="Please mark Program" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Qualification<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlIDegreeLevel" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="HSC">HSC</asp:ListItem>
                                <asp:ListItem Value="A-Level">A-Level</asp:ListItem>
                                <asp:ListItem Value="Diploma">Diploma</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFldValIDegreeLevel" runat="server" ControlToValidate="ddlIDegreeLevel"
                                ErrorMessage="Please Select Degree" InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Group<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlIGroup" runat="server" ValidationGroup="StudentForm">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Pre-Engineering">Pre-Engineering</asp:ListItem>
                                <asp:ListItem Value="Pre-Medical">Pre-Medical</asp:ListItem>
                                <asp:ListItem Value="Humanities">Humanities</asp:ListItem>
                                <asp:ListItem Value="Computer Science">Computer Science</asp:ListItem>
                                <asp:ListItem Value="Commerce">Commerce</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFldValddlIGroup" runat="server" ControlToValidate="ddlIGroup"
                                ErrorMessage="Please Select Group" InitialValue="-1" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Grade<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlIgrade" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                                <asp:ListItem Value="Result Awaiting">Result Awaiting</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFlVtxtIgrade" runat="server" ControlToValidate="ddlIgrade"
                                ErrorMessage="Please Select Grade" InitialValue="-1" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Percentage<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPercentage" runat="server" MaxLength="3" Width="90px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtPercentage" ErrorMessage="Please enter Percentage"
                                ValidationGroup="StudentForm" ControlToValidate="txtPercentage" runat="server"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rvtxtScore" ControlToValidate="txtPercentage" Display="Dynamic"
                                MinimumValue="50" MaximumValue="100" SetFocusOnError="true" Type="Integer" runat="server"
                                ErrorMessage="Percentage must be greater than or equal to 50">
                            </asp:RangeValidator>
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
                                <%-- <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                                    Text="Cancel" OnClick="btnCancel_Click" />--%>
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
