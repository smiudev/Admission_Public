<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesInstallment.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.FeesInstallment" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Semester Fees Installment
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td class="menu_list" style="width: 163px">
                        Semester<span style="color: Red">*</span>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="SemesterFee" Width="200px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                            ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="SemesterFee"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="menu_list" style="width: 163px">
                        Reference/Tracking ID <span style="color: Red">*</span>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtReferenceID" runat="server" ToolTip="Reference/Tracking ID" Width="150px"
                            MaxLength="15" ValidationGroup="SemesterFee" autocomplete="off"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ReqFieldValtxtReferenceID" runat="server" ControlToValidate="txtReferenceID"
                            ErrorMessage="Please Enter Reference ID " ValidationGroup="SemesterFee" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExpValtxtReferenceID" runat="server" ErrorMessage="Please enter only digits"
                            ControlToValidate="txtReferenceID" Display="Dynamic" ValidationExpression="^[0-9]*$"
                            ValidChars="0123456789" ValidationGroup="SemesterFee"></asp:RegularExpressionValidator>
                        <cc1:FilteredTextBoxExtender ID="FlttxtExttxtReferenceID" runat="server" TargetControlID="txtReferenceID"
                            FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                        </cc1:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                <td class="menu_list" style="width: 163px">
                    Tution Fee Amount<span style="color: Red">*</span>
                </td>
                <td class="style2">
                <asp:TextBox ID="txtTutionFeeAmount" runat="server" Width="150px"
                    MaxLength="15" ValidationGroup="SemesterFee" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTutionFeeAmount"
                    ErrorMessage="Please Enter Fee Amount" ValidationGroup="SemesterFee" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter only digits"
                    ControlToValidate="txtTutionFeeAmount" Display="Dynamic" ValidationExpression="^[0-9]*$"
                    ValidChars="0123456789" ValidationGroup="SemesterFee"></asp:RegularExpressionValidator>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtTutionFeeAmount"
                    FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                </cc1:FilteredTextBoxExtender>
    </td>
</tr>
                <tr>
                    <td colspan="2">
                         <asp:Button ID="btnChallan" runat="server" CssClass="btn" OnClick="btnChallan_Click"
     Text="Download Installment Fee Voucher" />
                    </td>
                </tr>
                <tr>
               <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
               </td>
           </tr>
            </table>
            <br />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnChallan" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
