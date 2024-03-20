<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoWithStudentID.aspx.cs"
    Inherits="SMIU_Admission.PhotoWithStudentID" MasterPageFile="~/MasterPages/mtc.Master"
    MaintainScrollPositionOnPostback="false" ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">



    <asp:Button ID="btnSubmit" runat="server" Text="Generate Photo" CssClass ="btn" 
        onclick="btnSubmit_Click" />

    <asp:Button ID="btnInsert" runat="server" Text="Insert Photos" CssClass ="btn" 
        onclick="btnInsert_Click" />

    <asp:Button ID="btnSegregate" runat="server" Text="Segregate Photo" CssClass ="btn" 
        onclick="btnSegregate_Click" />

</asp:Content>
