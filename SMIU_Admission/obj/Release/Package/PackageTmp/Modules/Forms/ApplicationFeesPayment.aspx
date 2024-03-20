<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationFeesPayment.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.ApplicationFeesPayment" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Receive Application Fees
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <style>
        th
        {
            text-align: left;
        }
    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[id*=chkHeader]").live("click", function () {
            var chkHeader = $(this);
            var grid = $(this).closest("table");
            $("input[type=checkbox]", grid).each(function () {
                if (chkHeader.is(":checked")) {
                    $(this).attr("checked", "checked");
                } else {
                    $(this).removeAttr("checked");
                }
            });
        });
        $("[id*=chkRow]").live("click", function () {
            var grid = $(this).closest("table");
            var chkHeader = $("[id*=chkHeader]", grid);
            if (!$(this).is(":checked")) {
                chkHeader.removeAttr("checked");
            } else {
                if ($("[id*=chkRow]", grid).length == $("[id*=chkRow]:checked", grid).length) {
                    chkHeader.attr("checked", "checked");
                }
            }
        });
    </script>
    <table>
        <tr>
            <td class="menu_list" style="width: 163px">
                Semester<span style="color: Red">*</span>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="ApplicationFee"
                    Width="200px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                    ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="ApplicationFee"
                    Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="menu_list" style="width: 163px">
                Reference/Tracking ID <span style="color: Red">*</span>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtReferenceID" runat="server" ToolTip="Reference/Tracking ID" Width="150px"
                    MaxLength="15" ValidationGroup="ApplicationFee" autocomplete="off"></asp:TextBox>
                <asp:RequiredFieldValidator ID="ReqFieldValtxtReferenceID" runat="server" ControlToValidate="txtReferenceID"
                    ErrorMessage="Please Enter Reference ID " ValidationGroup="ApplicationFee" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegExpValtxtReferenceID" runat="server" ErrorMessage="Please enter only digits"
                    ControlToValidate="txtReferenceID" Display="Dynamic" ValidationExpression="^[0-9]*$"
                    ValidChars="0123456789" ValidationGroup="ApplicationFee"></asp:RegularExpressionValidator>
                <cc1:FilteredTextBoxExtender ID="FlttxtExttxtReferenceID" runat="server" TargetControlID="txtReferenceID"
                    FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                </cc1:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click"
                    ValidationGroup="ApplicationFee" />
            </td>
        </tr>
    </table>
    <br />
    <div id="Paymentdetails" runat="server" visible="false">
        <fieldset>
            <legend>Fee Payment Details </legend>
            <br />
            <asp:GridView ID="gvManageApplicationFee" runat="server" EmptyDataText="No Record Found"
                AutoGenerateColumns="False" DataKeyNames="ReferenceID">
                <Columns>
                    <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <span>
                                <%# Container.DataItemIndex +1 %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText=" Reference ID" DataField="ReferenceID"></asp:BoundField>
                    <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                    <asp:BoundField HeaderText="Program" DataField="StudentProgram"></asp:BoundField>
                    <asp:BoundField HeaderText="Fee Type" DataField="FeeType"></asp:BoundField>
                    <asp:TemplateField HeaderText="Fee Amount" SortExpression="FeeAmount">
                        <ItemTemplate>
                            <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("FeeAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" ItemStyle-CssClass="CM"
                        DataFormatString="{0:MMM dd, yyyy}" HtmlEncode="false">
                        <ItemStyle CssClass="CM"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText=" Bank Name" DataField="BankName"></asp:BoundField>
                </Columns>
            </asp:GridView>
        </fieldset>
    </div>
    <div id="DocumentChecklist" runat="server" visible="false">
        <fieldset>
            <legend>Docuemnt CheckList</legend>
            <table>
                <tr>
                    <td>
                        <asp:GridView ID="grdDocumentCheckList" runat="server" AutoGenerateColumns="False"
                            EmptyDataText="No Record Found" DataKeyNames="DocumentChecklistId" CssClass="ContentTable"
                            OnRowDataBound="grdDocumentCheckList_RowDataBound">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <asp:CheckBox ID="chkHeader" runat="server" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkRow" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="DocumentName" HeaderText="Document" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </fieldset>
        <table>
            <tr>
                <td colspan="2">
                    &nbsp;<asp:Button ID="btnReceived" runat="server" Text="Received" CssClass="btn"
                        OnClick="btnReceived_Click" ValidationGroup="ApplicationFee" />
                    <asp:Button ID="btnAdmitCard" runat="server" Text="Generate Admit card" CssClass="btn"
                        OnClick="btnAdmitCard_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
