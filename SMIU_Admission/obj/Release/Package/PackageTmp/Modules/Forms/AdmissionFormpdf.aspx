<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdmissionFormpdf.aspx.cs"
    Inherits="SMIU_Admission.Modules.Forms.AdmissionFormpdf" MasterPageFile="~/MasterPages/student.Master"
    MaintainScrollPositionOnPostback="false" ValidateRequest="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphTitle">
    <h1>
        Applicant Admission Form - Fall 2017</h1>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphbody">
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlPerson.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
    <script type="text/javascript">
        function PrintPage() {
            window.print();
        }
    </script>
    <br />
    <br />
    <asp:Panel ID="pnlPerson" runat="server">
        <fieldset>
            <legend>Program Information</legend>
            <table border="1">
                <tr>
                    <td>
                        Degree Program
                    </td>
                    <td>
                        <asp:Label ID="lblDegreeProgram" runat="server"></asp:Label>
                    </td>
                    <td>
                        Photo<span style="color: Red">*</span>
                        <br />
                        <asp:Image ID="impPrev" runat="server" Height="102px" Width="77px" CssClass="imageStyle" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        First Choice
                    </td>
                    <td>
                        <asp:Label ID="lblFirstChoice" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Second Choice (Optional)
                    </td>
                    <td>
                        <asp:Label ID="lblSecondChoice" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Third Choice (Optional)
                    </td>
                    <td>
                        <asp:Label ID="lblThirdChoice" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
        <br />
        <table border="1">
            <tr>
                <td align='left' style='background-color: #18B5F0' colspan='4'>
                    <b>Personal Information</b>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCNICNo" runat="server" Text="CNIC # / FORM 'B'"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="txtNIC" runat="server"></asp:Label>
                </td>
                <td>
                    Passport Number
                    <br />
                    (For Foreign Students)
                </td>
                <td colspan="3">
                    <asp:Label ID="txtPassportNumber" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    First Name
                </td>
                <td>
                    <asp:Label ID="ftxtname" runat="server"></asp:Label>
                </td>
                <td>
                    Middle Name
                </td>
                <td>
                    <asp:Label ID="mtxtName" runat="server"></asp:Label>
                </td>
                <td>
                    Last Name
                </td>
                <td>
                    <asp:Label ID="txtLastName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Father's Name
                </td>
                <td>
                    <asp:Label ID="txtFatherName" runat="server"></asp:Label>
                </td>
                <td>
                    Father's Occupation<span style="color: Red">*</span>
                </td>
                <td colspan="3">
                    <asp:Label ID="txtfatheroccupation" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Nationality
                </td>
                <td class="style2">
                    <asp:Label ID="txtNationality" runat="server"></asp:Label>
                </td>
                <td>
                    Religion
                </td>
                <td class="style4">
                    <asp:Label ID="ddlReligion" runat="server"></asp:Label>
                </td>
                <td class="style3">
                    Gender
                </td>
                <td>
                    <asp:Label ID="ddlGender" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Date of Birth
                </td>
                <td class="style2">
                    <asp:Label ID="txtDOB" runat="server"></asp:Label>
                </td>
                <td>
                    Place Of Birth
                </td>
                <td class="style4">
                    <asp:Label ID="txtPlaceOfBirth" runat="server"></asp:Label>
                </td>
                <td class="style3">
                    Marital Status
                </td>
                <td>
                    <asp:Label ID="ddlMaritalStatus" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Permanent Address
                </td>
                <td colspan="5">
                    <asp:Label ID="txtPermanentAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Postal Address
                </td>
                <td colspan="5">
                    <asp:Label ID="txtCorrAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    City
                </td>
                <td class="style2">
                    <asp:Label ID="txtCity" runat="server"></asp:Label>
                </td>
                <td>
                    Postal Code
                </td>
                <td class="style4">
                    <asp:Label ID="txtPostalCode" runat="server"></asp:Label>
                </td>
                <td class="style3">
                    Country
                </td>
                <td>
                    <asp:Label ID="txtCountry" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Home Phone # <span style="color: Red">*</span>
                </td>
                <td class="style2">
                    <asp:Label ID="txtLandLineNumber" runat="server"></asp:Label>
                </td>
                <td>
                    Mobile /Cell # <span style="color: Red">*</span>
                </td>
                <td colspan="3">
                    <asp:Label ID="txtMobileNo" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    E-mail<span style="color: Red">*</span>
                </td>
                <td class="style2">
                    <asp:Label ID="txtEmail" runat="server"></asp:Label>
                </td>
                <td>
                    Emergency Contact # <span style="color: Red">*</span>
                </td>
                <td colspan="3">
                    <asp:Label ID="txtEmergencyContact" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        </fieldset>
        <fieldset>
            <legend>Guardian's Information</legend>
            <br />
            <table border="1">
                <tr>
                    <td class="style5">
                        Guardian's Name<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:Label ID="txtGname" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Guardian's Occupation<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:Label ID="txtGOccupation" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Guardian's Address<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:Label ID="txtGuardianAddress" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        Guardian's Relation<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:Label ID="txtGuardianrelation" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>District Information</legend>
            <br />
            <table>
                <tr>
                    <td class="style6">
                        District Of Domicile<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:Label ID="txtDistrictOfDomicile" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        Urban / Rural<span style="color: Red">*</span>
                    </td>
                    <td>
                        <asp:Label ID="ddlUrbanOrRural" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
        <fieldset>
            <legend>NTS Test Details if Appeared</legend>
            <br />
            <table>
                <tr>
                    <td class="style7">
                        NTS Test Type
                    </td>
                    <td>
                        <asp:Label ID="ddtNtSType" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Date
                    </td>
                    <td>
                        <asp:Label ID="txtNTSDate" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        NTS Roll Number
                    </td>
                    <td>
                        <asp:Label ID="txtNTSRollNumber" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style7">
                        Score
                    </td>
                    <td>
                        <asp:Label ID="txtScore" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </fieldset>
        <br />
        <fieldset>
            <legend>Previous Education/Acadmic Record </legend>
            <br />
            <table>
                <tr>
                    <th colspan="9" style="text-align: left;">
                        Secondary School Certificate (SSC) / O-Level
                    </th>
                </tr>
                <tr>
                    <td>
                        Degree
                    </td>
                    <td>
                        Seat Number
                    </td>
                    <td>
                        Board
                    </td>
                    <td>
                        Group
                    </td>
                    <td>
                        Passing
                        <br />
                        Year
                    </td>
                    <td>
                        Marks Obtained
                    </td>
                    <td>
                        Total Marks
                    </td>
                    <td>
                        Percentage
                    </td>
                    <td>
                        Grade
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ddlMDegreeLevel" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtMSeatNumber" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtMInstitution" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="ddlMGroup" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtMyear" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtMarksObtainedM" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtMTotalMarks" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtMPercentage" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="ddlMGrade" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <th colspan="9" style="text-align: left;">
                        Higher School Certificate (HSC) / A-Level
                    </th>
                </tr>
                <tr>
                    <td>
                        Degree
                    </td>
                    <td>
                        Seat Number
                    </td>
                    <td>
                        Board
                    </td>
                    <td>
                        Group
                    </td>
                    <td>
                        Passing Year
                    </td>
                    <td>
                        Marks Obtained
                    </td>
                    <td>
                        Total Marks
                    </td>
                    <td>
                        Percentage
                    </td>
                    <td>
                        Grade
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ddlIDegreeLevel" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtISeatNumber" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtIInstitution" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="ddlIGroup" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtIyear" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtMarksObtainedI" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtITotalMarks" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtIPercentage" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="ddlIgrade" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <th colspan="9" style="text-align: left;">
                        Bachelor's Degree Program
                    </th>
                </tr>
                <tr>
                    <td>
                        Seat Number
                    </td>
                    <td>
                        Passing Year
                    </td>
                    <td>
                        University
                    </td>
                    <td>
                        Program
                    </td>
                    <td>
                        Marks Obtained
                    </td>
                    <td>
                        Total Marks
                    </td>
                    <td>
                        Percentage
                    </td>
                    <td>
                        Grade/ Division
                    </td>
                    <td>
                        CGPA
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="txtoProgram" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtOSeatNumber" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtOInstitution" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtOyear" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtMarksObtainedO" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtOTotalMarks" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtOPercentage" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="ddlOGradeDivision" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick="return PrintPanel();" />
            </table>
        </fieldset>
    </asp:Panel>
</asp:Content>
