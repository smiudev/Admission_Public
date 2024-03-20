<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenerateAdmissionpdf.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.GenerateAdmissionpdf" MasterPageFile="~/MasterPages/student.Master"
    MaintainScrollPositionOnPostback="false" ValidateRequest="false" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Applicant Admission Form - Fall 2017</h1>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <asp:Button ID="btnGeneratePdf" runat="server" Text="Report" CssClass="btn" CausesValidation="False"
        OnClick="btnGeneratePdf_Click" />
    <asp:Button ID="btnAdmissionFOrm" runat="server" OnClick="btnAdmissionFOrm_Click"
        Text="Admission Form" CssClass="btn" />
    <asp:Button ID="btnChallan" runat="server" Text="Challan Form" CssClass="btn" OnClick="btnChallan_Click" />
    <asp:Button ID="btnUndeertaking" runat="server" Text="UnderTaking" CssClass="btn"
        OnClick="btnUndeertaking_Click" />
    <asp:Button ID="btnAdmitCard" runat="server" Text="Admit card" CssClass="btn" OnClick="btnAdmitCard_Click" />
    <asp:Button ID="btnSemesterChallan" runat="server" Text="Semester Challan" CssClass="btn"
        OnClick="btnSemesterChallan_Click" />
</asp:Content>
