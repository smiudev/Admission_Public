<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/FrontPage.master"
    CodeBehind="Dashboard.aspx.cs" Inherits="SMIU_Admission.Dashboard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Contact Information</h1>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <style type="text/css">
        textarea
        {
            resize: none;
        }
    </style>
    <br />
    <br />
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <fieldset>
                <legend>Personal Information</legend>
                <br />
                <table width="100%">
                    <tr>
                        <td>
                            Category<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCategory" runat="server" ValidationGroup="EmpForm" Width="200px"
                                AutoPostBack="True" AppendDataBoundItems="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFldVCategory" runat="server" ControlToValidate="ddlCategory"
                                ErrorMessage="Select Category" InitialValue="-1" ValidationGroup="EmpForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            SubCategory<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlSubcategory" runat="server" ValidationGroup="EmpForm" Width="200px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFldValddlSubCategory" runat="server" ControlToValidate="ddlSubcategory"
                                ErrorMessage="Select SubCategory" InitialValue="-1" ValidationGroup="EmpForm"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Prefix<span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPrefix" runat="server" ValidationGroup="EmpForm" Width="200px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="ReqFlVddlPrefix" runat="server" ControlToValidate="ddlPrefix"
                                ErrorMessage="Select Prefix" InitialValue="-1" ValidationGroup="EmpForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtname" runat="server" MaxLength="100" ToolTip="Name" Width="200px"
                                ValidationGroup="EmpForm"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="ReqFdValtxtname" runat="server" ControlToValidate="txtname"
                                Display="Static" ErrorMessage="Please Enter Name" ValidationGroup="EmpForm"></asp:RequiredFieldValidator>--%>
                            <%-- <cc1:FilteredTextBoxExtender ID="fltrExtName" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtname">
                            </cc1:FilteredTextBoxExtender>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Surname/last name
                        </td>
                        <td>
                            <asp:TextBox ID="txtSurName" runat="server" MaxLength="100" ToolTip="Name" Width="200px"
                                ValidationGroup="EmpForm"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Designation
                        </td>
                        <td>
                            <asp:TextBox ID="txtDesignation" runat="server" MaxLength="100" ToolTip="Designation"
                                Width="200px" ValidationGroup="EmpForm"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="ReqflvtxtDesignation" runat="server" ControlToValidate="txtDesignation"
                                Display="Static" ErrorMessage="Please Enter Designation" ValidationGroup="EmpForm"></asp:RequiredFieldValidator>--%>
                            &nbsp;
                            <%-- <cc1:FilteredTextBoxExtender ID="fltExtxtDesignation" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtDesignation">
                            </cc1:FilteredTextBoxExtender>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Organization
                        </td>
                        <td>
                            <asp:TextBox ID="txtorganization" runat="server" MaxLength="100" ToolTip="Organization"
                                Width="200px" ValidationGroup="EmpForm"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="ReqflvtxtDesignation" runat="server" ControlToValidate="txtDesignation"
                                Display="Static" ErrorMessage="Please Enter Designation" ValidationGroup="EmpForm"></asp:RequiredFieldValidator>--%>
                            &nbsp;
                            <%-- <cc1:FilteredTextBoxExtender ID="FldtxtExtxtorganization" runat="server" FilterMode="InvalidChars"
                                FilterType="Custom" InvalidChars="~!@#$%^&*()_+}<{\|:?/>`1234567890-=][';," TargetControlID="txtorganization">
                            </cc1:FilteredTextBoxExtender>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server" MaxLength="100" ToolTip="Name" Width="200px"
                                ValidationGroup="EmpForm"></asp:TextBox>
                            <%-- <asp:RequiredFieldValidator ID="ReqFldVtxtCity" runat="server" ControlToValidate="txtCity"
                                Display="Static" ErrorMessage="Please Enter City" ValidationGroup="EmpForm"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Country
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCountry" runat="server" ValidationGroup="EmpForm" Width="200px">
                            </asp:DropDownList>
                            <%-- <asp:RequiredFieldValidator ID="ReqddlCountry" runat="server" ControlToValidate="ddlCountry"
                                ErrorMessage="Select Country" InitialValue="-1" ValidationGroup="EmpForm" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-mail
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="EmpForm"></asp:RequiredFieldValidator>--%>
                            <asp:RegularExpressionValidator ID="regExEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Invalid Email Address" ValidationExpression="^([\w-\.&]+)@([\w-]+\.)+[\w-]+"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlCategory" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <fieldset>
        <legend>Address Information</legend>
        <br />
        <table width="100%">
            <tr>
                <td colspan="2">
                    <strong>Office Address</strong>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="txtOfficeAddress" runat="server" TextMode="MultiLine" Rows="10"
                        ValidationGroup="EmpForm" Width="935px" CssClass="publication" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <strong>Residential Address</strong>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="txtresidentialAddress" runat="server" TextMode="MultiLine" Rows="10"
                        ValidationGroup="EmpForm" Width="935px" CssClass="publication" />
                </td>
            </tr>
            <%-- <tr>
                        <td>
                            Residential Address
                        </td>
                        <td>
                            <asp:TextBox ID="txtresidentialAddress" runat="server" ValidationGroup="EmpForm"
                                Width="700px" />
                            <cc1:FilteredTextBoxExtender ID="FilteredtxtresidentialAddress" runat="server" TargetControlID="txtresidentialAddress"
                                FilterMode="ValidChars" FilterType="UppercaseLetters,lowercaseLetters,Numbers,Custom"
                                ValidChars=" .,:;/*-=_+?'`|}{[]\)(^%$#@!~&quot;&amp;">
                            </cc1:FilteredTextBoxExtender>
                             <asp:RequiredFieldValidator ID="ReqFldVtxtresidentialAddress" runat="server" ControlToValidate="txtresidentialAddress"
                                ErrorMessage="Please Enter Address" ValidationGroup="EmpForm" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>--%>
            <tr>
                <td>
                    Land Line Number
                    <%--<span style="color: Red">*</span>--%>
                </td>
                <td>
                    <asp:TextBox ID="txtLandLineNumber" runat="server" ToolTip="Land Line Number" Width="400px"
                        MaxLength="100" ValidationGroup="EmpForm"></asp:TextBox>
                    <%-- <asp:RequiredFieldValidator ID="ReqLandLineNumber" runat="server" ControlToValidate="txtLandLineNumber"
                                ErrorMessage="Please Enter Land Line Number" ValidationGroup="EmpForm"></asp:RequiredFieldValidator>--%>
                    <%--<asp:RegularExpressionValidator ID="RegExptxtLandLineNumber" runat="server" ErrorMessage="Please enter only digits"
                                ControlToValidate="txtLandLineNumber" Display="Static" ValidationExpression="^[0-9]*$"
                                ValidChars="0123456789" ValidationGroup="EmpForm"></asp:RegularExpressionValidator>
                            <cc1:FilteredTextBoxExtender ID="FilteredLandLineNumber" runat="server" TargetControlID="txtLandLineNumber"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>--%>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile Number
                </td>
                <td>
                    <asp:TextBox ID="txtMobileNo" runat="server" MaxLength="100" ToolTip="Mobile Number"
                        Width="400px" ValidationGroup="EmpForm"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="ReqFldMobileNo" runat="server" ControlToValidate="txtMobileNo"
                                ErrorMessage="Please Enter Mobile Number" ValidationGroup="EmpForm"></asp:RequiredFieldValidator>--%>
                    <%-- <cc1:FilteredTextBoxExtender ID="FilteredtxtMobileNo" runat="server" TargetControlID="txtMobileNo"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>--%>
                </td>
            </tr>
            <tr>
                <td>
                    Fax Number
                </td>
                <td>
                    <asp:TextBox ID="txtFaxNumber" runat="server" MaxLength="100" ToolTip="Fax Number"
                        Width="400px" ValidationGroup="EmpForm"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="ReqFldMobileNo" runat="server" ControlToValidate="txtMobileNo"
                                ErrorMessage="Please Enter Mobile Number" ValidationGroup="EmpForm"></asp:RequiredFieldValidator>--%>
                    <%-- <cc1:FilteredTextBoxExtender ID="FilteredtxtMobileNo" runat="server" TargetControlID="txtMobileNo"
                                FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
                            </cc1:FilteredTextBoxExtender>--%>
                </td>
            </tr>
            <tr>
                <td>
                    Preferred Address<span style="color: Red">*</span>
                </td>
                <td>
                    <asp:RadioButtonList ID="RdnPreferredAddress" runat="server">
                        <asp:ListItem>Office Address</asp:ListItem>
                        <asp:ListItem>Residential Address</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqdValRdnPreferredAddress" runat="server" ControlToValidate="RdnPreferredAddress"
                        Display="Static" ErrorMessage="Please mark  Preferred Address" ValidationGroup="EmpForm"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </fieldset>
    <br />
    <table>
        <tr>
            <td colspan="2">
                &nbsp;<asp:Button ID="btnSubmit" runat="server" Text="Submit" CommandName="Insert"
                    CssClass="btn" ValidationGroup="EmpForm"  />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn" CausesValidation="False" />
            </td>
        </tr>
    </table>
</asp:Content>
