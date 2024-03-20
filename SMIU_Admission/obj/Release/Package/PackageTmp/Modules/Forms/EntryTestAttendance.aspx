<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntryTestAttendance.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.EntryTestAttendance" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Entry Test Attendance
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <style>
        th
        {
            text-align: left;
        }
    </style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td class="menu_list" style="width: 163px">
                        Semester<span style="color: Red">*</span>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EntryTestAttendance"
                            Width="200px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                            ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="EntryTestAttendance"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="menu_list" style="width: 163px">
                        Reference/Tracking ID <span style="color: Red">*</span>
                      <%--  <br />
                        <span style="color: Red">(last 4 digit only)</span>--%>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtReferenceID" runat="server" ToolTip="Reference/Tracking ID" Width="150px"
                            MaxLength="9" Text="1000" ValidationGroup="EntryTestAttendance" autocomplete="off"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValtxtReferenceID" runat="server" ControlToValidate="txtReferenceID"
                            ErrorMessage="Please Enter Reference ID " ValidationGroup="EntryTestAttendance"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExpValtxtReferenceID" runat="server" ErrorMessage="Please enter only digits"
                            ControlToValidate="txtReferenceID" Display="Dynamic" ValidationExpression="^[0-9]*$"
                            ValidChars="0123456789" ValidationGroup="EntryTestAttendance"></asp:RegularExpressionValidator>
                        <%--  ValidationExpression="^[0-9]*$"--%>
                        <cc1:FilteredTextBoxExtender ID="FlttxtExttxtReferenceID" runat="server" TargetControlID="txtReferenceID"
                            FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click"
                            ValidationGroup="EntryTestAttendance" />
                    </td>
                </tr>
            </table>
            <br />
            <div id="Studentdetails" runat="server" visible="false">
                <fieldset>
                    <legend>Student Attendance Details </legend>
                    <br />
                    <asp:GridView ID="gvManageStudentDetails" runat="server" EmptyDataText="No Record Found"
                        AutoGenerateColumns="False" DataKeyNames="ReferenceID">
                        <Columns>
                            <asp:TemplateField HeaderText="Attendance">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkAttendanceStatus" runat="server" AutoPostBack="true" OnCheckedChanged="chkAttendanceStatus_OnCheckedChanged"
                                        Checked='<%# Convert.ToBoolean(Eval("IsPresent")) %>' Text='<%# Eval("IsPresent").ToString().Equals("True") ? " Present " : " Absent " %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <span>
                                        <%# Container.DataItemIndex +1 %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Reference ID" DataField="ReferenceID"></asp:BoundField>
                            <asp:BoundField HeaderText="Seat Number" DataField="SeatNumber"></asp:BoundField>
                            <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                            <asp:BoundField HeaderText="Program" DataField="StudentProgram"></asp:BoundField>
                            <asp:BoundField HeaderText="Room" DataField="RoomName"></asp:BoundField>
                            <asp:BoundField DataField="ReceivingDate" HeaderText="Receiving Date" ItemStyle-CssClass="CM"
                                DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                                <ItemStyle CssClass="CM"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSearch" />
            <asp:PostBackTrigger ControlID="gvManageStudentDetails" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
