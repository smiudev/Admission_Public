<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEntryTestMarks.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.AddEntryTestMarks" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Entry Test Marks
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <style>
                th
                {
                    text-align: left;
                }
            </style>
            <table>
                <tr>
                    <td class="menu_list" style="width: 163px">
                        Semester<span style="color: Red">*</span>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="EntryTestMarks"
                            Width="200px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                            ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="EntryTestMarks"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Degree Program
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDegreeProgram" runat="server" ValidationGroup="EmpForm"
                            Width="200px">
                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Graduate</asp:ListItem>
                            <asp:ListItem Value="2">Undergraduate </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Department Name<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Value="GetAll">All</asp:ListItem>
                            <asp:ListItem Value="FIT">Computer Science</asp:ListItem>
                            <asp:ListItem Value="FMBC">Business Administration</asp:ListItem>
                            <asp:ListItem Value="FSS">Media Studies & Social Science</asp:ListItem>
                            <asp:ListItem Value="FED">Education</asp:ListItem>
                            <asp:ListItem Value="FES">Environmental Sciences</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="ReqFldValDept" runat="server" ControlToValidate="ddlDepartment"
                            ErrorMessage="Please Select Department" InitialValue="-1" SetFocusOnError="True"
                            ValidationGroup="EntryTestMarks"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Program Name<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlProgramName" runat="server" ValidationGroup="EntryTestMarks"
                            Width="200px">
                        </asp:DropDownList>
                        <%-- <asp:RequiredFieldValidator ID="rfvddlddlProgramName" runat="server" ControlToValidate="ddlProgramName"
                    ErrorMessage="Select Program" InitialValue="-1" ValidationGroup="EntryTestMarks"
                    Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click"
                            ValidationGroup="EntryTestMarks" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlDepartment" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="btnSearch" />
        </Triggers>
    </asp:UpdatePanel>
    <br />
    <div id="ApplicantDetails" style="overflow: Auto; max-height: 450px; width: 100%;"
        visible="false" runat="server">
        <br />
        <fieldset>
            <legend>Manage Entry Test Marks</legend>
            <br />
            <asp:GridView ID="gvManageEntryTestMarks" runat="server" EmptyDataText="No Record Found"
                AutoGenerateColumns="False" DataKeyNames="ReferenceID" OnRowDataBound="gdvRowDatabound">
                <Columns>
                    <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <span>
                                <%# Container.DataItemIndex +1 %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Reference No" DataField="ReferenceID"></asp:BoundField>
                    <asp:BoundField HeaderText="Semester" DataField="SemesterName"></asp:BoundField>
                    <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                    <asp:BoundField HeaderText="Program" DataField="StudentProgram"></asp:BoundField>                   
                    <asp:TemplateField HeaderText="MCQS Marks">
                        <ItemTemplate>
                            <asp:TextBox ID="txtMcqsTestMarks" runat="server" ValidationGroup="EmpForm" MaxLength="2"
                                Width="70px" Text='<%# Eval("McqsMarks").ToString()%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExpMcqstxtTestMarks" runat="server" ErrorMessage="Please enter only digits"
                                ForeColor="Red" ControlToValidate="txtMcqsTestMarks" Display="Dynamic" ValidationExpression="\d+"
                                ValidChars="0123456789" ValidationGroup="EmpForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtMcqsTestMarks" runat="server" TargetControlID="txtMcqsTestMarks"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eassy Marks">
                        <ItemTemplate>
                            <asp:TextBox ID="txtTestEassyMarks" runat="server" ValidationGroup="EmpForm" MaxLength="2"
                                Width="70px" Text='<%# Eval("EassyMarks").ToString()%>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegExptxtTestEassyMarks" runat="server" ErrorMessage="Please enter only digits"
                                ForeColor="Red" ControlToValidate="txtTestEassyMarks" Display="Dynamic" ValidationExpression="\d+"
                                ValidChars="0123456789" ValidationGroup="EmpForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtTestEassyMarks" runat="server" TargetControlID="txtTestEassyMarks"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Total" DataField="TotalMarks"></asp:BoundField>
                    <asp:BoundField HeaderText="Remarks" DataField="Remarks"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </fieldset>
        <%-- <table>
            <tr>
                <td colspan="2">
                    &nbsp;<asp:Button ID="btnSaved" runat="server" Text="Save" CssClass="btn" OnClick="btnSaved_Click"
                        ValidationGroup="EmpForm" />
                </td>
            </tr>
        </table>--%>
    </div>
</asp:Content>
