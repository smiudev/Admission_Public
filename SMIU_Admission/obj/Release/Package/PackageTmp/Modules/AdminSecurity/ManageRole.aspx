<%@ Page Language="C#" MaintainScrollPositionOnPostback="false" ValidateRequest="false"
    AutoEventWireup="true" MasterPageFile="~/MasterPages/FrontPage.master" CodeBehind="ManageRole.aspx.cs"
    Inherits="SMIU_Admission.Modules.AdminSecurity.ManageRole" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Role</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <br />
    <br />
    <fieldset>
        <legend>Role </legend>
        <br />
        <table class="contentTable">
            <tr>
                <td>
                    Role Name
                </td>
                <td>
                    <asp:TextBox ID="txtRole" runat="server" MaxLength="25" />
                    <!-- please don't change the max length of role becasue it effects badly on other forms -->
                    <asp:RequiredFieldValidator ID="reqValRole" runat="server" SetFocusOnError="true"
                        ControlToValidate="txtRole" ErrorMessage="Role Name is Required" />
                </td>
            </tr>
            <tr>
                <td>
                    Description
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" MaxLength="250" TextMode="MultiLine" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" ToolTip="Submit"
                        OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" ToolTip="Cancel"
                        CausesValidation="false" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
    </fieldset>
    <br />
    <fieldset>
        <legend>All Role's Information</legend>
        <asp:GridView ID="grdRoleInformation" runat="server" ToolTip="Roles Information"
            AutoGenerateColumns="false" DataKeyNames="RoleId" CssClass="GridWordWrap GridSpace"
            OnRowDeleting="grdRoleInformation_RowDeleting" OnRowEditing="grdRoleInformation_RowEditing">
            <Columns>
                <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                        <span>
                            <%# Container.DataItemIndex + 1 %>
                        </span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Role Name" DataField="RoleName" />
                <asp:BoundField HeaderText="Description" DataField="Description" />
                <asp:TemplateField HeaderText="Action(s)">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" ToolTip="Update" CommandName="Edit"
                            CausesValidation="false" />
                        <asp:Label ID="lblUpdate" runat="server" Text="|" />
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" ToolTip="Delete" CommandName="Delete"
                            CausesValidation="false" OnClientClick="javascript:return confirm('Are you sure to delete this Role?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%--</div>--%>
    </fieldset>
</asp:Content>
