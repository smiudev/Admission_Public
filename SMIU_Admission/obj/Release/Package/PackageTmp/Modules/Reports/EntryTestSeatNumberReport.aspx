<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntryTestSeatNumberReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.EntryTestSeatNumberReport" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Student Entry Test Seat Number Report
        <br />
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <br />
            <fieldset>
                <legend>Parameters</legend>
                <br />
                <table class="tbl">
                    <tr>
                        <td style="width: 102px">
                            Semester<span style="color: Red">*</span>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="SeatingPlan" Width="230px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlSemester" runat="server" ControlToValidate="ddlSemester"
                                ErrorMessage="Select Semester" InitialValue="-1" ValidationGroup="SeatingPlan"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Paper Time<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPaperTime" runat="server" ValidationGroup="SeatingPlan"
                                Width="230px" AutoPostBack="True" OnSelectedIndexChanged="ddlPaperTime_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvddlPaperTime" runat="server" ControlToValidate="ddlPaperTime"
                                ErrorMessage="Please Select Paper Time" InitialValue="-1" ValidationGroup="SeatingPlan"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Room Name <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRoomName" runat="server" ValidationGroup="SeatingPlan" Width="230px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFieldValddlRoomName" runat="server" ControlToValidate="ddlRoomName"
                                ErrorMessage="Please Select Room" InitialValue="-1" ValidationGroup="SeatingPlan"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnGenerate" runat="server" CssClass="btn" OnClick="btnGenerate_Click"
                                Text="Show Seating Plan" ValidationGroup="SeatingPlan" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br />
            <fieldset id="MainReport" runat="server" visible = "false">
                <legend>List of Students </legend>
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" Text="Export All to Word" runat="server" CssClass="btn"
                        OnClick="btnExporttoExcel_Click" Enabled="true" />
                </div>
                <table width="100%" border="0" id="ExportToExcel" runat="server">
                    <tr>
                        <td colspan="3">
                            <b>Total Records:</b>
                            <asp:Label ID="lblTotalRecords" runat="server" Text="TotalContacts" Font-Bold="true"></asp:Label>
                            <asp:DataList ID="dlContacts" runat="server" RepeatLayout="Table" RepeatColumns="3"
                                CellPadding="0" CellSpacing="50" RepeatDirection="Horizontal" DataKeyField="ReferenceID">
                                <ItemTemplate>
                                    <span><b>
                                        <asp:Label ID="lblContactID" Font-Italic="true" Font-Size="10.5pt" runat="server"
                                            Text='<%# Eval("StudentName") %>'></asp:Label></b>
                                        <br />
                                        <b>
                                            <asp:Label ID="lblContactDetails" Font-Size="10.5pt" runat="server" Text='<%# Eval("ReferenceID") %>'></asp:Label>
                                        </b></span>
                                    <br />
                                    <span><b>
                                        <asp:Label ID="lblDesignation" Font-Size="10.5pt" runat="server" Text='<%# Eval("SeatNumber") %>'></asp:Label></b>
                                        <br />
                                        <span><b>
                                            <asp:Label ID="lblStudentProgram" Font-Size="10.5pt" runat="server" Text='<%# Eval("ProgramName") %>'></asp:Label></b>
                                        </span>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
            <asp:AsyncPostBackTrigger ControlID="ddlPaperTime" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="btnGenerate" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
