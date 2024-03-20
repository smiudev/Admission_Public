<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountsPage.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.AccounsPage"
    MaintainScrollPositionOnPostback="false" ValidateRequest="false" MasterPageFile="~/MasterPages/student.Master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        <center>
            Admission -
            <asp:Label ID="lblSemesterName" runat="server" Text="Semester Name"></asp:Label>
        </center>
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label ID="lblStudentName" runat="server" Text="Student Name" 
                Font-Bold="true"></asp:Label>
            <br />
            <div id="Studentdetails" runat="server" visible="false">
                <fieldset>
                    <legend>SMIU Login credentials</legend>
                    <br />
                    <asp:GridView ID="gvManageStudentLoginDetails" runat="server" EmptyDataText="No Record Found"
                        AutoGenerateColumns="False" DataKeyNames="StudentID">
                        <Columns>
                            <asp:TemplateField HeaderText="S.No">
                                <ItemTemplate>
                                    <span>
                                        <%# Container.DataItemIndex +1 %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Reference ID" DataField="StudentID"></asp:BoundField>                          
                            <asp:BoundField DataField="CMSID" HeaderText="CMS ID" />
                            <asp:BoundField DataField="CMSPassword" HeaderText="CMS Password" />
                            <asp:BoundField DataField="LMSID" HeaderText="LMS ID" />
                            <asp:BoundField DataField="LMSPassword" HeaderText="LMS Password" />
                            <asp:BoundField DataField="OfficialEmail" HeaderText="Email Address" />
                            <asp:BoundField DataField="EmailPassword" HeaderText="Email Password" />

                        </Columns>
                    </asp:GridView>
                </fieldset>
                <h4>Note:
                </h4>
                <p>
                    For any query you may contact at admission@smiu.edu.pk, 111-111-885 Ext 221
                    <br />
                    Admission Office SMIU
                </p>

            </div>

            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
