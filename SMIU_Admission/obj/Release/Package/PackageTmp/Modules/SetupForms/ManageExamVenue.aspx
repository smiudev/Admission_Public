<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageExamVenue.aspx.cs"
    Inherits="SMIU_Admission.Modules.SetupForms.ManageExamVenue" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Exam Venue</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" href="/css/ui.theme.css" type="text/css" media="all" />
    <script src="/scripts/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/ui.core.js"></script>
    <script type="text/javascript" src="/scripts/ui.datepicker.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: '2020:2025',
                dateFormat: 'dd/mm/yy'
            });
        });
    </script>
    <table class="contentTable GridSpace">
        <tr>
            <td>
                Semester<span style="color: Red">*</span>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="ExamVenue" Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                    ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="ExamVenue"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Student Career<span style="color: Red">*</span>
            </td>
            <td>
                <asp:RadioButtonList ID="rdnDegreeProgram" runat="server">
                    <asp:ListItem Value="1">Graduate</asp:ListItem>
                    <asp:ListItem Value="2">Undergraduate</asp:ListItem>
                    <asp:ListItem Value="3">Postgraduate</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="ReqFldVDegreeProgram" runat="server" ControlToValidate="rdnDegreeProgram"
                    Display="Dynamic" ErrorMessage="Please mark degree Program" ValidationGroup="ExamVenue"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Test Date From <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtAptitudeDate" runat="server" Width="110px" ValidationGroup="ExamVenue"
                    CssClass="date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFlVtxtAptitudeDate" runat="server" ControlToValidate="txtAptitudeDate"
                    ErrorMessage="Please Enter Valid Date" ValidationGroup="ExamVenue" Display="Dynamic"></asp:RequiredFieldValidator>
                <cc1:MaskedEditExtender ID="MaskedEditExtxtAptitudeDate" MaskType="Date" runat="server"
                    TargetControlID="txtAptitudeDate" Mask="99/99/9999" MessageValidatorTip="true"
                    OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft"
                    AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditValidator ID="MaskedEditValidatortxtAptitudeDate" runat="server" ControlExtender="MaskedEditExtxtAptitudeDate"
                    ControlToValidate="txtAptitudeDate" InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                    ValidationGroup="ExamVenue" ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                    EmptyValueMessage="*" Display="Dynamic"></cc1:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td>
                Test Date To <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtAptitudeDateTo" runat="server" Width="110px" ValidationGroup="ExamVenue"
                    CssClass="date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFlVtxtAptitudeDateTo" runat="server" ControlToValidate="txtAptitudeDateTo"
                    ErrorMessage="Please Enter Valid Date" ValidationGroup="ExamVenue" Display="Dynamic"></asp:RequiredFieldValidator>
                <cc1:MaskedEditExtender ID="MaskedEditExtxtAptitudeDateTo" MaskType="Date" runat="server"
                    TargetControlID="txtAptitudeDate" Mask="99/99/9999" MessageValidatorTip="true"
                    OnFocusCssClass="MaskedEditFocus" OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft"
                    AcceptNegative="Left" DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditValidator ID="MaskedEditValidatortxtAptitudeDateTo" runat="server"
                    ControlExtender="MaskedEditExtxtAptitudeDateTo" ControlToValidate="txtAptitudeDateTo"
                    InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)" ValidationGroup="ExamVenue"
                    ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)" EmptyValueMessage="*"
                    Display="Dynamic"></cc1:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td>
                Test Time<span style="color: Red">*</span>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlTestTime" runat="server" ValidationGroup="ExamVenue" Width="100px">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                    <asp:ListItem Value="09:00AM">09:00AM</asp:ListItem>
                    <asp:ListItem Value="09:30AM">09:30AM</asp:ListItem>
                    <asp:ListItem Value="10:00AM">10:00AM</asp:ListItem>
                    <asp:ListItem Value="10:30AM">10:30AM</asp:ListItem>
                    <asp:ListItem Value="11:00AM">11:00AM</asp:ListItem>
                    <asp:ListItem Value="11:00AM">11:30AM</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvdddlTestTime" runat="server" ControlToValidate="ddlTestTime"
                    ErrorMessage="Select Test Time" InitialValue="-1" ValidationGroup="ExamVenue"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Aptitude Test Venue
            </td>
            <td>
                <asp:TextBox ID="txtAptitudeTestVenue" runat="server" MaxLength="100" Width="300px"
                    ValidationGroup="ExamVenue"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqValtxtAptitudeTestVenue" runat="server" ControlToValidate="txtAptitudeTestVenue"
                    ErrorMessage="Please Enter Test Venue" ValidationGroup="ExamVenue"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExptxtAptitudeTestVenue" runat="server" ControlToValidate="txtAptitudeTestVenue"
                    ErrorMessage="Invalid Characters Entered" ValidationExpression="^([a-zA-Z &amp;]*)$"
                    ValidationGroup="ExamVenue"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<asp:Button ID="btnsubmit" runat="server" Text="Submit" CommandName="Insert"
                    CssClass="btn" OnClick="btnsubmit_Click" ValidationGroup="ExamVenue" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancel_Click"
                    CausesValidation="False" />
            </td>
        </tr>
    </table>
    <br />
    <fieldset>
        <legend>All Exam Venue Details </legend>
        <br />
        <asp:GridView ID="gvManageExamVenue" runat="server" EmptyDataText="No Record Found"
            AutoGenerateColumns="False" DataKeyNames="ExamVenueId" CssClass="GridWordWrap GridSpace"
            OnRowDataBound="gvManageExamVenue_RowDataBound" OnRowDeleting="gvManageExamVenue_RowDeleting"
            OnRowEditing="gvManageExamVenue_RowEditing">
            <Columns>
                <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                        <span>
                            <%# Container.DataItemIndex +1 %></span>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="Semester Name" DataField="SemesterName"></asp:BoundField>
                <asp:BoundField HeaderText="Student Career" DataField="StudentCareer"></asp:BoundField>
                <asp:BoundField DataField="TestDateFrom" HeaderText="Test Date From" ItemStyle-CssClass="CM"
                    DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                    <ItemStyle CssClass="CM"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="TestDateTo" HeaderText="Test Date To" ItemStyle-CssClass="CM"
                    DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                    <ItemStyle CssClass="CM"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Aptitude Test Time" DataField="AptitudeTestTime"></asp:BoundField>
                <asp:TemplateField HeaderText="Aptitude Test Venue" SortExpression="AptitudeTestVenue">
                    <ItemTemplate>
                        <asp:Label ID="lblAptitudeTestVenue" runat="server" Text='<%# Eval("AptitudeTestVenue") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Status" HeaderText="Status">
                    <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Action(s)">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Edit" CausesValidation="False"></asp:LinkButton>
                        <asp:Label ID="lblupdate" runat="server" Text="Label">|</asp:Label>
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="javascript:return confirm('Are you sure to delete Test Venue?');"
                            CausesValidation="False"></asp:LinkButton>
                        <asp:Label ID="lblDelete" runat="server" Text="Label">|</asp:Label>
                        <asp:LinkButton ID="LnkActivate" runat="server" Text="Activate" CausesValidation="False"
                            OnClick="LnkActivate_Click"></asp:LinkButton>
                        <asp:Label ID="lblActivate" runat="server" Text="Label">|</asp:Label>
                        <asp:LinkButton ID="LnkDeActivate" runat="server" Text="DeActivate" CausesValidation="False"
                            OnClick="LnkDeActivate_Click"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="20%" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </fieldset>
</asp:Content>
