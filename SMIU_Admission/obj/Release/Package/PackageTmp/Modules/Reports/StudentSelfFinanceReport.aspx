<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentSelfFinanceReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.StudentSelfFinanceReport" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Student Self Finance Report
        <br />
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Search Parameter</legend>
                <br />
                <table class="tbl">
                    <tr>
                        <td>
                            Semester<span style="color: Red">*</span>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EmpForm" Width="200px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <%-- <tr>
                        <td class="menu_list" style="width: 163px">
                            Reference/Tracking ID <span style="color: Red">*</span>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txtReferenceID" runat="server" ToolTip="Reference/Tracking ID" Width="150px"
                                MaxLength="15" ValidationGroup="EmpForm" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFieldValtxtReferenceID" runat="server" ControlToValidate="txtReferenceID"
                                ErrorMessage="Please Enter Reference ID " ValidationGroup="EmpForm" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExpValtxtReferenceID" runat="server" ErrorMessage="Please enter only digits"
                                ControlToValidate="txtReferenceID" Display="Dynamic" ValidationExpression="^[0-9]*$"
                                ValidChars="0123456789" ValidationGroup="EmpForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FlttxtExttxtReferenceID" runat="server" TargetControlID="txtReferenceID"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnShowReport" runat="server" CssClass="btn" OnClick="btnShowReport_Click"
                                Text="Show Report" ValidationGroup="EmpForm" />
                        </td>
                    </tr>--%>
                </table>
            </fieldset>
            <fieldset id="MainReport" runat="server" >
                <legend>Student Self Finance Report</legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <div id="ExportToExcel" runat="server">
                    <table width="100%" border="1">
                        <tr>
                            <td style="width: 50%; text-align: center;" colspan="9">
                                <strong>Student Self Finance Report-
                                    <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label>
                                </strong>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grdSelfFinance" runat="server" AutoGenerateColumns="false" DataKeyNames="StudentID"
                        EmptyDataText="No Record Found">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentID" HeaderText="Reference No" />
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="FirstPreference" HeaderText="First Preference" />
                            <asp:BoundField DataField="SecondPreference" HeaderText="Second Preference" />
                            <asp:BoundField DataField="ThirdPreference" HeaderText="Third Preference" />
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
        </ContentTemplate>
        <Triggers>
           <%-- <asp:PostBackTrigger ControlID="btnShowReport" />--%>
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
