<%@ Page Language="C#" MaintainScrollPositionOnPostback="false" AutoEventWireup="true"
    MasterPageFile="~/MasterPages/FrontPage.master" CodeBehind="UpdateUser.aspx.cs"
    Inherits="SMIU_Admission.Modules.AdminSecurity.UpdateUser" %>

<script runat="server">
    void CustomValidatorUpdate_ServerValidate(Object source,
       ServerValidateEventArgs args)
    {
        args.IsValid = (chkRole.SelectedValue != "");
    }

</script>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Update User</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <br />
    <br />
    <fieldset runat="server" id="fsUpdateUser">
        <legend>Update User Information </legend>
        <table class="GridSpace">
            <tr>
                <td>
                    User Name
                </td>
                <td>
                    <h2>
                        <asp:Label ID="lblUserName" runat="server" /></h2>
                    <%--<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="txtUserName"
                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="UpdateUser"
                        SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                </td>
            </tr>
            <tr>
                <td>
                    Employee Number
                </td>
                <td>
                    <asp:TextBox ID="txtEmpNo" runat="server" MaxLength="50" />
                </td>
            </tr>
            <tr>
                <td>
                    Roles
                </td>
                <td>
                    <asp:CheckBoxList ID="chkRole" runat="server" RepeatColumns="2">
                    </asp:CheckBoxList>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Select at least any one Role"
                        OnServerValidate="CustomValidatorUpdate_ServerValidate" ValidationGroup="UpdateUser">
                    </asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    E-mail ID
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="UpdateUser"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regExEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Invalid Email Address" ValidationExpression="^([\w-\.&]+)@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Department
                </td>
                <td>
                    <asp:DropDownList ID="ddlDepartment" runat="server" />
                    <asp:RequiredFieldValidator ID="reqValDepartment" ErrorMessage="Department is required."
                        ValidationGroup="UpdateUser" ControlToValidate="ddlDepartment" InitialValue="Select Department"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    Designation
                </td>
                <td>
                    <asp:DropDownList ID="ddlDesignation" runat="server" />
                    <asp:RequiredFieldValidator ID="reqValDesignation" ErrorMessage="Designation is required."
                        ValidationGroup="UpdateUser" ControlToValidate="ddlDesignation" InitialValue="Select Designation"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnUpdate" runat="server" CausesValidation="true" ValidationGroup="UpdateUser"
                        CssClass="btn" Text="Update" ToolTip="Update" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="false" CssClass="btn"
                        Text="Cancel" ToolTip="Cancel" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
