<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageEntryTestPrepartion.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.ManageEntryTestPrepartion" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Entry Test Preparation Fee Voucher -
        <asp:Label ID="lblSemesterName" runat="server" Text="Semester Name"></asp:Label>
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width: 106px">
                        Reference ID <span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtReferenceID" runat="server" ToolTip="Reference/Tracking ID" Width="150px"
                            MaxLength="15" ValidationGroup="EntryTestResult"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValtxtReferenceID" runat="server" ControlToValidate="txtReferenceID"
                            ErrorMessage="Please Enter Reference ID " ValidationGroup="EntryTestResult" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExpValtxtReferenceID" runat="server" ErrorMessage="Please enter only digits"
                            ControlToValidate="txtReferenceID" Display="Dynamic" ValidationExpression="^[0-9]*$"
                            ValidChars="0123456789" ValidationGroup="EntryTestResult"></asp:RegularExpressionValidator>
                        <cc1:FilteredTextBoxExtender ID="FlttxtExttxtReferenceID" runat="server" TargetControlID="txtReferenceID"
                            FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click"
                            ValidationGroup="EntryTestResult" />
                    </td>
                </tr>
            </table>
            <div id="Studentdetails" runat="server" visible="false">
                <fieldset>
                    <legend>Entry Test Preparation </legend>
                    <br />
                    <asp:GridView ID="gvManageStudentDetails" runat="server" EmptyDataText="No Record Found"
                        AutoGenerateColumns="False" DataKeyNames="EntryTestPrepartionID">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <span>
                                        <%# Container.DataItemIndex +1 %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Reference ID" DataField="EntryTestPrepartionID"></asp:BoundField>
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="FatherName" HeaderText="Father's Name" />
                            <%-- <asp:BoundField DataField="Gender" HeaderText="Gender" />--%>
                            <%--  <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" />--%>
                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                            <asp:BoundField DataField="IntrestedProgram" HeaderText="Intrested" />
                            <asp:BoundField DataField="LastQualification" HeaderText="Last Qualification" />
                            <asp:BoundField DataField="DegreeGroup" HeaderText="Group" />
                            <asp:BoundField DataField="Grade" HeaderText="Grade" />
                        </Columns>
                    </asp:GridView>
                </fieldset>
                <asp:Button ID="btnChallan" runat="server" Text="Download Fee Voucher" CssClass="btn"
                    OnClick="btnChallan_Click" />
                <asp:Button ID="btnRegistrationForm" runat="server" Text="Download Registration Form"
                    CssClass="btn" OnClick="btnRegistrationForm_Click" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSearch" />
            <asp:PostBackTrigger ControlID="btnChallan" />
            <asp:PostBackTrigger ControlID="btnRegistrationForm" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
