<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thanks.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.thanks"
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
    <%--  <script language="javascript" type="text/javascript">
        function disableback() {
            if (event.keyCode == 8 || event.keyCode == 37) // 8 -> BackSpace ; 37 -> Left Arrow
            {
                return false;
            }
            else {
                return true;
            }
        }

        function disableEnterKey() {
            if (event.keyCode == 13) {
                return false;
            }
            else {
                return true;
            }
        }


        function disableRefresh() {
            if (event.keyCode == 116) {
                return false;
            }
            else {
                return true;
            }
        }

        function disableCtrlKeyCombination(e) {
            var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j');
            var key;
            var isCtrl;
            if (window.event) {
                key = window.event.keyCode;
                if (window.event.ctrlKey)
                    isCtrl = true;
                else
                    isCtrl = false;
            }
            else {
                key = e.which;
                if (e.ctrlKey)
                    isCtrl = true;
                else
                    isCtrl = false;
            }
            if (isCtrl) {
                for (i = 0; i < forbiddenKeys.length; i++) {
                    if (forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase()) {
                        alert('Key combination CTRL + ' + String.fromCharCode(key) + ' has been disabled.');
                        return false;
                    }
                }
            }
            return true;
        }
    </script>
    <script language="javascript" type="text/javascript">
        window.history.forward(1);
        document.attachEvent("onkeydown", my_onkeydown_handler);
        function my_onkeydown_handler() {
            switch (event.keyCode) {
                case 116:
                    event.returnValue = false;
                    event.keyCode = 0;
                    window.status = "We have disabled F5";
                    break;
            }
        }
        document.onmousedown = disableclick;
        status = "Right Click is not allowed";
        function disableclick(e) {
            if (event.button == 2) {
                alert(status);
                return false;
            }
        }
    </script>
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
    </script>--%>
    <%-- <h1>
        Dear
        <asp:Label ID="lblStudentName" runat="server" Text="StudentName" Visible="false"></asp:Label>
    </h1>
    <p>
        <ol>
            <li>Your test has been submitted successfully. Test results will be announced <strong>
                3:00 pm on 6th January 2021</strong> and can be checked through admission portal.</li>
            <li>At the time of interview, please bring all required documents (Attested Copies and
                Originals) for submission and verification. Details of required documents are available
                on SMIU Website.</li>
            <li>Please report 30 minutes before the allocated time for interview. Candidate arriving
                late will be marked late and no re-interview will be conducted.</li>
            <li>Only successful candidates after interview will be awarded admission letters.</li>
        </ol>
    </p>--%>
    <h1>
        Your Reference Number / Tracking ID is
        <asp:Label ID="lblReferenceNumber" runat="server" Text="ReferenceNumber" Visible="false"></asp:Label>
    </h1>
    <%--<p>
        Thank you for applying at SMI University. Please follow the below steps to deposit
        the Application Fee and obtain Admit card to appear in the Entrance Test, Collect
        Admission kit including SMIU Prospectus and Sample test paper.</p>--%>
    <%--<p>
        Your documents have been uploaded successfully. Scrutinization of documents will take a week, 
        you are requested to visit the portal after a week to check the status of your application.
         You can download university's prospectus and test format paper fromt he links given below.</p>--%>
        <p>
        Thank you for applying at SMI University. 
        <br />
    </p>
    <div runat="server" id="divDocUpload">
    <ol>
        <li>Please download Application Fee Voucher and Admission form from the link available below.</li>
        <li>The Admission Processing Fee can be deposited at any online Branch of Habib bank
            Limited.</li>
        <%-- <li>Please submit copy of deposited Slip of bank challan (office Copy) at Admission
            Department of Sindh Madressatul Islam University along with all required attested
            documents. </li>
        <li>Please bring Admit card on the test date as mentioned on the Admit card. </li>--%>
    </ol>
    <br />
    <asp:Button ID="btnAdmissionFOrm" runat="server" OnClick="btnAdmissionFOrm_Click"
        Text="Download Application Form" CssClass="btn" />
    <asp:Button ID="btnChallan" runat="server" Text="Download Application Fee Voucher"
        CssClass="btn" OnClick="btnChallan_Click" />
    <br />
    <br />
    <div id="uploadDocuments" runat="server">
        <p>
            3. Click the button below to upload deposited Fee Voucher along with all the required documents to complete your
            admission process.</p>
        <asp:Button ID="btnUploadDocuments" runat="server" Text="Upload Documents" CssClass="btn"
            OnClick="btnUploadDocuments_Click" />
    </div>
        </div>

    <div id ="IsDocumentSubmitted" runat ="server" visible ="false">
    <p>
        Your documents have been uploaded successfully. Scrutinization of documents will take a week, 
        you are requested to visit the portal after a week to check the status of your application.
        <%--You can download university's prospectus and test format paper from the links given below.--%>
        </p>    
        <br />
        <span runat="server">Please keep visiting Admission Portal frequently for futher updates.</span>
        <br />
        <br />
        <a class="btn" style="color:blue;padding-left:20px;padding-right:20px;display:none;" href="https://www.smiu.edu.pk/admissions/" target="_blank" >Check Calender for Admissions Spring 2023</a>
    </div>
    <br />
    <div id ="IsFeesReceived" runat ="server" visible ="false">
        <p>
          <span>Your application has been accepted.</span>          
          <span id="spanMessage" runat="server">Please keep visiting Admission Portal frequently for futher updates.</span>
        </p>
        <br />
        <br />
        <a class="btn" style="color:blue;padding-left:20px;padding-right:20px;" href="https://www.smiu.edu.pk/admissions/" target="_blank" >Check Calender for Admissions Spring 2023</a>
        <br />
        <br />
        <a runat="server" ID="ProspectusData" class="btn" style="color:blue;padding-left:20px;padding-right:20px;" href="~/Document/Prospectus.pdf" target="_blank" >Download Prospectus</a>
        <br />
        <br />
        <div id="OnlyUndergraduate" runat="server" visible="false">
            <a runat="server" ID="SampleData" class="btn" style="color:blue;padding-left:20px;padding-right:20px;" href="~/Document/SampleTestPaper.docx" target="_blank" >Download Sample Test</a>
            <br />
            <br />
            <p runat="server" ID="AdmitCardData">
                <strong style="color:red">New </strong> Your Admit card is ready to download.
                <br />
                <asp:Button Text="Download Admit Card" runat="server" CssClass="btn" OnClick="btnAdmitCard_Click" />
                <br />
                <span><strong>Note. </strong> If there is an issue in generating your Admit Card, You are advised to contact Admission Department.</span>
            </p>
            <%--<br />
            <br />
            <p runat="server" ID="TestData">
            </p>--%>
        </div>
        <%--<br />
        <p runat="server" ID="InterviewData">            
        </p>--%>
    </div>
    
    <br />
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
