<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaticData.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.StaticData"
    MasterPageFile="~/MasterPages/FrontPage.master" MaintainScrollPositionOnPostback="false"
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
    <div>
        <asp:TextBox ID="txtInterviewDate" runat="server"> </asp:TextBox>
        <asp:TextBox ID="txtTestDate" runat="server"> </asp:TextBox>
        <asp:TextBox ID="txtTestTime" runat="server"> </asp:TextBox>
        <asp:TextBox ID="txtInterviewTime" runat="server"> </asp:TextBox>
        <asp:TextBox ID="txtVenue" runat="server"> </asp:TextBox>
        <asp:TextBox ID="txtWaiting Days" runat="server"> </asp:TextBox>
        <asp:CheckBox ID="chkProspectus" runat="server" />
        <asp:CheckBox ID="chkSamplePaper" runat="server" />
        <asp:CheckBox ID="chkAdmitCard" runat="server" />
    <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click"
        Text="Search Documents" CssClass="btn" />
    </div>                  
    <br />                                                
</asp:Content>
