<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadMeritList.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.UploadMeritList" MasterPageFile="~/MasterPages/student.Master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Manage Student Interview Schedule
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <script type="text/javascript">
        window.onsubmit = function () {
            if (Page_IsValid) {
                var updateProgress = $find("<%= updProgressEnrollment.ClientID %>");
                window.setTimeout(function () {
                    updateProgress.set_visible(true);
                }, 100);
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdPnl" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <br />
            <fieldset>
                <legend>Upload</legend>
                <br />
                <table>
                    <tr>
                        <td style="width: 164px">
                            Semester<span style="color: Red">*</span>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="ddlSemester" runat="server" ValidationGroup="UploadFile" Width="200px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvddlddlSemester" runat="server" ControlToValidate="ddlSemester"
                                ErrorMessage="Select Semester" InitialValue="-1" ValidationGroup="UploadFile"
                                Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 164px">
                            Upload Merit List
                        </td>
                        <td>
                            <asp:FileUpload ID="flUpldExcelFile" runat="server" />
                            <asp:RequiredFieldValidator ID="ReqdFldValFileUpload" runat="server" Display="Dynamic"
                                ErrorMessage="Please Choose a file!" ControlToValidate="flUpldExcelFile" ValidationGroup="UploadFile"
                                SetFocusOnError="true">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpValUploadFile" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.xls|.xlsx)$"
                                ControlToValidate="flUpldExcelFile" runat="server" ErrorMessage="Only Excel files are allowed!"
                                Display="Dynamic" ValidationGroup="UploadFile" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn" OnClick="btnSubmit_Click"
                                Text="Browse & Submit" ValidationGroup="UploadFile" />
                            <asp:UpdateProgress ID="updProgressEnrollment" runat="server" AssociatedUpdatePanelID="UpdPnl">
                                <ProgressTemplate>
                                    <asp:Image ID="updImageEdu" runat="server" ImageUrl="~/Images/loading.gif" ImageAlign="Middle" />
                                    <b>Data is Loading Please wait....</b></ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                </table>
                <br />
            </fieldset>
            <br />
            <div id="Enroll" runat="server" visible="false" style="overflow: Auto; max-height: 450px;
                width: 100%;">
                <br />
                <fieldset>
                    <legend>Student Merit List Details</legend>
                    <div id="ExportToExcel" runat="server">
                        <table width="100%" border="1">
                            <tr>
                                <td style="width: 50%; text-align: center;" colspan="14">
                                    <strong>Student(s)List -
                                        <asp:Label ID="lblSemesterName" runat="server" Text="SemesterName"></asp:Label>
                                    </strong>
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="grdStudent" runat="server" AutoGenerateColumns="False" EmptyDataText="No Record Found"
                            DataKeyNames="StudentID">
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Student ID" DataField="StudentID"></asp:BoundField>
                                <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                                <asp:BoundField DataField="ProgramName" HeaderText="Program" />                               
                            </Columns>
                        </asp:GridView>
                    </div>
                </fieldset>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
