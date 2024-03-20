<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageApplicationFees.aspx.cs"
    Inherits="SMIU_Admission.Modules.SetupForms.ManageApplicationFees" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Application Fees</h1>
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
                yearRange: '1990:2017',
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
                <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="ApplicationFee"
                    Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                    ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="ApplicationFee"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Fee Type
            </td>
            <td>
                <asp:TextBox ID="txtFeeType" runat="server" MaxLength="100" Width="200px" ValidationGroup="ApplicationFee"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqValtxtFeeType" runat="server" ControlToValidate="txtFeeType"
                    ErrorMessage="Please Enter Fee Typee" ValidationGroup="ApplicationFee"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExptxtFeeType" runat="server" ControlToValidate="txtFeeType"
                    ErrorMessage="Invalid Characters Entered" ValidationExpression="^([a-zA-Z &amp;]*)$"
                    ValidationGroup="ApplicationFee"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Degree Program<span style="color: Red">*</span>
            </td>
            <td>
                <asp:RadioButtonList ID="rdnDegreeProgram" runat="server">
                    <asp:ListItem Value="2">Undergraduate</asp:ListItem>
                    <asp:ListItem Value="1">Graduate</asp:ListItem>
                    <asp:ListItem Value="3">Postgraduate</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Label ID="lnProgramName" runat="server" Text="Program" Visible="false" ForeColor="Red"></asp:Label>
                <asp:RequiredFieldValidator ID="ReqFldVDegreeProgram" runat="server" ControlToValidate="rdnDegreeProgram"
                    Display="Dynamic" ErrorMessage="Please mark degree Program" ValidationGroup="ApplicationFee"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Valid Till Date <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtValidDate" runat="server" Width="110px" ValidationGroup="ApplicationFee"
                    CssClass="date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFlVtxtValidDate" runat="server" ControlToValidate="txtValidDate"
                    ErrorMessage="Please Enter Valid Date" ValidationGroup="ApplicationFee" Display="Dynamic"></asp:RequiredFieldValidator>
                <cc1:MaskedEditExtender ID="MaskedEditExtxtValidDate" MaskType="Date" runat="server"
                    TargetControlID="txtValidDate" Mask="99/99/9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                    OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft" AcceptNegative="Left"
                    DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditValidator ID="MaskedEditValidatortxtValidDate" runat="server" ControlExtender="MaskedEditExtxtValidDate"
                    ControlToValidate="txtValidDate" InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                    ValidationGroup="ApplicationFee" ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                    EmptyValueMessage="*" Display="Dynamic"></cc1:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td>
                Fee Amount <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtFeeAmount" runat="server" ToolTip="Land Line Number" Width="80px"
                    MaxLength="4" ValidationGroup="ApplicationFee"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqLandLineNumber" runat="server" ControlToValidate="txtFeeAmount"
                    ErrorMessage="Please Enter Fee Amount" ValidationGroup="ApplicationFee" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExptxttxtFeeAmount" runat="server" ErrorMessage="Please enter only digits"
                    ControlToValidate="txtFeeAmount" Display="Dynamic" ValidationExpression="^[0-9]*$"
                    ValidChars="0123456789" ValidationGroup="ApplicationFee"></asp:RegularExpressionValidator>
                <cc1:FilteredTextBoxExtender ID="FilteredtxtFeeAmount" runat="server" TargetControlID="txtFeeAmount"
                    FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                </cc1:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<asp:Button ID="btnsubmit" runat="server" Text="Submit" CommandName="Insert"
                    CssClass="btn" OnClick="btnsubmit_Click" ValidationGroup="ApplicationFee" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancel_Click"
                    CausesValidation="False" />
            </td>
        </tr>
    </table>
    <br />
    <fieldset>
        <legend>All Fee Details </legend>
        <br />
        <asp:GridView ID="gvManageApplicationFee" runat="server" EmptyDataText="No Record Found"
            AutoGenerateColumns="False" DataKeyNames="ApplicationFeeID" CssClass="GridWordWrap GridSpace"
            OnRowDataBound="gvManageApplicationFee_RowDataBound" OnRowDeleting="gvManageApplicationFee_RowDeleting"
            OnRowEditing="gvManageApplicationFee_RowEditing">
            <Columns>
                <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                        <span>
                            <%# Container.DataItemIndex +1 %></span>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="Semester Name" DataField="SemesterName">
                    <%--<ItemStyle Width="30%" />--%>
                </asp:BoundField>
                <asp:BoundField HeaderText="Fee Type" DataField="FeeType">
                    <%-- <ItemStyle Width="30%" Wrap="True" />--%>
                </asp:BoundField>
                <asp:BoundField DataField="ValidDate" HeaderText="Valid Till Date" ItemStyle-CssClass="CM"
                    DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                    <ItemStyle CssClass="CM"></ItemStyle>
                </asp:BoundField>
                <asp:TemplateField HeaderText="Fee Amount" SortExpression="FeeAmount">
                    <ItemTemplate>
                        <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("FeeAmount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Status" HeaderText="Status">
                    <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Degree Program" SortExpression="DegreeProgram">
                    <ItemTemplate>
                        <asp:Label ID="lblDegreeProgram" runat="server" Text='<%# Eval("DegreeProgram") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action(s)">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Edit" CausesValidation="False"></asp:LinkButton>
                        <asp:Label ID="lblupdate" runat="server" Text="Label">|</asp:Label>
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="javascript:return confirm('Are you sure to delete Aplication Fee?');"
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
