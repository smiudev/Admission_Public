<%@ Page Language="C#" MaintainScrollPositionOnPostback="false" ValidateRequest="false"
    AutoEventWireup="true" MasterPageFile="~/MasterPages/FrontPage.master" CodeBehind="ManageFeatures.aspx.cs"
    Inherits="SMIU_Admission.Modules.AdminSecurity.ManageFeatures" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Features</h1>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
  <br />
    <br />
    <asp:Panel ID="pnlConfirm" runat="server" CssClass="warning" Visible="false" Height="20px">
        <asp:Label ID="lblConfirm" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnYes" runat="server" Text="Delete" CssClass="btn" CausesValidation="false"
            OnClick="btnYes_Click" />
        <asp:Button ID="btnNo" runat="server" Text="Cancel" CssClass="btn" CausesValidation="false"
            OnClick="btnNo_Click" />
    </asp:Panel>
    <fieldset>
        <legend>Features</legend>
        <br />
        <table width="100%" cellpadding="0" cellspacing="0" class="topTD">
            <tr>
                <td style="width: 50%">
                    <asp:Panel ID="pnlAdd" runat="server">
                        <table width="100%" cellpadding="0" cellspacing="0" class="contentTable">
                            <tr>
                                <td>
                                    Feature Parent:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlParent" runat="server" AppendDataBoundItems="true">
                                        <asp:ListItem Selected="True" Text="-- Select Parent --" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Feature Name:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFName" runat="server" MaxLength="100" Width="175px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="Name is required"
                                        ControlToValidate="txtFName"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Feature Link:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFLink" runat="server" MaxLength="200" Width="175px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="LinkValidator" runat="server" ErrorMessage="Link is required"
                                        ControlToValidate="txtFLink"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Options:
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="chkOptions" runat="server" ToolTip="Options" RepeatColumns="2">
                                        <asp:ListItem Text="View" Value="View" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Add" Value="Add" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Update" Value="Update" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Delete" Value="Delete" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Activate/Deactivate" Value="Activate/Deactivate" Selected="True"></asp:ListItem>
                                        <%--  <asp:ListItem Text="FillSTOPCard" Value="FillSTOPCard" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="GenerateCAR" Value="GenerateCAR" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="CloseCAR" Value="CloseCAR" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="ManageAudit" Value="ManageAudit" Selected="True"></asp:ListItem>--%>
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Feature Description:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFDesc" runat="server" Rows="5" Width="175px" TextMode="MultiLine"
                                        MaxLength="200"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Sort Id:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSortId" runat="server"></asp:TextBox>
                                    <cc1:FilteredTextBoxExtender ID="fltrSortID" runat="server" TargetControlID="txtSortId"
                                        FilterType="Numbers">
                                    </cc1:FilteredTextBoxExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Show In Menu:
                                </td>
                                <td>
                                    <asp:CheckBox ID="chkMenu" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right">
                                    <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                                    <asp:Button CssClass="btn" ID="btnAdd" runat="server" Text="Submit" OnClick="btnAdd_Click" />
                                    <asp:Button CssClass="btn" ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                                        CausesValidation="False" />
                                    <asp:Button CssClass="btn" ID="btnDelete" runat="server" CausesValidation="False"
                                        OnClick="btnDelete_Click" Text="Delete" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td valign="top" style="width: 50%">
                    <asp:Panel ID="pnlView" runat="server">
                        <asp:TreeView ID="tvFeatures" runat="server" ShowLines="True" AutoGenerateDataBindings="False"
                            OnSelectedNodeChanged="tvFeatures_SelectedNodeChanged" CssClass="noeffect">
                            <SelectedNodeStyle BackColor="Silver" />
                        </asp:TreeView>
                        <asp:Button ID="btnMoveDown" runat="server" CausesValidation="False" OnClick="btnMoveDown_Click"
                            Text="Move Down" Visible="false" />
                        <asp:Button ID="btnMoveUp" runat="server" CausesValidation="False" OnClick="btnMoveUp_Click"
                            Text="Move Up" Visible="false" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
