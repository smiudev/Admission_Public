<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exam.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.Exam"
    MasterPageFile="~/MasterPages/student.Master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        
        <script src="/scripts/jquery.min.js" type="text/javascript"></script>


        <center>
            Entry Test -
            <asp:Label ID="lblSemesterName" runat="server" Text="Semester Name"></asp:Label>
        </center>
    </h1>
    <br />
    <div style="float: right;">
        <asp:HiddenField ID="hdnTimerMin" ClientIDMode="Static" runat="server" Value="59" />
        <asp:HiddenField ID="hdnTimerSec" ClientIDMode="Static" runat="server" Value="59" />
        <h1>
            <span>Minutes: </span>
            <asp:Label ID="lblTimerMin" runat="server" ClientIDMode="Static"></asp:Label>
            <span>Seconds: </span>
            <asp:Label ID="lblTimerSec" runat="server" ClientIDMode="Static"></asp:Label>
        </h1>
        <div id="Div1" runat="server">
            <asp:Button ID="btnSubmit" ClientIDMode="Static" runat="server" Text="Submit" OnClientClick="return "
                OnClick="btnSubmit_Click"  />
        </div>
    </div>
    <br />
    <script language="javascript" type="text/javascript">

        document.addEventListener("DOMContentLoaded", function (event) {
            document.getElementById("btnSubmit").style.display = "none";
            startTimer();
        });

        function ShowTimer() {
            var sec = document.getElementById("hdnTimerSec").value;
            if (sec > 0) {
                sec = sec - 1;
            }
            else {
                sec = 59;
                var min = document.getElementById("hdnTimerMin").value;
                min = min - 1;
                if (min > -1) {
                    /*if (min > 0) {*/
                    document.getElementById("hdnTimerMin").value = min;
                    document.getElementById("lblTimerMin").innerText = min;
                }
                else {
                    sec = 0;
                    stopTimer();
                }
            }
            document.getElementById("hdnTimerSec").value = sec;
            document.getElementById("lblTimerSec").innerText = sec;
        }

        var timer;
        function startTimer() {

            var sec = document.getElementById("hdnTimerSec").value;
            var min = document.getElementById("hdnTimerMin").value;
            document.getElementById("lblTimerMin").innerText = min;
            document.getElementById("lblTimerSec").innerText = sec;
            timer = setInterval(ShowTimer, 1000);
        }

        function stopTimer() {
            alert("Time Up!");
            clearInterval(timer);
            document.getElementById("btnSubmit").click();
        }

        function pauseTimer() {
            clearInterval(timer);
        }

        function Next() {
            pauseTimer();
            document.getElementById("btnNext").click();
        }

    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <script language="javascript" type="text/javascript">
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
    </script>
    <script language="javascript" type="text/javascript">
        $(function () {
            $(window).keydown(function (e) {
                if (e.keyCode == 13) {
                    e.preventDefault();
                    return false;
                }
            });
        })
    </script>
    <style type="text/css">
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            width: 300px;
            border: 3px solid #0DA9D0;
        }
        .modalPopup .header
        {
            background-color: #2FBDF1;
            height: 30px;
            color: White;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
        }
        .modalPopup .body
        {
            min-height: 50px;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
        }
        .modalPopup .footer
        {
            padding: 3px;
        }
        .modalPopup .yes, .modalPopup .no
        {
            height: 23px;
            color: White;
            line-height: 23px;
            text-align: center;
            font-weight: bold;
            cursor: pointer;
        }
        .modalPopup .yes
        {
            background-color: #2FBDF1;
            border: 1px solid #0DA9D0;
        }
        .modalPopup .no
        {
            background-color: #9F9F9F;
            border: 1px solid #5C5C5C;
        }
    </style>
    <asp:UpdatePanel ID="UpdPanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <br />
    <br />
    <div id="dvQuestion" runat="server">
        <h2>
            <asp:Label ID="lblQuestion" runat="server" />
            <asp:HiddenField ID="hdnQuestionID" runat="server" />
            <asp:HiddenField ID="hdnSerailNo" runat="server" />
        </h2>
        <asp:RadioButtonList ID="rbtnOptions" runat="server" CausesValidation="true" ViewStateMode="Enabled">
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="ReqdFieldValOption" ErrorMessage="Please select answer<br />"
            ControlToValidate="rbtnOptions" runat="server" ForeColor="Red" Display="Dynamic" />
        <br />
        <asp:Button ID="btnPrevious" Text="Previous" runat="server" OnClick="Previous" CssClass="btn"
            Width="120px" Height="50px" UseSubmitBehavior="false" CausesValidation="false"
            OnClientClick="if (!Page_ClientValidate()){ return false; }" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnNext" Text="Next" ClientIDMode="Static" runat="server" OnClick="Next"
            CssClass="btn" Width="120px" Height="50px" UseSubmitBehavior="false" OnClientClick="if (!Page_ClientValidate()){ return false; }" />
        <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup"
            PopupControlID="pnlpopup" CancelControlID="btnNo" BackgroundCssClass="modalBackground"
            BehaviorID="pnlpopup">
        </cc1:ModalPopupExtender>
        <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="100px" Width="400px"
            Style="display: none">
            <table>
                <tr>
                    <td colspan="3" style="margin-left: 50px;">
                        <center>
                            <b>Confirm Box</b></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" Text="Are you sure you want to submit the Entry Test?" />
                    </td>
                </tr>
                <tr>
                    <td align="right" style="padding-right: 15px">
                        <asp:Button ID="btnYes" OnClick="btnYes_Click" runat="server" CssClass="btn" Text="Yes"
                            Width="90px" Height="40px" />
                        <asp:Button ID="btnNo" runat="server" CssClass="btn" Text="No" Width="90px" Height="40px"
                            OnClientClick="return false;" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
      </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnNext" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnPrevious" EventName="Click" />
            <asp:PostBackTrigger ControlID="btnYes" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
