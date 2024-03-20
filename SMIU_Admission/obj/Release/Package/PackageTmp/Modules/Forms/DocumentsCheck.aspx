<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentsCheck.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.DocumentsCheck"
    MasterPageFile="~/MasterPages/FrontPage.master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <style>
        li {
            margin: 10px 0;
        }
    </style>
    <div>
        <label>Student's Reference ID: </label>
        <asp:TextBox ID="btnStudentID" runat="server" ValidationGroup="Documentcheck"> </asp:TextBox>        

        <%--<asp:RequiredFieldValidator ID="ReqFieldValtxtReferenceID" runat="server" ControlToValidate="btnStudentID"
            ErrorMessage="Please Enter Reference ID " ValidationGroup="Documentcheck"
            Display="Dynamic"></asp:RequiredFieldValidator>--%>
        <%--<asp:RegularExpressionValidator ID="RegExpValtxtReferenceID" runat="server" ErrorMessage="Please enter only digits"
            ControlToValidate="btnStudentID" Display="Dynamic" ValidationExpression="^\d{1,4}$"
            ValidChars="0123456789" ValidationGroup="Documentcheck"></asp:RegularExpressionValidator>--%>
        <%--  ValidationExpression="^[0-9]*$"--%>
        <cc1:FilteredTextBoxExtender ID="FlttxtExttxtReferenceID" runat="server" TargetControlID="btnStudentID"
            FilterMode="ValidChars" FilterType="Numbers" ValidChars="0123456789">
        </cc1:FilteredTextBoxExtender>



        <asp:Button ID="btnDocumentsSearch" runat="server" OnClick="btnDocumentsSearch_Click"
            Text="Search Documents" CssClass="btn"  ValidationGroup="Documentcheck"/>
        <br />
        <label>(If you want to browse documents of all students, leave Reference ID blank.)</label>
    </div>
    <asp:GridView runat="server" ID="dtDocuments" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField HeaderText="SNo." DataField="SNo" />
            <asp:BoundField HeaderText="Reference ID" DataField="Reference" />
            <asp:BoundField HeaderText="Student Name" DataField="Name" />
            <asp:BoundField HeaderText="First Choice" DataField="FirstChoice" />
            <asp:BoundField HeaderText="Form B" DataField="FormB" HtmlEncode="False" DataFormatString="<a target='_blank' href='{0}'>FormB</a>" />
            <asp:BoundField HeaderText="CNIC Front" DataField="CNICF" HtmlEncode="False" DataFormatString="<a target='_blank' href='{0}'>CNICF</a>" />
            <asp:BoundField HeaderText="CNIC Back" DataField="CNICB" HtmlEncode="False" DataFormatString="<a target='_blank' href='{0}'>CNICB</a>" />
            <asp:BoundField HeaderText="Voucher" DataField="Voucher" HtmlEncode="False" DataFormatString="<a target='_blank' href='{0}'>Voucher</a>" />
            <asp:BoundField HeaderText="SSC" DataField="SSC" HtmlEncode="False" DataFormatString="<a target='_blank' href='{0}'>SSC</a>" />
            <asp:BoundField HeaderText="HSC" DataField="HSC" HtmlEncode="False" DataFormatString="<a target='_blank' href='{0}'>HSC</a>" />
            <asp:BoundField HeaderText="Last Degree" DataField="LastDegree" HtmlEncode="False" DataFormatString="<a target='_blank' href='{0}'>LastDegree</a>" />
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>
