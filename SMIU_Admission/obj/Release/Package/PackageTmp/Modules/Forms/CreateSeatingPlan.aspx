<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateSeatingPlan.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.CreateSeatingPlan" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Generate Entry Test Seating Plan
        <br />
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <table>
        <tr>
            <td class="menu_list" style="width: 163px">
                Semester<span style="color: Red">*</span>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EmpForm" Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                    ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="EmpForm"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
       <%-- <tr>
            <td>
                Degree Program<span style="color: Red">*</span>
            </td>
            <td>
                <asp:RadioButtonList ID="rdnDegreeProgram" runat="server">
                    <asp:ListItem Value="2">Undergraduate</asp:ListItem>
                    <asp:ListItem Value="1">Graduate</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Label ID="lnProgramName" runat="server" Text="Program" Visible="false" ForeColor="Red"></asp:Label>
                <asp:RequiredFieldValidator ID="ReqFldVDegreeProgram" runat="server" ControlToValidate="rdnDegreeProgram"
                    Display="Dynamic" ErrorMessage="Please mark degree Program" ValidationGroup="EmpForm"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
        </tr>--%>
        <tr>
            <td>
                Paper Time<span style="color: Red">*</span>
            </td>
            <td>
                <asp:DropDownList ID="ddlPaperTime" runat="server" ValidationGroup="EmpForm" Width="230px">
                    <asp:ListItem Value="-1">---Select Time --</asp:ListItem>
                    <asp:ListItem Value="09:30 AM">09:30 AM</asp:ListItem>
                   <%-- <asp:ListItem Value="12:30 PM">12:30 PM</asp:ListItem>--%>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlPaperTime" runat="server" ControlToValidate="ddlPaperTime"
                    ErrorMessage="Please Select Paper Time" InitialValue="-1" ValidationGroup="EmpForm"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnGenerate" runat="server" CssClass="btn" OnClick="btnGenerate_Click"
                    Text="Generate Seating Plan" ValidationGroup="EmpForm" />
            </td>
        </tr>
    </table>
</asp:Content>
