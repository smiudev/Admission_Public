<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeritListBeforeInterviewReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.MeritListBeforeInterviewReport" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Entry Test Merit Report Before Interview
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Search Parameter</legend>
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
                        <td>
                            Range From (MCQS Marks)
                        </td>
                        <td>
                            <asp:TextBox ID="txtMcqsMarksFrom" runat="server" MaxLength="2" ToolTip="Range From"
                                ValidationGroup="EmpForm" Width="70px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMcqsMarksFrom" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMcqsMarksFrom" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Range To (MCQS Marks)
                            <asp:TextBox ID="txtMcqsMarksTo" runat="server" MaxLength="2" ToolTip="Range From"
                                ValidationGroup="EmpForm" Width="70px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMcqsMarksTo" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtMcqsMarksTo" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Range From (Eassy Marks)
                        </td>
                        <td>
                            <asp:TextBox ID="txtEassyMarksFrom" runat="server" MaxLength="2" ToolTip="Range From"
                                ValidationGroup="EmpForm" Width="70px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtEassyMarksFrom" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtEassyMarksFrom" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Range To (Eassy Marks)
                            <asp:TextBox ID="txtEassyMarksTo" runat="server" MaxLength="2" ToolTip="Range From"
                                ValidationGroup="EmpForm" Width="70px"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtEassyMarksTo" runat="server" FilterMode="ValidChars"
                                FilterType="Numbers" TargetControlID="txtEassyMarksTo" ValidChars="0123456789">
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
            <fieldset id="MainReport" runat="server" visible="false">
                <legend>Entry Test Merit Report Before Interview</legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <%--  <div id="ExportToExcel" runat="server" style="overflow: Auto; max-height: 450px;
                    width: 100%;">--%>
                <div id="ExportToExcel" runat="server" style="overflow-x: auto; width: 1030px; max-height: 450px;">
                    <table width="100%" border="1">
                        <tr>
                            <td style="width: 50%; text-align: center;" colspan="12">
                                <strong>Entry Test Merit Report Before Interview -
                                    <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label></strong><br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grdStudentEntryTestMerit" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="ReferenceID" EmptyDataText="No Record Found" OnRowDataBound="gdvRowDatabound">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ReferenceID" HeaderText="Reference No" />
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="FathersName" HeaderText="Father's Name" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />
                            <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                            <asp:BoundField DataField="StudentProgram" HeaderText="Program" />
                            <asp:BoundField DataField="SBoard" HeaderText="SSC Board" />
                            <asp:BoundField DataField="SGroup" HeaderText="Group" />
                            <asp:BoundField DataField="SDegree" HeaderText="Degree" />
                            <asp:BoundField DataField="SSCMarksObtained" HeaderText="SSC" />
                            <asp:BoundField DataField="SSCTOtalMarks" HeaderText="Out of" />
                            <asp:BoundField DataField="SSCPercentage" HeaderText="SSC %" />
                            <asp:BoundField DataField="SSCPass" HeaderText="Pass Year" />
                            <asp:BoundField DataField="HBoard" HeaderText="HSC Board" />
                            <asp:BoundField DataField="HGroup" HeaderText="Group" />
                            <asp:BoundField DataField="HDegree" HeaderText="Degree" />
                            <asp:BoundField DataField="HSCMarksObtained" HeaderText="HSC" />
                            <asp:BoundField DataField="HSCTOtalMarks" HeaderText="Out of" />
                            <asp:BoundField DataField="HSCPercentage" HeaderText="HSC %" />
                            <asp:BoundField DataField="SSCPass" HeaderText="Pass Year" />
                            <asp:BoundField DataField="B14ObtainedMarks" HeaderText="Bachelor Marks" />
                            <asp:BoundField DataField="B14TotalMarks" HeaderText="Out of" />
                            <asp:BoundField DataField="B14Percentage" HeaderText="Bachelor %" />
                            <asp:BoundField DataField="EntryTestMarksObtained" HeaderText="Test Score 60" />
                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" />
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
