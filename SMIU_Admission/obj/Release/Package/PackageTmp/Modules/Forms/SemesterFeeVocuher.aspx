<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SemesterFeeVocuher.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.SemesterFeeVocuher" ValidateRequest="false"
    MasterPageFile="~/MasterPages/FrontPage.master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Semester Fee Challan Form -
        <asp:Label ID="lblSemesterName" runat="server" Text="Semester Name"></asp:Label></h1>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td class="style1" style="width: 165px">
                        Reference/Tracking ID <span style="color: Red">*</span>
                    </td>
                    <td class="style2">
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
            <div id="NotSelectedStudents" runat="server" visible="false">
                <h1>
                    Dear Candidate,
                </h1>
                <p>
                    Regretted!
                    <br />
                    Your name is not in the first Merit List. However, you may wait for the second merit
                    list up to 28th September, 2020, if you have cleared the written test and also appeared
                    in interview.
                </p>
                <p>
                    Admission Office SMIU
                </p>
            </div>
            <div id="StudentSuccess" runat="server" visible="false">
                <h1>
                    Dear
                    <asp:Label ID="lblCandidateName" runat="server" Text="Student Name"></asp:Label>,
                </h1>
                <p>
                    Congratulations! It is to inform that you have been selected for admission in
                    <h1>
                        <asp:Label ID="lblProgramName" runat="server" Text="Program Name"></asp:Label></h1>
                    Fall 2020 at SMIU. You are advised to Download the fee Voucher , and deposit in
                    any online Branch of HBL latest by 26th September, 2020.<br />
                    For any query you may contact at admission@smiu.edu.pk, 111-111-885 Ext 221
                    <br />
                    <p>
                    </p>
                    <h1>
                        Note:
                    </h1>
                    <p>
                        In order to avail the opportunity of admission at SMIU, you are required to furnish
                        the following documents (if not provided earlier) at Admission office
                        <br />
                        <br />
                        a) Attested Photocopies of Marks Sheet and Certificate of SSC, HSC &amp; Bachelor/Masters/MS
                        or M.Phil or Equivalence Certificate.(If not submitted earlier)<br />
                        b) Original Marks Sheet of HSC-II (for the Candidates of undergraduate program)
                        <br />
                        c) Original Bachelors/Masters/MS or M.Phil Marks Sheet. (For the Candidates of graduate
                        program)<br />
                        d) Paid Fee Voucher ( Admission and Finance Copy)
                        <br />
                    </p>
                    <br />
                    <p>
                        Admission Office SMIU
                    </p>
                    <br />
                    <asp:Button ID="btnChallan" runat="server" CssClass="btn" OnClick="btnChallan_Click"
                        Text="Download Semester Fee Voucher" />
                </p>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSearch" />
            <asp:PostBackTrigger ControlID="btnChallan" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
