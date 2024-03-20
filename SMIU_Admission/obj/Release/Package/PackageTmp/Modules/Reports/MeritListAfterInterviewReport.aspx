<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeritListAfterInterviewReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.MeritListAfterInterviewReport" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Entry Test Merit Report After Interview
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
                        <td colspan="2">
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn" OnClick="btnAdd_Click" Text="Show Report"
                                ValidationGroup="EmpForm" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br />
            <div style="overflow: Auto; max-height: 450px; width: 100%;">
            <br />
            <fieldset id="MainReport" runat="server" visible="false">
                <legend>Entry Test Merit Report After Interview</legend>
                <br />
                <div style="display: block; float: left;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <div id="ExportToExcel" runat="server">
                    <table width="100%" border="1">
                        <tr>
                            <td style="width: 50%; text-align: left;" colspan="12">
                                <strong>Entry Test Merit Report After Interview -
                                    <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label></strong><br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grdStudentEntryTestInterviewMerit" runat="server" AutoGenerateColumns="false" Width="100%"
                        DataKeyNames="ReferenceID" EmptyDataText="No Record Found">
                        <Columns>
                            <%--OnRowDataBound="gdvRowDatabound"--%>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ReferenceID" HeaderText="Reference No" />
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="FathersName" HeaderText="Father's Name" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />                            
                            <asp:BoundField DataField="PostalAddress" HeaderText="Postal Address" />
                            <%--<asp:BoundField DataField="PermanentAddress" HeaderText="Permanent Address" />--%>
                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                            <%--<asp:BoundField DataField="HomePhoneNumber" HeaderText="Phone Number" />--%>
                            <%--<asp:BoundField DataField="DistrictOfDomicile" HeaderText="Domicile" />                            --%>
                            <asp:BoundField DataField="DegreeProgramName" HeaderText="DegreeProgramName" />                                                        
                            <asp:BoundField DataField="FirstChoice" HeaderText="FirstChoice" />
                            <asp:BoundField DataField="SecondChoice" HeaderText="SecondChoice" />
                            <asp:BoundField DataField="ThirdChoice" HeaderText="ThirdChoice" />
                            <asp:BoundField DataField="FourthChoice" HeaderText="FourthChoice" />
                            <asp:BoundField DataField="FifthChoice" HeaderText="FifthChoice" />
                            <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                            <asp:BoundField DataField="SBoard" HeaderText="SSC Board" />
                            <asp:BoundField DataField="SGroup" HeaderText="SSC Group" />
                            <asp:BoundField DataField="SDegree" HeaderText="SSC Degree" />
                            <asp:BoundField DataField="SSCPass" HeaderText="SSC Pass" />
                            <asp:BoundField DataField="SSCMarksObtained" HeaderText="Marks" />
                            <asp:BoundField DataField="SSCTOtalMarks" HeaderText="Out of" />
                            <asp:BoundField DataField="SSCPercentage" HeaderText="%" />
                            <asp:BoundField DataField="SSC_CUTOF" HeaderText="Cutoff" />
                            <asp:BoundField DataField="HBoard" HeaderText="HSC Board" />
                            <asp:BoundField DataField="HGroup" HeaderText="HSC Group" />
                            <asp:BoundField DataField="HDegree" HeaderText="HSC Degree" />
                            <asp:BoundField DataField="HSCPass" HeaderText="HSC Pass" />
                            <asp:BoundField DataField="HSCMarksObtained" HeaderText="Marks" />
                            <asp:BoundField DataField="HSCTotalMarks" HeaderText="Out of" />
                            <asp:BoundField DataField="HSCPercentage" HeaderText="%" />
                            <asp:BoundField DataField="HSC_CUTOF" HeaderText="Cutoff" />
                            <asp:BoundField DataField="B14Program" HeaderText="B14 Program" />
                            <asp:BoundField DataField="B14University" HeaderText="B14 University" />
                            <asp:BoundField DataField="Specialization14" HeaderText="Specialization" />
                            <asp:BoundField DataField="Pass14" HeaderText="Pass14" />
                            <asp:BoundField DataField="BchlorMarksObtained" HeaderText="Marks" />
                            <asp:BoundField DataField="BchlorTotalMarks" HeaderText="Out of" />
                            <asp:BoundField DataField="BchlorPrcnt" HeaderText="%" />
                            <asp:BoundField DataField="Bchlor_CUTOF" HeaderText="Cutoff" />
                            <asp:BoundField DataField="B16Program" HeaderText="B16 Program" />
                            <asp:BoundField DataField="B16University" HeaderText="B16 University" />
                            <asp:BoundField DataField="Specialization16" HeaderText="Specialization" />
                            <asp:BoundField DataField="Pass16" HeaderText="Pass16" />
                            <asp:BoundField DataField="Year16MarksObtained" HeaderText="Marks" />
                            <asp:BoundField DataField="Year16TotalMarks" HeaderText="Out of" />
                            <asp:BoundField DataField="Year16Prcnt" HeaderText="%" />
                            <asp:BoundField DataField="Year16_CUTOF" HeaderText="Cutoff" />
                            <asp:BoundField DataField="MProgram" HeaderText="Master Program" />
                            <asp:BoundField DataField="MUniversity" HeaderText="Master University" />
                            <asp:BoundField DataField="Specialization18" HeaderText="Specialization" />
                            <asp:BoundField DataField="Pass18" HeaderText="Pass18" />
                            <asp:BoundField DataField="Year18MarksObtained" HeaderText="Marks" />
                            <asp:BoundField DataField="Year18TotalMarks" HeaderText="Out of" />
                            <asp:BoundField DataField="Year18Prcnt" HeaderText="%" />
                            <asp:BoundField DataField="Year18_CUTOF" HeaderText="Cutoff" />
                            <asp:BoundField DataField="OProgram" HeaderText="Other Program" />
                            <asp:BoundField DataField="OUniversity" HeaderText="Other University" />
                            <asp:BoundField DataField="OMarksObtained" HeaderText="Other" />
                            <asp:BoundField DataField="OTotalMarks" HeaderText="Out of" />
                            <asp:BoundField DataField="OtherDegreePercentage" HeaderText="%" />                            
                            <asp:BoundField DataField="EntryTestMarksObtained" HeaderText="Test Marks" />
                            <asp:BoundField DataField="Outof" HeaderText="Out of" />
                            <asp:BoundField DataField="TST_CUTOF" HeaderText="Cutoff" />
                            <asp:BoundField DataField="EntryTestInterviewMarksObtained" HeaderText="Interview Marks" />
                            <asp:BoundField DataField="OutofInterview" HeaderText="Out of" />
                            <asp:BoundField DataField="Interview_CutOf" HeaderText="Cutoff" />
                            <asp:BoundField DataField="TOTL_MRKS" HeaderText="Total" />                            
                            <asp:BoundField DataField="AdmissionRemarks" HeaderText="Admission Remarks" />
                            <asp:BoundField DataField="Remarks" HeaderText="Panel Remarks" />
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAdd" />
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
