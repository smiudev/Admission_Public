<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageDocumentCheckList.aspx.cs"
    ValidateRequest="false" MaintainScrollPositionOnPostback="false" Inherits="SMIU_Admission.Modules.SetupForms.ManageDocumentCheckList"
    MasterPageFile="~/MasterPages/FrontPage.master" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Document CheckList Semester Wise</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <table class="contentTable GridSpace">
        <tr>
            <td>
                Semester<span style="color: Red">*</span>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="DocumentCheckList"
                    Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                    ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="DocumentCheckList"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
       <%-- <tr>
            <td>
                Degree Program<span style="color: Red">*</span>
            </td>
            <td>
                <asp:RadioButtonList ID="rdnDegreeProgram" runat="server">
                    <asp:ListItem Value="1">Graduate</asp:ListItem>
                    <asp:ListItem Value="2">Undergraduate</asp:ListItem>
                    <asp:ListItem Value="3">Postgraduate</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Label ID="lnProgramName" runat="server" Text="Program" Visible="false" ForeColor="Red"></asp:Label>
                <asp:RequiredFieldValidator ID="ReqFldVDegreeProgram" runat="server" ControlToValidate="rdnDegreeProgram"
                    Display="Dynamic" ErrorMessage="Please mark degree Program" ValidationGroup="DocumentCheckList"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
            </tr>--%>
            <tr>
                <td>
                    Document Name
                </td>
                <td>
                    <asp:TextBox ID="txtDocumentName" runat="server" MaxLength="50" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ReqValDeptName" runat="server" ControlToValidate="txtDocumentName"
                        ErrorMessage="Enter Docuemnt Name" ValidationGroup="DocumentCheckList"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegExptxtDocumentName" runat="server" ControlToValidate="txtDocumentName"
                        ErrorMessage="Invalid Characters Entered" ValidationExpression="^([a-zA-Z0-9 &amp;/]*)$"
                        ValidationGroup="DocumentCheckList"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Description
                </td>
                <td>
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" MaxLength="200"
                        Width="300px" Height="50px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;<asp:Button ID="btnsubmit" runat="server" Text="Submit" CommandName="Insert"
                        CssClass="btn" OnClick="btnsubmit_Click" ValidationGroup="DocumentCheckList" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancel_Click"
                        CausesValidation="False" />
                </td>
            </tr>
    </table>
    <br />
    <fieldset>
        <legend>All Departments Details </legend>
        <asp:GridView ID="gvManageDocument" runat="server" EmptyDataText="No Record Found"
            AutoGenerateColumns="False" DataKeyNames="DocumentChecklistId" CssClass="GridWordWrap GridSpace"
            OnRowDataBound="gvManageDocument_RowDataBound" OnRowDeleting="gvManageDocument_RowDeleting"
            OnRowEditing="gvManageDocument_RowEditing">
            <Columns>
                <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                        <span>
                            <%# Container.DataItemIndex +1 %></span>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="Semester Name" DataField="SemesterName"></asp:BoundField>
                <asp:BoundField HeaderText="Degree Program" DataField="DegreeProgram"></asp:BoundField>
                <asp:BoundField HeaderText="Document Name" DataField="DocumentName"></asp:BoundField>
                <asp:BoundField HeaderText="Description" DataField="Description"></asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="Status"></asp:BoundField>
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
