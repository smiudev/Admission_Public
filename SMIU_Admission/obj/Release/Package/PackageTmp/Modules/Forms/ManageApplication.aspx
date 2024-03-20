<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageApplication.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.ManageApplication" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" MasterPageFile="~/MasterPages/FrontPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Application
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
                        <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="ManageApplication"
                            Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlSemester_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvddlSemester" runat="server" ControlToValidate="ddlSemester"
                            ErrorMessage="Please Select Semester" InitialValue="-1" ValidationGroup="ManageApplication"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    <tr>
                        <td class="menu_list" style="width: 163px">
                            Fee Status<span style="color: Red">*</span>
                        </td>
                        <td colspan="2">
                        <asp:DropDownList ID="ddlStatus" runat="server" ValidationGroup="ManageApplication"
                            Width="200px" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                            <asp:ListItem Text="Approved" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Not Approved" Value="0"></asp:ListItem>
                            <%--<asp:ListItem Text="All" Value="All"></asp:ListItem>--%>
                        </asp:DropDownList>
                    </td>
                    </tr>
                    
                </tr>
            </table>
            <br />
            <div id="Applicationdetails" runat="server">
                <fieldset>
                    <legend>Application Details </legend>
                    <br />
                    <asp:GridView ID="gvManageApplication" runat="server" EmptyDataText="No Record Found"
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
                            <%-- <asp:TemplateField HeaderText="Fee Amount" SortExpression="FeeAmount">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtAmount" runat="server" Text='<%# Eval("FeeAmount") %>' Width="50px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ReqFieldValtxtAmount" runat="server" ControlToValidate="txtAmount"
                                        ErrorMessage="Please Enter Fee Amount " ValidationGroup="ManageApplication" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegExpValtxtAmount" runat="server" ErrorMessage="Please enter only digits"
                                        ControlToValidate="txtAmount" Display="Dynamic" ValidationExpression="^\d{1,4}$"
                                        ValidChars="0123456789" ValidationGroup="ManageApplication"></asp:RegularExpressionValidator>
                                    <cc1:FilteredTextBoxExtender ID="FlttxtExttxttxtAmount" runat="server" TargetControlID="txtAmount"
                                        FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                                    </cc1:FilteredTextBoxExtender>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Approved">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkApprove" runat="server" AutoPostBack="true" OnCheckedChanged="chkApprove_OnCheckedChanged" 
                                        Checked='<%# Convert.ToBoolean(Eval("Approved")) %>' Text='<%# Eval("Approved").ToString().Equals("True") ? " Approved " : " Not Approved " %>'
                                        />
                                    <asp:HiddenField ID="hdnFeeAmount" runat="server" Value='<%# Eval("FeeAmount") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <%--<asp:TemplateField HeaderText="Reject">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkReject" runat="server" AutoPostBack="true" OnCheckedChanged="chkReject_OnCheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Remarks">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtRemarks" Text='<%# Eval("Remarks")%>' runat="server" Width="200px" Height="30px" autocomplete ="Off"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlSemester" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="gvManageApplication" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
