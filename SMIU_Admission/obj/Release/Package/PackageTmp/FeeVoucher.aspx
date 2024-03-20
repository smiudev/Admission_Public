<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeeVoucher.aspx.cs" Inherits="SMIU_Admission.FeeVoucher"
    MasterPageFile="~/MasterPages/mtc.Master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        <center>
            CPE Registration Fees Voucher</center>
    </h1>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblCNICNo" runat="server" Text="CNIC # "></asp:Label>
                        &nbsp;<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNIC" runat="server" Width="200px" ValidationGroup="StudentForm"
                            autocomplete="off"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredtxtNIC" runat="server" ControlToValidate="txtNIC"
                            ErrorMessage="Please Enter CNIC Number" SetFocusOnError="True" ValidationGroup="StudentForm"
                            InitialValue="_____-_______-_" Display="Dynamic"></asp:RequiredFieldValidator>
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
                    <td colspan="2">
                        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click"
                            ValidationGroup="StudentForm" />
                    </td>
                </tr>
            </table>
            <br />
            <div id="Paymentdetails" runat="server" visible="false">
                <fieldset>
                    <legend>Course Details </legend>
                    <br />
                    <asp:GridView ID="gvManageApplicationFee" runat="server" EmptyDataText="No Record Found"
                        AutoGenerateColumns="False" DataKeyNames="ApplicantID">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <span>
                                        <%# Container.DataItemIndex +1 %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Student ID" DataField="ApplicantID"></asp:BoundField>
                            <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                            <asp:BoundField HeaderText="CNIC Number" DataField="CNICNumber"></asp:BoundField>
                            <asp:BoundField HeaderText="Course" DataField="FirstChoice"></asp:BoundField>
                            <asp:TemplateField HeaderText="Registration Fee" SortExpression="TotalFee">
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("TotalFee") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ValidTilDate" HeaderText="Due Date" ItemStyle-CssClass="CM"
                                DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                                <ItemStyle CssClass="CM"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
                <asp:Button ID="btnChallan" runat="server" CssClass="btn" OnClick="btnChallan_Click"
                    Text="Download Fee Voucher" />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSearch" />
            <asp:PostBackTrigger ControlID="btnChallan" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
