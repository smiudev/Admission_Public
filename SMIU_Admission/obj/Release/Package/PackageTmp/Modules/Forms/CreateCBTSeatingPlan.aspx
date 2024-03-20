<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateCBTSeatingPlan.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.CreateCBTSeatingPlan" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Generate CBT Entry Test Seating
        <br />
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
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
                    yearRange: '2020:2025',
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
                <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="CBTSchedule" Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                    ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="CBTSchedule"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <%-- <tr>
            <td>
                Time<span style="color: Red">*</span>
            </td>
            <td>
                <asp:DropDownList ID="ddlPaperTime" runat="server" ValidationGroup="CBTSchedule" Width="230px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlPaperTime" runat="server" ControlToValidate="ddlPaperTime"
                    ErrorMessage="Please Select Paper Time" InitialValue="-1" ValidationGroup="CBTSchedule"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>--%>
        <tr>
            <td style="width: 102px">
                Date <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtPaperDate" runat="server" Width="110px" ValidationGroup="CBTSchedule"
                    CssClass="date" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFlVtxtDOB" runat="server" ControlToValidate="txtPaperDate"
                    ErrorMessage="Please Enter Date" ValidationGroup="CBTSchedule" Display="Dynamic"></asp:RequiredFieldValidator>
                <cc1:MaskedEditExtender ID="MaskedEditExtxtDOB" MaskType="Date" runat="server" TargetControlID="txtPaperDate"
                    Mask="99/99/9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                    OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft" AcceptNegative="Left"
                    DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditValidator ID="MaskedEditValidatortxtDOB" runat="server" ControlExtender="MaskedEditExtxtDOB"
                    ControlToValidate="txtPaperDate" InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                    ValidationGroup="CBTSchedule" ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                    EmptyValueMessage="*" Display="Dynamic"></cc1:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnGenerate" runat="server" CssClass="btn" OnClick="btnGenerate_Click"
                    Text="Generate Seating Plan" ValidationGroup="CBTSchedule" UseSubmitBehavior="false"
                    OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Please Wait...';" />
            </td>
        </tr>
    </table>
</asp:Content>
