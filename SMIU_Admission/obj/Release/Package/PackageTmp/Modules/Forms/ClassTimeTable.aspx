<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClassTimeTable.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.ClassTimeTable" MasterPageFile="~/MasterPages/student.Master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        <center>
           Updated Online Class Timetable -
            <asp:Label ID="lblSemesterName" runat="server" Text="Semester Name"></asp:Label>
        </center>
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table id ="stdTable" runat="server" visible ="false">
                <tr>
                    <td class="menu_list" style="width: 143px">
                        Student Name :
                    </td>
                    <td>
                        <asp:Label ID="lblStudentName" runat="server" Text="Student Name" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="menu_list" style="width: 143px">
                        Program :
                    </td>
                    <td>
                        <asp:Label ID="LblProgram" runat="server" Text="program" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
            </table>
            <div style="overflow: Auto; max-height: 450px; width: 100%;">
                <br />
                <div id="Studentdetails" runat="server" visible="false">
                    <fieldset>
                        <legend>Updated Online Class Timetable </legend>
                        <br />
                        <asp:GridView ID="gvManageTimeTableDetails" runat="server" EmptyDataText="No Record Found"
                            AutoGenerateColumns="False" DataKeyNames="StudentID">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <span>
                                            <%# Container.DataItemIndex +1 %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CourseTitle" HeaderText="CourseTitle" />
                                <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" />
                                <asp:BoundField DataField="ClassDay" HeaderText="ClassDay" />
                                <asp:BoundField DataField="ClassTime" HeaderText="ClassTime" />
                                <asp:BoundField DataField="ClassSection" HeaderText="ClassSection" />
                                <asp:BoundField DataField="MeetingID" HeaderText="MeetingID" />
                                <asp:BoundField DataField="MeetingPassword" HeaderText="MeetingPassword" />
                                <asp:BoundField DataField="MeetingLink" HeaderText="MeetingLink" />
                            </Columns>
                        </asp:GridView>
                </div>
                </fieldset>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
