<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="thanks_exam.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.thanks_exam"
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
     <h1>
        Dear <asp:Label ID="lblStudentName" runat="server" Text="Candidate"></asp:Label>,
    </h1>
    <p>
        <ol>
            <li>Your test has been submitted successfully. You are suggested to visit admission portal frequently.</li>
            <li>Test result and Interview schedule of passed candidates will be announced on admission portal.</li>
            <li>At the time of interview, please bring all required documents (Attested Copies and
                Originals) for submission and verification. Details of required documents are available
                on SMIU Website.</li>
            <li>Please report 30 minutes before the allocated time for interview. Candidate arriving
                late will be marked late and no re-interview will be conducted.</li>
            <li>Only successful candidates after interview will be awarded admission letters.</li>
        </ol>
    </p>
    <br />
    <%--<p>
        <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Click here " />
        to close your account.
    </p>--%>
    
    <br />
    <br />
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
