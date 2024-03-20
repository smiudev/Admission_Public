<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentNotSubmittedReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.DocumentNotSubmittedReport" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Student's Document not Submitted Report
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
                            Department<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDepartment" runat="server" ValidationGroup="EmpForm" Width="200px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Degree Program
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDegreeProgram" runat="server" ValidationGroup="EmpForm"
                                Width="200px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Graduate</asp:ListItem>
                                <asp:ListItem Value="2">Undergraduate </asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="StudentForm" Width="140px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
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
                <legend>Student's Document not Submitted Report</legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <div id="ExportToExcel" runat="server" style="overflow: Auto; max-height: 450px;
                    width: 1030px;">
                     <table width="100%" border="1">
                        <tr>
                            <td style="width: 50%; text-align: center;" colspan="8">
                                <strong>Document not Submitted Report - <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label></strong><br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grddocumentNotSubmitted" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="StudentID" EmptyDataText="No Record Found" OnRowDataBound="gdvRowDatabound">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentID" HeaderText="Reference No" />
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="FathersName" HeaderText="Father's Name" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />
                            <asp:BoundField DataField="ProgramName" HeaderText="Program" />
                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                            <asp:BoundField DataField="EmailAddress" HeaderText="Email" />
                            <asp:BoundField DataField="DegreeProgramName" HeaderText="Career" />
                            <asp:BoundField DataField="Remarks" HeaderText="Attendance Status" />
                            <asp:BoundField DataField="NOTSubmittedDocumentList" HeaderText="Document" />
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
