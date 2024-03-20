<%@ Page Language="C#" MaintainScrollPositionOnPostback="false" ValidateRequest="false"
    AutoEventWireup="true" MasterPageFile="~/MasterPages/FrontPage.master" CodeBehind="ManageUser.aspx.cs"
    Inherits="SMIU_Admission.Modules.AdminSecurity.ManageUser" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage User</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <br />
    <br />
    <fieldset>
        <legend>Search User Information</legend>
        <table class="GridSpace">
            <tr>
                <td>
                    User Name
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="30" />
                </td>
            </tr>
            <tr>
                <td>
                    Designation
                </td>
                <td>
                    <asp:DropDownList ID="ddlDesignation" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Department
                </td>
                <td>
                    <asp:DropDownList ID="ddlDepartment" runat="server" />
                </td>
            </tr>
            <tr runat="server" visible="false">
                <td>
                    Role
                </td>
                <td>
                    <asp:DropDownList ID="ddlRole" runat="server" />
                </td>
            </tr>
            <%-- <tr runat="server" visible="false">
    <td>Status</td>
    <td><asp:DropDownList ID="ddlStatus" runat="server" /></td>
    </tr>
            --%>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
    </fieldset>
    <br />
    <fieldset>
        <legend>All User&#39;s Information</legend>
        <%--    <div class="GridDivContainer GridDivStyle" >--%>
        <asp:GridView ID="grdUserInfo" runat="server" ToolTip="All User's Information" EmptyDataText="No Record Found"
            AutoGenerateColumns="false" DataKeyNames="UserName" CssClass="GridWordWrap GridSpace"
            OnRowEditing="grdUserInfo_RowEditing">
            <Columns>
                <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                        <span>
                            <%# Container.DataItemIndex +1  %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="User Name" DataField="UserName" />
                <asp:BoundField HeaderText="Email ID" DataField="Email" />
                <%-- <asp:BoundField  HeaderText="Designation" DataField="DesignationName" />--%>
                <asp:BoundField HeaderText="Department" DataField="DepartmentName" />
                <%--<asp:BoundField  HeaderText="User Level" DataField="UserLevelName" />--%>
                <%-- <asp:BoundField HeaderText="Report To Designation" DataField="ReportToDesignation" />--%>
                <asp:BoundField HeaderText="Employee No" DataField="DesignationName" />
                <asp:TemplateField HeaderText="Action(s)">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" ToolTip="Update" CommandName="Edit"
                            CausesValidation="false" Text="Update" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%--  </div>--%>
    </fieldset>
</asp:Content>
