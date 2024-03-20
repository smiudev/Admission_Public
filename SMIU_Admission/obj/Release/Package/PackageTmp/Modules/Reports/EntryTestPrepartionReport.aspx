<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntryTestPrepartionReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.EntryTestPrepartionReport" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Student Entry Test Prepartion Registration Report
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
                    <tr>
                        <td>
                            Intrested Program
                        </td>
                        <td>
                            <asp:DropDownList ID="rdnIntrestedProgram" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Bachelor of Business Administration (BBA)">Bachelor of Business Administration (BBA)</asp:ListItem>
                                <asp:ListItem Value="BS Computer Science">BS Computer Science</asp:ListItem>
                                <asp:ListItem Value="BS Education">BS Education</asp:ListItem>
                                <asp:ListItem Value="BS Media Studies">BS Media Studies</asp:ListItem>
                                <asp:ListItem Value="BS Environmental Sciences">BS Environmental Sciences</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn" OnClick="btnAdd_Click" Text="Show Report"
                                ValidationGroup="EmpForm" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset id="MainReport" runat="server" visible="false">
                <legend>Student Entry Test Prepartion Registration Report</legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <div id="ExportToExcel" runat="server" style="overflow: Auto; max-height: 450px;
                    width: 100%;">
                    <table width="100%" border="1">
                        <tr>
                            <td style="width: 50%; text-align: center;" colspan="8">
                                <strong>Student Entry Test Prepartion Registration Report -
                                    <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label></strong><br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grdStudentTestRegistrationDetails" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="EntryTestPrepartionID" EmptyDataText="No Record Found" OnRowDataBound="gdvRowDatabound">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="EntryTestPrepartionID" HeaderText="Reference ID" />
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="FatherName" HeaderText="Father's Name" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />
                            <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" />
                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                            <asp:BoundField DataField="IntrestedProgram" HeaderText="Intrested" />
                            <asp:BoundField DataField="LastQualification" HeaderText="Last Qualification" />
                            <asp:BoundField DataField="DegreeGroup" HeaderText="Group" />
                            <asp:BoundField DataField="Grade" HeaderText="Grade" />
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
