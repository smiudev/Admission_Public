<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeesInstallmentOLD.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.FeesInstallmentOLD" MaintainScrollPositionOnPostback="false"
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
                        &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click"
                            ValidationGroup="SemesterFee" />
                         <asp:Button ID="btnChallan" runat="server" CssClass="btn" OnClick="btnChallan_Click"
     Text="Download Installment Fee Voucher" />
                    </td>
                </tr>
            </table>
            <br />
            <div id="studentdetails" runat="server" visible="false">
                <fieldset>
                    <legend>Semester Fee Details </legend>
                    <br />
                    <asp:GridView ID="gvManageStudentTermFee" runat="server" EmptyDataText="No Record Found"
                        AutoGenerateColumns="False" DataKeyNames="StudentID">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <span>
                                        <%# Container.DataItemIndex +1 %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Student ID" DataField="StudentID"></asp:BoundField>
                            <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                            <asp:BoundField HeaderText="Program" DataField="FirstChoice"></asp:BoundField>
                            <asp:BoundField HeaderText="Fee Type" DataField="FeeType"></asp:BoundField>
                            <asp:TemplateField HeaderText="Tuition Fee" SortExpression="TotalCoursesFee">
                                <ItemTemplate>
                                    <asp:Label ID="lblCourseFee" runat="server" Text='<%# Eval("TotalCoursesFee") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Fee Amount" SortExpression="TotalSemesterFee">
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("TotalSemesterFee") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
            </div>
            <fieldset id="FeesInstallmentDetails" runat="server" visible="false">
                <legend>Fees Installment</legend>
                <br />
                <table>
                    <tr>
                        <td class="style1">
                            Tuition Fees <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTuitionFees" runat="server" ValidationGroup="TuitionFees" autocomplete="off"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            Remarks
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Width="900px" Height="80px"
                                Text="First Installament" />
                            <cc1:FilteredTextBoxExtender ID="FltEtxtRemarks" runat="server" TargetControlID="txtRemarks"
                                FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td colspan="2">
                           
                        </td>
                    </tr>
                </table>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnChallan" />
            <asp:PostBackTrigger ControlID="btnSearch" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
