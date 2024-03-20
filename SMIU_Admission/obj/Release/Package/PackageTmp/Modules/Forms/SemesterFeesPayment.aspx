<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SemesterFeesPayment.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.SemesterFeesPayment" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Receive Semester Fees
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <style>
        th
        {
            text-align: left;
        }
    </style>
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
                    yearRange: '2019:2025',
                    dateFormat: 'dd/mm/yy'
                });
            });
        });

    </script>
    <table>
        <tr>
            <td class="menu_list" style="width: 163px">
                Semester<span style="color: Red">*</span>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="SemesterFee" Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                    ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="SemesterFee"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="menu_list" style="width: 163px">
                Reference/Tracking ID <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtReferenceID" runat="server" ToolTip="Reference/Tracking ID" Width="150px"
                    MaxLength="15" ValidationGroup="SemesterFee" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFieldValtxtReferenceID" runat="server" ControlToValidate="txtReferenceID"
                    ErrorMessage="Please Enter Reference ID " ValidationGroup="SemesterFee" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExpValtxtReferenceID" runat="server" ErrorMessage="Please enter only digits"
                    ControlToValidate="txtReferenceID" Display="Dynamic" ValidationExpression="^[0-9]*$"
                    ValidChars="0123456789" ValidationGroup="SemesterFee"></asp:RegularExpressionValidator>
                <cc1:FilteredTextBoxExtender ID="FlttxtExttxtReferenceID" runat="server" TargetControlID="txtReferenceID"
                    FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                </cc1:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td>
                Fees Payment Date <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtFeesPaymentDate" runat="server" Width="110px" ValidationGroup="SemesterFee"
                    CssClass="date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFlVtxtFeesPaymentDate" runat="server" ControlToValidate="txtFeesPaymentDate"
                    ErrorMessage="Please Enter Date" ValidationGroup="SemesterFee" Display="Dynamic"></asp:RequiredFieldValidator>
                <cc1:MaskedEditExtender ID="MaskedEditExtxtFeesPaymentDate" MaskType="Date" runat="server"
                    TargetControlID="txtFeesPaymentDate" Mask="99/99/9999" MessageValidatorTip="true"
                    OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft"
                    AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditValidator ID="MaskedEditValidatortxtFeesPaymentDate" runat="server"
                    ControlExtender="MaskedEditExtxtFeesPaymentDate" ControlToValidate="txtFeesPaymentDate"
                    InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)" ValidationGroup="SemesterFee"
                    ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)" EmptyValueMessage="*"
                    Display="Dynamic"></cc1:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td class="menu_list" style="width: 163px">
                Amount <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtFeesAmount" runat="server" ToolTip="Amount" Width="150px" MaxLength="15"
                    ValidationGroup="SemesterFee" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFieldValtxtFeesAmount" runat="server" ControlToValidate="txtFeesAmount"
                    ErrorMessage="Please Enter Amount " ValidationGroup="SemesterFee" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExpValtxtFeesAmount" runat="server" ErrorMessage="Please enter only digits"
                    ControlToValidate="txtReferenceID" Display="Dynamic" ValidationExpression="^[0-9]*$"
                    ValidChars="0123456789" ValidationGroup="SemesterFee"></asp:RegularExpressionValidator>
                <cc1:FilteredTextBoxExtender ID="FlttxtExttxtFeesAmount" runat="server" TargetControlID="txtFeesAmount"
                    FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                </cc1:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td>
                Remarks
            </td>
            <td>
                <asp:TextBox ID="txtFeesRemarks" runat="server" TextMode="MultiLine" Width="800px"
                    Height="80px" />
                <cc1:FilteredTextBoxExtender ID="fltrtxtFeesRemarks" runat="server" TargetControlID="txtFeesRemarks"
                    FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                    ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                </cc1:FilteredTextBoxExtender>
                <%-- <asp:RequiredFieldValidator ID="ReqFlVtxtFeesRemarks" runat="server" ControlToValidate="txtFeesRemarks"
                    ErrorMessage="Please Enter Best Aspects" ValidationGroup="TEForm" Display="Dynamic"></asp:RequiredFieldValidator>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<asp:Button ID="btnReceived" runat="server" Text="Received" CssClass="btn"
                    ValidationGroup="SemesterFee" OnClick=" btnReceived_Click" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
