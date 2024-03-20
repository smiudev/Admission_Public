<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CBTEntryTestSeatingReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.CBTEntryTestSeatingReport" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        CBT Entry Test Seating Report
        <br />
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Search Parameter</legend>
                <br />
                <table class="tbl">
                    <tr>
                        <td>
                            Semester<span style="color: Red">*</span>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EmpForm" Width="200px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset id="MainReport" runat="server">
                <legend>CBT Entry Test Seating Report</legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <div id="ExportToExcel" runat="server" style="overflow-x: auto; width: 980px; max-height: 450px;">
                    <table width="100%" border="1">
                        <tr>
                            <td style="width: 50%; text-align: center;" colspan="9">
                                <strong>CBT Entry Test Seating Report -
                                    <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label>
                                </strong>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grdCBTSeating" runat="server" AutoGenerateColumns="false" DataKeyNames="StudentID"
                        EmptyDataText="No Record Found">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentID" HeaderText="Reference No" />
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="Program" HeaderText="Program" />
                            <asp:BoundField DataField="TestVenue" HeaderText="Venue" />
                            <asp:BoundField DataField="EntryTestDay" HeaderText="Day" />
                            <asp:BoundField DataField="TestTime" HeaderText="Time" />
                            <asp:BoundField DataField="TestDate" HeaderText="Date" ItemStyle-CssClass="CM" DataFormatString="{0:MMM dd, yyyy}"
                                HtmlEncode="false">
                                <ItemStyle CssClass="CM"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="EmailAddress" HeaderText="Email" />
                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
