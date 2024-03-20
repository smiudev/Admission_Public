<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaleAndSubmissionReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.SaleAndSubmissionReport" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Department Wise Sales and Submission Summary Report
    </h1>
    <br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Sales and Submission Summary Report</legend>
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
                            Department<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDepartment" runat="server" ValidationGroup="EmpForm" Width="200px">
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
            <br />
            <fieldset id="MainReport" runat="server" visible="false">
                <legend>Department Wise Sale and Submission Summary Report</legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <%-- <div id="ExportToExcel" runat="server"  style="overflow: scroll; max-height: 450px; width: 90%;">--%>
                <%-- style="overflow: Auto; max-height: 450px;
                    width: 90%;"--%>
                <div id="ExportToExcel" runat="server" style="overflow-x: auto; width: 980px;">
                    <table width="50%" border="1">
                        <tr>
                            <td colspan="21" style="text-align: center;">
                                <strong>Department Wise Sale and Submission Summary Report - <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label></strong><br />
                            </td>
                        </tr>
                    </table>

                    <div id="AIMSDept" runat="server">
                        <table>
                            <tr>
                                <td style="text-align: center;" colspan="21">
                                    <strong>Artificial Intelligence And Mathematical Sciences</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdsaleSubmissionAIMSDeptWise" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="5px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div id="SoftwareEngDept" runat="server">
                        <table>
                            <tr>
                                <td style="text-align: center;" colspan="21">
                                    <strong>Software Engineering</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdsaleSubmissionSoftwareDeptWise" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="5px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="csdept" runat="server">
                        <table>
                            <tr>
                                <td style="text-align: center;" colspan="21">
                                    <strong>Computer Science</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdsaleSubmissionCSDeptWise" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="5px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="BussinessDept" runat="server">
                        <table>
                            <tr>
                                <td colspan="21" style="text-align: center;">
                                    <strong>Business Administration</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdsaleSubmissionBussinessDeptWise" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" ItemStyle-Width="50" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>


                    <div id="AccountsandFinanceDept" runat="server">
                        <table>
                            <tr>
                                <td colspan="21" style="text-align: center;">
                                    <strong>Accounting Banking And Finance</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdsaleSubmissionAccountsandFinanceDeptWise" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" ItemStyle-Width="50" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <div id="EduDep" runat="server">
                        <table width="50%" border="1">
                            <tr>
                                <td style="text-align: center;" colspan="21">
                                    <strong>Education</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdsaleSubmissionEduDeptWise" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" ItemStyle-Width="50" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="5px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="Evndept" runat="server">
                        <table width="50%" border="1">
                            <tr>
                                <td style="text-align: center;" colspan="21">
                                    <strong>Environmental Sciences</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdEnvironmentalSciencesdept" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" ItemStyle-Width="50" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="5px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="Mediadept" runat="server">
                        <table width="50%" border="1">
                            <tr>
                                <td style="text-align: center;" colspan="21">
                                    <strong>Media and Communication Studies</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdMediaStudiesdept" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" ItemStyle-Width="50" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="5px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                     <div id="SocialDevelopmentdept" runat="server">
                        <table width="50%" border="1">
                            <tr>
                                <td style="text-align: center;" colspan="21">
                                    <strong>Social Development</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdDevelopmentStudiesdept" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" ItemStyle-Width="50" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="5px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                     <div id="EnglishDept" runat="server">
                        <table width="50%" border="1">
                            <tr>
                                <td style="text-align: center;" colspan="21">
                                    <strong>English</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdEnglishDept" runat="server" AutoGenerateColumns="false"
                            EmptyDataText="No Item Found" ShowFooter="true" OnDataBound="OnDataBound" OnRowDataBound="gdvRowDatabound">
                            <Columns>
                                <asp:BoundField DataField="ProgramGroup" HeaderText="Program Name" ItemStyle-Width="50" />
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleMorning" runat="server" Text='<%# Eval("MorningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleMorning" runat="server" Text='<%# Eval("MorningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleMorning" Text='<%# Eval("TotalMorning") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="5px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleEvening" runat="server" Text='<%# Eval("EveningMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleEvening" runat="server" Text='<%# Eval("EveningFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleEvening" Text='<%# Eval("TotalEvening") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMaleWeekend" runat="server" Text='<%# Eval("WeekendMaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemaleWeekend" runat="server" Text='<%# Eval("WeekendFemaleCount") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemaleWeekend" Text='<%# Eval("TotalWeekend") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFormSubmission" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentM" runat="server" Text='<%# Eval("MorningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentM" runat="server" Text='<%# Eval("MorningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentM" Text='<%# Eval("MorningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentE" runat="server" Text='<%# Eval("EveningGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentE" runat="server" Text='<%# Eval("EveningGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentE" Text='<%# Eval("EveningGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Male">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderMalePaymentW" runat="server" Text='<%# Eval("WeekendGenderMalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Female">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCountGenderFemalePaymentW" runat="server" Text='<%# Eval("WeekendGenderFemalePayment") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalMaleFemalepaymentW" Text='<%# Eval("WeekendGenderTotalPayment") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalFeeSubmission" runat="server" Text='<%# Eval("TotalPayment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                    <br />
                     <table width="50%" border="1">
                   <tr>                            
                            <td style ="text-align: center; width:70px";>
                            <asp:Label ID="lblTotal" runat="server" Font-Bold="true" Text ="Grand Total" />
                                
                            </td>
                            <td style="text-align: center; width:51%;" colspan ="10" >
                                <asp:Label ID="lblTotalCountFormSubmission" runat="server" Font-Bold="true" Text ="0" />
                            </td>
                            <td style="text-align: center;" colspan="10">
                                <asp:Label ID="lblTotalCountFormFeePayment" runat="server" Font-Bold="true" Text ="0" />
                            </td>
                        </tr>
                </table>
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
