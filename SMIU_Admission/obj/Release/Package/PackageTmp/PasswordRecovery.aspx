<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs"
    Inherits="SMIU_Admission.PasswordRecovery" MasterPageFile="~/MasterPages/student.Master"
    MaintainScrollPositionOnPostback="false" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Password Recovery</h1>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <br />
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Password Recovery </legend>
                <br />
                <table width="100%">
                    <tr>
                        <td colspan="2">
                            <strong>Enter your CNIC Number and Email Address to receive your password </strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCNICNo" runat="server" Text="C.N.I.C No"></asp:Label>
                            &nbsp;<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNIC" runat="server" Width="200px" ValidationGroup="StudentForm"
                                MaxLength="13"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredtxtNIC" runat="server" ControlToValidate="txtNIC"
                                ErrorMessage="Please Enter NIC" SetFocusOnError="True" ValidationGroup="StudentForm"
                                InitialValue="_____-_______-_"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegrExpValCNICNo" runat="server" ErrorMessage="Please enter correct CNIC number"
                                ControlToValidate="txtNIC" Display="Static" ValidationExpression="^[0-9]{5}-[0-9]{7}-[0-9]{1}$"
                                ValidationGroup="StudentForm"></asp:RegularExpressionValidator>
                            <cc1:MaskedEditExtender ID="txtNIC_MaskedEditExtender" runat="server" CultureAMPMPlaceholder=""
                                CultureCurrencySymbolPlaceholder="" CultureDateFormat="" CultureDatePlaceholder=""
                                CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" CultureTimePlaceholder=""
                                Enabled="True" Mask="99999-9999999-9" MaskType="Number" TargetControlID="txtNIC"
                                ClearMaskOnLostFocus="False">
                            </cc1:MaskedEditExtender>
                            <cc1:TextBoxWatermarkExtender ID="txtNIC_WatermarkExtender" runat="server" Enabled="True"
                                TargetControlID="txtNIC" WatermarkCssClass="txtwatermark" WatermarkText="CNIC Here">
                            </cc1:TextBoxWatermarkExtender>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-mail<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Please Enter E-mail" ToolTip="E-mail is required." ValidationGroup="StudentForm"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Invalid Email Address" ValidationExpression="^([\w-\.&]+)@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            What is the result of below calculation?<span style="color: Red">*</span>
                            <br />
                            <center>
                                <b>
                                    <asp:Label ID="lblStopSpam" runat="server"></asp:Label>
                                    = </b>
                            </center>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="txtSecurityCode" MaxLength="50" ToolTip="Enter Calculated Number"
                                Width="50px" ValidationGroup="StudentForm"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ReqFlvtxtstopspam" ErrorMessage="Please enter your answer."
                                ValidationGroup="StudentForm" ControlToValidate="txtSecurityCode" runat="server"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CustomValidator runat="server" ID="cusCustom" ControlToValidate="txtSecurityCode"
                                OnServerValidate="cusCustom_ServerValidate" ErrorMessage="Invalid Security Code Please try again"
                                ValidationGroup="StudentForm" Display="Dynamic" SetFocusOnError="true" />
                        </td>
                    </tr>
                </table>
                <caption>
                    <br />
                    <table>
                        <tr>
                            <td>
                                &nbsp;<asp:Button ID="btnSubmit" runat="server" CommandName="Insert" CssClass="btn"
                                    OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="StudentForm" />
                            </td>
                        </tr>
                    </table>
                </caption>
            </fieldset>
            </table> </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
