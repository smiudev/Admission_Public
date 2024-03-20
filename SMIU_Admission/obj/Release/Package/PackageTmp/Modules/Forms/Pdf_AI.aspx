<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pdf_AI.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.Pdf_AI"
    MasterPageFile="~/MasterPages/student.Master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <script language="javascript" type="text/javascript">
        function disableselect(e) {
            return false
        }
        function reEnable() {
            return true
        }

        document.onselectstart = new Function("return false")


        if (window.sidebar) {
            document.onmousedown = disableselect                    // for mozilla           
            document.onclick = reEnable
        }

        function clickIE() {
            if (document.all) {
                (message);
                return false;
            }
        }


        document.oncontextmenu = new Function("return false")

        var element = document.getElementById('tbl');

        element.onmousedown = function () { return false; }        // mozilla         

    </script>
    <fieldset>
        <legend runat="server" id="legendCurrentAdmission"></legend>
        <div id="ExportToExcel" runat="server">
            <%--<div style="display: block; float: right;">
                <asp:Button ID="btnback" OnClick="btnback_Click" Text="Back" runat="server" CssClass="btn" />
            </div>--%>
            <br />
            <p>
                <span>
                For admissions <span runat="server" id="spanCurrentAdmission"></span>, Computer Based Test (CBT) was conducted 
                at Sindh Madressatul Islam University, while following Covid-19 SOPs. 
                Test was conducted for all eligible candidates of undergraduate programs, 
                with maximum of 60 marks distributed in following equal sections of 15 marks each: 
                </span>
                <ul>
                    <li>* English</li>
                    <li>* Mathematics</li>
                    <li>* Intelligent Quotient (IQ)</li>
                    <li>* General Knowledge</li>
                </ul>
                <br />
                <span>
                Candidates who appeared in the test can check their obtained marks from the below list.
                </span>
            </p>
            <br />
            <table width="100%" border="1">
                <tr>
                    <td style="width: 50%; text-align: center;" colspan="14">
                        <strong>Candidate List - 
                            <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label>
                        </strong>
                        <br />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="grdStudent" runat="server" AutoGenerateColumns="False" EmptyDataText="No Record Found"
                DataKeyNames="StudentID">
                <Columns>
                    <asp:BoundField HeaderText="Student ID" DataField="StudentID"></asp:BoundField>
                    <asp:BoundField DataField="Marks" HeaderText="Marks (Out of 60)" />
                </Columns>
            </asp:GridView>
        </div>
    </fieldset>
</asp:Content>
