<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeritListAfterInterviewSummaryReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.MeritListAfterInterviewSummaryReport"
    MasterPageFile="~/MasterPages/FrontPage.master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Department Wise Entry Test Merit Summary Report After Interview
    </h1>
    <br />
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
                        <td>
                            <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EmpForm" Width="200px">
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
                            Gender
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlGender" runat="server" ValidationGroup="EmpForm" Width="140px">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Range From
                        </td>
                        <td>
                            <asp:TextBox ID="txtRangeFrom" runat="server" MaxLength="2" ToolTip="Range From"
                                ValidationGroup="EmpForm" Width="70px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExttxtRangeFrom" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtRangeFrom" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Range To
                        </td>
                        <td>
                            <asp:TextBox ID="txtRangeTo" runat="server" MaxLength="2" ToolTip="Range From" ValidationGroup="EmpForm"
                                Width="70px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtendertxtRangeTo" runat="server"
                                FilterMode="ValidChars" FilterType="Numbers" TargetControlID="txtRangeTo" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
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
                <legend>Department Wise Entry Test Merit Summary Report After Interview </legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <div id="ExportToExcel" runat="server" style="overflow-x: auto; width: 1030px;">
                    <table width="50%" border="1">
                        <tr>
                            <td colspan="21" style="text-align: center;">
                                <strong>Department Wise Entry Test Merit Summary Report After Interview - <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label></strong><br />
                            </td>
                        </tr>
                    </table>
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
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="Mediadept" runat="server">
                        <table width="50%" border="1">
                            <tr>
                                <td style="text-align: center;" colspan="21">
                                    <strong>Media Studies & Social Sciences</strong><br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdMediaStudiesdept" runat="server" AutoGenerateColumns="false"
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
