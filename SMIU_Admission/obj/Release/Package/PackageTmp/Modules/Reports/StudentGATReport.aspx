<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentGATReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.StudentGATReport" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Student GAT / NAT Report
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
                            <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EmpForm"
                                Width="200px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Department
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDepartment" runat="server" ValidationGroup="EmpForm" Width="200px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            NTS Test Type
                        </td>
                        <td>
                            <asp:DropDownList ID="ddtNtSType" runat="server" ValidationGroup="EmpForm" Width="200px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="GAT">GAT</asp:ListItem>
                               <asp:ListItem Value="GAT Subject">GAT Subject</asp:ListItem>
                                <asp:ListItem Value="NAT">NAT</asp:ListItem>
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
                <legend>Student GAT / NAT Report</legend>
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
                                <strong>Student GAT / NAT Report - <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label></strong><br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grdStudentNTSTestDetails" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="StudentID" EmptyDataText="No Record Found" OnRowDataBound="gdvRowDatabound">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentID" HeaderText="Reference No" />
                            <asp:BoundField DataField="CNICNumber" HeaderText="CNIC" />
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="FathersName" HeaderText="Father's Name" />
                            <asp:BoundField DataField="ProgramName" HeaderText="Program" />
                            <asp:BoundField DataField="NTSTestType" HeaderText="NTS Type" />
                            <asp:BoundField DataField="NTSDate" HeaderText="NTS Date" ItemStyle-CssClass="CM"
                                DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                                <ItemStyle CssClass="CM"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="NTSRollNumber" HeaderText="NTS Roll Number" />
                            <asp:BoundField DataField="NTSTestScore" HeaderText="NTS Marks" />
                            <asp:BoundField DataField="MobileNumber" HeaderText="CELL NO." />
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
