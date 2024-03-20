<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="_Result.aspx.cs" Inherits="SMIU_Admission.Modules.Forms._Result" MaintainScrollPositionOnPostback="false" ValidateRequest="false" MasterPageFile="~/MasterPages/PortalMaster.master"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="contentScreen">
    <form runat="server">
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <h4>---- Result ----</h4>
        </div>
        <div class="col-md-2" style="text-align:center;"></div>
        <div class="clearfix"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <span runat="server" id="lblMessage" visible="false"></span>
        </div>
        <div class="clearfix"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <div runat="server" id="divUndergraduate" visible="false">
                <span runat="server" id="lblTestScoreMessage">The Computer Based Test (CBT) Result has been announced. You can click the following button to view your Test Score.</span>
                <br />
                <br />
                <a href="/NewForms/Pdf_BI.aspx" class="btn btn-primary" target="_blank" style="padding:10px;" >View Test Result</a>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <span runat="server" id="lblInterviewMessage" visible="false"></span>
            <div runat="server" id="divInterviewSchedule" visible="false">
                <div class="row">
                    <div class="col-md-12">
                        <h4>Interview Schedule </h4>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table">
                          <thead>
                            <tr>
                              <th scope="col">Reference Number</th>
                              <th scope="col">Name</th>
                              <th scope="col">Father's Name</th>
                              <th scope="col">Program</th>
                              <th scope="col">Interview Day Date</th>
                              <th scope="col">Time</th>
                              <th scope="col">Venue</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td runat="server" id="lblRefenceNumber"></td>
                              <td runat="server" id="lblName"></td>
                              <td runat="server" id="lblFatherName"></td>
                              <td runat="server" id="lblProgram"></td>
                              <td runat="server" id="lblInterviewDateDay"></td>
                              <td runat="server" id="lblInterviewTime"></td>
                              <td runat="server" id="lblInterviewVenue"></td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <asp:Button Text="Download Interview Admit Card" runat="server" CssClass="btn btn-primary" OnClick="btnAdmitCard_Click" />
                                </td>
                            </tr>
                          </tbody>
                        </table>
                    </div>                    
                    <div class="clearfix"></div>
                </div>
                <br />
                <div class="row">
                     <div class="col-md-12">
                        <strong style="color:red">Note.</strong>
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
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    
    <div class="row">
        <div class="col-md-12" style="text-align:center;">
            <div runat="server" id="divMeritList" visible="false">
                <h5 runat="server" id="lblDearName"></h5>
                <span runat="server" id="lblMeritSuccessMessage" style="padding:30px;" visible="false">
                    You have been granted provisional admission at Sindh Madressatul Islam University for <strong>PROGRAM</strong> <strong>ONSELFFINANCE</strong>
                    Kindly download fee voucher and submit copy of paid fee voucher along with required documents and undertaking by <strong>SEMESTERFEEDUEDATE</strong> at the admission office to secure your admission.
                    <br />Otherwise, your seat will be offered to next candidate in the waiting list.
                </span>
                <span runat="server" id="lblMeritRegretMessage" visible="false">
                    You were unable to qualify for the current Merit List.
                </span>
                <br />
               <%-- <br />
                <strong style="color:red">Important. </strong><strong>The Merit list has been updated and includes the Evening Programs.</strong>--%>
                <br />
                <a href="Pdf_AI.aspx?meritlist=1" class="btn btn-primary" target="_blank" style="color: white; padding: 5px;">View 1<sup>st</sup> Merit List</a>
                <a href="Pdf_AI.aspx?meritlist=2" class="btn btn-primary" target="_blank"  style="color: white; padding: 5px;">View 2<sup>nd</sup> Merit List</a>
                <a href="Pdf_AI.aspx?meritlist=3" class="btn btn-primary" target="_blank"  style="color: white; padding: 5px;">View 3<sup>rd</sup> Merit List</a>
                <asp:Button ID="btnSemesterChallan" runat="server" CssClass="btn btn-primary" OnClick="btnSemesterChallan_Click" Visible="true" Text="Download Semester Fee Voucher" />
                <a runat="server" id="btnUndertaking" class="btn btn-primary" style="color: white; padding-left: 20px;" href="~/Document/Undertaking.pdf" target="_blank">Download Undertaking</a>
                <%--<a runat="server" class="btn btn-primary" style="color: white; padding-left: 20px;" href="~/Document/Orientation.docx" target="_blank">Orientation Details</a>--%>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
        </form>
</asp:Content>
