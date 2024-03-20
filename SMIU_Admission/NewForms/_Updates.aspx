<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_Updates.aspx.cs" Inherits="SMIU_Admission.NewForms._Updates" MasterPageFile="~/MasterPages/PortalMaster.master" %>

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
            <h4>Application Updates</h4>
        </div>
    </div>
    <br />
    <br />
    <div class="row">
        <div class="col-md-12" style="font-size:medium;">
            <div style="padding:5px;" id="txtTracking" runat="server" visible="false">
                Your tracking reference number is: STUDENTID. You will need it in further application processes. 
            </div>
            <div style="padding:5px;" id="liBeforeSubmit" runat="server" visible="false">
                        Thanking for choosing SMI University.
                        <br />
                        Fill the Admission form, download fee voucher and upload the deposited fee voucher along with all the required documents before the deadline.
            </div>
            <div style="padding:5px;" id="liAfterSubmission" runat="server" visible="false">
                        Your admission form has been submitted successfully.
                        <br />
                        <br />
                        Fee Voucher for Admission Processing Fee is available at <strong>"Preview & Print" or "Downloads Section"</strong>
            </div>
            <br />

            <div style="padding:5px;" id="liAfterDocuments" runat="server" visible="false">
                    Your documents have been uploaded successfully. 
                    <br />
                    <br />
                    Scrutinization of documents will take some time, you are requested to visit the portal frequently to check the status of your application.
                    <br />                    
                    Once your documents are verified, you will be able to download Prospectus and Admit Card.                    
                    <br />
                    <br />
                    <%--<strong style="color:red">NEW | </strong>Sample Test Paper has been uploaded. You can download it from the "Downloads" Section. (for Undergraduates only)--%>
            </div>
            <div style="padding:5px;" id="liAfterApproval" runat="server" visible="false">
                    Your application has been accepted after verifying your documents.
                    <br />    
                    <span id="spanAfterApprovalContent" runat="server">You will be able to download Prospectus, Admit Card and Sample Test Paper (for Undergraduates only) shortly.</span>
                    <br /> 
                    <br /> 
                    <br />    
                    <span id="spanTestPaper" runat="server" visible="false"><strong style="color:red"></strong>Sample Test Paper has been uploaded. You can download it from the "Downloads" Section. (for Undergraduate program only)</span>    
                    <br />    
                    <span id="spanProspectus" runat="server" visible="false">The Admission Spring 2024 Propspectus is now available in "Downloads" Section.</span>    
                    <br />        
                    <span id="spanAdmitCard" runat="server" visible="false"><strong style="color:red"></strong>Your Admit Card is ready. You can download it from the "Downloads" Section.  (for Undergraduate program only)</span>
                    <br />       
                    <br />       
                    <span id="spanResult" runat="server" visible="false"><strong style="color:red"></strong>Computer Based Result has been announced. Interview Schedule will be posted as per Academic Calender Schedule.</span>    
                    <br />
                    <br />
                    <span id="spanMerit" runat="server" visible="false"><strong style="color:red"></strong>The 1<sup>st</sup> Merit List has been announced. Please visit the "Result" Section. You are suggested to visit Admission portal frequently for further updates.</span>    
                    <br />
                    <br />
                    <span id="spanMerit2" runat="server" visible="false"><strong style="color:red"></strong>The 2<sup>nd</sup> Merit list has been updated. Candidates who couldn't qualify in 1<sup>st</sup> Merit List are suggested to check "Result" Section.</span>    
                    <br />
                    <br />
                    <span id="spanMerit3" runat="server" visible="false"><strong style="color:red">NEW | </strong><strong>The 3<sup>rd</sup> Merit list has been updated. Candidates who couldn't qualify in 2<sup>nd</sup> Merit List are suggested to check "Result" Section.</strong></span>    
                    <br />
                    <br />
                    <span id="spanOrientation" runat="server" visible="false"><strong style="color:red">NEW | </strong><strong>The Orientation Schedule has been published. <a href="https://www.smiu.edu.pk/admissions/orientation">Check Orientation Schedule here.</a></strong></span>    

                    <div id="liMasterPhD" runat="server" visible="false">
                    </div>
            </div>

        </div>
    </div>
</asp:Content>