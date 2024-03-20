<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditSeatingPlan.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.EditSeatingPlan" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    <h1>
        Edit Exam Seating Details
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <style>
        .tdText
        {
            width: 120px;
            word-wrap: break-word;
            text-align: center;
            vertical-align: middle;
        }
    </style>
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
                            <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="ExamTimeTable"
                                Width="230px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqddlSemester" runat="server" ControlToValidate="ddlSemester"
                                ErrorMessage="Select Semester" InitialValue="-1" ValidationGroup="ExamTimeTable"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>             
                   
                    <tr>
                        <td>
                            Paper Time<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPaperTime" runat="server" ValidationGroup="EmpForm" Width="230px"
                                AutoPostBack="True" OnSelectedIndexChanged="ddlPaperTime_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvddlPaperTime" runat="server" ControlToValidate="ddlPaperTime"
                                ErrorMessage="Please Select Paper Time" InitialValue="-1" ValidationGroup="EmpForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Room Name <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRoomName" runat="server" ValidationGroup="EmpForm" Width="230px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFieldValddlRoomName" runat="server" ControlToValidate="ddlRoomName"
                                ErrorMessage="Please Select Room" InitialValue="-1" ValidationGroup="EmpForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnGenerate" runat="server" CssClass="btn" OnClick="btnGenerate_Click"
                                Text="Show Seating Plan" ValidationGroup="EmpForm" />
                        </td>
                    </tr>
                </table>
            </fieldset>
            <br />
            <div id="DivRoomWiseSeating" runat="server" visible="false">
                <fieldset>
                    <legend>Room Wise Seating</legend>
                    <br />
                    <div style="overflow: auto; width: 960px">
                        <asp:Label ID="lblRoomDetails" runat="server" Text="RoomDetails" Font-Bold ="true"></asp:Label>
                        <asp:GridView ID="grdExamSeating" runat="server" EmptyDataText="No Record Found"
                            OnRowDataBound="grdExamSeating_RowDataBound" OnRowCreated="grdExamSeating_RowCreated">
                        </asp:GridView>
                        <asp:Button ID="btnSave" runat="server" CssClass="btn" OnClick="btnSave_Click" Text="Update"
                            ValidationGroup="EmpForm" /><br />
                    </div>
                </fieldset>
            </div>
        </ContentTemplate>
        <Triggers>           
            <asp:PostBackTrigger ControlID="btnGenerate" />          
            <asp:AsyncPostBackTrigger ControlID="ddlPaperTime" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

