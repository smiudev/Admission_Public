<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEntryTestInterviewMarks.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.ViewEntryTestInterviewMarks" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        View Entry Test Interview Marks
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <style>
                th
                {
                    text-align: left;
                }
            </style>
            <table>
                <tr>
                    <td class="menu_list" style="width: 163px">
                        Semester<span style="color: Red">*</span>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EntryTestMarks"
                            Width="200px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                            ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="EntryTestMarks"
                            Display="Dynamic"></asp:RequiredFieldValidator>
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
                        Department Name<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Value="GetAll">All</asp:ListItem>
                            <asp:ListItem Value="FIT">Computer Science</asp:ListItem>
                            <asp:ListItem Value="FMBC">Business Administration</asp:ListItem>
                            <asp:ListItem Value="FSS">Media Studies & Social Science</asp:ListItem>
                            <asp:ListItem Value="FED">Education</asp:ListItem>
                            <asp:ListItem Value="FES">Environmental Sciences</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="ReqFldValDept" runat="server" ControlToValidate="ddlDepartment"
                            ErrorMessage="Please Select Department" InitialValue="-1" SetFocusOnError="True"
                            ValidationGroup="EntryTestMarks"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Program Name
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProgramName" runat="server" ValidationGroup="EntryTestMarks"
                            Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click"
                            ValidationGroup="EntryTestMarks" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlDepartment" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="btnSearch" />
        </Triggers>
    </asp:UpdatePanel>
    <br />
    <div id="ApplicantDetails" visible="false" runat="server">
        <br />
        <fieldset>
            <legend>Entry Test Interview Marks</legend>
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
                        <td style="width: 50%; text-align: center;" colspan="9">
                            <strong>Entry Test Interview Marks -
                                <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label></strong><br />
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvManageEntryTestInterviewMarks" runat="server" EmptyDataText="No Record Found"
                    AutoGenerateColumns="False" DataKeyNames="ReferenceID">
                    <Columns>
                        <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <span>
                                    <%# Container.DataItemIndex +1 %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Reference No" DataField="ReferenceID"></asp:BoundField>
                        <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                        <asp:BoundField HeaderText="Father Name" DataField="FathersName"></asp:BoundField>
                        <asp:BoundField HeaderText="Gender" DataField="Gender"></asp:BoundField>
                        <asp:BoundField HeaderText="First Choice" DataField="StudentFirstChoice"></asp:BoundField>
                        <asp:BoundField HeaderText="Second Choice" DataField="SecondChoice"></asp:BoundField>
                        <asp:BoundField HeaderText="Department" DataField="DepartmentName"></asp:BoundField>
                        <asp:BoundField HeaderText="Total_CutOff(%)" DataField="TOTL_MRKS"></asp:BoundField>
                        <asp:BoundField HeaderText="Interview Marks" DataField="InterviewMarks"></asp:BoundField>
                        <asp:BoundField HeaderText="Shift" DataField="ProgramShift"></asp:BoundField>
                        <asp:BoundField HeaderText="Interview Remarks" DataField="FirstInterviewRemarks">
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Interviewed By" DataField="InterviewedBYFaculty"></asp:BoundField>
                        <%-- <asp:BoundField HeaderText="Student Status" DataField="StudentStatus"></asp:BoundField>
                        <asp:BoundField HeaderText="Second Option" DataField="SecondOption"></asp:BoundField>
                        <asp:BoundField HeaderText="Department" DataField="Department"></asp:BoundField>
                        <asp:BoundField HeaderText="Second Interview Remarks" DataField="SecondInterviewRemarks">
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Faculty" DataField="InterviewedBYSeniorFaculty"></asp:BoundField>--%>
                        <asp:BoundField DataField="InterviewDate" HeaderText="Interview Date" ItemStyle-CssClass="CM"
                            DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                            <ItemStyle CssClass="CM"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Postal Address" DataField="PostalAddress"></asp:BoundField>
                        <asp:BoundField DataField="PermanentAddress" HeaderText="Permanent Address" />
                        <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                        <asp:BoundField DataField="HomePhoneNumber" HeaderText="Home Number" />
                        <asp:BoundField DataField="DistrictOfDomicile" HeaderText="Domicile" />
                        <asp:BoundField DataField="InterviewTime" HeaderText="Interview Time" />
                        <asp:BoundField DataField="ScheduleDate" HeaderText="Schedule Date" ItemStyle-CssClass="CM"
                            DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                            <ItemStyle CssClass="CM"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Attendance" HeaderText="Attendance" />
                        <%--<asp:BoundField DataField="MeritList" HeaderText="Merit List" />--%>
                    </Columns>
                </asp:GridView>
            </div>
        </fieldset>
    </div>
</asp:Content>
