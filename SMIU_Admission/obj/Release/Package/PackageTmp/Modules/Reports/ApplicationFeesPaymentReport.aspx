<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationFeesPaymentReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.ApplicationFeesPaymentReport" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Application Fee Collection Report
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
                          <%--  <asp:RequiredFieldValidator ID="rfvdepartment" runat="server" ControlToValidate="ddlDepartment"
                                ErrorMessage="Please Select Department" InitialValue="-1" ValidationGroup="EmpForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
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
                <legend>Application Fee Collection Report</legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <%--<div id="ExportToExcel" runat="server" style="overflow: Auto; max-height: 450px;
                    width: 70%;">--%>
                <div id="ExportToExcel" runat="server" style="overflow-x: auto; width: 960px; max-height: 450px;">
                    <table width="100%" border="1">
                        <tr>
                            <td style="width: 50%; text-align: center;" colspan="14">
                                <strong>Application Fee Collection Report -
                                    <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label>
                                </strong>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grdapplicationfeecollection" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="StudentID" EmptyDataText="No Record Found" OnRowDataBound="gdvRowDatabound"
                        ShowFooter="true">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentID" HeaderText="Reference No" />
                            <asp:BoundField DataField="AdmitCardNumber" HeaderText="Admit Card No" />
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="EmailAddress" HeaderText="Email" />
                            <asp:BoundField DataField="ProgramName" HeaderText="Program" />
                            <asp:BoundField DataField="FirstChoiceShift" HeaderText="Shift" />
                            <asp:BoundField DataField="SecondChoice" HeaderText="2nd Choice" />
                            <asp:BoundField DataField="ThirdChoice" HeaderText="3rd Choice" />
                            <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                            <asp:BoundField DataField="LastDegreeName" HeaderText="last Degree" />
                            <asp:BoundField DataField="LastDegreePercentage" HeaderText="Percentage /CGPA" />
                            <asp:BoundField DataField="LastInstituteAttended" HeaderText="Last Institute" />
                            <asp:BoundField DataField="VoucherID" HeaderText="Voucher No" />
                            <asp:BoundField DataField="ReceivingDate" HeaderText="Receiving Date" ItemStyle-CssClass="CM"
                                DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                                <ItemStyle CssClass="CM"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Fee Amount" SortExpression="FeeAmount">
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("FeeAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblTotalFeeAmount" runat="server" Font-Bold="true" />
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PermanentAddress" HeaderText="Permanent Address" />
                            <asp:BoundField DataField="PostalAddress" HeaderText="Postal Address" />
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlDepartment" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="btnAdd" />
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
