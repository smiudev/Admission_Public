<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageDepartment.aspx.cs"
    ValidateRequest="false" MaintainScrollPositionOnPostback="false" Inherits="SMIU_Admission.Modules.SetupForms.ManageDepartment"
    MasterPageFile="~/MasterPages/FrontPage.master" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Department</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">  
        <table class="contentTable GridSpace">
            <tr>
                <td>
                    Department Name
                </td>
                <td>
                    <asp:TextBox ID="txtDepartmentName" runat="server" MaxLength="50" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqValDeptName" runat="server" ControlToValidate="txtDepartmentName"
                        ErrorMessage="Enter Department Name"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegExpDptName" runat="server" ControlToValidate="txtDepartmentName"
                        ErrorMessage="Invalid Characters Entered" ValidationExpression="^([a-zA-Z &amp;]*)$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Description
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" MaxLength="200" Width="300px" Height ="50px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;<asp:Button ID="btnsubmit" runat="server" Text="Submit" CommandName="Insert"
                        CssClass="btn" OnClick="btnsubmit_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancel_Click"
                        CausesValidation="False" />
                </td>
            </tr>
        </table>   
    <br />
    <fieldset>
        <legend>All Departments Details </legend>
        <asp:GridView ID="gvManageDepartment" runat="server" EmptyDataText="No Record Found"
            AutoGenerateColumns="False" DataKeyNames="DepartmentID" CssClass="GridWordWrap GridSpace"
            OnRowDataBound="gvManageDepartment_RowDataBound" OnRowDeleting="gvManageDepartment_RowDeleting"
            OnRowEditing="gvManageDepartment_RowEditing">
            <Columns>
                <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                        <span>
                            <%# Container.DataItemIndex +1 %></span>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
                <asp:BoundField HeaderText=" Department Name" DataField="DepartmentName">
                    <ItemStyle Width="30%" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Description" DataField="Description">
                    <ItemStyle Width="30%" Wrap="True" />
                </asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="Status">
                    <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Action(s)">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Edit" CausesValidation="False"></asp:LinkButton>
                        <asp:Label ID="lblupdate" runat="server" Text="Label">|</asp:Label>
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="javascript:return confirm('Are you sure to delete this Department?');"
                            CausesValidation="False"></asp:LinkButton>
                        <asp:Label ID="lblDelete" runat="server" Text="Label">|</asp:Label>
                        <asp:LinkButton ID="LnkActivate" runat="server" Text="Activate" CausesValidation="False"
                            OnClick="LnkActivate_Click"></asp:LinkButton>
                        <asp:Label ID="lblActivate" runat="server" Text="Label">|</asp:Label>
                        <asp:LinkButton ID="LnkDeActivate" runat="server" Text="DeActivate" CausesValidation="False"
                            OnClick="LnkDeActivate_Click"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="20%" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </fieldset>
</asp:Content>
