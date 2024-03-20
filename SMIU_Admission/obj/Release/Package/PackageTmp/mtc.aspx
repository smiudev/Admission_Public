<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mtc.aspx.cs" Inherits="SMIU_Admission.mtc"
    MasterPageFile="~/MasterPages/mtc.Master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <center>
        <h1>
            Media Training Center (MTC) - Photography Workshop
        </h1>
    </center>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <script src="/scripts/jquery-1.8.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowPreview(input) {
            if (input.files && input.files[0]) {
                var ImageDir = new FileReader();
                ImageDir.onload = function (e) {
                    $('[id*=impPrev]').attr('src', e.target.result);
                }
                ImageDir.readAsDataURL(input.files[0]);
            }
        }       
    </script>
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
    <style>
        .imageStyle
        {
            padding: 3px;
            background-color: #ffffff;
            border: solid 2px #DFEFFF !important;
        }
    </style>
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <%--<fieldset>
                <legend>Workshop Information</legend>--%>
            <%-- <table>
                    <tr>
                        <td>
                            Course Type<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rdnDegreeProgram" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rdnDegreeProgram_SelectedIndexChanged">
                                <asp:ListItem Value="1">Film Courses</asp:ListItem>
                                <asp:ListItem Value="2">Television Courses</asp:ListItem>
                                <asp:ListItem Value="3">Radio Courses</asp:ListItem>
                                <asp:ListItem Value="4">General Courses</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="ReqFldVDegreeProgram" runat="server" ControlToValidate="rdnDegreeProgram"
                                Display="Dynamic" ErrorMessage="Please mark Course Type" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Course Name<span style="color: Red">*</span>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlFirstChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvddlFirstChoice" runat="server" ControlToValidate="ddlFirstChoice"
                                ErrorMessage="Select First Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>--%>
            <%-- </fieldset>--%>
            <fieldset>
                <legend>Personal Information</legend>
                <br />
                <table>
                    <tr>
                        <td>
                            Photo<span style="color: Red">*</span>
                        </td>
                        <td>
                            <p style="color: Red">
                                Supported format (JPG,JPEG,PNG,BMP,gif,Png)<br />
                                Maximum Photo size 2 MB</p>
                            <asp:Image ID="impPrev" runat="server" Height="102px" Width="77px" CssClass="imageStyle" />
                            <br />
                            <asp:FileUpload ID="photoUpload" runat="server" onchange="ShowPreview(this);" />
                            <asp:RequiredFieldValidator ID="ReqdFldValphotoUpload" runat="server" Display="Dynamic"
                                ErrorMessage="Please Upload Photo" ControlToValidate="photoUpload" ValidationGroup="StudentForm"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExpValUploadPhoto" ValidationExpression="^([0-9a-zA-Z_\-~ :\\])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$"
                                ControlToValidate="photoUpload" runat="server" ErrorMessage="Please select a valid Image "
                                Display="Dynamic" ValidationGroup="StudentForm" />
                            <asp:CustomValidator ID="PhotoUploadCustomValidator" runat="server" ControlToValidate="photoUpload"
                                ForeColor="Red" OnServerValidate="ValidateFileSize" Display="Dynamic" ValidationGroup="StudentForm"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCNICNo" runat="server" Text="CNIC # "></asp:Label>
                            &nbsp;<span style="color: Red">*</span>
                        </td>
                        <td colspan="6">
                            <asp:TextBox ID="txtNIC" runat="server" Width="200px" ValidationGroup="StudentForm"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredtxtNIC" runat="server" ControlToValidate="txtNIC"
                                ErrorMessage="Please Enter NIC" SetFocusOnError="True" ValidationGroup="StudentForm"
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
                    </tr>
                    <tr>
                        <td>
                            Name<span style="color: Red">*</span>
                        </td>
                        <td colspan="6">
                            <asp:TextBox ID="ftxtname" runat="server" MaxLength="200" ToolTip=" First Name" Width="200px"
                                ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFdValtxtname" runat="server" ControlToValidate="ftxtname"
                                Display="Dynamic" ErrorMessage="Please Enter First Name" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltrExtFName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="ftxtname">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Father's /Guardian Name
                        </td>
                        <td colspan="6">
                            <asp:TextBox ID="txtFatherName" runat="server" MaxLength="100" ToolTip="Name" Width="200px"
                                ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            &nbsp;
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtFatherName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtFatherName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="StudentForm" Width="200px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Date of Birth <span style="color: Red">*</span>
                        </td>
                        <td colspan="6">
                            <asp:TextBox ID="txtDOB" runat="server" Width="110px" ValidationGroup="StudentForm"
                                CssClass="date" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFlVtxtDOB" runat="server" ControlToValidate="txtDOB"
                                ErrorMessage="Please Enter Date" ValidationGroup="StudentForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                            Postal Address<span style="color: Red">*</span>
                        </td>
                        <td colspan="5">
                            <asp:TextBox ID="txtCorrAddress" runat="server" ValidationGroup="StudentForm" Width="570px"
                                autocomplete="off" />
                            <cc1:FilteredTextBoxExtender ID="fltrtxtCorrAddress" runat="server" TargetControlID="txtCorrAddress"
                                FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="ReqFlVtxtCorrAddress" runat="server" ControlToValidate="txtCorrAddress"
                                ErrorMessage="Please Enter Address" ValidationGroup="StudentForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mobile Number <span style="color: Red">*</span>
                        </td>
                        <td colspan="6">
                            <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="11" ToolTip="Mobile Number"
                                Width="200px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            &nbsp;&nbsp; <strong>(Format: 03XXXXXXXXX)</strong>
                            <asp:RequiredFieldValidator ID="ReqFldMobileNo" runat="server" ControlToValidate="txtMobileNo"
                                ErrorMessage="Please Enter Mobile Number" ValidationGroup="StudentForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExpValtxtMobileNo" runat="server" ErrorMessage="Please enter only digits"
                                ControlToValidate="txtMobileNo" Display="Static" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="EmpForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMobileNo" runat="server" TargetControlID="txtMobileNo"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-mail<span style="color: Red">*</span>
                        </td>
                        <td colspan="6">
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="200px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please Enter E-mail" ToolTip="E-mail Address" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Invalid Email Address" ValidationExpression="^([\w-\.&]+)@([\w-]+\.)+[\w-]+"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Acadmic Record (Highest Qualification)</legend>
                <br />
                <table>
                    <tr>
                        <th colspan="4" style="text-align: left;">
                            Highest Qualification
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Certificate / Degree
                        </td>
                        <td>
                            Board / Institue
                        </td>
                        <td>
                            Year
                        </td>
                        <td>
                            Grade / Division
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlMDegreeLevel" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Matriculation">Matriculation</asp:ListItem>
                                <asp:ListItem Value="Intermediate">Intermediate</asp:ListItem>
                                <asp:ListItem Value="Graduation">Graduation</asp:ListItem>
                                <asp:ListItem Value="Masters">Masters</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFldValMDegreeLevel" runat="server" ControlToValidate="ddlMDegreeLevel"
                                ErrorMessage="Please Select Degree" InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBoardname" runat="server" ToolTip="Board/Institution" Width="95%"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqMtxtInstitution" runat="server" ControlToValidate="txtBoardname"
                                Display="Dynamic" ErrorMessage="Please Enter Board /Institution" InitialValue="-1"
                                SetFocusOnError="True" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMyearFrom" runat="server" MaxLength="4" ToolTip="Year From" Width="50px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValMtxtYearFrom" runat="server" ControlToValidate="txtMyearFrom"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="ReqFldMYearFrom" runat="server" ControlToValidate="txtMyearFrom"
                                Display="Dynamic" ErrorMessage="Please Enter Year From" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rngvalMYearFrom" runat="server" ControlToValidate="txtMyearFrom"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="StudentForm">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMGrade" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1st Division">1st Division</asp:ListItem>
                                <asp:ListItem Value="2nd Division">2nd Division</asp:ListItem>
                                <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFlVtxtMgrade" runat="server" ControlToValidate="ddlMGrade"
                                ErrorMessage="Please Select Grade" InitialValue="-1" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--<tr>
                        <td colspan="4">
                            Interivew: You will be contacted for further processing after closing of required
                            deadline (20-08-2019)
                        </td>
                    </tr>--%>
                </table>
                <%-- <h3>
                    Deadline of submission of form is <span style="color: Red">(7th Janurary 2021)</span>
                </h3>--%>
            </fieldset>
            <br />
            <table>
                <tr>
                    <td colspan="2">
                        &nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" CommandName="Insert"
                            CssClass="btn" ValidationGroup="StudentForm" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <%-- <asp:AsyncPostBackTrigger ControlID="rdnDegreeProgram" EventName="SelectedIndexChanged" />--%>
            <%--  <asp:AsyncPostBackTrigger ControlID="ddlFirstChoice" EventName="SelectedIndexChanged" />--%>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
