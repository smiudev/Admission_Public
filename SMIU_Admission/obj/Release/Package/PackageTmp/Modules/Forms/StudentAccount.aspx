<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentAccount.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.StudentAccount" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    <h1>
        Manage Student Account Details
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
            <td>
                CNIC Number<span style="color: Red">*</span>
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtCNIC" runat="server" Width="200px" MaxLength="15"></asp:TextBox>
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
           <%-- <div style="display: block; float: right;">
                <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                    runat="server" CssClass="btn" />
            </div>--%>
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
                    DataKeyNames="RegistrationID" OnRowUpdating="grdStudent_RowUpdating"  OnRowDataBound="gdvRowDatabound">
                    <Columns>
                        <asp:TemplateField HeaderText="S.No">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:BoundField DataField="RegistrationID" HeaderText="Registration ID" />
                        <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                         <asp:BoundField DataField="CNICNumber" HeaderText="C.N.I.C No" />
                        <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" ItemStyle-CssClass="WrappedText" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-CssClass="WrappedText" />
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:TextBox ID="txtEmailAddress" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EmailAddress") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <asp:TextBox ID="txtPassword" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Password") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                      <%--  <asp:BoundField DataField="EmailAddress" HeaderText="Login Email" ItemStyle-CssClass="WrappedText" />
                        <asp:BoundField DataField="Password" HeaderText="Login Password" ItemStyle-CssClass="WrappedText" />--%>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update"  ToolTip="Update Student Account" Text="Update" />
                                <%--<asp:Label ID="lblDelete" runat="server" Text="lblDelete" Visible ="false">|</asp:Label>--%>
                              <%--  <asp:LinkButton ID="LnkbtnDelete" runat="server" Text="Delete" CommandName="Delete"
                                    OnClientClick="javascript:return confirm('Are you sure to delete Selected Record ?');"
                                    CausesValidation="False" Visible="false"></asp:LinkButton>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </fieldset>
    </div>
</asp:Content>
