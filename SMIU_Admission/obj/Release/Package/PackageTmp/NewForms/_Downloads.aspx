<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_Downloads.aspx.cs" Inherits="SMIU_Admission.NewForms._Downloads" MasterPageFile="~/MasterPages/PortalMaster.master" %>

<asp:Content ID="cDashboard" ContentPlaceHolderID="contentScreen" runat="Server">
 <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false"><asp:Label ID="lblPanel" runat="server"></asp:Label></asp:Panel>

    <form id="formDownload" runat="server">
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <h4>Downloads Section</h4>
        </div>
    </div>
        <br />
        <br />
        <br />
    <div class="row" id="divFormVoucher" runat="server" visible="false">
        <div class="col-md-12">
            <asp:Button ID="btnApplicationForm" runat="server" Text="Download Application Form" CssClass="btn btn-primary" OnClick="btnApplicationForm_Click" />
        </div>
        
        <%--<div class="col-md-12">
            <asp:Button ID="btnFeeVoucher" runat="server" Text="Download HBL Fee Voucher" CssClass="btn btn-primary" OnClick="btnFeeVoucher_Click" />
        </div>--%>
        <div class="col-md-12">
            <br />
            <asp:Button ID="btnFeeVoucherHBL" runat="server" Text="Download Fee Voucher" CssClass="btn btn-primary" OnClick="btnFeeVoucherHBL_Click" />
        </div>
    </div>
        <br />
        <br />
    <div class="row">
        <div class="col-md-12">
            <a runat="server" ID="btnSampleTestPaper" visible="false" class="btn btn-primary" href="~/Document/SampleTestPaper.pdf" target="_blank" >Download Sample Test</a>
        </div>
        <br />
        <div class="col-md-12">                        
            <a runat="server" ID="btnProspectus" visible="false" class="btn btn-primary" href="~/Document/Prospectus.pdf" target="_blank" >Download Prospectus</a>            
        </div>
        <br />
        <div class="col-md-12">
            <asp:Button Text="Download Test Admit Card" ID="btnAdmitCard"  visible="false" runat="server" CssClass="btn btn-primary" OnClick="btnAdmitCard_Click" />
        </div>
        <div class="col-md-12">
            
        </div>
        <div class="col-md-12">
            
        </div>
        <div class="clearfix"></div>
    </div>
    </form>
</asp:Content>