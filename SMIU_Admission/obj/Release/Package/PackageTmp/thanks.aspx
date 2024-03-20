<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thanks.aspx.cs" Inherits="SMIU_Admission.thanks"
    MasterPageFile="~/MasterPages/mtc.Master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <style>
        li
        {
            margin: 10px 0;
        }
    </style>
   <h1>
        Dear
        <asp:Label ID="lblStudentName" runat="server" Text="StudentName" Visible="false"></asp:Label>
    </h1>
    <h1>
        Your Reference Number / Tracking ID is
        <asp:Label ID="lblReferenceNumber" runat="server" Text="ReferenceNumber" Visible="false"></asp:Label>
    </h1>
    <p>
        Thank you for applying for Pre Entry Test Preparation Classes, Fall 2018.
    </p>
    <ol>
        <li>Please download Registration Form and Preparation Fee Voucher from the link available at the bottom of
            this page. </li>
        <li>The Registraton Processing Fee for Pre Entry Test Preparation Classes of Rs.5000/-
            can be deposited at any online Branch of Habib Bank Limited.</li>
    </ol>
    <br />
    <br />
    <asp:Button ID="btnChallan" runat="server" Text="Download Fee Voucher" CssClass="btn"
        OnClick="btnChallan_Click" />

         <asp:Button ID="btnRegistrationForm" runat="server" Text="Download Registration Form" CssClass="btn"
        OnClick="btnRegistrationForm_Click" />


    <br />
    <br />
    <p>
        for any query, please contact<br />
        Admission Department
        <br />
        021-99213307, 021-99213309 Dir. 021-99217501-3, Ext 225<br />
        admission@smiu.edu.pk
    </p>
    <style>
        li
        {
            margin: 10px 0;
        }
    </style>
   <%-- <h1>
        Dear
        <asp:Label ID="lblStudentName" runat="server" Text="StudentName" Visible="false"></asp:Label>
    </h1>
    <p>
        Your form has been submitted successfully, click Download Voucher to download your
        Registration Fees Voucher and submit the fees at MTC office SMIU.
        <br />
        <asp:Button ID="btnChallan" runat="server" Text="Download Voucher" CssClass="btn"
            OnClick="btnChallan_Click" />
        <br />
        <p>
            for any query, please contact<br />
            MTC Department
            <br />
            <%-- 021-99213307, 021-99213309 Dir. 021-99217501-3, Ext 225<br />
            111-111-885, Ext 221<br />
            mtc@smiu.edu.pk
        </p>--%>
</asp:Content>
