<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntryTestInfo.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.EntryTestInfo" MasterPageFile="~/MasterPages/student.Master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Entry Test Schedule -
        <asp:Label ID="lblSemesterName" runat="server" Text="Semester Name"></asp:Label>
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <br />
    <div id="Studentdetails" runat="server" visible="false">
        <fieldset>
            <legend>Entry Test Schedule -
                <asp:Label ID="lblSemester" runat="server" Text="SemesterName"></asp:Label></legend>
            <br />
            <asp:GridView ID="gvManageStudentDetails" runat="server" EmptyDataText="No Record Found"
                AutoGenerateColumns="False" DataKeyNames="StudentID">
                <Columns>
                    <asp:BoundField HeaderText="Reference ID" DataField="StudentID"></asp:BoundField>
                    <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                    <asp:BoundField DataField="ProgramName" HeaderText="Program" />
                    <asp:BoundField DataField="PaperDate" HeaderText="Date" ItemStyle-CssClass="CM" DataFormatString="{0:MMM dd, yyyy}"
                        HtmlEncode="false">
                        <ItemStyle CssClass="CM"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="PaperDay" HeaderText="Day" />
                    <asp:BoundField DataField="PaperTime" HeaderText="Test Time" />
                    <asp:BoundField DataField="ReportTime" HeaderText="Reporting Time" />
                    <asp:BoundField HeaderText="Venue" DataField="Venue"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="btnAdmitCard" runat="server" Text=" Download Admit card" CssClass="btn"
                OnClick="btnAdmitCard_Click" />
        </fieldset>
    </div>
</asp:Content>
