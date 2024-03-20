<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdmissionFormBAK.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.AdmissionFormBAK" MasterPageFile="~/MasterPages/student.Master"
    MaintainScrollPositionOnPostback="false" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1 id="headingCurrentAdmission" runat="server"></h1>
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

        function SSCPercentage() {
            var Marksobtained = parseFloat($('[id*=txtMarksObtainedM]').val());
            var TotalMarks = parseFloat($('[id*=txtMTotalMarks]').val());
            var percentage = ((Marksobtained / TotalMarks) * 100);
            if (isNaN(percentage)) percentage = 0.00;
            $('[id*=txtMPercentage]').val(percentage.toFixed(2));
        }
        function HSCPercentage() {
            var Marksobtained = parseFloat($('[id*=txtMarksObtainedI]').val());
            var TotalMarks = parseFloat($('[id*=txtITotalMarks]').val());
            var percentage = ((Marksobtained / TotalMarks) * 100);
            if (isNaN(percentage)) percentage = 0.00;
            $('[id*=txtIPercentage]').val(percentage.toFixed(2));
        }
        function UGradPercentage() {
            var Marksobtained = parseFloat($('[id*=txtMarksUgradbtained]').val());
            var TotalMarks = parseFloat($('[id*=txtUgradTotalMarks]').val());
            var percentage = ((Marksobtained / TotalMarks) * 100);
            if (isNaN(percentage)) percentage = 0.00;
            $('[id*=txtUgradPercentage]').val(percentage.toFixed(2));
        }
        function GradPercentage() {
            var Marksobtained = parseFloat($('[id*=txtMarksgradbtained]').val());
            var TotalMarks = parseFloat($('[id*=txtgradTotalMarks]').val());
            var percentage = ((Marksobtained / TotalMarks) * 100);
            if (isNaN(percentage)) percentage = 0.00;
            $('[id*=txtgradPercentage]').val(percentage.toFixed(2));
        }
        function MSGradPercentage() {
            var Marksobtained = parseFloat($('[id*=txtMSMarksgradbtained]').val());
            var TotalMarks = parseFloat($('[id*=txtMSgradTotalMarks]').val());
            var percentage = ((Marksobtained / TotalMarks) * 100);
            if (isNaN(percentage)) percentage = 0.00;
            $('[id*=txtMSgradPercentage]').val(percentage.toFixed(2));
        }

        function OtherPercentage() {
            var Marksobtained = parseFloat($('[id*=txtMarksObtainedO]').val());
            var TotalMarks = parseFloat($('[id*=txtOTotalMarks]').val());
            var percentage = ((Marksobtained / TotalMarks) * 100);
            if (isNaN(percentage)) percentage = 0.00;
            $('[id*=txtOPercentage]').val(percentage.toFixed(2));
        }         
    </script>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
   <%-- <script type="text/javascript">
        function CheckDropdowns() {
            //Grab all dropdown objects in array
            var drpArray = document.getElementsByTagName('select');
            //Loop through the array
            for (i = 0; i < drpArray.length; i++) {
                //Loop through the array again
                for (j = 0; j < drpArray.length; j++)
                // Checking to ensure that we are not comparing same drop downlist
                    if (drpArray[i].id != drpArray[j].id) {
                        // compare values between dropdownlists
                        if (drpArray[i].options[drpArray[i].selectedIndex].value == drpArray[j].options[drpArray[j].selectedIndex].value) {
                            //Showing error messsage with duplicated dropdownlist selected value
                            alert(drpArray[i].options[drpArray[i].selectedIndex].value + ' already selected');
                            return false;
                        }
                    }
            }
        }
    </script>--%>
    <style type="text/css">
        textarea
        {
            resize: none;
        }
        
        .style1
        {
            width: 169px;
        }
        .style3
        {
            width: 130px;
        }
        .style4
        {
            width: 217px;
        }
        .style5
        {
            width: 185px;
        }
        .style6
        {
            width: 183px;
        }
        .style7
        {
            width: 175px;
        }
        
        .imageStyle
        {
            padding: 3px;
            background-color: #ffffff;
            border: solid 2px #DFEFFF !important;
        }
        
        .test
        {
            width: 250px;
            height: 180px;
            background-image: url('https://www.google.se/images/srpr/logo4w.png');
            background-repeat: no-repeat;
            background-size: 250px 180px;
            border: }        
        .style12
        {
            width: 181px;
        }
        .style13
        {
            width: 170px;
        }      
    </style>
    <br />
    <br />
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Program Information</legend>
                <table>
                    <tr>
                        <td>
                            Degree Program<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rdnDegreeProgram" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rdnDegreeProgram_SelectedIndexChanged">
                                <asp:ListItem Value="2">Undergraduate</asp:ListItem>
                                <asp:ListItem Value="1">Graduate</asp:ListItem>
                                <asp:ListItem Value="3">Postgraduate</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Label ID="lnProgramName" runat="server" Text="Program" Visible="false" ForeColor="Red"></asp:Label>
                            <asp:RequiredFieldValidator ID="ReqFldVDegreeProgram" runat="server" ControlToValidate="rdnDegreeProgram"
                                Display="Dynamic" ErrorMessage="Please mark degree Program" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                        <td colspan="2">
                            Photo<span style="color: Red">*</span>
                            <br />
                            <p style="color: Red">
                                Supported format (JPG,JPEG,PNG,BMP,gif,Png)<br />
                                Maximum Photo size 1 MB</p>
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
                    <%-- <tr>
                        <td>
                            First Choice<span style="color: Red">*</span>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlFirstChoice" runat="server" ValidationGroup="EmpForm" Width="300px"
                                OnSelectedIndexChanged="ddlFirstChoice_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvddlFirstChoice" runat="server" ControlToValidate="ddlFirstChoice"
                                ErrorMessage="Select First Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Second Choice (Optional)
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlSecondChoice" runat="server" Width="300px">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CmpValddlSecondChoice" runat="server" ValidationGroup="EmpForm"
                                InitialValue="-1" ControlToValidate="ddlFirstChoice" ControlToCompare="ddlSecondChoice"
                                Operator="NotEqual" Text="Please select another Program" Type="String" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Third Choice (Optional)
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlThirdChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CmpValddlThirdChoice" runat="server" ErrorMessage="Please select another Program"
                                ControlToCompare="ddlSecondChoice" ControlToValidate="ddlThirdChoice" Operator="NotEqual"></asp:CompareValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <span id="FirstChoice" runat="server">
                            <td>
                                First Choice<span style="color: Red">*</span>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFirstChoice" runat="server" Width="300px" ValidationGroup="StudentForm"
                                    OnSelectedIndexChanged="ddlFirstChoice_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvddlFirstChoice" runat="server" ControlToValidate="ddlFirstChoice"
                                    ErrorMessage="Select First Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                        </span>

                          <span id="Eleventh" runat="server">
                            <td>
                                Eleventh Choice <%--<span id="span11" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEleventhChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlEleventhChoice" runat="server" ControlToValidate="ddlEleventhChoice"
                                    ErrorMessage="Select Eleventh Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>
                        
                    </tr>
                    <tr>
                        <span id="SecondChoice" runat="server">
                            <td>
                                Second Choice <%--<span id="span2" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSecondChoice" runat="server" Width="300px" ValidationGroup="StudentForm">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlSecondChoice" runat="server" ControlToValidate="ddlSecondChoice"
                                    ErrorMessage="Select Second Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
<%--                                <asp:CompareValidator ID="CmpValddlSecondChoice" runat="server"  ValidationGroup="StudentForm"
                                    InitialValue="-1" ControlToValidate="ddlSecondChoice" ControlToCompare="ddlFirstChoice"
                                    Operator="NotEqual" Text="Please select another Program" Type="String" />--%>
                            </td>
                        </span>

                        <span id="Twelfth" runat="server">
                            <td>
                                Twelfth Choice <%--<span id="span12" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTwelefthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlTwelfthChoice" runat="server" ControlToValidate="ddlTwelefthChoice"
                                    ErrorMessage="Select Twelfth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>
                        
                    </tr>
                    <tr>
                        <span id="ThirdChoice" runat="server">
                            <td>
                                Third Choice<%--<span id="span3" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlThirdChoice" runat="server"  ValidationGroup="StudentForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlThirdChoice" runat="server" ControlToValidate="ddlThirdChoice"
                                    ErrorMessage="Select Third Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                <%--<asp:CompareValidator ID="CmpValddlThirdChoice" runat="server" ErrorMessage="Please select another Program"
                                    InitialValue="-1"  ControlToCompare="ddlSecondChoice" ControlToValidate="ddlThirdChoice" Operator="NotEqual"  ValidationGroup="StudentForm"></asp:CompareValidator>--%>
                            </td>
                        </span>

                        <span id="Thirteenth" runat="server">
                            <td>
                                Thirteen Choice <%--<span id="span14" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlThirteenthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlThirteenthChoice" runat="server" ControlToValidate="ddlThirteenthChoice"
                                    ErrorMessage="Select Thirteenth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>

                        
                    </tr>
                    <tr>
                        <span id="FourthChoice" runat="server">
                            <td>
                                Fourth Choice <%--<span id="span4" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFourthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlFourthChoice" runat="server" ControlToValidate="ddlFourthChoice"
                                    ErrorMessage="Select Fourth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>

                        <span id="Fourteenth" runat="server">
                            <td>
                                Fourteenth Choice <%--<span id="span13" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFourteenthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlFourteenthChoice" runat="server" ControlToValidate="ddlFourteenthChoice"
                                    ErrorMessage="Select Fourteenth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>

                    </tr>
                    <tr>
                        <span id="FifthChoice" runat="server">
                            <td>
                                Fifth Choice <%--<span id="span5" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFifthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlFifthChoice" runat="server" ControlToValidate="ddlFifthChoice"
                                    ErrorMessage="Select Fifth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>

                         <span id="Fifteenth" runat="server">
                            <td>
                                Fifteenth Choice <%--<span id="span15" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlFifteenthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlFifteenthChoice" runat="server" ControlToValidate="ddlFifteenthChoice"
                                    ErrorMessage="Select Fifteenth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>
                    </tr>
                    <tr>
                        <span id="sixth" runat="server">
                            <td>
                                Sixth Choice <%--<span id="span6" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSixthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlSixthChoice" runat="server" ControlToValidate="ddlSixthChoice"
                                    ErrorMessage="Select Sixth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>

                        <span id="Sixteenth" runat="server">
                            <td>
                                Sixteenth Choice <%-- <span id="span17" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSixteenthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlSixteenthChoice" runat="server" ControlToValidate="ddlSixteenthChoice"
                                    ErrorMessage="Select Sixteenth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>
                    </tr>
                    <tr>
                        <span id="Seventh" runat="server">
                            <td>
                                Seventh Choice <%--<span id="span7" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSeventhChoice" runat="server" ValidationGroup="EmpForm"
                                    Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlSeventhChoice" runat="server" ControlToValidate="ddlSeventhChoice"
                                    ErrorMessage="Select Seventh Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>

                        <span id="Seventeenth" runat="server">
                            <td>
                                Seventeenth Choice<%-- <span id="span19" style="color: Red" runat="server">*</span>--%></td>
                            <td>
                                <asp:DropDownList ID="ddlSeventeenthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlSeventeenthChoice" runat="server" ControlToValidate="ddlSeventeenthChoice"
                                    ErrorMessage="Select Seventeenth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>
                        
                    </tr>
                    <tr>

                        <span id="Eighth" runat="server">
                            <td>
                                Eighth Choice <%--<span id="span8" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEighthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlEighthChoice" runat="server" ControlToValidate="ddlEighthChoice"
                                    ErrorMessage="Select Eighth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>

                        <span id="Eighteenth" runat="server">
                            <td>
                                Eighteenth Choice <%--<span id="span21" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEighteenthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlEighteenthChoice" runat="server" ControlToValidate="ddlEighteenthChoice"
                                    ErrorMessage="Select Eighteenth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>
                        
                    </tr>
                    <tr>
                         <span id="Nineth" runat="server">
                            <td>
                                Nineth Choice <%--<span id="span9" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlNinethChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlNinethChoice" runat="server" ControlToValidate="ddlNinethChoice"
                                    ErrorMessage="Select Nineth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>

                        <span id="Nineteenth" runat="server">
                            <td>
                                Nineteenth Choice <%--<span id="span23" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlNineteenthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlNineteenthChoice" runat="server" ControlToValidate="ddlNineteenthChoice"
                                    ErrorMessage="Select Nineteenth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>
                        
                    </tr>
                    <tr>

                        <span id="Tenth" runat="server">
                            <td>
                                Tenth Choice <%--<span id="span10" style="color: Red" runat="server">*</span>--%>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTenthChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>
                                <%--<asp:RequiredFieldValidator ID="rfvddlTenthChoice" runat="server" ControlToValidate="ddlTenthChoice"
                                    ErrorMessage="Select Tenth Choice" InitialValue="-1" ValidationGroup="StudentForm"
                                    Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            </td>
                        </span>

                        
                        <span id="Twentieth" runat="server">
                            <td>
                                Twentieth Choice
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTwentiethChoice" runat="server" ValidationGroup="EmpForm" Width="300px">
                                </asp:DropDownList>                              
                            </td>
                        </span>
                    </tr>
                    <tr id="selfFinance" runat="server">
                        <td colspan="2">
                            Plesae check the box if you are intrested in Self Finance Scheme
                        </td>
                        <td colspan="2">
                            <asp:CheckBox ID="chkselfFinance" runat="server" />
                        </td>
                    </tr>
                    <tr id="transport" runat="server">
                        <td colspan="2">
                            Plesae check the box if you want to avail SMIU Transport
                        </td>
                        <td colspan="2">
                            <asp:CheckBox ID="chkTransport" runat="server" AutoPostBack="true" OnCheckedChanged="chkTransport_CheckedChanged" />
                        </td>
                    </tr>
                    <tr id="TransportDesc" runat="server">
                        <td colspan="4">
                            <span>Specify your Pickup point</span>
                            <asp:TextBox ID="txtTransport" runat="server" autocomplete="off" Width="50%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Personal Information</legend>
                <br />
                <table>
                    <tr>
                        <td class="style4">
                            <asp:Label ID="lblCNICNo" runat="server" Text="CNIC # / FORM 'B'"></asp:Label>
                            &nbsp;<span style="color: Red">*</span>
                        </td>
                        <td class="style23">
                            <asp:TextBox ID="txtNIC" runat="server" Width="140px" ValidationGroup="StudentForm"
                                ReadOnly="true" autocomplete="off"></asp:TextBox>
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
                        <td class="style12">
                            Passport Number
                            <br />
                            (For Foreign Students)
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtPassportNumber" runat="server" MaxLength="100" ToolTip="Name"
                                Width="150px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            First Name<span style="color: Red">*</span>
                        </td>
                        <td class="style23">
                            <asp:TextBox ID="ftxtname" runat="server" MaxLength="100" ToolTip=" First Name" Width="140px"
                                ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFdValtxtname" runat="server" ControlToValidate="ftxtname"
                                Display="Dynamic" ErrorMessage="Please Enter First Name" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltrExtFName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="ftxtname">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td class="style12">
                            Middle Name
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="mtxtName" runat="server" MaxLength="100" ToolTip="Middle Name" Width="130px"
                                ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="fltrExtMName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="mtxtName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td class="style3">
                            Last Name<%--<span style="color: Red">*</span>--%></td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="100" ToolTip="Last Name"
                                Width="130px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="ReqFdValLtxtName" runat="server" ControlToValidate="txtLastName"
                                Display="Dynamic" ErrorMessage="Please Enter Last Name" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>--%>
                            <cc1:FilteredTextBoxExtender ID="FltExttxtLastName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtLastName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            Father's Name<span style="color: Red">*</span>
                        </td>
                        <td class="style23">
                            <asp:TextBox ID="txtFatherName" runat="server" MaxLength="100" ToolTip="Name" Width="140px"
                                ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqtxtFatherName" runat="server" ControlToValidate="txtFatherName"
                                Display="Dynamic" ErrorMessage="Please Enter Father Name" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            &nbsp;
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtFatherName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtFatherName">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td class="style12">
                            Father's Occupation<%--<span style="color: Red">*</span>--%></td>
                        <td colspan="3">
                            <asp:TextBox ID="txtfatheroccupation" runat="server" MaxLength="100" Width="150px"
                                autocomplete="off"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            Nationality
                        </td>
                        <td class="style23">
                            <asp:TextBox ID="txtNationality" runat="server" MaxLength="100" ToolTip="Nationality"
                                Width="140px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtNationality" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtNationality">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <%-- <td class="style12">
                            Religion <span style="color: Red">*</span>
                        </td>
                        <td class="style4">
                            <asp:DropDownList ID="ddlReligion" runat="server" ValidationGroup="StudentForm" Width="140px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Islam">Islam</asp:ListItem>
                                <asp:ListItem Value="Hinduism">Hinduism</asp:ListItem>
                                <asp:ListItem Value="Christianity">Christianity</asp:ListItem>
                                <asp:ListItem Value="Parsi">Parsi</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFieldValReligion" runat="server" ControlToValidate="ddlReligion"
                                ErrorMessage="Select Religion" InitialValue="-1" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>--%>
                        <td class="style3">
                            Gender <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="StudentForm" Width="140px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlGender" runat="server" ControlToValidate="ddlGender"
                                ErrorMessage="Select Gender" InitialValue="-1" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            Date of Birth <span style="color: Red">*</span>
                        </td>
                        <td class="style23">
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
                        <td class="style12">
                            Place Of Birth
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="txtPlaceOfBirth" runat="server" MaxLength="100" ToolTip="Place Of Birth"
                                Width="130px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtPlaceOfBirth" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtPlaceOfBirth">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td class="style3">
                            Marital Status <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMaritalStatus" runat="server" ValidationGroup="StudentForm"
                                Width="140px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Single">Single</asp:ListItem>
                                <asp:ListItem Value="Married">Married</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlMaritalStatus" runat="server" ControlToValidate="ddlMaritalStatus"
                                ErrorMessage="Select Marital Status" InitialValue="-1" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
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
                            City<span style="color: Red">*</span>
                            <asp:TextBox ID="PostaltxtCity" runat="server" MaxLength="100" ToolTip="City" Width="110px"
                                ValidationGroup="StudentForm"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFldVaPostaltxtCity" runat="server" ControlToValidate="PostaltxtCity"
                                Display="Dynamic" ErrorMessage="Please Enter City" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltrExPostaltxtCity" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="PostaltxtCity">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            Permanent Address<span style="color: Red">*</span>
                        </td>
                        <td colspan="5">
                            <asp:TextBox ID="txtPermanentAddress" runat="server" ValidationGroup="StudentForm"
                                Width="570px" autocomplete="off" />
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtPermanentAddress" runat="server" TargetControlID="txtPermanentAddress"
                                FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="ReqFldVtxtPermanentAddress" runat="server" ControlToValidate="txtPermanentAddress"
                                ErrorMessage="Please Enter Address" ValidationGroup="StudentForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            City<span style="color: Red">*</span>
                            <asp:TextBox ID="PermanenttxtCity" runat="server" MaxLength="100" ToolTip="City"
                                Width="110px" ValidationGroup="StudentForm"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFldVaPermanenttxtCity" runat="server" ControlToValidate="PermanenttxtCity"
                                Display="Dynamic" ErrorMessage="Please Enter City" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltrExPermanenttxtCity" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="PermanenttxtCity">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <%--<td class="style13">
                            City<span style="color: Red">*</span>
                        </td>
                        <td class="style23">
                            <asp:TextBox ID="txtCity" runat="server" MaxLength="100" ToolTip="City" Width="140px"
                                ValidationGroup="StudentForm"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFldVatxtCity" runat="server" ControlToValidate="txtCity"
                                Display="Dynamic" ErrorMessage="Please Enter City" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltrExtxtCity" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtCity">
                            </cc1:FilteredTextBoxExtender>
                        </td>--%>
                        <td class="style4">
                            Postal Code
                        </td>
                        <td class="style4">
                            <asp:TextBox ID="txtPostalCode" runat="server" MaxLength="100" ToolTip="Postal Code"
                                Width="130px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                        </td>
                        <td class="style3">
                            Country
                        </td>
                        <td colspan="5">
                            <asp:TextBox ID="txtCountry" runat="server" MaxLength="100" ToolTip="Country" Width="130px"
                                ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            Home Phone Number
                            <%--<span style="color: Red">*</span>--%>
                        </td>
                        <td class="style23">
                            <asp:TextBox ID="txtLandLineNumber" runat="server" ToolTip="Land Line Number" Width="140px"
                                MaxLength="12" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            &nbsp;&nbsp; <strong>(Format: 021XXXXXXXX)</strong>
                            <%--  <asp:RequiredFieldValidator ID="ReqLandLineNumber" runat="server" ControlToValidate="txtLandLineNumber"
                                ErrorMessage="Please Enter Land Line Number" ValidationGroup="StudentForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            <asp:RegularExpressionValidator ID="RegExptxtLandLineNumber" runat="server" ErrorMessage="Please enter only digits"
                                ControlToValidate="txtLandLineNumber" Display="Dynamic" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredLandLineNumber" runat="server" TargetControlID="txtLandLineNumber"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td class="style12">
                            Mobile Number (self) <span style="color: Red">*</span>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="11" ToolTip="Mobile Number"
                                Width="130px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
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
                        <td class="style4">
                            E-mail<span style="color: Red">*</span>
                        </td>
                        <td class="style23">
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="140px" ReadOnly="true"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please Enter E-mail" ToolTip="E-mail Address" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Invalid Email Address" ValidationExpression="^([\w-\.&]+)@([\w-]+\.)+[\w-]+"
                                Display="Dynamic"></asp:RegularExpressionValidator>
                        </td>
                        <td class="style12">
                            Mobile Number (Home)
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtMobileNoHome" runat="server" MaxLength="11" ToolTip="Mobile Number (Home)"
                                Width="130px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            &nbsp;&nbsp; <strong>(Format: 03XXXXXXXXX)</strong>
                            <%-- <asp:RequiredFieldValidator ID="ReqFldVtxtEmergencyContact" runat="server" ControlToValidate="txtEmergencyContact"
                                ErrorMessage="Please Enter Emergency Contact Number" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                            <asp:RegularExpressionValidator ID="RegExpValtxtMobileNoHome" runat="server" ErrorMessage="Please enter only digits"
                                ControlToValidate="txtMobileNoHome" Display="Static" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMobileNoHome" runat="server" TargetControlID="txtMobileNoHome"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            District Of Domicile<%--<span style="color: Red">*</span>--%></td>
                        <td>
                            <asp:TextBox ID="txtDistrictOfDomicile" runat="server" MaxLength="100" ToolTip="District Of Domicile"
                                ValidationGroup="StudentForm" Width="200px" autocomplete="off"></asp:TextBox>
                            <%--  <asp:RequiredFieldValidator ID="ReqFldValtxtDistrictOfDomicile" runat="server" ControlToValidate="txtDistrictOfDomicile"
                                Display="Dynamic" ErrorMessage="Please Enter District Of Domicile" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>--%>
                            <cc1:FilteredTextBoxExtender ID="fltrtxtDistrictOfDomicile" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*()_+}&lt;{\|:?/&gt;`1234567890-=][';,"
                                TargetControlID="txtDistrictOfDomicile">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td class="style6">
                            Domicile<span style="color: Red">*</span>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="ddlUrbanOrRural" runat="server" ValidationGroup="StudentForm"
                                Width="200px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Sindh Rural">Sindh Rural</asp:ListItem>
                                <asp:ListItem Value="Sindh Urban">Sindh Urban</asp:ListItem>
                                <asp:ListItem Value="Punjab">Punjab</asp:ListItem>
                                <asp:ListItem Value="Balochistan">Balochistan</asp:ListItem>
                                <asp:ListItem Value="KPK">KPK</asp:ListItem>
                                <asp:ListItem Value="Gilgit-Baltistan">Gilgit-Baltistan</asp:ListItem>
                                <asp:ListItem Value="AJK">AJK</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvddlUrbanOrRural" runat="server" ControlToValidate="ddlUrbanOrRural"
                                Display="Dynamic" ErrorMessage="Select Urban/Rural" InitialValue="-1" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Guardian's Information</legend>
                <br />
                <table>
                    <tr>
                        <td class="style5">
                            Guardian's Name<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGname" runat="server" MaxLength="100" ToolTip="Guardian's Name"
                                Width="200px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtGname" runat="server" ControlToValidate="txtGname"
                                Display="Dynamic" ErrorMessage="Please Enter Guardian's Name" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltrtxtGname" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtGname">
                            </cc1:FilteredTextBoxExtender>
                            &nbsp;&nbsp; &nbsp;&nbsp; Guardian's Occupation<%--<span style="color: Red">*</span>--%><asp:TextBox
                                ID="txtGOccupation" runat="server" MaxLength="100" ToolTip="Guardian's Occupation"
                                Width="200px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtGOccupation" runat="server"
                                ControlToValidate="txtGOccupation" Display="Dynamic" ErrorMessage="Please Enter Occupation"
                                ValidationGroup="StudentForm"></asp:RequiredFieldValidator>--%>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtGOccupation" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtGOccupation">
                            </cc1:FilteredTextBoxExtender>
                    </tr>
                    <tr>
                        <td class="style1">
                            Nature of job
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rdnNatureofJob" runat="server" RepeatDirection="Vertical">
                                <asp:ListItem Value="Public">Public</asp:ListItem>
                                <asp:ListItem Value="Private">Private</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Organization
                        </td>
                        <td>
                            <asp:TextBox ID="txtOrganization" runat="server" MaxLength="100" ToolTip="Guardian's Organization"
                                Width="200px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtOrganization" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtOrganization">
                            </cc1:FilteredTextBoxExtender>
                            &nbsp; &nbsp;&nbsp; Designation
                            <asp:TextBox ID="txtGDesignation" runat="server" MaxLength="100" ToolTip="Guardian's Designation"
                                Width="150px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="flttxtGDesignation" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtGDesignation">
                            </cc1:FilteredTextBoxExtender>
                            &nbsp; &nbsp;&nbsp; Monthly Income
                            <asp:TextBox ID="txtMonthlyIncome" runat="server" MaxLength="100" ToolTip="Monthly Income"
                                Width="100px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <%-- <asp:RegularExpressionValidator ID="RegularExprValtxtMonthlyIncome" runat="server"
                                ErrorMessage="Please enter only digits" ControlToValidate="txtMonthlyIncome"
                                Display="Static" ValidChars="0123456789" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>--%>
                            <cc1:FilteredTextBoxExtender ID="fltexttxtMonthlyIncome" runat="server" TargetControlID="txtMonthlyIncome"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Guardian's Address<%--<span style="color: Red">*</span>--%></td>
                        <td>
                            <asp:TextBox ID="txtGuardianAddress" runat="server" ValidationGroup="StudentForm"
                                Width="730px" autocomplete="off" />
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtGuardianAddress" runat="server" TargetControlID="txtGuardianAddress"
                                FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                            <%-- <asp:RequiredFieldValidator ID="ReqFldValtxtGuardianAddress" runat="server" ControlToValidate="txtGuardianAddress"
                                ErrorMessage="Please Enter Address" ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Guardian's Relation<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtGuardianrelation" runat="server" MaxLength="100" Width="90px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFldVtxtGuardianrelation" runat="server" ControlToValidate="txtGuardianrelation"
                                ErrorMessage="Please Enter Relation" ValidationGroup="StudentForm" Display="Dynamic"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            &nbsp;&nbsp; &nbsp;&nbsp; Mobile Number <span style="color: Red">*</span>
                            <asp:TextBox ID="txtGMobileNo" runat="server" MaxLength="11" ToolTip="Mobile Number"
                                Width="130px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            &nbsp;&nbsp; <strong>(Format: 03XXXXXXXXX)</strong>
                            <asp:RequiredFieldValidator ID="ReqFldVtxtGMobileNo" runat="server" ControlToValidate="txtGMobileNo"
                                ErrorMessage="Please Enter Guardian's Contact Number" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExpValtxtGMobileNo" runat="server" ErrorMessage="Please enter only digits"
                                ControlToValidate="txtGMobileNo" Display="Static" ValidationExpression="^\d{11}$"
                                ValidChars="0123456789" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtGMobileNo" runat="server" TargetControlID="txtGMobileNo"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>Emergency Contact Details</legend>
                <br />
                <table>
                    <tr>
                        <td class="style5">
                            Name<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmergencyContactName" runat="server" MaxLength="100" ToolTip="Emergency Contact Name"
                                Width="200px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtEmergencyContactName" runat="server"
                                ControlToValidate="txtEmergencyContactName" Display="Dynamic" ErrorMessage="Please Enter Emergency Contact Name"
                                ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtExttxtEmergencyContactName" runat="server"
                                FilterMode="InvalidChars" FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';,"
                                TargetControlID="txtEmergencyContactName">
                            </cc1:FilteredTextBoxExtender>
                            &nbsp;&nbsp; &nbsp;&nbsp; Relation<span style="color: Red">*</span><asp:TextBox ID="txtEmergencyContactRelation"
                                runat="server" MaxLength="100" ToolTip="Relation" Width="200px" ValidationGroup="StudentForm"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtEmergencyContactRelation" runat="server"
                                ControlToValidate="txtEmergencyContactRelation" Display="Dynamic" ErrorMessage="Please Enter Relation"
                                ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredExttxtEmergencyContactRelation" runat="server"
                                FilterMode="InvalidChars" FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';,"
                                TargetControlID="txtEmergencyContactRelation">
                            </cc1:FilteredTextBoxExtender>
                    </tr>
                    <tr>
                        <td class="style5">
                            Address<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmergencyContactAddress" runat="server" ValidationGroup="StudentForm"
                                Width="730px" autocomplete="off" />
                            <asp:RequiredFieldValidator ID="ReqFldValEmergencyContactAddress" runat="server"
                                ControlToValidate="txtEmergencyContactAddress" ErrorMessage="Please Enter Emergency Contact Address"
                                ValidationGroup="StudentForm" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltExttxtEmergencyContactAddress" runat="server"
                                TargetControlID="txtEmergencyContactAddress" FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5">
                            Mobile Number<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmergencyContact" runat="server" MaxLength="11" ToolTip="Mobile Number"
                                Width="130px" ValidationGroup="StudentForm" autocomplete="off"></asp:TextBox>
                            &nbsp;&nbsp; <strong>(Format: 03XXXXXXXXX)</strong>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtEmergencyContact" runat="server" ControlToValidate="txtEmergencyContact"
                                ErrorMessage="Please Enter Emergency Contact Number" ValidationGroup="StudentForm"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpValEmergencyContact" runat="server"
                                ErrorMessage="Please enter correct number" ControlToValidate="txtEmergencyContact"
                                Display="Static" ValidationExpression="^\d{11}$" ValidChars="0123456789" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredTxtExtEmergencyContact" runat="server" TargetControlID="txtEmergencyContact"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <legend>NTS / Other Test Details if Appeared</legend>
                <br />
                <table>
                    <tr>
                        <td class="style7">
                            Test Type
                        </td>
                        <td>
                            <asp:DropDownList ID="ddtNtSType" runat="server" ValidationGroup="StudentForm" Width="200px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="GAT">GAT</asp:ListItem>
                                <asp:ListItem Value="GAT Subject">GAT Subject</asp:ListItem>
                                <asp:ListItem Value="NAT">NAT</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp; &nbsp;&nbsp; Testing Service
                            <asp:TextBox ID="txtTestingServiceName" runat="server" ValidationGroup="StudentForm"
                                Width="200px" autocomplete="off"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="ReqFldVddtNtSType" runat="server" ControlToValidate="ddtNtSType"
                                Display="Dynamic" ErrorMessage="Select NTS Type" InitialValue="-1" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            Test Date
                        </td>
                        <td>
                            <asp:TextBox ID="txtNTSDate" runat="server" ValidationGroup="StudentForm" Width="200px"
                                CssClass="date" autocomplete="off"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNTSDate"
                                ErrorMessage="Please Enter Date" ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" AcceptNegative="Left"
                                CultureName="en-GB" DisplayMoney="Left" ErrorTooltipEnabled="True" InputDirection="RightToLeft"
                                Mask="99/99/9999" MaskType="Date" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                                OnInvalidCssClass="MaskedEditError" TargetControlID="txtNTSDate">
                            </cc1:MaskedEditExtender>
                            <cc1:MaskedEditValidator ID="MaskedEditValidator1" runat="server" ControlExtender="MaskedEditExtxtDOB"
                                ControlToValidate="txtNTSDate" EmptyValueMessage="*" ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                                InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)" ValidationGroup="StudentForm"
                                Display="Dynamic"></cc1:MaskedEditValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            Roll Number
                        </td>
                        <td>
                            <asp:TextBox ID="txtNTSRollNumber" runat="server" MaxLength="12" ToolTip="Mobile Number"
                                ValidationGroup="StudentForm" Width="200px" autocomplete="off"></asp:TextBox>
                            <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNTSRollNumber"
                                ErrorMessage="Please Enter NTS Roll Number" ValidationGroup="StudentForm"></asp:RequiredFieldValidator>--%>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtNTSRollNumber" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            Max. Marks
                        </td>
                        <td>
                            <asp:TextBox ID="txtMaxTestMarks" runat="server" MaxLength="3" Width="90px" autocomplete="off"></asp:TextBox>
                            &nbsp; &nbsp;&nbsp; Marks Obtain
                            <asp:TextBox ID="txtScore" runat="server" MaxLength="3" Width="90px"></asp:TextBox>
                            <asp:RangeValidator ID="rvtxtScore" ControlToValidate="txtScore" Display="Dynamic"
                                MinimumValue="50" MaximumValue="200" SetFocusOnError="true" Type="Integer" runat="server"
                                ErrorMessage="Test Score must be greater than or equal to 50">
                            </asp:RangeValidator>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br />
            <fieldset>
                <legend>Previous Education/Acadmic Record </legend>
                <br />
                <table>
                    <tr>
                        <th colspan="7" style="text-align: left;">
                            Secondary School Certificate (SSC) / O-Level
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Degree
                        </td>
                        <td>
                            Seat Number
                        </td>
                        <td>
                            Institution
                        </td>
                        <td>
                            Board
                        </td>
                        <td>
                            Group
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
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlMDegreeLevel" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="SSC">SSC</asp:ListItem>
                                <asp:ListItem Value="O-Level">O-Level</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFldValMDegreeLevel" runat="server" ControlToValidate="ddlMDegreeLevel"
                                ErrorMessage="Please Select Degree" InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSeatNumber" runat="server" MaxLength="15" Width="80px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFldValtxtMSeatNumber" runat="server" ControlToValidate="txtMSeatNumber"
                                ErrorMessage="Please Enter Seat Number" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMBoard" runat="server" MaxLength="200" Width="200px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtMBoard" runat="server" ControlToValidate="txtMBoard"
                                ErrorMessage="Institution Name" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMInstitution" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="BIE Karachi">BIE Karachi</asp:ListItem>
                                <asp:ListItem Value="BSE Karachi">BSE Karachi</asp:ListItem>
                                <asp:ListItem Value="BISE Sukkur">BISE Sukkur</asp:ListItem>
                                <asp:ListItem Value="BISE Hyderabad">BISE Hyderabad</asp:ListItem>
                                <asp:ListItem Value="BISE Larkana">BISE Larkana</asp:ListItem>
                                <asp:ListItem Value="BISE Mirpurkhas">BISE Mirpurkhas</asp:ListItem>
                                <asp:ListItem Value="Aga Khan Board">Aga Khan Board</asp:ListItem>
                                <asp:ListItem Value="BISE Lahore">BISE Lahore</asp:ListItem>
                                <asp:ListItem Value="BISE Gujranwala">BISE Gujranwala</asp:ListItem>
                                <asp:ListItem Value="BISE Multan">BISE Multan</asp:ListItem>
                                <asp:ListItem Value="BISE Faisalabad">BISE Faisalabad</asp:ListItem>
                                <asp:ListItem Value="BISE Sargodha">BISE Sargodha</asp:ListItem>
                                <asp:ListItem Value="BISE Rawalpindi">BISE Rawalpindi</asp:ListItem>
                                <asp:ListItem Value="BISE Bahawalpur">BISE Bahawalpur</asp:ListItem>
                                <asp:ListItem Value="BISE DG Khan">BISE DG Khan</asp:ListItem>
                                <asp:ListItem Value="BISE Sahiwal">BISE Sahiwal</asp:ListItem>
                                <asp:ListItem Value="BISE Federal">BISE Federal</asp:ListItem>
                                <asp:ListItem Value="BISE Peshawar">BISE Peshawar</asp:ListItem>
                                <asp:ListItem Value="BISE Swat">BISE Swat</asp:ListItem>
                                <asp:ListItem Value="BISE Kohat"> BISE Kohatr</asp:ListItem>
                                <asp:ListItem Value="BISE Malakand">BISE Malakand</asp:ListItem>
                                <asp:ListItem Value="BISE Abbottabad">BISE Abbottabad</asp:ListItem>
                                <asp:ListItem Value="BISE Bannu">BISE Bannu</asp:ListItem>
                                <asp:ListItem Value="BISE Quetta">BISE Quetta</asp:ListItem>
                                <asp:ListItem Value="BISE Turbat">BISE Turbat</asp:ListItem>
                                <asp:ListItem Value="FBISE Islamabad">FBISE Islamabad</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqMtxtInstitution" runat="server" ControlToValidate="ddlMInstitution"
                                Display="Dynamic" ErrorMessage="Please Select Board" InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMGroup" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="General Science">General Science</asp:ListItem>
                                <asp:ListItem Value="Science">Science</asp:ListItem>
                                <asp:ListItem Value="Humanities">Humanities</asp:ListItem>
                                <asp:ListItem Value="Computer Science">Computer Science</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFldValddlMGroup" runat="server" ControlToValidate="ddlMGroup"
                                ErrorMessage="Please Select Group" InitialValue="-1" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:TextBox ID="txtMyearTo" runat="server" MaxLength="4" ToolTip="Year To" Width="50px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValMtxtYearTo" runat="server" ControlToValidate="txtMyearTo"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="ReqFldMYearTo" runat="server" ControlToValidate="txtMyearTo"
                                Display="Dynamic" ErrorMessage="Please Enter Year To" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rngvalMYearTo" runat="server" ControlToValidate="txtMyearTo"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="StudentForm">
                            </asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Marks Obtained
                        </td>
                        <td>
                            Total Marks
                        </td>
                        <td>
                            Percentage
                        </td>
                        <td>
                            Grade
                        </td>
                        <td colspan="3">
                            Annual/Suppl.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMarksObtainedM" runat="server" ToolTip="Obtained Marks" Width="50px"
                                MaxLength="4" onkeyup="SSCPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMarksObtainedM" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMarksObtainedM" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="ReqdFldVtxtMarksObtainedM" runat="server" ControlToValidate="txtMarksObtainedM"
                                Display="Dynamic" ErrorMessage="Please Enter Makrs Obtained" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExprValtxtMarksObtainedM" runat="server" ControlToValidate="txtMarksObtainedM"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMTotalMarks" runat="server" ToolTip="Total Marks" Width="50px"
                                MaxLength="4" onkeyup="SSCPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMTotalMarks" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMTotalMarks" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="ReqtxtMTotalMarks" runat="server" ControlToValidate="txtMTotalMarks"
                                Display="Dynamic" ErrorMessage="Please Enter Total Marks" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:CompareValidator runat="server" ID="CmpValtxtMTotalMarks" ControlToValidate="txtMTotalMarks"
                                ControlToCompare="txtMarksObtainedM" Operator="GreaterThan" Type="Integer" ErrorMessage="Total marks must be greater than Otained Marks"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="RegExprValtxtMTotalMarks" runat="server" ControlToValidate="txtMTotalMarks"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMPercentage" runat="server" ToolTip="Percentage" Width="50px"
                                MaxLength="5" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FlttxEtxtendertxtMPercentage" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" TargetControlID="txtMPercentage" ValidChars="ABCDEFabcdef0123456789.">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMGrade" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
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
                        <td colspan="3">
                            <asp:DropDownList ID="ddlExamTypeM" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFieldValddlExamTypeM" runat="server" ControlToValidate="ddlExamTypeM"
                                ErrorMessage="Please Select" InitialValue="-1" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <th colspan="7" style="text-align: left;">
                            Higher School Certificate (HSC) / A-Level
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Degree
                        </td>
                        <td>
                            Seat Number
                        </td>
                        <td>
                            Institution
                        </td>
                        <td>
                            Board
                        </td>
                        <td>
                            Group
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
                    </tr>
                    <tr>
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
                        <td>
                            <asp:TextBox ID="txtISeatNumber" runat="server" MaxLength="15" Width="80px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqfldValtxtISeatNumber" runat="server" ControlToValidate="txtISeatNumber"
                                ErrorMessage="Please Enter Seat Number" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIBoard" runat="server" MaxLength="200" Width="200px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtIBoard" runat="server" ControlToValidate="txtIBoard"
                                ErrorMessage="Please Enter Institution Name" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlInstitution" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="BIE Karachi">BIE Karachi</asp:ListItem>
                                <asp:ListItem Value="BSE Karachi">BSE Karachi</asp:ListItem>
                                <asp:ListItem Value="BISE Sukkur">BISE Sukkur</asp:ListItem>
                                <asp:ListItem Value="BISE Hyderabad">BISE Hyderabad</asp:ListItem>
                                <asp:ListItem Value="BISE Larkana">BISE Larkana</asp:ListItem>
                                <asp:ListItem Value="BISE Mirpurkhas">BISE Mirpurkhas</asp:ListItem>
                                <asp:ListItem Value="Aga Khan Board">Aga Khan Board</asp:ListItem>
                                <asp:ListItem Value="BISE Lahore">BISE Lahore</asp:ListItem>
                                <asp:ListItem Value="BISE Gujranwala">BISE Gujranwala</asp:ListItem>
                                <asp:ListItem Value="BISE Multan">BISE Multan</asp:ListItem>
                                <asp:ListItem Value="BISE Faisalabad">BISE Faisalabad</asp:ListItem>
                                <asp:ListItem Value="BISE Sargodha">BISE Sargodha</asp:ListItem>
                                <asp:ListItem Value="BISE Rawalpindi">BISE Rawalpindi</asp:ListItem>
                                <asp:ListItem Value="BISE Bahawalpur">BISE Bahawalpur</asp:ListItem>
                                <asp:ListItem Value="BISE DG Khan">BISE DG Khan</asp:ListItem>
                                <asp:ListItem Value="BISE Sahiwal">BISE Sahiwal</asp:ListItem>
                                <asp:ListItem Value="BISE Federal">BISE Federal</asp:ListItem>
                                <asp:ListItem Value="BISE Peshawar">BISE Peshawar</asp:ListItem>
                                <asp:ListItem Value="BISE Swat">BISE Swat</asp:ListItem>
                                <asp:ListItem Value="BISE Kohat"> BISE Kohatr</asp:ListItem>
                                <asp:ListItem Value="BISE Malakand">BISE Malakand</asp:ListItem>
                                <asp:ListItem Value="BISE Abbottabad">BISE Abbottabad</asp:ListItem>
                                <asp:ListItem Value="BISE Bannu">BISE Bannu</asp:ListItem>
                                <asp:ListItem Value="BISE Quetta">BISE Quetta</asp:ListItem>
                                <asp:ListItem Value="BISE Turbat">BISE Turbat</asp:ListItem>
                                <asp:ListItem Value="FBISE Islamabad">FBISE Islamabad</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqItxtInstitution" runat="server" ControlToValidate="ddlInstitution"
                                Display="Dynamic" ErrorMessage="Please Select Board" InitialValue="-1" SetFocusOnError="True"
                                ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
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
                        <td>
                            <asp:TextBox ID="txtIyearFrom" runat="server" MaxLength="4" ToolTip="Passing Year"
                                Width="50px" autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValItxtYear" runat="server" ControlToValidate="txtIyearFrom"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="ReqFldIYearFrom" runat="server" ControlToValidate="txtIyearFrom"
                                Display="Dynamic" ErrorMessage="Please Enter Passing Year From" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rngvalIYearFrom" runat="server" ControlToValidate="txtIyearFrom"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="StudentForm">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIyearTo" runat="server" MaxLength="4" ToolTip="Year To" Width="50px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValItxtYearTo" runat="server" ControlToValidate="txtIyearTo"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="ReqFldIYearTo" runat="server" ControlToValidate="txtIyearTo"
                                Display="Dynamic" ErrorMessage="Please Enter Year To" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rngvalIYearTo" runat="server" ControlToValidate="txtIyearTo"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="StudentForm">
                            </asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Marks Obtained
                        </td>
                        <td>
                            Total Marks
                        </td>
                        <td>
                            Percentage
                        </td>
                        <td>
                            Grade
                        </td>
                        <td colspan="3">
                            Annual/Suppl.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMarksObtainedI" runat="server" ToolTip="Marks Obtained" Width="50px"
                                MaxLength="4" onkeyup="HSCPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMarksObtainedI" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMarksObtainedI" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RequiredFieldValidator ID="ReqdFldVtxtMarksObtainedI" runat="server" ControlToValidate="txtMarksObtainedI"
                                Display="Dynamic" ErrorMessage="Please Enter Makrs Obtained" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExprValtxtMarksObtainedI" runat="server" ControlToValidate="txtMarksObtainedI"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtITotalMarks" runat="server" ToolTip="Total Marks" Width="50px"
                                MaxLength="4" onkeyup="HSCPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtITotalMarks" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtITotalMarks" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RegularExpressionValidator ID="RegExprValtxtITotalMarks" runat="server" ControlToValidate="txtITotalMarks"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="ReqtxtITotalMarks" runat="server" ControlToValidate="txtITotalMarks"
                                Display="Dynamic" ErrorMessage="Please Enter Total Marks" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:CompareValidator runat="server" ID="cmpINumbers" ControlToValidate="txtITotalMarks"
                                ControlToCompare="txtMarksObtainedI" Operator="GreaterThan" Type="Integer" ErrorMessage="Total marks must be greater than Otained Marks"
                                Display="Dynamic" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtIPercentage" runat="server" ToolTip="Percentage" Width="50px"
                                MaxLength="4" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FlttxEtxtenderIPercentage" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" TargetControlID="txtIPercentage" ValidChars="ABCDEFabcdef0123456789 .">
                            </cc1:FilteredTextBoxExtender>
                            <asp:CustomValidator ID="CustomValidatorFldtxtIPercentage" runat="server" ControlToValidate="txtIPercentage"
                                ErrorMessage="Percentage must be greater than or equal to 45" OnServerValidate="txtIPercentageCustom_ServerValidate"
                                Display="Dynamic" ValidationGroup="StudentForm"></asp:CustomValidator>
                        </td>
                        <td class="style28">
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
                        <td colspan="3">
                            <asp:DropDownList ID="ddlExamTypeI" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFieldValddlExamTypeI" runat="server" ControlToValidate="ddlExamTypeI"
                                ErrorMessage="Please Select" InitialValue="-1" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <table id="UgradDegree" runat="server">
                    <tr>
                        <th colspan="7" style="text-align: left;">
                            Bachelor's Degree Program
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Seat Number
                        </td>
                        <td>
                            Institution
                        </td>
                        <td>
                            University
                        </td>
                        <td>
                            Program<br />
                            (e.g. BSc, BS etc)
                        </td>
                        <td>
                            Major Subjects<br />
                            (e.g. Math, English etc)
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
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtUgradSeatNumber" runat="server" MaxLength="15" Width="80px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUgradInstitution" runat="server" MaxLength="500" ToolTip="Institution"
                                Width="160px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFldValtxtUgradInstitution" runat="server" ControlToValidate="txtUgradInstitution"
                                ErrorMessage="Please Enter Institution " SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="fltUgradExt" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;,?" TargetControlID="txtUgradInstitution">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUgradUniversity" runat="server" MaxLength="200" Width="160px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFldValtxtUgradUniversity" runat="server" ControlToValidate="txtUgradUniversity"
                                ErrorMessage="Please Enter University" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtUgradUniversity" runat="server" ControlToValidate="txtUgradUniversity"
                                ErrorMessage="Please Enter University Name" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUgradProgram" runat="server" MaxLength="100" ToolTip="Program"
                                Width="120px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFldValtxtUgradProgram" runat="server" ControlToValidate="txtUgradProgram"
                                ErrorMessage="Please Enter Program" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;,?" TargetControlID="txtUgradProgram">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUgradMajorSubjects" runat="server" MaxLength="100" ToolTip="Major Subjects"
                                Width="120px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFldValtxtUgradMajorSubjects" runat="server" ControlToValidate="txtUgradMajorSubjects"
                                ErrorMessage="Please Enter Major Subjects" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtUgradMajorSubjects" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;?" TargetControlID="txtUgradMajorSubjects">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUgradyearFrom" runat="server" MaxLength="4" ToolTip="Passing Year From"
                                Width="50px" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtUgradyearFrom" runat="server" ControlToValidate="txtUgradyearFrom"
                                ErrorMessage="Please Enter Year From" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExprValUgradtxtYearFrom" runat="server" ControlToValidate="txtUgradyearFrom"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="a"></asp:RegularExpressionValidator>
                            <asp:RangeValidator ID="rngvalUgradYearFrom" runat="server" ControlToValidate="txtUgradyearFrom"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="a">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUgradyearTo" runat="server" MaxLength="4" ToolTip="Year To" Width="50px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValtxtUgradyearTo" runat="server" ControlToValidate="txtUgradyearTo"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="ReqFldtxtUgradyearTo" runat="server" ControlToValidate="txtUgradyearTo"
                                Display="Dynamic" ErrorMessage="Please Enter Year To" ValidationGroup="StudentForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rngvaltxtUgradyearTo" runat="server" ControlToValidate="txtUgradyearTo"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="StudentForm">
                            </asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Marks Obtained
                        </td>
                        <td>
                            Total Marks
                        </td>
                        <td>
                            Percentage
                        </td>
                        <td>
                            Grade/ Division
                        </td>
                        <td>
                            CGPA
                        </td>
                        <td colspan="3">
                            Annual/Suppl.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMarksUgradbtained" runat="server" ToolTip="Marks Obtained" Width="50px"
                                MaxLength="4" onkeyup="UGradPercentage()" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtMarksUgradbtained" runat="server" ControlToValidate="txtMarksUgradbtained"
                                ErrorMessage="Please Enter Marks Obtained" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMarksObtainedUgrad" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMarksUgradbtained" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RegularExpressionValidator ID="RegExprValtxtMarksUgradbtained" runat="server"
                                ControlToValidate="txtMarksUgradbtained" Display="Dynamic" ErrorMessage="only numbers are allowed"
                                ValidationExpression="\d+" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUgradTotalMarks" runat="server" ToolTip="Total Marks" Width="50px"
                                MaxLength="4" onkeyup="UGradPercentage()" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtUgradTotalMarks" runat="server" ControlToValidate="txtUgradTotalMarks"
                                ErrorMessage="Please Enter Total Marks" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtUgradTotalMarks" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtUgradTotalMarks" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RegularExpressionValidator ID="RegExprValtxtUgradTotalMarks" runat="server"
                                ControlToValidate="txtUgradTotalMarks" Display="Dynamic" ErrorMessage="only numbers are allowed"
                                ValidationExpression="\d+" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtUgradPercentage" runat="server" ToolTip="Percentage" Width="50px"
                                MaxLength="4" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FlttxEtxtenderUgradPercentage" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" TargetControlID="txtUgradPercentage" ValidChars="ABCDEFabcdef0123456789 .">
                            </cc1:FilteredTextBoxExtender>
                            <asp:CustomValidator ID="CustomValidatorFldtxtUgradPercentage" runat="server" ControlToValidate="txtUgradPercentage"
                                ErrorMessage="Percentage must be greater than or equal to 50" OnServerValidate="txtUgradPercentageCustom_ServerValidate"
                                Display="Dynamic" ValidationGroup="StudentForm"></asp:CustomValidator>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlUgradDivision" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUgradDivision_SelectedIndexChanged">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1st Division">1st Division</asp:ListItem>
                                <asp:ListItem Value="2nd Division">2nd Division</asp:ListItem>
                                <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                                <asp:ListItem Value="Result Awaiting">Result Awaiting</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFieldValddlUgradDivision" runat="server" ControlToValidate="ddlUgradDivision"
                                ErrorMessage="Please Select" InitialValue="-1" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCGPAUgrad" runat="server" ToolTip="CGPA" Width="50px" MaxLength="4"
                                autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtCGPAUgrad" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" TargetControlID="txtCGPAUgrad" ValidChars="ABCDEFabcdef0123456789 .">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="ddlExamTypeUgrad" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                                <asp:ListItem Value="Semester">Semester</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFieldValddlExamTypeUgrad" runat="server" ControlToValidate="ddlExamTypeUgrad"
                                ErrorMessage="Please Select" InitialValue="-1" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr id="UgradResultAwaitedSeatNumber" runat="server" visible="false">
                        <td colspan="2">
                            <span style="color: Red">if Result Awaiting Please provide Exam given Seat Number</span>
                        </td>
                        <td>
                            Exam Seat Number <span style="color: Red">*</span>
                        </td>
                        <td colspan="6">
                            <asp:TextBox ID="txtUgradResultAwaitedSeatNumber" runat="server" MaxLength="15" Width="80px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValUtxtResultAwaitedSeatNumber" runat="server"
                                ControlToValidate="txtUgradResultAwaitedSeatNumber" ErrorMessage="Please Provide Exam given Seat Number"
                                SetFocusOnError="True" ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <table id="gradDegree" runat="server">
                    <tr>
                        <th colspan="7" style="text-align: left;">
                            Master's Degree Program
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Seat Number
                        </td>
                        <td>
                            Institution
                        </td>
                        <td>
                            University
                        </td>
                        <td>
                            Program<br />
                            (e.g. MBA Marketing)
                        </td>
                        <td>
                            Major Subjects<br />
                            (e.g. Math, English etc)
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
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtgradSeatNumber" runat="server" MaxLength="15" Width="80px" autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtgradInstitution" runat="server" MaxLength="500" ToolTip="Institution"
                                Width="160px" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="fltgradExt" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;,?" TargetControlID="txtUgradInstitution">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtgradUniversity" runat="server" MaxLength="200" Width="160px"
                                autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtgradProgram" runat="server" MaxLength="100" ToolTip="Program"
                                Width="120px" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;,?" TargetControlID="txtgradProgram">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtgradMajorSubjects" runat="server" MaxLength="100" ToolTip="Program"
                                Width="140px" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtgradMajorSubjects" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;?" TargetControlID="txtgradMajorSubjects">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtgradyearFrom" runat="server" MaxLength="4" ToolTip="Year From"
                                Width="50px" autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValgradtxtYearFrom" runat="server" ControlToValidate="txtgradyearFrom"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="a"></asp:RegularExpressionValidator>
                            <asp:RangeValidator ID="rngvalgradYearFrom" runat="server" ControlToValidate="txtgradyearFrom"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="a">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtgradyearTo" runat="server" MaxLength="4" ToolTip="Year To" Width="50px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValtxttxtgradyearyearTo" runat="server"
                                ControlToValidate="txtgradyearTo" Display="Dynamic" ErrorMessage="only numbers are allowed"
                                ValidationExpression="\d+" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RangeValidator ID="rngvaltxtgradyearTo" runat="server" ControlToValidate="txtgradyearTo"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="StudentForm">
                            </asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Marks Obtained
                        </td>
                        <td>
                            Total Marks
                        </td>
                        <td>
                            Percentage
                        </td>
                        <td>
                            Grade/ Division
                        </td>
                        <td>
                            CGPA
                        </td>
                        <td colspan="3">
                            Annual/Suppl.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMarksgradbtained" runat="server" ToolTip="Marks Obtained" Width="50px"
                                MaxLength="4" onkeyup="GradPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMarksObtainedgrad" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMarksgradbtained" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RegularExpressionValidator ID="RegExprValtxtMarksgradbtained" runat="server"
                                ControlToValidate="txtMarksgradbtained" Display="Dynamic" ErrorMessage="only numbers are allowed"
                                ValidationExpression="\d+" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtgradTotalMarks" runat="server" ToolTip="Total Marks" Width="50px"
                                MaxLength="4" onkeyup="GradPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtgradTotalMarks" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtgradTotalMarks" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RegularExpressionValidator ID="RegExprValtxtgradTotalMarks" runat="server" ControlToValidate="txtgradTotalMarks"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtgradPercentage" runat="server" ToolTip="Percentage" Width="50px"
                                MaxLength="4" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FlttxEtxtendergradPercentage" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" TargetControlID="txtgradPercentage" ValidChars="ABCDEFabcdef0123456789 .">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlgradDivision" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlgradDivision_SelectedIndexChanged">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1st Division">1st Division</asp:ListItem>
                                <asp:ListItem Value="2nd Division">2nd Division</asp:ListItem>
                                <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                                <asp:ListItem Value="Result Awaiting">Result Awaiting</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCGPAgrad" runat="server" ToolTip="CGPA" Width="50px" MaxLength="4"
                                autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtCGPAgrad" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" TargetControlID="txtCGPAgrad" ValidChars="ABCDEFabcdef0123456789 .">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="ddlExamTypegrad" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                                <asp:ListItem Value="Semester">Semester</asp:ListItem>
                            </asp:DropDownList>
                            <%--  <asp:RequiredFieldValidator ID="ReqFieldValddlExamTypegrad" runat="server" ControlToValidate="ddlExamTypegrad"
                                ErrorMessage="Please Select" InitialValue="-1" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr id="gradResultAwaitedSeatNumber" runat="server" visible="false">
                        <td colspan="2">
                            <span style="color: Red">if Result Awaiting Please provide Exam given Seat Number</span>
                        </td>
                        <td>
                            Exam Seat Number <span style="color: Red">*</span>
                        </td>
                        <td colspan="6">
                            <asp:TextBox ID="txtgradResultAwaitedSeatNumber" runat="server" MaxLength="15" Width="80px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtResultAwaitedSeatNumber" runat="server"
                                ControlToValidate="txtgradResultAwaitedSeatNumber" ErrorMessage="Please Provide Exam given Seat Number"
                                SetFocusOnError="True" ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <table id="gradMSDegree" runat="server" visible="false">
                    <tr>
                        <th colspan="7" style="text-align: left;">
                            MS / MPhil Degree Program
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Seat Number
                        </td>
                        <td>
                            Institution
                        </td>
                        <td>
                            University
                        </td>
                        <td>
                            Program<br />
                            (e.g. MS Computer)
                        </td>
                        <td>
                            Major Subjects<br />
                            (e.g. Math, English etc)
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
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMSgradSeatNumber" runat="server" MaxLength="15" Width="80px"
                                autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSgradInstitution" runat="server" MaxLength="500" ToolTip="Institution"
                                Width="160px" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="fltMSgradExt" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;,?" TargetControlID="txtMSgradInstitution">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSgradUniversity" runat="server" MaxLength="200" Width="160px"
                                autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSgradProgram" runat="server" MaxLength="100" ToolTip="Program"
                                Width="120px" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMSgradProgram" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;,?" TargetControlID="txtMSgradProgram">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSgradMajorSubjects" runat="server" MaxLength="100" ToolTip="Program"
                                Width="140px" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredMStxtgradMajorSubjects" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;?" TargetControlID="txtMSgradMajorSubjects">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSgradyearFrom" runat="server" MaxLength="4" ToolTip="Year From"
                                Width="50px" autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValMSgradtxtYearFrom" runat="server" ControlToValidate="txtMSgradyearFrom"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="a"></asp:RegularExpressionValidator>
                            <asp:RangeValidator ID="rngvalMSgradYearFrom" runat="server" ControlToValidate="txtMSgradyearFrom"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="a">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSgradyearTo" runat="server" MaxLength="4" ToolTip="Year To"
                                Width="50px" autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValtxtMStxtgradyearyearTo" runat="server"
                                ControlToValidate="txtMSgradyearTo" Display="Dynamic" ErrorMessage="only numbers are allowed"
                                ValidationExpression="\d+" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <asp:RangeValidator ID="rngvalMStxtgradyearTo" runat="server" ControlToValidate="txtMSgradyearTo"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="StudentForm">
                            </asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Marks Obtained
                        </td>
                        <td>
                            Total Marks
                        </td>
                        <td>
                            Percentage
                        </td>
                        <td>
                            Grade/ Division
                        </td>
                        <td>
                            CGPA
                        </td>
                        <td colspan="3">
                            Annual/Suppl.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMSMarksgradbtained" runat="server" ToolTip="Marks Obtained" Width="50px"
                                MaxLength="4" onkeyup="MSGradPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="Filteredtextboxextender4" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMSMarksgradbtained" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RegularExpressionValidator ID="RegExprValtxtMSMarksgradbtained" runat="server"
                                ControlToValidate="txtMSMarksgradbtained" Display="Dynamic" ErrorMessage="only numbers are allowed"
                                ValidationExpression="\d+" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSgradTotalMarks" runat="server" ToolTip="Total Marks" Width="50px"
                                MaxLength="4" onkeyup="MSGradPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="Filteredtextboxextender5" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMSgradTotalMarks" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RegularExpressionValidator ID="RegExprValtxtMSgradTotalMarks" runat="server"
                                ControlToValidate="txtMSgradTotalMarks" Display="Dynamic" ErrorMessage="only numbers are allowed"
                                ValidationExpression="\d+" ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSgradPercentage" runat="server" ToolTip="Percentage" Width="50px"
                                MaxLength="4" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FlttxEtxtenderMSgradPercentage" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" TargetControlID="txtMSgradPercentage" ValidChars="ABCDEFabcdef0123456789 .">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMSgradDivision" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1st Division">1st Division</asp:ListItem>
                                <asp:ListItem Value="2nd Division">2nd Division</asp:ListItem>
                                <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                                <asp:ListItem Value="Result Awaiting">Result Awaiting</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMSCGPAgrad" runat="server" ToolTip="CGPA" Width="50px" MaxLength="4"
                                autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredMStxtCGPAgrad" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" TargetControlID="txtMSCGPAgrad" ValidChars="ABCDEFabcdef0123456789 .">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="ddlMSExamTypegrad" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                                <asp:ListItem Value="Semester">Semester</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table id="OtherDegree" runat="server" visible="false">
                    <tr>
                        <th colspan="7" style="text-align: left;">
                            Other's Degree Program / Diploma / Certificate
                        </th>
                    </tr>
                    <tr>
                        <td>
                            Program
                            <br />
                            (e.g. PGD,BE,DAE, etc)
                        </td>
                        <td>
                            Seat Number
                        </td>
                        <td>
                            Institution
                        </td>
                        <td>
                            Board /University
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
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtoProgram" runat="server" MaxLength="15" Width="100px" autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOSeatNumber" runat="server" MaxLength="20" Width="80px" autocomplete="off"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOInstitution" runat="server" MaxLength="100" ToolTip="Institution"
                                Width="200px" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="fltOExt" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&amp;*_=+|}{[`]|:;'&gt;&lt;,?" TargetControlID="txtOInstitution">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOBoard" runat="server" MaxLength="200" Width="200px" autocomplete="off"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="ReqFieldValtxtOBoard" runat="server" ControlToValidate="txtOBoard"
                                ErrorMessage="Please Enter Board/ University Name" SetFocusOnError="True" ValidationGroup="StudentForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOyearFrom" runat="server" MaxLength="4" ToolTip="Year From" Width="50px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValOtxtYearFrom" runat="server" ControlToValidate="txtOyearFrom"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="a"></asp:RegularExpressionValidator>
                            <asp:RangeValidator ID="rngvalOYearFrom" runat="server" ControlToValidate="txtOyearFrom"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="a">
                            </asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOyearTo" runat="server" MaxLength="4" ToolTip="Year To" Width="50px"
                                autocomplete="off"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExprValOtxtYearTo" runat="server" ControlToValidate="txtOyearTo"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="a"></asp:RegularExpressionValidator>
                            <asp:RangeValidator ID="rngvalOYearTo" runat="server" ControlToValidate="txtOyearTo"
                                Display="Dynamic" ErrorMessage="Enter Year between 1950 - 9999" MaximumValue="9999"
                                MinimumValue="1950" SetFocusOnError="true" Type="Integer" ValidationGroup="a">
                            </asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Marks Obtained
                        </td>
                        <td>
                            Total Marks
                        </td>
                        <td>
                            Percentage
                        </td>
                        <td>
                            Grade/ Division
                        </td>
                        <td colspan="3">
                            Annual/Suppl.
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtMarksObtainedO" runat="server" ToolTip="Marks Obtained" Width="50px"
                                MaxLength="4" onkeyup="OtherPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMarksObtainedO" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMarksObtainedO" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RegularExpressionValidator ID="RegExprValtxtMarksObtainedO" runat="server" ControlToValidate="txtMarksObtainedO"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOTotalMarks" runat="server" ToolTip="Total Marks" Width="50px"
                                MaxLength="4" onkeyup="OtherPercentage()" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtOTotalMarks" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtOTotalMarks" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            <asp:RegularExpressionValidator ID="RegExprValtxtOTotalMarks" runat="server" ControlToValidate="txtOTotalMarks"
                                Display="Dynamic" ErrorMessage="only numbers are allowed" ValidationExpression="\d+"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOPercentage" runat="server" ToolTip="Percentage" Width="50px"
                                MaxLength="4" autocomplete="off"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FlttxEtxtenderOPercentage" runat="server" FilterMode="ValidChars"
                                FilterType="Custom" TargetControlID="txtOPercentage" ValidChars="ABCDEFabcdef0123456789 .">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlOGradeDivision" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1st Division">1st Division</asp:ListItem>
                                <asp:ListItem Value="2nd Division">2nd Division</asp:ListItem>
                                <asp:ListItem Value="A-1">A-1</asp:ListItem>
                                <asp:ListItem Value="A">A</asp:ListItem>
                                <asp:ListItem Value="B">B</asp:ListItem>
                                <asp:ListItem Value="C">C</asp:ListItem>
                                <asp:ListItem Value="D">D</asp:ListItem>
                                <asp:ListItem Value="Others">Others</asp:ListItem>
                                <asp:ListItem Value="Result Awaiting">Result Awaiting</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="ddlExamTypeO" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Annual">Annual</asp:ListItem>
                                <asp:ListItem Value="Supplementary">Supplementary</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br />
            <br />
            <table>
                <tr>
                    <td colspan="2">
                        &nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" CommandName="Insert"
                            CssClass="btn" ValidationGroup="StudentForm" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnfinalSubmission" runat="server" Text="Final Submission" CssClass="btn"
                            Visible="false" CausesValidation="False" OnClick="btnfinalSubmission_Click" />
                        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn" Visible="false"
                            CausesValidation="False" OnClick="btnNext_Click" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:AsyncPostBackTrigger ControlID="rdnDegreeProgram" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlgradDivision" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlUgradDivision" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlFirstChoice" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
