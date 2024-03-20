<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEnteyTestAttemptedQ.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.ViewEnteyTestAttemptedQ" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Entry Test -
        <asp:Label ID="lblSemesterName" runat="server" Text="Semester Name"></asp:Label>
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <table>
        <tr>
            <td>
                Student ID:
            </td>
            <td>
                <asp:Label ID="lblStudentID" runat="server" />
            </td>
            <td>
                Student Name:
            </td>
            <td>
                <asp:Label ID="LblStudentName" runat="server" />
            </td>
            <td>
                Program:
            </td>
            <td>
                <asp:Label ID="lblStudentProgram" runat="server" />
            </td>
        </tr>
    </table>
    <asp:DataList runat="server" ID="dtEntryTestQ" RepeatDirection="Vertical" DataKeyField="QuestionId"
        OnItemDataBound="dtEntryTestQ_ItemDataBound">
        <ItemTemplate>
            <h2>
                Q.<%#Container.ItemIndex +1 %>&nbsp;<%# Eval("QuestionName")%></h2>
            <asp:RadioButtonList runat="server" ID="rbtnOptions">
            </asp:RadioButtonList>
            <b>
                <asp:Label ID="lblCorrectAnser" runat="server" /></b>
        </ItemTemplate>
    </asp:DataList>
    <table>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn" 
                    CausesValidation="False" onclick="btnBack_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
