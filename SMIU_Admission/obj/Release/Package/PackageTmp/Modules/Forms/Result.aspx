<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.Result"
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
    <asp:Label ID="lblStudentName" runat="server" Text="Student Name" Visible="false"
        Font-Bold="true"></asp:Label>
    <br />
    <br />
    <center>
        <p style="text-align: center;">
            <strong>Please find updates as per the Admissions Spring 2023 Calender
                    </strong>
        </p>
        <a class="btn" style="color: blue; padding-left: 20px; padding-right: 20px;" href="https://www.smiu.edu.pk/admissions/" target="_blank">Check Calender for Admissions Spring 2023</a>
    </center>
    <br />
    <br />

    <div id="divTestScore" runat="server" style="text-align: center;" visible="false">
        <br />
        <br />
        <center>
            <a href="Pdf_BI.aspx" class="btn" target="_blank" style="color: white; padding: 10px;">View Admission Test Result</a>
        </center>
        <br />
        <br />
        <br />
    </div>
    <div id="Studentdetails" runat="server" visible="false">
        <fieldset>
            <legend>Test Result And Interview Schedule </legend>
            <br />
            <asp:GridView ID="gvManageStudentDetails" runat="server" EmptyDataText="No Record Found"
                AutoGenerateColumns="False" DataKeyNames="StudentID">
                <Columns>
                    <asp:TemplateField HeaderText="S.No">
                        <ItemTemplate>
                            <span>
                                <%# Container.DataItemIndex +1 %></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Reference ID" DataField="StudentID"></asp:BoundField>
                    <%-- <asp:BoundField HeaderText="Seat Number" DataField="SeatNumber"></asp:BoundField>--%>
                    <asp:BoundField HeaderText="Student Name" DataField="StudentName"></asp:BoundField>
                    <asp:BoundField HeaderText="Father's Name" DataField="FathersName"></asp:BoundField>
                    <%-- <asp:BoundField DataField="Gender" HeaderText="Gender" />--%>
                    <asp:BoundField DataField="ProgramName" HeaderText="Program" />
                    <%--<asp:BoundField DataField="Marks" HeaderText="Test Marks Out of 60" />--%>
                    <%-- <asp:BoundField HeaderText="Result Remarks" DataField="ResultRemarks"></asp:BoundField> --%>
                    <asp:BoundField DataField="InterviewDate" HeaderText="Interview Date" />
                    <asp:BoundField DataField="InterviewTime" HeaderText="Interview Time" />
                    <asp:BoundField DataField="InterviewVenue" HeaderText="Interview Venue" />
                    <asp:BoundField DataField="Panel" HeaderText="Interview Panel" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button Text="Download Interview Admit Card" runat="server" CssClass="btn" OnClick="btnAdmitCard_Click" />
        </fieldset>
        <h4>Note:
                </h4>
        <p>
            <ul>
                <li>1. Bring all original documents at the time of interview (Academic Documents, CNIC/B-Form, paid fee voucher)</li>
                <li>2. Report at least 15 minutes before your interview time</li>

            </ul>
            <br />
            For any query you may contact at admission@smiu.edu.pk, 111-111-885 Ext 221
                   
            <br />
            Admission Office SMIU
               
        </p>

    </div>

    <div id="NotSelectedStudents" runat="server" visible="false">
        <h1>Dear Candidate,
                </h1>
        <p>
            <br />
            You were not able to qualify for the current interview stage. Please wait for 2nd interview list, which might be announced if required.
               
        </p>
        <br />
        <br />
        <a href="Pdf_BI.aspx" class="btn" target="_blank" style="color: white; padding: 10px;">View Admission Test Result</a>
        <br />
        <br />
        <%--<p>
                    Admission Office SMIU
                </p>--%>
    </div>


    <div id="divMsphD" runat="server" visible="false">
        <h1>Dear Candidate,
                </h1>
        <p>
            <br />
             If You eligible for degree program, Interview schedule will be displayed by tommorow.
               
            <br />

            <p>
                Admission Office SMIU
               
            </p>
    </div>



    <div id="BeforeResultAnnoucementMsg" runat="server" visible="false">
        <h1>Dear Candidate,
                </h1>
        <p>
            <br />
            <b>For Undergraduate Students Only</b><br />
            Entry Test <span runat="server" id="currentAdmission"></span>result will be announced on 23<sup>rd</sup> August, 2021 at
                    12:00 PM.
                   
            <br />
            <br />
            <b>For Graduate and Postgraduate students </b>
            <br />
            Interview schedule will be displayed on 23<sup>rd</sup> August, 2021 at 12:00 PM
               
        </p>
        <br />
        <%--<p>
                    Admission Office SMIU
                </p>--%>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
