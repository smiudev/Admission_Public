<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageStudent.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.ManageStudent" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    <h1>
        Manage Student Details
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <table class="contentTable GridSpace">
        <tr>
            <td>
                Semester<span style="color: Red">*</span>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="ApplicationFee"
                    Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="menu_list" style="width: 183px">
                Department
            </td>
            <td>
                <asp:DropDownList ID="ddlDepartment" runat="server" AppendDataBoundItems="true" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="menu_list" style="width: 183px">
                Program
            </td>
            <td>
                <asp:DropDownList ID="ddlProgram" runat="server" AppendDataBoundItems="true" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="menu_list" style="width: 183px">
                Gender
            </td>
            <td>
                <asp:DropDownList ID="ddlGender" runat="server" Width="140px">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                    <asp:ListItem Value="Male">Male</asp:ListItem>
                    <asp:ListItem Value="Female">Female</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="menu_list" style="width: 183px">
                Reference/Tracking ID
            </td>
            <td>
                <asp:TextBox ID="txtReferenceID" runat="server" ToolTip="Reference/Tracking ID" Width="150px"
                    MaxLength="15"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <div style="text-align: left;">
                    <asp:Button ID="btn_search" runat="server" CssClass="btn" Text="Search" OnClick="btn_search_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_Reset" runat="server" CssClass="btn" Text="Reset" OnClick="btn_Reset_Click" />
                </div>
            </td>
        </tr>
    </table>
    <br />
    <div style="overflow: Auto; max-height: 450px; width: 100%;">
        <br />
        <fieldset>
            <legend>Student(s)List</legend>
            <div style="display: block; float: right;">
                <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                    runat="server" CssClass="btn" />
            </div>
            <div id="ExportToExcel" runat="server">
                <table width="100%" border="1">
                    <tr>
                        <td style="width: 50%; text-align: center;" colspan="14">
                            <strong>Student(s)List -
                                <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label>
                            </strong>
                            <br />
                        </td>
                    </tr>
                </table>
                <asp:GridView ID="grdStudent" runat="server" AutoGenerateColumns="False" EmptyDataText="No Record Found"
                    DataKeyNames="StudentId" OnRowDeleting="grdStudent_RowDeleting" OnRowDataBound="gdvRowDatabound">
                    <Columns>
                        <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Reference ID" DataField="StudentID"></asp:BoundField>
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                        <%-- <asp:BoundField DataField="CNICNumber" HeaderText="C.N.I.C No" />--%>
                        <asp:BoundField DataField="FirstChoice" HeaderText="Program" ItemStyle-CssClass="WrappedText" />
                        <asp:BoundField DataField="DepartmentName" HeaderText="Department" ItemStyle-CssClass="WrappedText" />
                        <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" ItemStyle-CssClass="WrappedText" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-CssClass="WrappedText" />
                        <asp:BoundField DataField="FeesPaid" HeaderText="Fees Paid" ItemStyle-CssClass="WrappedText" />
                        <asp:BoundField DataField="LoginEmail" HeaderText="Login Email" ItemStyle-CssClass="WrappedText" />
                        <asp:BoundField DataField="LoginPassword" HeaderText="Login Password" ItemStyle-CssClass="WrappedText" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:HyperLink ID="hlUpdateStudent" runat="server" ToolTip="Update Student Details"
                                    Text="Update" NavigateUrl='<%#String.Format("UpdateAddmissionForm.aspx?ViewAs=edit&StudentId={0}",Eval("StudentID").ToString()) %>'></asp:HyperLink>
                                <asp:Label ID="lblDelete" runat="server" Text="lblDelete" Visible ="false">|</asp:Label>
                                <asp:LinkButton ID="LnkbtnDelete" runat="server" Text="Delete" CommandName="Delete"
                                    OnClientClick="javascript:return confirm('Are you sure to delete Selected Record ?');"
                                    CausesValidation="False" Visible="false"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </fieldset>
    </div>
</asp:Content>
