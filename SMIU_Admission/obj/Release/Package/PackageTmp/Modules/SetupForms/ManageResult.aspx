<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageResult.aspx.cs" Inherits="SMIU_Admission.Modules.SetupForms.ManageResult"
    MasterPageFile="~/MasterPages/FrontPage.master" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Result Message</h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <style type="text/css">
        textarea
        {
            resize: none;
        }
    </style>
    <link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="all" />
    <link rel="stylesheet" href="/css/ui.theme.css" type="text/css" media="all" />
    <script src="/scripts/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/ui.core.js"></script>
    <script type="text/javascript" src="/scripts/ui.datepicker.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(function (evt, args) {
                $(".date").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: '2020:2025',
                    dateFormat: 'dd/mm/yy'
                });
            });
        });

    </script>
    <script type="text/javascript" src="../../tinymce/js/tinymce/tinymce.min.js"></script>
    <script type="text/javascript">
        tinymce.init({
            menubar: false,
            selector: "textarea.publication",
            encoding: 'xml', 
            height: "100",
            width: "740",
            plugins: [
              "advlist autolink lists link image charmap print preview anchor",
              "searchreplace visualblocks code fullscreen",
              "insertdatetime media table contextmenu paste"
             ],
            toolbar: "insertfile undo redo | bold italic | alignleft aligncenter alignright alignjustify"
        });
        function setPlainText() {
            var ed = tinyMCE.get('elm1');
            ed.pasteAsPlainText = true;
            //adding handlers crossbrowser
            if (tinymce.isOpera || /Firefox\/2/.test(navigator.userAgent)) {
                ed.onKeyDown.add(function (ed, e) {
                    if (((tinymce.isMac ? e.metaKey : e.ctrlKey) && e.keyCode == 86) || (e.shiftKey && e.keyCode == 45))
                        ed.pasteAsPlainText = true;
                });
            } else {
                ed.onPaste.addToTop(function (ed, e) {
                    ed.pasteAsPlainText = true;
                });
            }
        }   
       
    </script>
    <table class="contentTable GridSpace">
        <tr>
            <td>
                Message Type
            </td>
            <td>
                <asp:DropDownList ID="ddlMessageType" runat="server" ValidationGroup="StudentForm"
                    Width="200px">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                    <asp:ListItem Value="Entry Test Result With Interview Schedule">Entry Test Result With Interview Schedule</asp:ListItem>
                    <asp:ListItem Value="Final Selection with Fee Voucher">Final Selection with Fee Voucher</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ReqFldValddlMessageType" runat="server" ControlToValidate="ddlMessageType"
                    ErrorMessage="Select Message Type" InitialValue="-1" ValidationGroup="StudentForm"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Message Text
            </td>
            <td>
                <asp:TextBox ID="txtMessageText" runat="server" TextMode="MultiLine" Rows="10" Width="935px"
                    CssClass="publication"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredtxttxtMessageText" runat="server" TargetControlID="txtMessageText"
                    FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                    ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                </cc1:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="ReqFldtxtMessageText" runat="server" ControlToValidate="txtMessageText"
                    ErrorMessage="Please Enter Message Text " ValidationGroup="StudentForm" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Display Date <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtDispalyDate" runat="server" Width="110px" ValidationGroup="StudentForm"
                    CssClass="date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFlVtxtDOB" runat="server" ControlToValidate="txtDispalyDate"
                    ErrorMessage="Please Enter Date" ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>
                <cc1:MaskedEditExtender ID="MaskedEditExtxtDOB" MaskType="Date" runat="server" TargetControlID="txtDispalyDate"
                    Mask="99/99/9999" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
                    OnInvalidCssClass="MaskedEditError" InputDirection="RightToLeft" AcceptNegative="Left"
                    DisplayMoney="Left" ErrorTooltipEnabled="True" CultureName="en-GB">
                </cc1:MaskedEditExtender>
                <cc1:MaskedEditValidator ID="MaskedEditValidatortxtDOB" runat="server" ControlExtender="MaskedEditExtxtDOB"
                    ControlToValidate="txtDispalyDate" InvalidValueMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                    ValidationGroup="StudentForm" ErrorMessage="Date is invalid Enter format like (dd/MM/YYYY)"
                    EmptyValueMessage="*" Display="Dynamic"></cc1:MaskedEditValidator>
            </td>
        </tr>
        <tr>
            <td>
                Display Time
            </td>
            <td>
                <asp:DropDownList ID="ddlTime" runat="server" ValidationGroup="StudentForm" Width="200px">
                    <asp:ListItem Value="-1">--Select--</asp:ListItem>
                    <asp:ListItem Value="2:00 PM">2:00 PM</asp:ListItem>
                    <asp:ListItem Value="2:30 PM">2:30 PM</asp:ListItem>
                    <asp:ListItem Value="3:00 PM">3:00 PM</asp:ListItem>
                    <asp:ListItem Value="3:30 PM">3:30 PM</asp:ListItem>
                    <asp:ListItem Value="4:00 PM">4:00 PM</asp:ListItem>
                    <asp:ListItem Value="4:30 PM">4:30 PM</asp:ListItem>
                    <asp:ListItem Value="5:00 PM">5:00 PM</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="ReqddlTime" runat="server" ControlToValidate="ddlTime"
                    ErrorMessage="Select Time" InitialValue="-1" ValidationGroup="StudentForm" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<asp:Button ID="btnsubmit" runat="server" Text="Submit" CommandName="Insert"
                    CssClass="btn" OnClick="btnsubmit_Click" ValidationGroup="StudentForm" OnClientClick="tinymce.triggerSave(false,true);" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancel_Click"
                    CausesValidation="False" />
            </td>
        </tr>
    </table>
    <br />
    <fieldset>
        <legend>Message Details </legend>
        <asp:GridView ID="gvManageResult" runat="server" EmptyDataText="No Record Found"
            AutoGenerateColumns="False" DataKeyNames="MessageID" CssClass="GridWordWrap GridSpace"
            OnRowDataBound="gvManageResult_RowDataBound" OnRowDeleting="gvManageResult_RowDeleting"
            OnRowEditing="gvManageResult_RowEditing">
            <Columns>
                <asp:TemplateField HeaderText="S.No">
                    <ItemTemplate>
                        <span>
                            <%# Container.DataItemIndex +1 %></span>
                    </ItemTemplate>
                    <ItemStyle Width="10%" />
                </asp:TemplateField>
                <asp:BoundField HeaderText="Message Type" DataField="MessageType">
                    <ItemStyle Width="30%" />
                </asp:BoundField>
                <asp:BoundField HeaderText="Message Text" DataField="MessageText" HtmlEncode="False">
                    <ItemStyle Width="30%" Wrap="True" />
                </asp:BoundField>
                <asp:BoundField DataField="DisplayDate" HeaderText="Display Date" ItemStyle-CssClass="CM"
                    DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                    <ItemStyle CssClass="CM"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField HeaderText="Display Time" DataField="DisplayTime"></asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="Status">
                    <ItemStyle Width="10%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Action(s)">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Edit" CausesValidation="False"></asp:LinkButton>
                        <asp:Label ID="lblupdate" runat="server" Text="Label">|</asp:Label>
                        <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete"
                            OnClientClick="javascript:return confirm('Are you sure to delete this?');" CausesValidation="False"></asp:LinkButton>
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
