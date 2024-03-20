<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result_f.aspx.cs" Inherits="SMIU_Admission.Modules.Forms.Result_f"
    MaintainScrollPositionOnPostback="false" ValidateRequest="false" MasterPageFile="~/MasterPages/student.Master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        <center>
            Admission Result -
            <asp:Label ID="lblSemesterName" runat="server" Text="Semester Name"></asp:Label>
        </center>
    </h1>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphbody">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>

            <%--<div id="Postgradute" runat="server" visible="false">
                <br />
                <h1>
                    <asp:Label ID="LblGraduateCandidateName" runat="server" Text="Student Name"></asp:Label>,
                </h1>
                <p>
            </div>--%>



            <div id="StudentSuccess" runat="server" visible="false">
                <br />
                <h1>Congratulation! Dear
                    <asp:Label ID="lblCandidateName" runat="server" Text="Student Name"></asp:Label>,
                </h1>
                <p>
                    <span>You have been granted provisional admission at Sindh Madressatul Islam University for </span>
                    <span runat="server" id="textResultCurrentAdmission"></span>
                    <%--<span>admissions at Sindh Madressatul Islam University</span>--%>
                    <asp:Label ID="lblSelfFinance" Font-Bold="true" runat="server" Text=" on Self-finance" Visible="false"></asp:Label>.
                    <span id="spanMerit" runat="server">Kindly download fee voucher and submit copy of paid fee voucher along with required documents and undertaking by </span>
                    <%--<span id="spanSelf" runat="server">Kindly collect your fee voucher from Admission office and submit copy of paid fee voucher along with required documents by </span>--%>
                    <asp:Label ID="lblFeesDueDate" runat="server" Visible="true" Text="FeesDueDate"></asp:Label>
                    <span>at the admission office to secure your admission. Otherwise, your seat will be offered to next candidate in the waiting list.</span>
                    <br />
                    <%--<span>Admission fee voucher will be available for download from 28th-August-2021.</span>--%>
                </p>
                <%--<p>
                    You have been selected for
                    <asp:Label ID="lblProvisional" runat="server" Text="Provisional" Visible="false"></asp:Label>,
                    admission in
                    <h1><asp:Label ID="lblProgramName" runat="server" Text="Program Name"></asp:Label></h1>
                    you have successfully fulfilled all requirements for admissions at Sindh Madressatul Islam University. Kindly download fee voucher from below and submit copy of paid fee voucher along with required documents by 
                    <asp:Label ID="lblFeesDueDate" runat="server" Text="FeesDueDate"></asp:Label>
                     at the admission office, to secure your admission. Otherwise, your seat will be offered to next candidate in the waiting list.
                    Fall 2021 at SMIU. You are advised to Download the fee Voucher and deposit in
                    any online Branch of HBL latest by
                    <br />
                    <br />
                    <strong>Note. </strong><span> Minimum number of 10 and 15 students are required for Morning and Evening Programs respectively, for it to be offered.</span>
                    <br />
                    <br />
                    For any query you may contact at admission@smiu.edu.pk, 111-111-885 Ext 221
                    <br />
                    <br />
                    <h1>
                        Note:
                    </h1>
                    <p>
                        In order to avail the opportunity of admission at SMIU, you are required to furnish
                        the following documents (if not provided earlier) at Admission office
                        <br />
                        <br />
                        a) Attested Photocopies of Marks Sheet and Certificate of SSC, HSC &amp; Bachelor/Masters/MS
                        or M.Phil or Equivalence Certificate.(If not submitted earlier)<br />
                        b) Original Marks Sheet of HSC-II (for the Candidates of undergraduate program)
                        <br />
                        c) Original Bachelors/Masters/MS or M.Phil Marks Sheet. (For the Candidates of graduate
                        program)
                        <br />
                        d)Paid Fee Voucher (Admission and Finance Copy)
                        <br />
                        <asp:Label ID="lblProvisionalMsg" runat="server" Text="lblProvisionalMsg"></asp:Label>.
                        <br />
                        <br />
                        <i>It is to further informed that, students who have selected the 2nd choice in their
                            application form they are also offered the admission according to the merit.
                            <br />
                            Batch will be started atleast with the 10 Students </i><i>Furthermore, Sindh Madreesatul
                                Islam University Karachi is also providing transport facility which almost cover
                                areas throughout Karachi. The transportation fee is Rs.10000/- per semester.
                                <br />
                                For more details please visit the given link &nbsp; <b><a href="https://tinyurl.com/SMIUTRANSPORT20"
                                    target="_blank">https://tinyurl.com/SMIUTRANSPORT20</a></b> , or contact the
                                office of Directorate of Student Affairs.</i>
                        <br />
                        <br />
                        <i>Note : It is to informed that, Program has been offered according to the merit.
                        </i>
                        <br />
                        <br />
                        <i>Note for Ph.D. Students: As most of the students are opted for weekend program, therefore
                            Ph. D. Weekend program is offered to all candidates.</i>
                    </p>
                    <br />
                    <p>
                        Admission Office SMIU
                    </p>
                </p>--%>
                <br />
                <asp:Button ID="btnAdmissionForm" runat="server" CssClass="btn" OnClick="btnAdmissionForm_Click" Visible="true"
                    Text="Download Admission Form" />                
                <a href="Pdf.aspx" class="btn" target="_blank" style="color: white; padding: 5px;">View 3<sup>rd</sup> Merit List</a>
                <%--<a href="Pdf1.aspx" class="btn" target="_blank" style="color: white; padding: 5px;">View 1st Merit List</a>--%>
                <asp:Button ID="btnChallan" runat="server" CssClass="btn" OnClick="btnChallan_Click" Visible="true"
                    Text="Download Semester Fee Voucher" />
                <a runat="server" class="btn" style="color: white; padding-left: 20px;" href="~/Document/Undertaking.docx" target="_blank">Download Undertaking</a>
                <%--<a runat="server" class="btn" style="color: white; padding-left: 20px;" href="~/Document/Orientation.docx" target="_blank">Orientation Details</a>--%>

                <br />
				<br />
                <table style="display:none;">
                    <tr>
                        <th colspan="2">
                            <strong>Important Announcement</strong>
                        </th>
                    </tr>
                    <tr>
                        <td>Display of Orientation Schedule</td>
                        <td>Tuesday 14th February, 2023</td>
                    </tr>
                    <tr>
                        <td>Orientation</td>
                        <td>Wednesday, 15th - Thursday, 16th February 2023 </td>
                    </tr>
                      <tr>
                        <td>Commencement of Classes</td>
                        <td>Monday, 20th February 2023</td>
                    </tr>
                </table>
                <br />
                <br />
                For any query you may contact at admission@smiu.edu.pk, 111-111-885 Ext 221
                    <br />
                <br />
            </div>
            <div id="NotSelectedStudents" runat="server" visible="false">
                <h1>Dear Candidate,
                </h1>
                <p>
                    You were unable to qualify for 1st Merit List. Kindly wait for 2nd Merit List which will be issued if required.
                </p>
            </div>
    <%--    </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnChallan" />
        </Triggers>
    </asp:UpdatePanel>--%>
</asp:Content>
