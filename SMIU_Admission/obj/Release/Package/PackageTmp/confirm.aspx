<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="SMIU_Admission.confirm"
    MasterPageFile="~/MasterPages/student.Master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Password Recovery Confirmation
    </h1>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <h1>
        Dear
        <asp:Label ID="lblStudentName" runat="server" Text="StudentName" Visible="false"></asp:Label>
    </h1>    
    <br />
    Your Password has been sent on your mentioned email Address.   
    <br />
    <b>(Kindly check your Spam/Junk folder in case our email does not appear in your inbox.)</b>
    <br />
    <br />
    <asp:Button ID="btnRedirect" runat="server" CssClass="btn" OnClick="btnSubmit_Click"
        Text="Click here to Login" />
</asp:Content>
