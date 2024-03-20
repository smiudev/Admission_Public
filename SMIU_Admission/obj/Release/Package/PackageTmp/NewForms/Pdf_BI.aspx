<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pdf_BI.aspx.cs" Inherits="SMIU_Admission.NewForms.Pdf_BI"
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
                 Computer Based Test (CBT) was conducted at Sindh Madressatul Islam University on 23rd & 24th December 2023 for Admission Session <span runat="server" id="spanCurrentAdmission"></span> . Test was conducted for all provisionally eligible candidates of undergraduate programs, with a maximum of 60 marks. Candidates who appeared in the test can check their obtained marks from the below list. The interview schedule for successful candidates will be posted at Admission Portal on Friday, 29th December 2023.
                </span>                
                <br />
                <span>
                Candidates who appeared in the test can check their obtained marks from the below list.
                </span>
                <br />
            <%--    <span>
                    The interview schedule for successful candidates will be posted on Wednesday, 4th January 2023.
                </span>--%>
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
                    <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                    <asp:BoundField DataField="Marks" HeaderText="Marks (Out of 60)" />
                </Columns>
            </asp:GridView>
        </div>
    </fieldset>
</asp:Content>
