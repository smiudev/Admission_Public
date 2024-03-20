<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Documents.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.Documents"
    MasterPageFile="~/MasterPages/student.Master" MaintainScrollPositionOnPostback="false"
    ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <style>
        li
        {
            margin: 10px 0;
        }
    </style>
    <div>
        <span>Please upload following documents and complete your application process.</span>
        <p style="color: Red">
            Supported format (JPG,JPEG,PNG,BMP,gif,Png)<br />
            Maximum Photo size 2 MB
        </p>
    </div>
    <br />
    <div>
        <span>Form B / CNIC Selection <span style="color: red">*</span> </span>
        <asp:RadioButtonList ID="rdnCnicFormB" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rdnCnicFormB_SelectedIndexChanged"
            ValidationGroup="UploadDocuments">
            <asp:ListItem Value="CNIC">CNIC</asp:ListItem>
            <asp:ListItem Value="FormB">FormB</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="ReqdldValrdnCnicFormB" ErrorMessage="Please select CNIC or Form B.<br />"
            ControlToValidate="rdnCnicFormB" runat="server" Display="Dynamic" ValidationGroup="UploadDocuments" />
    </div>
    <br />
    <div>
        <div id="divCnicF" runat="server">
            CNIC (front)<span style="color: Red">*</span>
            <br />
            <asp:FileUpload ID="cnicFUpload" runat="server" />
            <%--<asp:RequiredFieldValidator ID="ReqdFldValcnicFUpload" runat="server" Display="Dynamic"
                ErrorMessage="Please Upload CNIC Front" ControlToValidate="cnicFUpload" ValidationGroup="UploadDocuments"
                SetFocusOnError="true">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExpValcnicFUpload" ValidationExpression="^([0-9a-zA-Z_\-~ :\\])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$"
                ControlToValidate="cnicFUpload" runat="server" ErrorMessage="Please select a valid Image "
                Display="Dynamic" ValidationGroup="UploadDocuments" />--%>
        </div>
        <div id="divCnicB" runat="server">
            CNIC (back)<span style="color: Red">*</span>
            <br />
            <asp:FileUpload ID="cnicBUpload" runat="server" />
            <%-- <asp:RequiredFieldValidator ID="ReqFldValcnicBUpload" runat="server" Display="Dynamic"
                ErrorMessage="Please Upload CNIC Back" ControlToValidate="cnicBUpload" ValidationGroup="UploadDocuments"
                SetFocusOnError="true">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExpValcnicBUpload" ValidationExpression="^([0-9a-zA-Z_\-~ :\\])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$"
                ControlToValidate="cnicBUpload" runat="server" ErrorMessage="Please select a valid Image "
                Display="Dynamic" ValidationGroup="UploadDocuments" />--%>
        </div>
        <%--for undergrades cnic or form b whatever applicable--%>
        <div id="divFormB" runat="server">
            Form B<span style="color: Red">*</span>
            <br />
            <asp:FileUpload ID="formbUpload" runat="server" />
        </div>
        <div id="divVoucher" runat="server">
            Voucher<span style="color: Red">*</span>
            <br />
            <asp:FileUpload ID="voucherUpload" runat="server" />
            <asp:RequiredFieldValidator ID="ReqFldValvoucherUpload" runat="server" Display="Dynamic"
                ErrorMessage="Please Upload Voucher" ControlToValidate="voucherUpload" ValidationGroup="UploadDocuments"
                SetFocusOnError="true">
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExpValvoucherUpload" ValidationExpression="^([0-9a-zA-Z_\-~ :\\])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$"
                ControlToValidate="voucherUpload" runat="server" ErrorMessage="Please select a valid Image "
                Display="Dynamic" ValidationGroup="UploadDocuments" />
        </div>
        <%--for postgraduat / graduate and undergrade with 2 14yr education = last degree required otherwiser SSC HSC--%>
        <div id="divTranscript" runat="server">
            Last Degree Transcipt<span style="color: Red">*</span>
            <br />
            <asp:FileUpload ID="lastdegreeUpload" runat="server" />
        </div>
        <div id="divSSC" runat="server">
            SSC Marksheet<span style="color: Red">*</span>
            <br />
            <asp:FileUpload ID="sscUpload" runat="server" />
        </div>
        <div id="divHSC" runat="server">
            HSC Marksheet<span style="color: Red">*</span>
            <br />
            <asp:FileUpload ID="hscUpload" runat="server" />
        </div>
    </div>
    <br />
    <div>
        <asp:Button ID="btnDocumentsUpload" runat="server" OnClick="btnDocumentsUpload_Click"
            Text="Upload Documents" CssClass="btn" ValidationGroup="UploadDocuments" />
    </div>
    <%--     <asp:RequiredFieldValidator ID="ReqdFldValphotoUpload" runat="server" Display="Dynamic"
                                ErrorMessage="Please Upload Photo" ControlToValidate="photoUpload" ValidationGroup="StudentForm"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegExpValUploadPhoto" ValidationExpression="^([0-9a-zA-Z_\-~ :\\])+(.jpg|.JPG|.jpeg|.JPEG|.bmp|.BMP|.gif|.GIF|.png|.PNG)$"
                                ControlToValidate="photoUpload" runat="server" ErrorMessage="Please select a valid Image "
                                Display="Dynamic" ValidationGroup="StudentForm" />
                            <asp:CustomValidator ID="PhotoUploadCustomValidator" runat="server" ControlToValidate="photoUpload"
                                ForeColor="Red" OnServerValidate="ValidateFileSize" Display="Dynamic" ValidationGroup="StudentForm"></asp:CustomValidator>--%>
    <br />
    <p>
        for any query, please contact<br />
        Admission Department
        <br />
        <%-- 021-99213307, 021-99213309 Dir. 021-99217501-3, Ext 225<br />--%>
        111- 111- 885, Ext 225<br />
        admission@smiu.edu.pk
    </p>
</asp:Content>
