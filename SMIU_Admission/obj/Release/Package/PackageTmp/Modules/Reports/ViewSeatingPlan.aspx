<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSeatingPlan.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.ViewSeatingPlan" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    <h1>
        View Entry Test Seating Details
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
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
                            <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EmpForm" Width="230px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlSemester" runat="server" ControlToValidate="ddlSemester"
                                ErrorMessage="Select Semester" InitialValue="-1" ValidationGroup="EmpForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            Degree Program<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rdnDegreeProgram" runat="server">
                                <asp:ListItem Value="2">Undergraduate</asp:ListItem>
                                <asp:ListItem Value="1">Graduate</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Label ID="lnProgramName" runat="server" Text="Program" Visible="false" ForeColor="Red"></asp:Label>
                            <asp:RequiredFieldValidator ID="ReqFldVDegreeProgram" runat="server" ControlToValidate="rdnDegreeProgram"
                                Display="Dynamic" ErrorMessage="Please mark degree Program" ValidationGroup="EmpForm"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                            Paper Time<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPaperTime" runat="server" ValidationGroup="EmpForm" Width="230px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvddlPaperTime" runat="server" ControlToValidate="ddlPaperTime"
                                ErrorMessage="Please Select Paper Time" InitialValue="-1" ValidationGroup="EmpForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btn_search" runat="server" CssClass="btn" OnClick="btn_search_Click"
                                Text="Show Seating Plan" ValidationGroup="EmpForm" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br />
            <div id="btnExportdiv" runat="server" style="display: block; float: right;" visible="false">
                <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                    runat="server" CssClass="btn" />
                <asp:Button ID="btnExporttoPdf" OnClick="btnExporttoPdf_Click" Text="Export to Pdf"
                    runat="server" CssClass="btn" />
            </div>
            <div id="seatingDetails" runat="server" style="overflow: Auto; max-height: 450px;
                width: 100%;" visible="false">
                <br />
                <fieldset>
                    <legend>Room Wise Seating</legend>
                    <div id="ExportToExcel" runat="server">
                        <asp:DataList ID="dlRoomList" runat="server" OnItemDataBound="dlRoomList_ItemDataBound"
                            DataKeyField="RoomName">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0" style="width: 100%; border: none;">
                                    <tr>
                                        <td colspan="8">
                                            <asp:Image ID="smiulogo" Height="80px" Width="110px" runat="server" ImageUrl="~/Images/SMIU-Logo.png" />
                                            <span style="margin-left: 240px;"><strong>Sindh Madressatul Islam University</strong></span><br />
                                            <span style="margin-left: 350px;"><strong>(Sitting Arrangements - Entry Test Spring 2020)</strong></span><br />
                                            <span style="margin-left: 350px;"><strong>Department of
                                                <asp:Label ID="lblDepartmentName" runat="server" Text='<%# Eval("DepartmentName") %>'></asp:Label></strong>
                                            </span>
                                            <br />
                                            <b><span style="float: right;">Dated:
                                                <asp:Label ID="lblDatetime" runat="server" Text='<%# Eval("PaperDateTime") %>'></asp:Label>
                                                <br />
                                            </span></b>
                                            <br />
                                            <b><span style="float: left;">Room Name:
                                                <asp:Label ID="lblRoomName" runat="server" Text='<%# Eval("RoomName") %>'></asp:Label>
                                            </span></b><b><span style="float: right;">Time:
                                                <asp:Label ID="lblpaperTime" runat="server" Text='<%# Eval("PaperTime") %>'></asp:Label>
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="grdExamSeating" runat="server" EmptyDataText="No Record Found"
                                    OnRowDataBound="grdExamSeating_RowDataBound">
                                </asp:GridView>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </fieldset>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_search" />
            <asp:PostBackTrigger ControlID="btnExporttoPdf" />
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
