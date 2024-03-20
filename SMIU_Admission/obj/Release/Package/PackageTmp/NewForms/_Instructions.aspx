<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_Instructions.aspx.cs" Inherits="SMIU_Admission.NewForms._Instructions" MasterPageFile="~/MasterPages/PortalMaster.master" %>

<asp:Content ID="cDashboard" ContentPlaceHolderID="contentScreen" runat="Server">
 <asp:Panel ID="pnlMsg" runat="server" CssClass="error" Visible="false"><asp:Label ID="lblPanel" runat="server"></asp:Label></asp:Panel>

<script language="javascript" type="text/javascript">
     window.history.forward(1);
     document.attachEvent("onkeydown", setClipBoardData);
     function setClipBoardData() {
         setInterval("window.clipboardData.setData('text','')", 20);
     }
     function blockError() {
         window.location.reload(true);
         return true;
     }
    window.onerror = blockError;             



</script>
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <h4>Instructions</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <ul>
                <li>Test Test Test Test</li>
                <li>Test Test Test Test</li>
                <li>Test Test Test Test</li>
                <li>Test Test Test Test</li>
            </ul>
        </div>
    </div>
</asp:Content>