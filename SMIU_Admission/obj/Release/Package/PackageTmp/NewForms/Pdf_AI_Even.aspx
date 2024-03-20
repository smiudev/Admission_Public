<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pdf_AI_Even.aspx.cs" Inherits="SMIU_Admission.NewForms.Pdf_AI_Even"
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
    <%-- <div id="Enroll" runat="server" visible="false" style="overflow: Auto; max-height: 850px;
        width: 100%;">
        <br />--%>
    <fieldset>
        <legend>Student 1st Merit List Details</legend>
        <div id="ExportToExcel" runat="server">
            <div style="display: block; float: right;">
                <%--<asp:Button ID="btnback" OnClick="btnback_Click" Text="Back" runat="server" CssClass="btn" />--%>
            </div>
            <table width="100%" border="1">
                <tr>
                    <td style="width: 50%; text-align: center;" colspan="14">
                        <strong>Result Admissions -
                            <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label>
                        </strong>
                        <br />

                    </td>
                </tr>
            </table>
            <br />
            <table width="100%" border="1">
                <tr>
                    <td style="width: 50%; text-align: center;" colspan="14">
                        <strong>Student(s)List - Undergraduate (Evening) </strong>
                        <br />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="grdStudent" runat="server" AutoGenerateColumns="False" EmptyDataText="No Record Found"
                DataKeyNames="StudentID">
                <Columns>
                    <%-- <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:BoundField HeaderText="Student ID" DataField="StudentID"></asp:BoundField>
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="ProgramName" HeaderText="Program" />
                    <asp:BoundField DataField="Weightage" HeaderText="Merit Score" />
                    <%--<asp:BoundField DataField="WaitingList" HeaderText="Waiting List" />--%>
                </Columns>
            </asp:GridView>
            <br />
            <span>
                <strong>Note: </strong>
                The university reserves the right to correct any omission/typographical errors, etc. The students who are found “Ineligible” at any stage of the admission process shall be removed from the Merit List without further notice. In case a program is not offered by the University, the fee will be refunded as per policy.
            </span>
        </div>
    </fieldset>
</asp:Content>
