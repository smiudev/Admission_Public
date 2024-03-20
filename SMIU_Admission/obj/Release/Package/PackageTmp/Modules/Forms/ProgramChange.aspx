<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgramChange.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.ProgramChange" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Program Change
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <style>
        th
        {
            text-align: left;
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td class="menu_list" style="width: 163px">
                        Semester<span style="color: Red">*</span>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="UpdateProgram"
                            Width="200px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                            ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="UpdateProgram"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="menu_list" style="width: 163px">
                        Reference/Tracking ID <span style="color: Red">*</span>
                        <br />
                        <span style="color: Red">(last 4 digit only)</span>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtReferenceID" runat="server" ToolTip="Reference/Tracking ID" Width="150px"
                            MaxLength="4" ValidationGroup="UpdateProgram" autocomplete="off"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValtxtReferenceID" runat="server" ControlToValidate="txtReferenceID"
                            ErrorMessage="Please Enter Reference ID " ValidationGroup="UpdateProgram" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExpValtxtReferenceID" runat="server" ErrorMessage="Please enter only digits"
                            ControlToValidate="txtReferenceID" Display="Dynamic" ValidationExpression="^\d{1,4}$"
                            ValidChars="0123456789" ValidationGroup="UpdateProgram"></asp:RegularExpressionValidator>
                        <cc1:FilteredTextBoxExtender ID="FlttxtExttxtReferenceID" runat="server" TargetControlID="txtReferenceID"
                            FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click"
                            ValidationGroup="UpdateProgram" />
                    </td>
                </tr>
            </table>
            <br />
            <div id="Studentdetails" runat="server" visible="false">
                <fieldset>
                    <legend>Student Details </legend>
                    <br />
                    <asp:GridView ID="gvManageStudentDetails" runat="server" EmptyDataText="No Record Found"
                        AutoGenerateColumns="False" DataKeyNames="StudentID" OnRowDataBound="RowDataBound"
                        OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating">
                        <Columns>
                            <asp:BoundField HeaderText="Reference ID" DataField="StudentID"></asp:BoundField>
                            <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                            <asp:TemplateField HeaderText="Program">
                                <ItemTemplate>
                                    <asp:Label ID="lblProgram" runat="server" Text='<%# Eval("ProgramName")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlProgram" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                        </Columns>
                    </asp:GridView>
                </fieldset>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSearch" />
            <asp:PostBackTrigger ControlID="gvManageStudentDetails" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
