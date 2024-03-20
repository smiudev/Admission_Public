<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cpe.aspx.cs" Inherits="SMIU_Admission.cpe"
    MasterPageFile="~/MasterPages/mtc.Master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <script src="/scripts/jquery-1.8.2.js" type="text/javascript"></script>   
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
                    yearRange: '1960:2019',
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
    <br />
    <br />
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Course Information</legend>
                <table>
                    <tr>
                        <td>
                            First Choice<span style="color: Red">*</span><br />
                            <asp:DropDownList ID="ddlCourseFirstChoice" runat="server" ValidationGroup="CPEForm"
                                Width="300px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlCourseFirstChoice" runat="server" ControlToValidate="ddlCourseFirstChoice"
                                Display="Dynamic" ErrorMessage="Please Select First Choice" ValidationGroup="CPEForm"
                                SetFocusOnError="true" InitialValue="-1"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            Second Choice<span style="color: Red">*</span><br />
                            <asp:DropDownList ID="ddlCourseSecondChoice" runat="server" ValidationGroup="CPEForm"
                                Width="300px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlCourseSecondChoice" runat="server" ControlToValidate="ddlCourseSecondChoice"
                                Display="Dynamic" ErrorMessage="Please Select Second Choice" ValidationGroup="CPEForm"
                                SetFocusOnError="true" InitialValue="-1"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            Third Choice<span style="color: Red">*</span><br />
                            <asp:DropDownList ID="ddlCourseThirdChoice" runat="server" ValidationGroup="CPEForm"
                                Width="300px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlCourseThirdChoice" runat="server" ControlToValidate="ddlCourseThirdChoice"
                                Display="Dynamic" ErrorMessage="Please Select Third Choice" ValidationGroup="CPEForm"
                                SetFocusOnError="true" InitialValue="-1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Personal Information</legend>
                <br />
                <table>
                    <tr>
                        <td>
                            First Name<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtFirstName" runat="server" MaxLength="100" ToolTip=" First Name"
                                Width="200px" ValidationGroup="CPEForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtFirstName" runat="server" ControlToValidate="txtFirstName"
                                Display="Static" ErrorMessage="Please Enter First Name" ValidationGroup="CPEForm"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredTxtBoxExtendertxtFirstName" runat="server"
                                FilterMode="InvalidChars" FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';,"
                                TargetControlID="txtFirstName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td style="width: 200px">
                            Last Name <span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="100" ToolTip="Last Name"
                                Width="200px" ValidationGroup="CPEForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFdValLtxtName" runat="server" ControlToValidate="txtLastName"
                                Display="Static" ErrorMessage="Please Enter Last Name" ValidationGroup="CPEForm"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FltExttxtLastName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtLastName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Father's Name <span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtFatherName" runat="server" MaxLength="100" ToolTip="Name" Width="200px"
                                ValidationGroup="CPEForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtFatherName" runat="server" ControlToValidate="txtFatherName"
                                Display="Static" ErrorMessage="Please Enter Father Name" ValidationGroup="CPEForm"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtFatherName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtFatherName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCNICNo" runat="server" Text="CNIC # "></asp:Label>
                            &nbsp;<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtNIC" runat="server" Width="200px" ValidationGroup="CPEForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredtxtNIC" runat="server" ControlToValidate="txtNIC"
                                ErrorMessage="Please Enter NIC" SetFocusOnError="True" ValidationGroup="CPEForm"
                                InitialValue="_____-_______-_" Display="Dynamic"></asp:RequiredFieldValidator>
                            <cc1:MaskedEditExtender ID="txtNIC_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                Enabled="True" Mask="99999-9999999-9" MaskType="Number" TargetControlID="txtNIC"
                                ClearMaskOnLostFocus="False">
                            </cc1:MaskedEditExtender>
                            <cc1:TextBoxWatermarkExtender ID="txtNIC_WatermarkExtender" runat="server" Enabled="True"
                                TargetControlID="txtNIC" WatermarkCssClass="txtwatermark" WatermarkText="CNIC Here">
                            </cc1:TextBoxWatermarkExtender>
                        </td>
                        <td style="width: 368px">
                            Date of Birth <span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtDOB" runat="server" Width="110px" ValidationGroup="CPEForm" CssClass="date"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFlVtxtDOB" runat="server" ControlToValidate="txtDOB"
                                ErrorMessage="Please Enter Date" ValidationGroup="CPEForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:MaskedEditExtender ID="MaskedEditExtxtDOB" MaskType="Date" runat="server" TargetControlID="txtDOB"
                                Mask="99/99/9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft" AcceptNegative="Left"
                                DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                            </cc1:MaskedEditExtender>
                            <cc1:MaskedEditValidator ID="MaskedEditValidatortxtDOB" runat="server" ControlExtender="MaskedEditExtxtDOB"
                                ControlToValidate="txtDOB" InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                                ValidationGroup="CPEForm" ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                                EmptyValueMessage="*" Display="Dynamic"></cc1:MaskedEditValidator>
                        </td>
                        <td>
                            Gender <span style="color: Red">*</span><br />
                            <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="CPEForm" Width="200px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Male</asp:ListItem>
                                <asp:ListItem Value="0">Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlSGender" runat="server" ControlToValidate="ddlGender"
                                ErrorMessage="Select Gender" InitialValue="-1" ValidationGroup="CPEForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            Religion <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlReligion" runat="server" ValidationGroup="CPEForm" Width="140px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Islam">Islam</asp:ListItem>
                                <asp:ListItem Value="Hinduism">Hinduism</asp:ListItem>
                                <asp:ListItem Value="Christianity">Christianity</asp:ListItem>
                                <asp:ListItem Value="Sikh">Sikh</asp:ListItem>
                                <asp:ListItem Value="Parsi">Parsi</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFieldValReligion" runat="server" ControlToValidate="ddlReligion"
                                ErrorMessage="Select Religion" InitialValue="-1" ValidationGroup="CPEForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                            E-mail<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="200px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please Enter E-mail" ToolTip="E-mail Address" ValidationGroup="CPEForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Invalid Email Address" ValidationExpression="^([\w-\.&]+)@([\w-]+\.)+[\w-]+"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                        <td colspan="2">
                            Mobile Number <span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="11" ToolTip="Mobile Number"
                                Width="200px" ValidationGroup="CPEForm" autocomplete="off"></asp:TextBox>
                            &nbsp;&nbsp; <strong>(Format: 03XXXXXXXXX)</strong>
                            <asp:RequiredFieldValidator ID="ReqFldMobileNo" runat="server" ControlToValidate="txtMobileNo"
                                ErrorMessage="Please Enter Mobile Number" ValidationGroup="CPEForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExpValtxtMobileNo" runat="server" ErrorMessage="Please enter only digits"
                                ControlToValidate="txtMobileNo" Display="Static" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="CPEForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMobileNo" runat="server" TargetControlID="txtMobileNo"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            Postal Address<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtCorrAddress" runat="server" ValidationGroup="CPEForm" Width="95%"
                                autocomplete="off" />
                            <cc1:FilteredTextBoxExtender ID="fltrtxtCorrAddress" runat="server" TargetControlID="txtCorrAddress"
                                FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="ReqFlVtxtCorrAddress" runat="server" ControlToValidate="txtCorrAddress"
                                ErrorMessage="Please Enter Postal Address" ValidationGroup="CPEForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            Permanent Address<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtPermanentAddress" runat="server" ValidationGroup="CPEForm" Width="95%"
                                autocomplete="off" />
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtPermanentAddress" runat="server" TargetControlID="txtPermanentAddress"
                                FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="ReqFldVtxtPermanentAddress" runat="server" ControlToValidate="txtPermanentAddress"
                                ErrorMessage="Please Enter Permanent Address" ValidationGroup="CPEForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Emergency Contact Details</legend>
                <br />
                <table>
                    <tr>
                        <td>
                            Name<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtEmergencyContactName" runat="server" MaxLength="100" ToolTip="Emergency Contact Name"
                                Width="200px" ValidationGroup="CPEForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtEmergencyContactName" runat="server"
                                ControlToValidate="txtEmergencyContactName" Display="Dynamic" ErrorMessage="Please Enter Emergency Contact Name"
                                ValidationGroup="CPEForm"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtExttxtEmergencyContactName" runat="server"
                                FilterMode="InvalidChars" FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';,"
                                TargetControlID="txtEmergencyContactName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            &nbsp;&nbsp; &nbsp;&nbsp; Relation<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtEmergencyContactRelation" runat="server" MaxLength="100" ToolTip="Relation"
                                Width="200px" ValidationGroup="CPEForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtEmergencyContactRelation" runat="server"
                                ControlToValidate="txtEmergencyContactRelation" Display="Dynamic" ErrorMessage="Please Enter Relation"
                                ValidationGroup="CPEForm"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredExttxtEmergencyContactRelation" runat="server"
                                FilterMode="InvalidChars" FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';,"
                                TargetControlID="txtEmergencyContactRelation">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            Mobile Number<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtEmergencyContact" runat="server" MaxLength="11" ToolTip="Mobile Number"
                                Width="130px" ValidationGroup="CPEForm" autocomplete="off"></asp:TextBox>
                            &nbsp;&nbsp; <strong>(Format: 03XXXXXXXXX)</strong>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtEmergencyContact" runat="server" ControlToValidate="txtEmergencyContact"
                                ErrorMessage="Please Enter Emergency Contact Number" ValidationGroup="CPEForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpValEmergencyContact" runat="server"
                                ErrorMessage="Please enter correct number" ControlToValidate="txtEmergencyContact"
                                Display="Static" ValidationExpression="^\d{11}$" ValidChars="0123456789" ValidationGroup="CPEForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredTxtExtEmergencyContact" runat="server" TargetControlID="txtEmergencyContact"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            Address<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtEmergencyContactAddress" runat="server" ValidationGroup="CPEForm"
                                Width="95%" autocomplete="off" />
                            <asp:RequiredFieldValidator ID="ReqFldValEmergencyContactAddress" runat="server"
                                ControlToValidate="txtEmergencyContactAddress" ErrorMessage="Please Enter Emergency Contact Address"
                                ValidationGroup="CPEForm" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltExttxtEmergencyContactAddress" runat="server"
                                TargetControlID="txtEmergencyContactAddress" FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Last Academic Qualification</legend>
                <br />
                <table>
                    <tr>
                        <th colspan="7" style="text-align: left;">
                            Last Academic Qualification
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Degree
                        </td>
                        <td>
                            (In case of Other Degree)
                        </td>
                        <td>
                            Year
                            <br />
                            From
                        </td>
                        <td>
                            Year
                            <br />
                            To
                        </td>
                        <td>
                            Percentage/CGPA/Division/Grade
                        </td>
                        <td>
                            Institution
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlLastDegreeLevel" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="BS">BS</asp:ListItem>
                                <asp:ListItem Value="MS">MS</asp:ListItem>
                                <asp:ListItem Value="PhD">PhD</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFldValMDegreeLevel" runat="server" ControlToValidate="ddlLastDegreeLevel"
                                ErrorMessage="Please Select Degree" InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="CPEForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOtherDegreeName" runat="server" MaxLength="100" Width="200px"
                                autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMyearFrom" runat="server" MaxLength="4" ToolTip="Year From" Width="50px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValMtxtYearFrom" runat="server" ControlToValidate="txtMyearFrom"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="ReqFldMYearFrom" runat="server" ControlToValidate="txtMyearFrom"
                                Display="Dynamic" ErrorMessage="Please Enter Year From" ValidationGroup="CPEForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rngvalMYearFrom" runat="server" ControlToValidate="txtMyearFrom"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="CPEForm">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIyearTo" runat="server" MaxLength="4" ToolTip="Year To" Width="50px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValItxtYearTo" runat="server" ControlToValidate="txtIyearTo"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="ReqFldIYearTo" runat="server" ControlToValidate="txtIyearTo"
                                Display="Dynamic" ErrorMessage="Please Enter Year To" ValidationGroup="CPEForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rngvalIYearTo" runat="server" ControlToValidate="txtIyearTo"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="CPEForm">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGradeDivision" runat="server" MaxLength="100" Width="100px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFlVtxtMgrade" runat="server" ControlToValidate="txtGradeDivision"
                                ErrorMessage="Please Enter Percentage/CGPA/Division/Grade" SetFocusOnError="True"
                                ValidationGroup="CPEForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtInstitutionname" runat="server" ToolTip="Board/Institution" Width="100px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqMtxtInstitution" runat="server" ControlToValidate="txtInstitutionname"
                                Display="Dynamic" ErrorMessage="Please Enter Institution" SetFocusOnError="True"
                                ValidationGroup="CPEForm"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Last Employment</legend>
                <br />
                <table>
                    <tr>
                        <td>
                            Designation<%--<span style="color: Red">*</span>--%><br />
                            <asp:TextBox ID="txtDesignationEmployed" runat="server" MaxLength="100" ToolTip="Designation"
                                Width="200px" ValidationGroup="CPEForm" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FltExttxtDesignationEmployed" runat="server" TargetControlID="txtDesignationEmployed"
                                FilterMode="InvalidChars" FilterType="Custom" InvalidChars="~!@#$%^&*_=+|}{[`]|:;'><,?">
                            </cc1:FilteredTextBoxExtender>
                            <%--<asp:RequiredFieldValidator ID="rfvddlDesignationEmployed" runat="server" ControlToValidate="txtDesignationEmployed"
                                ErrorMessage="Please Enter Designation" ValidationGroup="CPEForm" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </td>
                        <td>
                            Date From
                            <%--<span style="color: Red">*</span>--%><br />
                            <asp:TextBox ID="txtEmpDateFrom" runat="server" Width="110px" ValidationGroup="CPEForm"
                                CssClass="date" autocomplete="off"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="ReqFlVtxtEmpDateFrom" runat="server" ControlToValidate="txtEmpDateFrom"
                                ErrorMessage="Please Enter Date From" ValidationGroup="CPEForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            <cc1:MaskedEditExtender ID="MaskedEditExtxtEmpDateFrom" MaskType="Date" runat="server"
                                TargetControlID="txtEmpDateFrom" Mask="99/99/9999" MessageValidatorTip="true"
                                OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft"
                                AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                            </cc1:MaskedEditExtender>
                            <cc1:MaskedEditValidator ID="MaskedEditValidatortxtEmpDateFrom" runat="server" ControlExtender="MaskedEditExtxtEmpDateFrom"
                                ControlToValidate="txtEmpDateFrom" InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                                ValidationGroup="CPEForm" ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                                EmptyValueMessage="*" Display="Dynamic"></cc1:MaskedEditValidator>
                        </td>
                        <td>
                            Date To<%--<span style="color: Red">*</span>--%><br />
                            <asp:TextBox ID="txtEmpDateTo" runat="server" Width="110px" ValidationGroup="CPEForm"
                                CssClass="date" autocomplete="off"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="ReqFlVtxtEmpDateTo" runat="server" ControlToValidate="txtEmpDateTo"
                                ErrorMessage="Please Enter Date" ValidationGroup="CPEForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            <cc1:MaskedEditExtender ID="MaskedEditExtxtEmpDateTo" MaskType="Date" runat="server"
                                TargetControlID="txtEmpDateTo" Mask="99/99/9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft" AcceptNegative="Left"
                                DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                            </cc1:MaskedEditExtender>
                            <cc1:MaskedEditValidator ID="MaskedEditValidatortxtEmpDateTo" runat="server" ControlExtender="MaskedEditExtxtEmpDateTo"
                                ControlToValidate="txtEmpDateTo" InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                                ValidationGroup="CPEForm" ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                                EmptyValueMessage="*" Display="Dynamic"></cc1:MaskedEditValidator>
                            <br />
                            <span style="color: Red">Leave blank if currently working</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Organization<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtOrganizationEmployed" runat="server" ToolTip="Organization" Width="300px"
                                autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="fltExtEmployed" runat="server" TargetControlID="txtOrganizationEmployed"
                                FilterMode="InvalidChars" FilterType="Custom" InvalidChars="~!@#$%^&*_=+|}{[`]|:;'><,?">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="ReqtxtOrganizationEmployed" runat="server" ControlToValidate="txtOrganizationEmployed"
                                Display="Dynamic" ErrorMessage="Please Enter Organization" ValidationGroup="CPEForm"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Job Description<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtJobDescription" runat="server" ToolTip="Job Description" Width="95%"
                                autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderJobDescription" runat="server"
                                TargetControlID="txtJobDescription" FilterMode="InvalidChars" FilterType="Custom"
                                InvalidChars="~!@#$%^&*_=+|}{[`]|:;'><,?">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValtxtJobDescription" runat="server"
                                ControlToValidate="txtJobDescription" Display="Dynamic" ErrorMessage="Please Enter Job Description"
                                ValidationGroup="CPEForm"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            Address<span style="color: Red">*</span><br />
                            <asp:TextBox ID="txtEmpContactAddress" runat="server" ValidationGroup="CPEForm" Width="95%"
                                autocomplete="off" />
                            <asp:RequiredFieldValidator ID="ReqFldValEmpContactAddress" runat="server" ControlToValidate="txtEmpContactAddress"
                                ErrorMessage="Please Enter Address" ValidationGroup="CPEForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltExttxtEmpContactAddress" runat="server" TargetControlID="txtEmpContactAddress"
                                FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <p>
                <strong><span style="color: Red">Note:</span> </strong>
                <br />
                * The courses will be offered subject to minimum number of enrollments.<br />
                * The candidates will be shortlisted for interview on the basis of their profile.</p>
            <table>
                <tr>
                    <td colspan="2">
                        &nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" CommandName="Insert"
                            CssClass="btn" ValidationGroup="CPEForm" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
