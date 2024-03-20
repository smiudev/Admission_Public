<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CpeFormSubmissionReport.aspx.cs"
    Inherits="SMIU_Admission.Modules.Reports.CpeFormSubmissionReport" MasterPageFile="~/MasterPages/FrontPage.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        MTC Workshop Form Submission Report
        <br />
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <%-- <fieldset>
                <legend>Search Parameter</legend>
                <br />
                <table class="tbl">
                    <tr>
                        <td>
                            Course
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCourses" runat="server" ValidationGroup="CpeForm" Width="200px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Student Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtStudentName" runat="server" ToolTip="StudentName" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn" OnClick="btnAdd_Click" Text="Show Report"
                                ValidationGroup="CpeForm" />
                        </td>
                    </tr>
                </table>
            </fieldset>--%>
            <fieldset id="MainReport" runat="server" visible="false">
                <legend>MTC Workshop Form Submission Report</legend>
                <br />
                <div style="display: block; float: right;">
                    <asp:Button ID="btnExporttoExcel" OnClick="btnExporttoExcel_Click" Text="Export to Excel"
                        runat="server" CssClass="btn" />
                </div>
                <div id="ExportToExcel" runat="server" style="overflow-x: auto; width: 960px; max-height: 450px;">
                    <table width="100%" border="1">
                        <tr>
                            <td style="width: 50%; text-align: center;" colspan="32">
                                <strong>MTC Workshop Form Submission Report - 2021 </strong>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="grdcpeapplicationformSubmition" runat="server" AutoGenerateColumns="false"
                        DataKeyNames="StudentID" EmptyDataText="No Record Found" ShowFooter="false">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StudentName" HeaderText="Name" />
                            <asp:BoundField DataField="FatherName" HeaderText="Father Name" />
                            <asp:BoundField DataField="CNICNumber" HeaderText="CNIC Number" />
                            <asp:BoundField DataField="BirthDate" HeaderText="Date Of Birth" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />                          
                            <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
                            <asp:BoundField DataField="MobileNumber" HeaderText="Mobile Number" />
                            <asp:BoundField DataField="AddressPostal" HeaderText="Postal Address" />
                            <asp:BoundField DataField="DegreeName" HeaderText="last Degree" />
                            <asp:BoundField DataField="BoardName" HeaderText="Institue Name" />
                            <asp:BoundField DataField="PassingYear" HeaderText="PassingYear" />
                            <asp:BoundField DataField="GradeorDivision" HeaderText="GradeorDivision" />
                            <asp:TemplateField ItemStyle-Height="50" ItemStyle-Width="50" HeaderText="Photo">
                                <ItemTemplate>
                                    <asp:Image ID="ImgStudentPhoto" runat="server" ImageUrl='<%# Eval("ImagePath", GetAbsoluteUrl("{0}")) %>'
                                        Height="70" witdth="70" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </fieldset>
        </ContentTemplate>
        <Triggers>
          <%--  <asp:PostBackTrigger ControlID="btnAdd" />--%>
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
