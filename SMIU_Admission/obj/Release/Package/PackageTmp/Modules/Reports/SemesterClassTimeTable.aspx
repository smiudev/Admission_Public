<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SemesterClassTimeTable.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.SemesterClassTimeTable" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Semester Time Table - Fall 2018
        <br />
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset id="MainReport" runat="server">
                <legend>Semester Time Table - Fall 2018</legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <div id="ExportToExcel" runat="server" style="overflow-x: auto; width: 1030px; max-height: 450px;">
                    <table width="100%" border="1">
                        <tr>
                            <td style="width: 50%; text-align: center;" colspan="14">
                                <strong>Semester Time Table - Fall 2018
                                    
                                </strong>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grdSemesterTimeTable" runat="server" EmptyDataText="No Record Found"
                        OnRowDataBound="gdvRowDatabound" HTMLEncode ="false">
                    </asp:GridView>
                </div>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
