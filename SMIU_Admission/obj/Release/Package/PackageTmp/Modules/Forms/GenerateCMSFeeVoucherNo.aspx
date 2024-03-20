<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenerateCMSFeeVoucherNo.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.GenerateCMSFeeVoucherNo" MasterPageFile="~/MasterPages/student.Master"
    EnableEventValidation="false" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h2>
        Upload Fee Voucher Data
    </h2>
    <br />
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Upload Fee Voucher</legend>
                <table>
                    <tr>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" CommandName="Insert" CssClass="btn" OnClick="btnSubmit_Click"
                                Text="Submit" ValidationGroup="StudentForm" />
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
