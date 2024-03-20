<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmationmsg.aspx.cs"
    Inherits="SMIU_Admission.Confirmationmsg" MasterPageFile="~/MasterPages/student.Master"
    MaintainScrollPositionOnPostback="false" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
      Thank you for registration, your account has been created.
    </h1>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <h4>
        Dear
        <asp:Label ID="lblStudentName" runat="server" Text="StudentName" Visible="false"></asp:Label>
    </h4>
    <br />
    Please login in to your account using Email address and Password and proceed to fill your application form.
    <br />    
    <br />
    In case you don't remember your email address or password, we have also sent you an email with your account information.
    <br />
    <b>(Kindly check your Spam/Junk folder if email does not appear in your inbox.)</b>
    <br />
    <br />
    <asp:Button ID="btnRedirect" runat="server" CssClass="btn" OnClick="btnSubmit_Click"
        Text="Click here to Login" />
</asp:Content>
