
using SMIU_Admission.AppClasses.BusinessLogicLayer;
using System.Data;
using System.Globalization;
using System;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System.Web.UI;
using Org.BouncyCastle.Asn1.Ocsp;
using SMIU_Admission.AppClasses.UtilityClasses;
using System.Configuration;
using System.Windows.Forms;

namespace SMIU_Admission.Resources
{
    public enum StudentCurrentStatus {
        NoInformationSubmit,
        PersonalInfoSubmit,
        GuardianInfoSubmit,
        DegreeInfoSubmit,
        EducationInfoSubmit,
        FinalSubmit,
        DocumentsSubmit,
        FeesApproved
    };
    public class HandyUtility
    {
        public StudentCurrentStatus GetStudentCurrentStatus(int StudentId)
        {
            StudentPersonalInfo stdPer = new StudentPersonalInfo();
            stdPer.StudentID = StudentId;
            DataTable dt = stdPer.NEW_GetStudentAdmissionFormInfoByStudentId();
            if (dt.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["FeeApproved"].ToString()) && Convert.ToBoolean(dt.Rows[0]["FeeApproved"]))
                    return StudentCurrentStatus.FeesApproved;
                else if (Convert.ToBoolean(dt.Rows[0]["Isdocumentsubmitted"]))
                    return StudentCurrentStatus.DocumentsSubmit;
                else if (Convert.ToBoolean(dt.Rows[0]["IsFinalSubmitted"]))
                    return StudentCurrentStatus.FinalSubmit;
            }
            
            StudentHSCEducation eduHSC = new StudentHSCEducation();
            eduHSC.StudentID = StudentId;
            dt = eduHSC.NEW_GetStudentEducationInfoByStudentId();
            if (dt.Rows.Count > 0)
                return StudentCurrentStatus.EducationInfoSubmit;

            StudentProgramInfo stdPrgInfo = new StudentProgramInfo();
            stdPrgInfo.StudentID = StudentId;
            dt = stdPrgInfo.NEW_GetDegreeProgramInfoDataByStudentId();
            if (dt.Rows.Count > 0)
                return StudentCurrentStatus.DegreeInfoSubmit;

            dt = stdPer.NEW_GetStudentInfoDataByStudentId();
            if (dt.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["EmergencyName"].ToString()))
                    return StudentCurrentStatus.GuardianInfoSubmit;
                else
                    return StudentCurrentStatus.PersonalInfoSubmit;
            }
            return StudentCurrentStatus.NoInformationSubmit;
        }
        public string ExtractShift(string Choice)
        {
            int startIndex = Choice.IndexOf("(");
            int endIndex = Choice.IndexOf(")");
            return Choice.Substring(startIndex+1, endIndex-startIndex-1);
        }
        public static string NumbersToWords(int inputNumber)
        {
            int inputNo = inputNumber;

            if (inputNo == 0)
                return "Zero";

            int[] numbers = new int[4];
            int first = 0;
            int u, h, t;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            if (inputNo < 0)
            {
                sb.Append("Minus ");
                inputNo = -inputNo;
            }
            string[] words0 = {"" ,"One ", "Two ", "Three ", "Four ",
            "Five " ,"Six ", "Seven ", "Eight ", "Nine "};
            string[] words1 = {"Ten ", "Eleven ", "Twelve ", "Thirteen ", "Fourteen ",
            "Fifteen ","Sixteen ","Seventeen ","Eighteen ", "Nineteen "};
            string[] words2 = {"Twenty ", "Thirty ", "Forty ", "Fifty ", "Sixty ",
            "Seventy ","Eighty ", "Ninety "};
            string[] words3 = { "Thousand ", "Lakh ", "Crore " };

            numbers[0] = inputNo % 1000; // units
            numbers[1] = inputNo / 1000;
            numbers[2] = inputNo / 100000;
            numbers[1] = numbers[1] - 100 * numbers[2]; // thousands
            numbers[3] = inputNo / 10000000; // crores
            numbers[2] = numbers[2] - 100 * numbers[3]; // lakhs

            for (int i = 3; i > 0; i--)
            {
                if (numbers[i] != 0)
                {
                    first = i;
                    break;
                }
            }
            for (int i = first; i >= 0; i--)
            {
                if (numbers[i] == 0) continue;
                u = numbers[i] % 10; // ones
                t = numbers[i] / 10;
                h = numbers[i] / 100; // hundreds
                t = t - 10 * h; // tens
                if (h > 0) sb.Append(words0[h] + "Hundred ");
                if (u > 0 || t > 0)
                {
                    if (h > 0 || i == 0) sb.Append("and ");
                    if (t == 0)
                        sb.Append(words0[u]);
                    else if (t == 1)
                        sb.Append(words1[u]);
                    else
                        sb.Append(words2[t - 2] + words0[u]);
                }
                if (i != 0) sb.Append(words3[i - 1]);
            }
            return sb.ToString().TrimEnd() + " Rupees only";
        }
        public StringBuilder GetFeeVoucherContent(int StudentId)
        {
            StudentPersonalInfo objStudentPersonalInfo = new StudentPersonalInfo();
            objStudentPersonalInfo.StudentID = StudentId;
            DataTable dtApplicantInfo = objStudentPersonalInfo.GetStudentInfoByReferenceNumber();
            int VoucherID = int.Parse(dtApplicantInfo.Rows[0]["VoucherNumber"].ToString());
            int FirstVoucherOnline = int.Parse(ConfigurationManager.AppSettings["FirstOnlineVoucherNo"].ToString());
            StringBuilder sb = new StringBuilder();
            //FirstVoucherOnline = 200100201;
            //if (VoucherID < FirstVoucherOnline)
            //    sb = GetFeeVoucherContentOLD(dtApplicantInfo);
            //else
            sb = GetFeeVoucherContentOnline(dtApplicantInfo);
            return sb;

        }
        public StringBuilder GetFeeVoucherContentOLD(DataTable dtApplicantInfo)
        {
            string logoPath = HttpContext.Current.Server.MapPath("~/Images/smiu_logo.png");
            StringBuilder sb = new StringBuilder();
            sb.Append("<table border='0' cellspacing='0' cellpadding='0' style='border: 0px; font-family: Arial; font-size: 9pt; table-layout: fixed; width: 95%;'>");
            sb.Append("<tr><td>");
            //First
            sb.Append("<table><tr>");
            sb.Append("<td width='23%' align='left' valign='top'>");
            sb.Append("<p><img src='" + logoPath + "' alt='smiu logo' /></p>");
            sb.Append("<p><u><b>HBL Account# 00427991705303</b></u><br />Valid Till: " + dtApplicantInfo.Rows[0]["ValidDate"].ToString() + "<br />Voucher No:" + dtApplicantInfo.Rows[0]["VoucherNumber"].ToString() + "<br />Ref no:" + dtApplicantInfo.Rows[0]["StudentID"].ToString() + "<br />Full Name: " + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "<br />Email ID: " + dtApplicantInfo.Rows[0]["EmailAddress"].ToString() + "<br />Program:" + dtApplicantInfo.Rows[0]["FirstChoice"].ToString() + "</td>");
            sb.Append("</tr>");
            sb.Append("</table><br />");
            sb.Append("<table border='0' cellspacing='0' cellpadding='0' align='left' width='90%' style='height: 10px; text-align: left; font-family: Arial; font-size: 9pt;'>");
            sb.Append("<tr>");
            sb.Append("<td>");
            sb.Append("<table border='1' cellspacing='0' cellpadding='0' align='left' width='100%' style='height: 10px; text-align: left; font-family: Arial; font-size: 8pt;'>");
            sb.Append("<tr>");
            sb.Append("<td>S#</td>");
            sb.Append("<td>Term</td>");
            sb.Append("<td> Description  </td>");
            sb.Append("<td>Amount</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td style='height: 36px;'> 1 </td>");
            sb.Append("<td style='height: 36px;'> " + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</td>");
            sb.Append("<td style='height: 36px;'> " + dtApplicantInfo.Rows[0]["FeeType"].ToString() + " </td>");
            sb.Append("<td style='height: 36px;'> " + (int.Parse(dtApplicantInfo.Rows[0]["FeeAmount"].ToString()) + 200) + " </td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan=4 style='height: 36px;'> Application Fee includes Rs.200/- HBL Bank Charges</td>");
            sb.Append("</tr>");
            sb.Append(" </table>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("<b>Note:</b><br />");
            sb.Append("<ol>");
            sb.Append("<li>Kindly deposit the amount using only this CHALLAN at any Online Branch of HBL.</li>");
            sb.Append("<li>Fee can only be deposit through cash, Pay order, Demand Draft at HBL.</li>");
            sb.Append("<li>Fee paid is non refundable&amp; non transferrable.</li>");
            sb.Append("<li>Only Amount Specified in the Application Fee Voucher is Acceptable at the bank Altered fee voucher is not acceptable for payment of Fee.</li>");
            sb.Append("</ol>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign. Officer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            sb.Append("Sign. Cashier");
            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student's Copy");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</table>");
            sb.Append("</td>");
            // Second
            sb.Append("<td>");
            sb.Append("<table><tr>");
            sb.Append("<td width='23%' align='left' valign='top'>");
            sb.Append("<p><img src='" + logoPath + "' alt='smiu logo' /></p>");
            sb.Append("<p><u><b>HBL Account# 00427991705303</b></u><br />Valid Till: " + dtApplicantInfo.Rows[0]["ValidDate"].ToString() + "<br />Voucher No:" + dtApplicantInfo.Rows[0]["VoucherNumber"].ToString() + "<br />Ref no:" + dtApplicantInfo.Rows[0]["StudentID"].ToString() + "<br />Full Name: " + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "<br />Email ID: " + dtApplicantInfo.Rows[0]["EmailAddress"].ToString() + "<br />Program:" + dtApplicantInfo.Rows[0]["FirstChoice"].ToString() + "</td>");
            sb.Append("</tr>");
            sb.Append("</table><br />");
            sb.Append("<table border='0' cellspacing='0' cellpadding='0' align='left' width='90%' style='height: 10px; text-align: left; font-family: Arial; font-size: 9pt;'>");
            sb.Append("<tr>");
            sb.Append("<td>");
            sb.Append("<table border='1' cellspacing='0' cellpadding='0' align='left' width='100%' style='height: 10px; text-align: left; font-family: Arial; font-size: 8pt;'>");
            sb.Append("<tr>");
            sb.Append("<td>S#</td>");
            sb.Append("<td>Term</td>");
            sb.Append("<td> Description  </td>");
            sb.Append("<td>Amount</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td style='height: 36px;'> 1 </td>");
            sb.Append("<td style='height: 36px;'> " + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</td>");
            sb.Append("<td style='height: 36px;'> " + dtApplicantInfo.Rows[0]["FeeType"].ToString() + " </td>");
            sb.Append("<td style='height: 36px;'> " + (int.Parse(dtApplicantInfo.Rows[0]["FeeAmount"].ToString()) + 200) + " </td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan=4 style='height: 36px;'> Application Fee includes Rs.200/- HBL Bank Charges</td>");
            sb.Append("</tr>");
            sb.Append(" </table>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("<b>Note:</b><br />");
            sb.Append("<ol>");
            sb.Append("<li>Kindly deposit the amount using only this CHALLAN at any Online Branch of HBL.</li>");
            sb.Append("<li>Fee can only be deposit through cash, Pay order, Demand Draft at HBL.</li>");
            sb.Append("<li>Fee paid is non refundable&amp; non transferrable.</li>");
            sb.Append("<li>Only Amount Specified in the Application Fee Voucher is Acceptable at the bank Altered fee voucher is not acceptable for payment of Fee.</li>");
            sb.Append("</ol>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign. Officer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            sb.Append("Sign. Cashier");
            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admission Office's Copy");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</table>");
            sb.Append("</td>");
            // Third
            sb.Append("<td>");
            sb.Append("<table><tr>");
            sb.Append("<td width='23%' align='left' valign='top'>");
            sb.Append("<p><img src='" + logoPath + "' alt='smiu logo' /></p>");
            sb.Append("<p><u><b>HBL Account# 00427991705303</b></u><br />Valid Till: " + dtApplicantInfo.Rows[0]["ValidDate"].ToString() + "<br />Voucher No:" + dtApplicantInfo.Rows[0]["VoucherNumber"].ToString() + "<br />Ref no:" + dtApplicantInfo.Rows[0]["StudentID"].ToString() + "<br />Full Name: " + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "<br />Email ID: " + dtApplicantInfo.Rows[0]["EmailAddress"].ToString() + "<br />Program:" + dtApplicantInfo.Rows[0]["FirstChoice"].ToString() + "</td>");
            sb.Append("</tr>");
            sb.Append("</table><br />");
            sb.Append("<table border='0' cellspacing='0' cellpadding='0' align='left' width='90%' style='height: 10px; text-align: left; font-family: Arial; font-size: 9pt;'>");
            sb.Append("<tr>");
            sb.Append("<td>");
            sb.Append("<table border='1' cellspacing='0' cellpadding='0' align='left' width='100%' style='height: 10px; text-align: left; font-family: Arial; font-size: 8pt;'>");
            sb.Append("<tr>");
            sb.Append("<td>S#</td>");
            sb.Append("<td>Term</td>");
            sb.Append("<td> Description  </td>");
            sb.Append("<td>Amount</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td style='height: 36px;'>1 </td>");
            sb.Append("<td style='height: 36px;'>" + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</td>");
            sb.Append("<td style='height: 36px;'>" + dtApplicantInfo.Rows[0]["FeeType"].ToString() + " </td>");
            sb.Append("<td style='height: 36px;'>" + (int.Parse(dtApplicantInfo.Rows[0]["FeeAmount"].ToString()) + 200) + " </td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan=4 style='height: 36px;'> Application Fee includes Rs.200/- HBL Bank Charges</td>");
            sb.Append("</tr>");
            sb.Append(" </table>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("<b>Note:</b><br />");
            sb.Append("<ol>");
            sb.Append("<li>Kindly deposit the amount using only this CHALLAN at any Online Branch of HBL.</li>");
            sb.Append("<li>Fee can only be deposit through cash, Pay order, Demand Draft at HBL.</li>");
            sb.Append("<li>Fee paid is non refundable&amp; non transferrable.</li>");
            sb.Append("<li>Only Amount Specified in the Application Fee Voucher is Acceptable at the bank Altered fee voucher is not acceptable for payment of Fee.</li>");
            sb.Append("</ol>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign. Officer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            sb.Append("Sign. Cashier");
            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Finance Department's Copy");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</table>");
            sb.Append("</td>");
            // Fourth
            sb.Append("<td>");
            sb.Append("<table><tr>");
            sb.Append("<td width='23%' align='left' valign='top'>");
            sb.Append("<p><img src='" + logoPath + "' alt='smiu logo' /></p>");
            sb.Append("<p><u><b>HBL Account# 00427991705303</b></u><br />Valid Till: " + dtApplicantInfo.Rows[0]["ValidDate"].ToString() + "<br />Voucher No:" + dtApplicantInfo.Rows[0]["VoucherNumber"].ToString() + "<br />Ref no:" + dtApplicantInfo.Rows[0]["StudentID"].ToString() + "<br />Full Name: " + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "<br />Email ID: " + dtApplicantInfo.Rows[0]["EmailAddress"].ToString() + "<br />Program:" + dtApplicantInfo.Rows[0]["FirstChoice"].ToString() + "</td>");
            sb.Append("</tr>");
            sb.Append("</table><br />");
            sb.Append("<table border='0' cellspacing='0' cellpadding='0' align='left' width='90%' style='height: 10px; text-align: left; font-family: Arial; font-size: 9pt;'>");
            sb.Append("<tr>");
            sb.Append("<td>");
            sb.Append("<table border='1' cellspacing='0' cellpadding='0' align='left' width='100%' style='height: 10px; text-align: left; font-family: Arial; font-size: 8pt;'>");
            sb.Append("<tr>");
            sb.Append("<td>S#</td>");
            sb.Append("<td>Term</td>");
            sb.Append("<td> Description  </td>");
            sb.Append("<td>Amount</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td style='height: 36px;'>1 </td>");
            sb.Append("<td style='height: 36px;'>" + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</td>");
            sb.Append("<td style='height: 36px;'>" + dtApplicantInfo.Rows[0]["FeeType"].ToString() + " </td>");
            sb.Append("<td style='height: 36px;'>" + (int.Parse(dtApplicantInfo.Rows[0]["FeeAmount"].ToString())+200) + " </td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan=4 style='height: 36px;'> Application Fee includes Rs.200/- HBL Bank Charges</td>");
            sb.Append("</tr>");
            sb.Append(" </table>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("<b>Note:</b><br />");
            sb.Append("<ol>");
            sb.Append("<li>Kindly deposit the amount using only this CHALLAN at any Online Branch of HBL.</li>");
            sb.Append("<li>Fee can only be deposit through cash, Pay order, Demand Draft at HBL.</li>");
            sb.Append("<li>Fee paid is non refundable&amp; non transferrable.</li>");
            sb.Append("<li>Only Amount Specified in the Application Fee Voucher is Acceptable at the bank Altered fee voucher is not acceptable for payment of Fee.</li>");
            sb.Append("</ol>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td colspan='4' style='border: none;'>");
            sb.Append("<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign. Officer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            sb.Append("Sign. Cashier");
            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("<br />");
            sb.Append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bank's Copy");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</table>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</table>");
            return sb;
        }
        public StringBuilder GetFeeVoucherContentOnline(DataTable dtApplicantInfo)
        {
            string logoPath = HttpContext.Current.Server.MapPath("~/Images/smiu_logo.png");
            string hblLogoPath = HttpContext.Current.Server.MapPath("~/Images/hbl_logo.png");
            string oneBillLogoPath = HttpContext.Current.Server.MapPath("~/Images/onebill_logo.png");
            string Bill_ID = ConfigurationManager.AppSettings["OneBillID"].ToString();
            int ProcessingFee = int.Parse(dtApplicantInfo.Rows[0]["FeeAmount"].ToString());
            int TransactionFee = 60;
            int TotalFee = ProcessingFee + TransactionFee;
            string TotalAmountInWords = NumbersToWords(TotalFee);
            string[] copiesText = { "Student Copy", "ADM Off: Copy", "FIN Off: Copy", "Bank Copy" };
            // Create a StringBuilder for HTML content
            StringBuilder sb = new StringBuilder();
            // Opening HTML and table tags
            sb.AppendLine("<html><body>");
            sb.AppendLine("<table style='font-size: 8px;'>");
            sb.AppendLine("<tr>");

            // Generate content for each copy
            for (int i = 0; i < copiesText.Length; i++)
            {

                sb.AppendLine("<td>");

                //Logo + Copy + Voucher
                sb.AppendLine("<table><tr>");
                sb.AppendLine("<td>");
                sb.AppendLine("<img src='" + logoPath + @"' height=53 width=90 />");
                sb.AppendLine("</td>");
                sb.AppendLine("<td>");
                sb.AppendLine("<strong>" + copiesText[i] + "</strong><br />");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</span><br />");
                sb.AppendLine("<span>Valid Date<br />" + dtApplicantInfo.Rows[0]["ValidDate"].ToString() + "</span><br />");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");

                //Bank Logo + Challan
                sb.AppendLine("<table border='1' width='170' style='margin-top:2; table-layout: fixed; border-collapse: collapse; font-family: Calibri (Body), Times New Roman, Times, serif; font-size: 9px;'><tr>");

                sb.AppendLine("<td align='center' style='text-align:center'>");
                sb.AppendLine("<img src='" + oneBillLogoPath + @"' height='30' />");
                sb.AppendLine("<br />");
                sb.AppendLine("<p style='font-size:9pt'>");
                sb.AppendLine("<strong>1 Bill ID#</strong>");
                sb.AppendLine("<span>" + Bill_ID + @"</span>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["VoucherNumber"].ToString() + @"</span>");
                sb.AppendLine("</p>");
                sb.AppendLine("</td>");

                //sb.AppendLine("<td align='center' style='text-align:center'>");
                //sb.AppendLine("<img src='" + oneBillLogoPath + @"' height=30 width=60 />");
                //sb.AppendLine("<p style='font-size:8pt'>");
                //sb.AppendLine("<strong>1 Bill ID#</strong>");
                //sb.AppendLine("<br />");
                //sb.AppendLine("<span>" + Bill_ID + @"</span>");
                //sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["VoucherNumber"].ToString() + @"</span>");
                //sb.AppendLine("</p>");
                //sb.AppendLine("</td>");
                //sb.AppendLine("<td align='center' style='text-align:center'>");
                //sb.AppendLine("<img src='" + hblLogoPath + @"' height=30 width=80 />");
                //sb.AppendLine("<p style='font-size:8pt'>");
                //sb.AppendLine("<strong>Challan#</strong>");
                //sb.AppendLine("<br />");
                //sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["VoucherNumber"].ToString() + @"</span>");
                //sb.AppendLine("</p>");
                //sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");

                //Student Details
                sb.AppendLine("<table border='0' width='170' style='margin-top:2; table-layout: fixed; border-collapse: collapse; font-size: 9px;'>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td colspan='2'>");
                sb.AppendLine("<strong>Student ID: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["StudentId"] + "</span><br />");
                sb.AppendLine("<strong>Student Name: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "</span><br />");
                sb.AppendLine("<strong>Email: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["EmailAddress"].ToString() + "</span><br />");
                sb.AppendLine("<strong>Program: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["FirstChoice"].ToString() + "</span><br />");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");

                //Fee Details
                sb.AppendLine("<table border='1' width='170' style='margin:0 auto; margin-top:2; table-layout: fixed; border-collapse: collapse; font-size: 9px;'>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td width='100'  align='center' valign='middle'  style='text-align:center'><strong>Particulars</strong></td>");
                sb.AppendLine("<td width='30'  align='center' valign='middle'  style='text-align:center'><strong>Fee</strong></td>");
                sb.AppendLine("</tr>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Application Processing Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + ProcessingFee + "</td>");
                sb.AppendLine("</tr>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Total Amount</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + TotalFee + "</td>");
                sb.AppendLine("</tr>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td colspan='2'>In words: " + TotalAmountInWords + "</td>");
                sb.AppendLine("</tr>");
                sb.AppendLine("</table>");
                sb.AppendLine("<span><strong>Note.</strong> Bank transaction fee Rs." + TransactionFee + "/- included.</span>");

                // Add the instructions
                sb.AppendLine("<br />");
                sb.AppendLine("<table width='180' style='table-layout: fixed; border-collapse: collapse; font-size: 9px;'><tr>");
                sb.AppendLine("<td style='font-size:9pt; text-align:left;'>");
                //sb.AppendLine("<strong>Payment Options</strong>");
                sb.AppendLine("<strong>Payment Instructions</strong>");
                sb.AppendLine("<br />");
                sb.AppendLine("<ul>");
                //sb.AppendLine("<li><strong>HBL customers: </strong> Select SMIU in the Education tab on HBL Mobile App, Konnect App or Internet Banking, enter your challan number and pay via your account.</li>");
                //sb.AppendLine("<li><strong>Other bank/wallet customers: </strong> Select the 1-Bill option from your App / Easy Paisa / Jazz Cash or any ATM and enter your 1 Bill ID.</li>");
                sb.AppendLine("<li>Select the 1-Bill option from your Mobile App / Easy Paisa / Jazz Cash or any ATM and enter your 1 Bill ID.</li>");
                sb.AppendLine("<li>IBFT/Fund Transfer or Counter payment is NOT accepted.</li>");
                
                sb.AppendLine("</ul>");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");
                sb.AppendLine("</div>");

                // Signatures
                sb.AppendLine("<br/>");
                sb.AppendLine("<br/>");
                sb.AppendLine("<br/>");
                sb.AppendLine("<table width='170' style='table-layout: fixed; border-collapse: collapse; font-size: 9px;'><tr>");
                sb.AppendLine("<td style='font-size:9pt; text-align:left;padding-left:2px'>");
                sb.AppendLine("<strong>Sign Officer</strong>");
                sb.AppendLine("</td>");
                sb.AppendLine("<td style='font-size:9pt; text-align:right;padding-right:2px'>");
                sb.AppendLine("<strong>Sign Cashier</strong>");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");
                sb.AppendLine("</td>");
            }

            sb.AppendLine("</tr>");
            sb.AppendLine("</table>");
            sb.AppendLine("</body></html>");
            return sb;
        }

        public StringBuilder GetSemesterFeeVoucherContentOnline(int StudentId)
        {
            string hblLogoPath = HttpContext.Current.Server.MapPath("~/Images/hbl_logo.png");
            string logoPath = HttpContext.Current.Server.MapPath("~/Images/smiu_logo.png");
            string oneBillLogoPath = HttpContext.Current.Server.MapPath("~/Images/onebill_logo.png");
            int SemesterId = int.Parse(HttpContext.Current.Session["SemesterId"].ToString());
            StudentPersonalInfo objStudentPersonalInfo = new StudentPersonalInfo();
            objStudentPersonalInfo.StudentID = StudentId;
            objStudentPersonalInfo.SemesterId = SemesterId;
            DataTable dtApplicantInfo = objStudentPersonalInfo.GetStudentInfoByStudentIDforSemesterFeeVoucher();

            string Bill_ID = ConfigurationManager.AppSettings["OneBillID"].ToString();
            int IsSelf = int.Parse(dtApplicantInfo.Rows[0]["IsSelfFinance"].ToString());
            int TransactionFee = 60;
            int SelfFee = IsSelf > 0 ? Convert.ToInt32(dtApplicantInfo.Rows[0]["SelfAmount"].ToString()) : 0;
            int TotalSemesterFee = 0;
            if (IsSelf==1)
            {
                TotalSemesterFee = Convert.ToInt32(dtApplicantInfo.Rows[0]["TotalSemesterFee"].ToString())
                + SelfFee
                + TransactionFee; //60 additional HBL Deposit
            }
            else
            {
                TotalSemesterFee = Convert.ToInt32(dtApplicantInfo.Rows[0]["TotalSemesterFee"].ToString())
                + TransactionFee; //60 additional HBL Deposit
            }
                
            string TotalAmountInWords = NumbersToWords(TotalSemesterFee);
            string[] copiesText = { "Student Copy", "ADM Off: Copy", "FIN Off: Copy", "Bank Copy" };
            // Create a StringBuilder for HTML content
            StringBuilder sb = new StringBuilder();
            // Opening HTML and table tags
            sb.AppendLine("<html><body>");
            sb.AppendLine("<table style='font-size: 8px;'>");
            sb.AppendLine("<tr>");

            // Generate content for each copy
            for (int i = 0; i < copiesText.Length; i++)
            {

                sb.AppendLine("<td>");

                //Logo + Copy + Voucher
                sb.AppendLine("<table><tr>");
                sb.AppendLine("<td>");
                sb.AppendLine("<img src='" + logoPath + @"' height=53 width=90 />");
                sb.AppendLine("</td>");
                sb.AppendLine("<td>");
                sb.AppendLine("<strong>" + copiesText[i] + "</strong><br />");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</span><br />");
                sb.AppendLine("<span>Valid Date<br />" + DateTime.Parse(dtApplicantInfo.Rows[0]["ValidTilDate"].ToString()).ToString("dd-MMM-yyyy") + "</span><br />");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");

                //Bank Logo + Challan
                sb.AppendLine("<table border='1' width='170' style='margin-top:2; table-layout: fixed; border-collapse: collapse; font-family: Calibri (Body), Times New Roman, Times, serif; font-size: 9px;'><tr>");

                //sb.AppendLine("<td align='center' style='text-align:center'>");
                //sb.AppendLine("<img src='" + oneBillLogoPath + @"' height='30' />");
                //sb.AppendLine("<br />");
                //sb.AppendLine("<p style='font-size:9pt'>");
                //sb.AppendLine("<strong>1 Bill ID#</strong>");
                //sb.AppendLine("<span>" + Bill_ID + @"</span>");
                //sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + @"</span>");
                //sb.AppendLine("</p>");
                //sb.AppendLine("</td>");

                sb.AppendLine("<td align='center' style='text-align:center'>");
                sb.AppendLine("<img src='" + oneBillLogoPath + @"' height=30 width=60 />");
                sb.AppendLine("<p style='font-size:8pt'>");
                sb.AppendLine("<strong>1 Bill ID#</strong>");
                sb.AppendLine("<br />");
                sb.AppendLine("<span style='font-size:7pt'>" + Bill_ID + @"</span>");
                sb.AppendLine("<span style='font-size:7pt'>" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + @"</span>");
                sb.AppendLine("</p>");
                sb.AppendLine("</td>");
                sb.AppendLine("<td align='center' style='text-align:center'>");
                sb.AppendLine("<img src='" + hblLogoPath + @"' height=30 width=80 />");
                sb.AppendLine("<p style='font-size:8pt'>");
                sb.AppendLine("<strong>Challan#</strong>");
                sb.AppendLine("<br />");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + @"</span>");
                sb.AppendLine("</p>");
                sb.AppendLine("</td>");


                sb.AppendLine("</tr></table>");

                



                //Student Details
                sb.AppendLine("<table border='0' width='170' style='margin-top:2; table-layout: fixed; border-collapse: collapse; font-size: 9px;'>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td colspan='2'>");
                sb.AppendLine("<strong>Student ID: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["StudentId"] + "</span><br />");
                sb.AppendLine("<strong>Student Name: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "</span><br />");
                //sb.AppendLine("<strong>Faculty: </strong>");
                //sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["Faculty"].ToString() + "</span><br />");
                sb.AppendLine("<strong>Program: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["Program"].ToString() + "</span><br />");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");

                //Fee Details
                sb.AppendLine("<table border='1' width='170' style='margin:0 auto; margin-top:2; table-layout: fixed; border-collapse: collapse; font-size: 9px;'>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td width='100'  align='center' valign='middle'  style='text-align:center'><strong>Particulars</strong></td>");
                sb.AppendLine("<td width='30'  align='center' valign='middle'  style='text-align:center'><strong>Fee</strong></td>");
                sb.AppendLine("</tr>");
                if (IsSelf == 1)
                {
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td  width='100' height='30'  align='center' valign='middle'  style='text-align:center'>Self Finance</td>");
                    sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + SelfFee + "</td>");
                    sb.AppendLine("</tr>");
                }
                
                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  height='30' align='center' valign='middle'  style='text-align:center'>Admission Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["AdmissionFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");
                
                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Security Deposit</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["SecurityDeposit"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Tution Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["TotalCoursesFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");


                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Student Activity</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["ActivityFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Lab & Library</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["LabLibraryFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Enrollment Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["EnrollmentFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                //sb.AppendLine("<tr>");
                //sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Registration Fee</td>");
                //sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["TermRegistrationFee"].ToString() + "</td>");
                //sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Examination Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["TotalExaminationFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>HBL Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + TransactionFee + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Total Amount</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + TotalSemesterFee + "</td>");
                sb.AppendLine("</tr>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td colspan='2'>In words: " + TotalAmountInWords + "</td>");
                sb.AppendLine("</tr>");
                sb.AppendLine("</table>");
                //sb.AppendLine("<span><strong>Note.</strong> Bank transaction fee Rs." + TransactionFee + "/- included.</span>");

                // Add the instructions
                //sb.AppendLine("<br />");
                sb.AppendLine("<table width='180' style='table-layout: fixed; border-collapse: collapse; font-size: 9px;'><tr>");
                sb.AppendLine("<td style='font-size:8pt; text-align:left;'>");
                //sb.AppendLine("<strong>Payment Options</strong>");
                sb.AppendLine("<strong>Payment Instructions</strong>");
                //sb.AppendLine("<br />");
                sb.AppendLine("<ul>");
                sb.AppendLine("<li style='font-size:8pt'><strong>HBL customers: </strong> Select SMIU in the Education tab on HBL/Konnect App or Internet Banking, Enter challan number and pay via your account.</li>");
                sb.AppendLine("<li style='font-size:8pt'><strong>Other Bank/Wallet: </strong> Select 1-Bill option from any App/Easy Paisa/Jazz Cash or ATM and Enter 1-Bill ID.</li>");
                //sb.AppendLine("<li>Select the 1-Bill option from your Mobile App / Easy Paisa / Jazz Cash or any ATM and enter your 1 Bill ID.</li>");
                sb.AppendLine("<li style='font-size:8pt'><strong>Note.</strong>IBFT/Fund Transfer or Counter payment is <strong>NOT</strong> accepted.</li>");

                sb.AppendLine("</ul>");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");
                sb.AppendLine("</div>");

                // Signatures
                //sb.AppendLine("<br/>");
                //sb.AppendLine("<br/>");
                //sb.AppendLine("<table width='170' style='table-layout: fixed; border-collapse: collapse; font-size: 9px;'><tr>");
                //sb.AppendLine("<td style='font-size:8pt; text-align:left;padding-left:2px'>");
                //sb.AppendLine("<strong>Sign Officer</strong>");
                //sb.AppendLine("</td>");
                //sb.AppendLine("<td style='font-size:8pt; text-align:right;padding-right:2px'>");
                //sb.AppendLine("<strong>Sign Cashier</strong>");
                //sb.AppendLine("</td>");
                //sb.AppendLine("</tr></table>");
                //sb.AppendLine("</td>");
            }

            sb.AppendLine("</tr>");
            sb.AppendLine("</table>");
            sb.AppendLine("</body></html>");
            return sb;
        }
        public StringBuilder GetInstallmentSemesterFeeVoucherContentOnline(int StudentId, int TutionFeeAmount)
        {
            string hblLogoPath = HttpContext.Current.Server.MapPath("~/Images/hbl_logo.png");
            string logoPath = HttpContext.Current.Server.MapPath("~/Images/smiu_logo.png");
            string oneBillLogoPath = HttpContext.Current.Server.MapPath("~/Images/onebill_logo.png");
            int SemesterId = int.Parse(HttpContext.Current.Session["SemesterId"].ToString());
            StudentPersonalInfo objStudentPersonalInfo = new StudentPersonalInfo();
            objStudentPersonalInfo.StudentID = StudentId;
            objStudentPersonalInfo.SemesterId = SemesterId;
            DataTable dtApplicantInfo = objStudentPersonalInfo.GetStudentInfoByStudentIDforSemesterFeeVoucher();

            string Bill_ID = ConfigurationManager.AppSettings["OneBillID"].ToString();
            int IsSelf = int.Parse(dtApplicantInfo.Rows[0]["IsSelfFinance"].ToString());
            int TransactionFee = 60;
            int SelfFee = IsSelf > 0 ? Convert.ToInt32(dtApplicantInfo.Rows[0]["SelfAmount"].ToString()) : 0;
            int TotalSemesterFee = 0;
            int TotalCourseFeeAmount = Convert.ToInt32(dtApplicantInfo.Rows[0]["TotalCoursesFee"].ToString());
            if (IsSelf == 1)
            {
                TotalSemesterFee = Convert.ToInt32(dtApplicantInfo.Rows[0]["TotalSemesterFee"].ToString())
                + SelfFee
                + TransactionFee; //60 additional HBL Deposit
            }
            else
            {
                TotalSemesterFee = Convert.ToInt32(dtApplicantInfo.Rows[0]["TotalSemesterFee"].ToString())
                + TransactionFee; //60 additional HBL Deposit
            }
            TotalSemesterFee = TotalSemesterFee - TotalCourseFeeAmount;
            TotalSemesterFee += TutionFeeAmount;

            string TotalAmountInWords = NumbersToWords(TotalSemesterFee);
            string[] copiesText = { "Student Copy", "ADM Off: Copy", "FIN Off: Copy", "Bank Copy" };
            // Create a StringBuilder for HTML content
            StringBuilder sb = new StringBuilder();
            // Opening HTML and table tags
            sb.AppendLine("<html><body>");
            sb.AppendLine("<table style='font-size: 8px;'>");
            sb.AppendLine("<tr>");

            // Generate content for each copy
            for (int i = 0; i < copiesText.Length; i++)
            {

                sb.AppendLine("<td>");

                //Logo + Copy + Voucher
                sb.AppendLine("<table><tr>");
                sb.AppendLine("<td>");
                sb.AppendLine("<img src='" + logoPath + @"' height=53 width=90 />");
                sb.AppendLine("</td>");
                sb.AppendLine("<td>");
                sb.AppendLine("<strong>" + copiesText[i] + "</strong><br />");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</span><br />");
                sb.AppendLine("<span>Valid Date<br />" + DateTime.Parse(dtApplicantInfo.Rows[0]["ValidTilDate"].ToString()).ToString("dd-MMM-yyyy") + "</span><br />");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");

                //Bank Logo + Challan
                sb.AppendLine("<table border='1' width='170' style='margin-top:2; table-layout: fixed; border-collapse: collapse; font-family: Calibri (Body), Times New Roman, Times, serif; font-size: 9px;'><tr>");

                //sb.AppendLine("<td align='center' style='text-align:center'>");
                //sb.AppendLine("<img src='" + oneBillLogoPath + @"' height='30' />");
                //sb.AppendLine("<br />");
                //sb.AppendLine("<p style='font-size:9pt'>");
                //sb.AppendLine("<strong>1 Bill ID#</strong>");
                //sb.AppendLine("<span>" + Bill_ID + @"</span>");
                //sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + @"</span>");
                //sb.AppendLine("</p>");
                //sb.AppendLine("</td>");

                sb.AppendLine("<td align='center' style='text-align:center'>");
                sb.AppendLine("<img src='" + oneBillLogoPath + @"' height=30 width=60 />");
                sb.AppendLine("<p style='font-size:8pt'>");
                sb.AppendLine("<strong>1 Bill ID#</strong>");
                sb.AppendLine("<br />");
                sb.AppendLine("<span style='font-size:7pt'>" + Bill_ID + @"</span>");
                sb.AppendLine("<span style='font-size:7pt'>" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + @"</span>");
                sb.AppendLine("</p>");
                sb.AppendLine("</td>");
                sb.AppendLine("<td align='center' style='text-align:center'>");
                sb.AppendLine("<img src='" + hblLogoPath + @"' height=30 width=80 />");
                sb.AppendLine("<p style='font-size:8pt'>");
                sb.AppendLine("<strong>Challan#</strong>");
                sb.AppendLine("<br />");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + @"</span>");
                sb.AppendLine("</p>");
                sb.AppendLine("</td>");


                sb.AppendLine("</tr></table>");





                //Student Details
                sb.AppendLine("<table border='0' width='170' style='margin-top:2; table-layout: fixed; border-collapse: collapse; font-size: 9px;'>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td colspan='2'>");
                sb.AppendLine("<strong>Student ID: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["StudentId"] + "</span><br />");
                sb.AppendLine("<strong>Student Name: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "</span><br />");
                //sb.AppendLine("<strong>Faculty: </strong>");
                //sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["Faculty"].ToString() + "</span><br />");
                sb.AppendLine("<strong>Program: </strong>");
                sb.AppendLine("<span>" + dtApplicantInfo.Rows[0]["Program"].ToString() + "</span><br />");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");

                //Fee Details
                sb.AppendLine("<table border='1' width='170' style='margin:0 auto; margin-top:2; table-layout: fixed; border-collapse: collapse; font-size: 9px;'>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td width='100'  align='center' valign='middle'  style='text-align:center'><strong>Particulars</strong></td>");
                sb.AppendLine("<td width='30'  align='center' valign='middle'  style='text-align:center'><strong>Fee</strong></td>");
                sb.AppendLine("</tr>");
                if (IsSelf == 1)
                {
                    sb.AppendLine("<tr>");
                    sb.AppendLine("<td  width='100' height='30'  align='center' valign='middle'  style='text-align:center'>Self Finance</td>");
                    sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + SelfFee + "</td>");
                    sb.AppendLine("</tr>");
                }

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  height='30' align='center' valign='middle'  style='text-align:center'>Admission Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["AdmissionFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Security Deposit</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["SecurityDeposit"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Tution Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + TutionFeeAmount + "</td>");
                sb.AppendLine("</tr>");


                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Student Activity</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["ActivityFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Lab & Library</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["LabLibraryFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Enrollment Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["EnrollmentFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                //sb.AppendLine("<tr>");
                //sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Registration Fee</td>");
                //sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["TermRegistrationFee"].ToString() + "</td>");
                //sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Examination Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + dtApplicantInfo.Rows[0]["TotalExaminationFee"].ToString() + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>HBL Fee</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + TransactionFee + "</td>");
                sb.AppendLine("</tr>");

                sb.AppendLine("<tr>");
                sb.AppendLine("<td  width='100'  align='center' valign='middle'  style='text-align:center'>Total Amount</td>");
                sb.AppendLine("<td  width='30'  align='center' valign='middle'  style='text-align:center'>" + TotalSemesterFee + "</td>");
                sb.AppendLine("</tr>");
                sb.AppendLine("<tr>");
                sb.AppendLine("<td colspan='2'>In words: " + TotalAmountInWords + "</td>");
                sb.AppendLine("</tr>");
                sb.AppendLine("</table>");
                //sb.AppendLine("<span><strong>Note.</strong> Bank transaction fee Rs." + TransactionFee + "/- included.</span>");

                // Add the instructions
                //sb.AppendLine("<br />");
                sb.AppendLine("<table width='180' style='table-layout: fixed; border-collapse: collapse; font-size: 9px;'><tr>");
                sb.AppendLine("<td style='font-size:8pt; text-align:left;'>");
                //sb.AppendLine("<strong>Payment Options</strong>");
                sb.AppendLine("<strong>Payment Instructions</strong>");
                //sb.AppendLine("<br />");
                sb.AppendLine("<ul>");
                sb.AppendLine("<li style='font-size:8pt'><strong>HBL customers: </strong> Select SMIU in the Education tab on HBL/Konnect App or Internet Banking, Enter challan number and pay via your account.</li>");
                sb.AppendLine("<li style='font-size:8pt'><strong>Other Bank/Wallet: </strong> Select 1-Bill option from any App/Easy Paisa/Jazz Cash or ATM and Enter 1-Bill ID.</li>");
                //sb.AppendLine("<li>Select the 1-Bill option from your Mobile App / Easy Paisa / Jazz Cash or any ATM and enter your 1 Bill ID.</li>");
                sb.AppendLine("<li style='font-size:8pt'><strong>Note.</strong>IBFT/Fund Transfer or Counter payment is <strong>NOT</strong> accepted.</li>");

                sb.AppendLine("</ul>");
                sb.AppendLine("</td>");
                sb.AppendLine("</tr></table>");
                sb.AppendLine("</div>");

                // Signatures
                //sb.AppendLine("<br/>");
                //sb.AppendLine("<br/>");
                //sb.AppendLine("<table width='170' style='table-layout: fixed; border-collapse: collapse; font-size: 9px;'><tr>");
                //sb.AppendLine("<td style='font-size:8pt; text-align:left;padding-left:2px'>");
                //sb.AppendLine("<strong>Sign Officer</strong>");
                //sb.AppendLine("</td>");
                //sb.AppendLine("<td style='font-size:8pt; text-align:right;padding-right:2px'>");
                //sb.AppendLine("<strong>Sign Cashier</strong>");
                //sb.AppendLine("</td>");
                //sb.AppendLine("</tr></table>");
                //sb.AppendLine("</td>");
            }

            sb.AppendLine("</tr>");
            sb.AppendLine("</table>");
            sb.AppendLine("</body></html>");
            return sb;
        }
        public StringBuilder GetSemesterFeeVoucherContentHBL(int StudentId)
        {
            try
            {
                int SemesterId = int.Parse(HttpContext.Current.Session["SemesterId"].ToString());
                StudentPersonalInfo objStudentPersonalInfo = new StudentPersonalInfo();
                objStudentPersonalInfo.StudentID = StudentId;
                objStudentPersonalInfo.SemesterId = SemesterId;
                DataTable dtApplicantInfo = objStudentPersonalInfo.GetStudentInfoByStudentIDforSemesterFeeVoucher();
                string logoPath = HttpContext.Current.Server.MapPath("~/Images/smiu_logo.png");
                int IsSelf = int.Parse(dtApplicantInfo.Rows[0]["IsSelfFinance"].ToString());
                int HBLFee = 200;
                int SelfFee = IsSelf > 0 ? Convert.ToInt32(dtApplicantInfo.Rows[0]["SelfAmount"].ToString()) : 0;
                int TotalSemesterFee = Convert.ToInt32(dtApplicantInfo.Rows[0]["TotalSemesterFee"].ToString())
                    + SelfFee + HBLFee; //200 additional HBL Deposit
                string TotalAmountInWords;

                TotalAmountInWords = NumbersToWords(TotalSemesterFee);

                #region Insert Voucher Download Details
                StudentTermFeeVouhcerLog objStdntFee = new StudentTermFeeVouhcerLog();
                objStdntFee.SemesterID = SemesterId;
                objStdntFee.InsertedBy = dtApplicantInfo.Rows[0]["StudentName"].ToString();
                objStdntFee.InsertedDate = DateTime.Now;
                bool result = false;
                result = objStdntFee.InsertSemesterFeeVoucherLog();

                #endregion
                StringBuilder sb = new StringBuilder();
                sb.Append("<table border='0' cellspacing='0' cellpadding='0' style='border: 0px; font-family: Arial; font-size: 9pt; table-layout: fixed; width: 100%;'>");
                sb.Append("<tr><td Style ='width: 25%;'>");
                sb.Append("<p><img src='" + logoPath + "' alt='logo' height='80px' /></p>");
                sb.Append("<table border='0' cellspacing='0' cellpadding='0' style='border: 0px; font-family: Arial; font-size: 9pt; table-layout: fixed; width: 100%;'>");
                sb.Append("<tr><td><strong>SEMESTER : " + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</strong></td></tr>");
                sb.Append("<tr><td><strong>VALID TILL: " + dtApplicantInfo.Rows[0]["ValidTilDate"].ToString() + "</strong></td></tr>");
                sb.Append("<tr><td><strong>TERM CODE: " + dtApplicantInfo.Rows[0]["SemesterCode"].ToString() + "</strong></td></tr>");
                sb.Append("</table>");
                sb.Append("<p style='font-family: Arial; font-size: 11pt;'>");
                sb.Append("<u><strong>Student Copy</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 9pt;'>");
                sb.Append("<strong>Challan #- (" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + ")</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 10pt;'>");
                sb.Append("<strong>Habib Bank Limited</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 10pt;'>");
                sb.Append("<strong>HBL Account # 00427991705303</strong></p>");
                sb.Append("<table border='1' cellspacing='0' width='90%' color ='black' cellpadding='0' style='font-family: Arial; font-size: 9pt; table-layout: fixed; border: 1px solid black; border-collapse: collapse;'>");
                sb.Append("<tr><td width='70' style='border: 1px solid #000000; height: 10px;' padding-left: 5px;><center><br /><strong>DATE</strong></center></td>");
                sb.Append("<td width='120' valign='top' style='border: 1px solid #000000; height: 10px;'><center><u><strong>DD-MON-YYYY</strong></u></center>");
                sb.Append("<center>");
                sb.Append("<strong>");
                sb.Append("<p>");
                sb.Append(" ___-________-20___</p></strong></center></td></tr></table>");
                sb.Append("<table border='0' cellspacing='0' cellpadding='5' style='border: 0px; font-family: Arial; font-size: 8pt;'>");
                sb.Append("<tr><td>");
                sb.Append("Name: <u><strong>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "</strong></u></td></tr>");
                sb.Append("<tr><td>ID#: <u><strong>" + dtApplicantInfo.Rows[0]["StudentID"].ToString() + "</strong></u> </td></tr>");
                sb.Append("<tr><td>");
                sb.Append("Faculty: <u><strong>" + dtApplicantInfo.Rows[0]["Faculty"].ToString() + "</strong></u></td></tr>");
                sb.Append("<tr>");
                sb.Append("<td>");
                sb.Append("Program: <u><strong>" + dtApplicantInfo.Rows[0]["Program"].ToString() + "</strong></u>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                sb.Append("<table border='1' width='90%' color ='black' cellspacing='0' cellpadding='0' style='font-family: Arial; font-size: 8pt; table-layout: fixed; border: 1px solid black; border-collapse: collapse;'>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("<strong>PARTICULARS</strong>");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='border: 1px solid #000000; height: 10px; text-align: right; padding-right: 5px;'>");
                sb.Append("<strong>FEES</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                if (IsSelf == 1)
                {
                    sb.Append("<tr>");
                    sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                    sb.Append("Self Finance Fee");
                    sb.Append("</td>");
                    sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                    sb.Append("<strong>" + SelfFee + "</strong>");
                    sb.Append("</td>");
                    sb.Append("</tr>");
                }
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'> Admission fee </td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["AdmissionFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Security Deposit");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["SecurityDeposit"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Student activity charges");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["StudentFund"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Lab & Library charges");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["LabLibraryCharges"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Enrollment Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["EnrollmentFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Registration Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TermRegistrationFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Examination Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TotalExaminationFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Tuition Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TotalCoursesFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                //Additional 200
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("HBL Deposit Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>"+HBLFee+"</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append(" Total");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" +TotalSemesterFee+"</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                

                sb.Append("</table>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<u><strong>Rupees (in words)</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 7pt;'>");
                sb.Append("<u><strong> " + TotalAmountInWords + "</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<u><strong>REMARKS:</strong></u></p>");
                sb.Append("<br />");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<strong>Depositor's&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Bank's cashier &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bank's officer</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<strong>Depositor's CNIC ____________________________</strong></p>");
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append("<p><img src='" + logoPath + "' alt='logo' height='80px' /></p>");
                sb.Append("<table border='0' cellspacing='0' cellpadding='0' style='border: 0px; font-family: Arial; font-size: 9pt; table-layout: fixed; width: 100%;'>");
                sb.Append("<tr><td><strong>SEMESTER : " + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</strong></td></tr>");
                sb.Append("<tr><td><strong>VALID TILL: " + dtApplicantInfo.Rows[0]["ValidTilDate"].ToString() + "</strong></td></tr>");
                sb.Append("<tr><td><strong>TERM CODE: " + dtApplicantInfo.Rows[0]["SemesterCode"].ToString() + "</strong></td></tr>");
                sb.Append("</table>");
                sb.Append("<p style='font-family: Arial; font-size: 11pt;'>");
                sb.Append("<u><strong>SMIU Admission Branch Copy</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 9pt;'>");
                sb.Append("<strong>Challan #- (" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + ")</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 10pt;'>");
                sb.Append("<strong>Habib Bank Limited</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 10pt;'>");
                sb.Append("<strong>HBL Account # 00427991705303</strong></p>");
                sb.Append("<table border='1' width='90%' cellspacing='0' cellpadding='0' style='font-family: Arial; font-size: 9pt; table-layout: fixed; border: 1px solid black; border-collapse: collapse;'>");
                sb.Append("<tr><td width='70' valign='top' style='border: 1px solid #000000; height: 10px;'><center><br /><strong>DATE</strong></center></td>");
                sb.Append("<td width='120' valign='top' style='border: 1px solid #000000; height: 10px;'><center><u><strong>DD-MON-YYYY</strong> </u></center>");
                sb.Append("<center>");
                sb.Append("<strong>");
                sb.Append("<p>");
                sb.Append(" ___-________-20___</p></strong></center></td></tr></table>");
                sb.Append("<table border='0' cellspacing='0' cellpadding='5' style='border: 0px; font-family: Arial; font-size: 8pt;'>");
                sb.Append("<tr><td>");
                sb.Append("Name: <u><strong>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "</strong></u></td></tr>");
                sb.Append("<tr><td>ID#: <u><strong>" + dtApplicantInfo.Rows[0]["StudentID"].ToString() + "</strong></u> </td></tr>");
                sb.Append("<tr><td>");
                sb.Append("Faculty: <u><strong>" + dtApplicantInfo.Rows[0]["Faculty"].ToString() + "</strong></u></td></tr>");
                sb.Append("<tr>");
                sb.Append("<td>");
                sb.Append("Program: <u><strong>" + dtApplicantInfo.Rows[0]["Program"].ToString() + "</strong></u>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                sb.Append("<table border='1' width='90%' cellspacing='0' cellpadding='0' style='font-family: Arial; font-size: 8pt; table-layout: fixed; border: 1px solid black; border-collapse: collapse;'>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("<strong>PARTICULARS</strong>");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='border: 1px solid #000000; height: 10px; text-align: right; padding-right: 5px;'>");
                sb.Append("<strong>FEES</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                if (IsSelf == 1)
                {
                    sb.Append("<tr>");
                    sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                    sb.Append("Self Finance Fee");
                    sb.Append("</td>");
                    sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                    sb.Append("<strong>" + SelfFee + "</strong>");
                    sb.Append("</td>");
                    sb.Append("</tr>");
                }
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'> Admission fee </td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["AdmissionFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Security Deposit");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["SecurityDeposit"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Student activity charges");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["StudentFund"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Lab & Library charges");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["LabLibraryCharges"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Enrollment Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["EnrollmentFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Registration Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TermRegistrationFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Examination Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TotalExaminationFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");


                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Tuition Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TotalCoursesFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");


                //Additional 200
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("HBL Deposit Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + HBLFee + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");



                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append(" Total");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + TotalSemesterFee + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<u><strong>Rupees (in words)</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 7pt;'>");
                sb.Append("<u><strong> " + TotalAmountInWords + "</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<u><strong>REMARKS:</strong></u></p>");
                sb.Append("<br />");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<strong>Depositor's&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Bank's cashier &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bank's officer</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<strong>Depositor's CNIC ____________________________</strong></p>");
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append("<p><img src='" + logoPath + "' alt='logo' height='80px' /></p>");
                sb.Append("<table border='0' cellspacing='0' cellpadding='0' style='border: 0px; font-family: Arial; font-size: 9pt; table-layout: fixed; width: 100%;'>");
                sb.Append("<tr><td><strong>SEMESTER : " + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</strong></td></tr>");
                sb.Append("<tr><td><strong>VALID TILL: " + dtApplicantInfo.Rows[0]["ValidTilDate"].ToString() + "</strong></td></tr>");
                sb.Append("<tr><td><strong>TERM CODE: " + dtApplicantInfo.Rows[0]["SemesterCode"].ToString() + "</strong></td></tr>");
                sb.Append("</table>");
                sb.Append("<p style='font-family: Arial; font-size: 11pt;'>");
                sb.Append("<u><strong>SMIU Accounts Branch Copy</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 9pt;'>");
                sb.Append("<strong>Challan #- (" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + ")</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 10pt;'>");
                sb.Append("<strong>Habib Bank Limited</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 10pt;'>");
                sb.Append("<strong>HBL Account # 00427991705303</strong></p>");
                sb.Append("<table border='1' cellspacing='0' width='90%'  cellpadding='0' style='font-family: Arial; font-size: 9pt; table-layout: fixed; border: 1px solid black; border-collapse: collapse;'>");
                sb.Append("<tr><td width='70' valign='top' style='border: 1px solid #000000; height: 10px;'><center><br /><strong>DATE</strong></center></td>");
                sb.Append("<td width='120' valign='top' style='border: 1px solid #000000; height: 10px;'><center><u><strong>DD-MON-YYYY</strong> </u></center>");
                sb.Append("<center>");
                sb.Append("<strong>");
                sb.Append("<p>");
                sb.Append(" ___-________-20___</p></strong></center></td></tr></table>");
                sb.Append("<table border='0' cellspacing='0' cellpadding='5' style='border: 0px; font-family: Arial; font-size: 8pt;'>");
                sb.Append("<tr><td>");
                sb.Append("Name: <u><strong>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "</strong></u></td></tr>");
                sb.Append("<tr><td>ID#: <u><strong>" + dtApplicantInfo.Rows[0]["StudentID"].ToString() + "</strong></u> </td></tr>");
                sb.Append("<tr><td>");
                sb.Append("Faculty: <u><strong>" + dtApplicantInfo.Rows[0]["Faculty"].ToString() + "</strong></u></td></tr>");
                sb.Append("<tr>");
                sb.Append("<td>");
                sb.Append("Program: <u><strong>" + dtApplicantInfo.Rows[0]["Program"].ToString() + "</strong></u>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                sb.Append("<table border='1' color ='black' cellspacing='0' width='90%' cellpadding='0' style='font-family: Arial; font-size: 8pt; table-layout: fixed; border: 1px solid black; border-collapse: collapse;'>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("<strong>PARTICULARS</strong>");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='border: 1px solid #000000; height: 10px; text-align: right; padding-right: 5px;'>");
                sb.Append("<strong>FEES</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                if (IsSelf == 1)
                {
                    sb.Append("<tr>");
                    sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                    sb.Append("Self Finance Fee");
                    sb.Append("</td>");
                    sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                    sb.Append("<strong>" + SelfFee + "</strong>");
                    sb.Append("</td>");
                    sb.Append("</tr>");
                }
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'> Admission fee </td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["AdmissionFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Security Deposit");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["SecurityDeposit"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Student activity charges");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["StudentFund"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Lab & Library charges");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["LabLibraryCharges"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Enrollment Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["EnrollmentFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Registration Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TermRegistrationFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Examination Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TotalExaminationFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");


                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Tuition Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TotalCoursesFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                //Additional 200
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("HBL Deposit Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + HBLFee + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");


                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append(" Total");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + TotalSemesterFee + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<u><strong>Rupees (in words)</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 7pt;'>");
                sb.Append("<u><strong> " + TotalAmountInWords + "</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<u><strong>REMARKS:</strong></u></p>");
                sb.Append("<br />");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<strong>Depositor's&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Bank's cashier &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bank's officer</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<strong>Depositor's CNIC ____________________________</strong></p>");
                sb.Append("</td>");
                sb.Append("<td>");
                sb.Append("<p><img src='" + logoPath + "' alt='logo' height='80px' /></p>");
                sb.Append("<table border='0' cellspacing='0' cellpadding='0' style='border: 0px; font-family: Arial; font-size: 9pt; table-layout: fixed; width: 100%;'>");
                sb.Append("<tr><td><strong>SEMESTER : " + dtApplicantInfo.Rows[0]["SemesterName"].ToString() + "</strong></td></tr>");
                sb.Append("<tr><td><strong>VALID TILL: " + dtApplicantInfo.Rows[0]["ValidTilDate"].ToString() + "</strong></td></tr>");
                sb.Append("<tr><td><strong>TERM CODE: " + dtApplicantInfo.Rows[0]["SemesterCode"].ToString() + "</strong></td></tr>");
                sb.Append("</table>");
                sb.Append("<p style='font-family: Arial; font-size: 11pt;'>");
                sb.Append("<u><strong>Bank Copy</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 9pt;'>");
                sb.Append("<strong>Challan #- (" + dtApplicantInfo.Rows[0]["FeeVocherNumber"].ToString() + ")</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 10pt;'>");
                sb.Append("<strong>Habib Bank Limited</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 10pt;'>");
                sb.Append("<strong>HBL Account # 00427991705303</strong></p>");
                sb.Append("<table border='1' width='90%' cellspacing='0' cellpadding='0' style='font-family: Arial; font-size: 9pt; table-layout: fixed; width: 100%; border: 1px solid black; border-collapse: collapse;'>");
                sb.Append("<tr><td width='70' valign='top' style='border: 1px solid #000000; height: 10px;'><center><br /><strong>DATE</strong></center></td>");
                sb.Append("<td width='120' valign='top' style='border: 1px solid #000000; height: 10px;'><center><u><strong>DD-MON-YYYY</strong> </u></center>");
                sb.Append("<center>");
                sb.Append("<strong>");
                sb.Append("<p>");
                sb.Append(" ___-________-20___</p></strong></center></td></tr></table>");
                sb.Append("<table border='0' cellspacing='0' cellpadding='5' style='border: 0px; font-family: Arial; font-size: 8pt;'>");
                sb.Append("<tr><td>");
                sb.Append("Name: <u><strong>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "</strong></u></td></tr>");
                sb.Append("<tr><td>ID#: <u><strong>" + dtApplicantInfo.Rows[0]["StudentID"].ToString() + "</strong></u> </td></tr>");
                sb.Append("<tr><td>");
                sb.Append("Faculty: <u><strong>" + dtApplicantInfo.Rows[0]["Faculty"].ToString() + "</strong></u></td></tr>");
                sb.Append("<tr>");
                sb.Append("<td>");
                sb.Append("Program: <u><strong>" + dtApplicantInfo.Rows[0]["Program"].ToString() + "</strong></u>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                sb.Append("<table border='1' width='90%' cellspacing='0' cellpadding='0' style='font-family: Arial; font-size: 8pt; table-layout: fixed; width: 100%; border: 1px solid black; border-collapse: collapse;'>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("<strong>PARTICULARS</strong>");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='border: 1px solid #000000; height: 10px; text-align: right; padding-right: 5px;'>");
                sb.Append("<strong>FEES</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                if (IsSelf == 1)
                {
                    sb.Append("<tr>");
                    sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                    sb.Append("Self Finance Fee");
                    sb.Append("</td>");
                    sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                    sb.Append("<strong>" + SelfFee + "</strong>");
                    sb.Append("</td>");
                    sb.Append("</tr>");
                }
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'> Admission fee </td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["AdmissionFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Security Deposit");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["SecurityDeposit"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Student activity charges");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["StudentFund"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Lab & Library charges");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["LabLibraryCharges"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Enrollment Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["EnrollmentFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Registration Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TermRegistrationFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Examination Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TotalExaminationFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");


                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("Tuition Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + dtApplicantInfo.Rows[0]["TotalCoursesFee"].ToString() + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");

                //Additional 200
                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append("HBL Deposit Fee");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + HBLFee + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");


                sb.Append("<tr>");
                sb.Append("<td width='168' valign='top' style='border: 1px solid #000000; height: 10px; padding-left: 5px;'>");
                sb.Append(" Total");
                sb.Append("</td>");
                sb.Append("<td width='90' valign='top' style='text-align: right; border: 1px solid #000000; height: 10px; padding-right: 5px;'>");
                sb.Append("<strong>" + TotalSemesterFee + "</strong>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<u><strong>Rupees (in words)</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 7pt;'>");
                sb.Append("<u><strong> " + TotalAmountInWords + "</strong></u></p>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<u><strong>REMARKS:</strong></u></p>");
                sb.Append("<br />");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<strong>Depositor's&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Bank's cashier &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bank's officer</strong></p>");
                sb.Append("<p style='font-family: Arial; font-size: 8pt;'>");
                sb.Append("<strong>Depositor's CNIC ____________________________</strong></p>");
                sb.Append("</td>");
                sb.Append("</tr>");
                sb.Append("</table>");
                return sb;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        
        public StringBuilder GetAdmissionFormContent(int StudentId)
        {
            StudentPersonalInfo objStudentPersonalInfo = new StudentPersonalInfo();
            objStudentPersonalInfo.StudentID = StudentId;
            DataTable dtApplicantInfo = objStudentPersonalInfo.NEW_GetStudentAdmissionFormInfoByStudentId();
            StringBuilder sb = new StringBuilder();
            string logoPath = HttpContext.Current.Server.MapPath("~/Images/smiu_logo_new.png");
            //  sb.Append("<font face='Times New Roman' , size= '10'> ");
            sb.Append("<table><tr>");
            sb.Append("<td width='468' colspan='15' rowspan='2'><p align='center'><img width='370' height='60' src= '" + logoPath + "' alt='smiu logo' /></p></td>");
            sb.Append("<td width='156' colspan='10' valign='bottom'><p align='center'><strong></strong></p></td>");
            sb.Append("<td width='108' colspan='4'><p align='left'><strong>&nbsp;</strong></p></td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            //sb.Append("<td width='156' colspan='10' valign='bottom'><p align='right' <strong>Reference ID: <strong> " + dtApplicantInfo.Rows[0]["StudentID"].ToString() + " </strong></strong></p></td>");
            sb.Append("<td width='156' colspan='10' valign='bottom'><p align='right'><strong></strong></p></td>");
            sb.Append("<td width='108' colspan='4' valign='bottom'><p align='center'><strong></strong></p></td>");
            sb.Append("</tr>");
            //sb.Append("<tr><td width='731' colspan='29' valign='top'><p align='center'><strong><u>ONLINE ADMISSION FORM</u></strong></p></td></tr></table>");
            sb.Append("<tr><td width='731' colspan='29' valign='top'><p align='center'><strong><u>ONLINE ADMISSION FORM</u><p align='right'>Reference ID: <strong> " + dtApplicantInfo.Rows[0]["StudentID"].ToString() + " </p></strong></p></td>");
            // sb.Append("<td><p align='right'><strong> </strong></strong></p></td>");
            sb.Append("</tr></table>");
            sb.Append("<table cellspacing='0' cellpadding='0' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt;' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tr><td width='114' colspan='3'><p align='center'> Degree Level</p></td>");
            sb.Append("<td width='108' colspan='3'><p align='center'> Preferences</p></td>");
            sb.Append("<td width='246' colspan='6'><p align='center'>Program</p></td>");
            sb.Append("<td width='150' colspan='6'><p align='center'>Shift</p></td>");
            sb.Append("<td width='90' colspan='3' rowspan='4'><p align='center'><img width='80' height='80' src='" + HttpContext.Current.Server.MapPath(new HandyUtility().LoadImageURL(objStudentPersonalInfo.StudentID)) + "' alt='student Photo'></p></td></tr>");
            sb.Append("<tr><td width='114' colspan='3' rowspan='3'><p align='center'><strong>" + dtApplicantInfo.Rows[0]["DegreeProgram"].ToString() + " </strong></p></td>");
            sb.Append("<td width='108' colspan='3'><p align='center'><strong>1st Preference:</strong></p></td>");
            string Shift = ExtractShift(dtApplicantInfo.Rows[0]["FirstChoice"].ToString());
            sb.Append("<td width='246' colspan='6'><p align='center'><strong>" + dtApplicantInfo.Rows[0]["FirstChoice"].ToString() + "</strong></p></td>");
            sb.Append("<td width='150' colspan='6'><p align='center'><strong>" + Shift + "</strong></p></td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='108' colspan='3'><p align='center'>2nd Preference:</p></td>");
            sb.Append(" <td width='246' colspan='6'><p align='center'><strong> " + dtApplicantInfo.Rows[0]["SecondChoice"].ToString() + " </strong></p></td>");
            Shift = ExtractShift(dtApplicantInfo.Rows[0]["SecondChoice"].ToString());
            sb.Append("<td width='150' colspan='6'><p align='center'>" + Shift + "</p></td>");
            sb.Append("</tr>");
            //sb.Append("<tr><td width='108' colspan='3'><p align='center'>3rd Preference:</p></td>");
            if (dtApplicantInfo.Rows[0]["ThirdChoice"] != null && dtApplicantInfo.Rows[0]["ThirdChoiceCode"].ToString()!="-1")
            {
                sb.Append("<tr><td width='108' colspan='3'><p align='center'>3rd Preference:</p></td>");
                sb.Append("<td width='246' colspan='6'><p align='center'><strong>" + dtApplicantInfo.Rows[0]["ThirdChoice"].ToString() + "</strong></p></td>");
                Shift = ExtractShift(dtApplicantInfo.Rows[0]["ThirdChoice"].ToString());
                sb.Append("<td width='150' colspan='6'><p align='center'>" + Shift + "</strong></p></td>");
                sb.Append("</tr>");
            }
            sb.Append("</table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<table style ='font-family: Times New Roman; font-size: 10pt'>");
            sb.Append("<tr>");
            sb.Append("<td width='731' colspan='29'><p align='left'><strong><u>CANDIDATE’S PROFILE:</u></strong><strong> </strong></p></td>");
            sb.Append("</tr>");
            sb.Append("</table>");
            sb.Append("<table cellspacing='0' cellpadding='5' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tr>");
            sb.Append("<td width='132' colspan='4'><p align='left' style='margin-left: 5px;'><strong>Name:</strong></p></td>");
            sb.Append("<td width='240' colspan='7'><p align='left'> <strong>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "</strong></p></td>");
            sb.Append("<td width='18'><p align='left'><strong>&nbsp;</strong></p></td>");
            sb.Append("<td width='108' colspan='4'><p align='left'><strong>Father’s Name:</strong></p></td>");
            sb.Append("<td width='233' colspan='12'><p>" + dtApplicantInfo.Rows[0]["FathersName"].ToString() + "</p></td>");
            sb.Append("<td width='1' colspan='2'><p>&nbsp;</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='132' colspan='4'><p align='left' style='margin-left: 5px;'><strong>CNIC/Form B:</strong></p></td>");
            sb.Append("<td width='240' colspan='7'><p align='left'>" + dtApplicantInfo.Rows[0]["CNICNumber"].ToString() + "</p></td>");
            sb.Append("<td width='18'><p align='left'><strong>&nbsp;</strong></p></td>");
            sb.Append("<td width='108' colspan='4'><p align='left'><strong>Date of Birth:</strong></p></td>");
            sb.Append("<td width='233' colspan='12'><p align='left'>" + dtApplicantInfo.Rows[0]["DateOfBirth"].ToString().Replace(" 00:00:00","") + "</p></td>");
            sb.Append("<td width='1' colspan='2'><p>&nbsp;</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='132' colspan='4'><p align='left' style='margin-left: 5px;'><strong>Gender:</strong></p></td>");
            sb.Append("<td width='240' colspan='7'> <p align='left'>" + dtApplicantInfo.Rows[0]["Gender"].ToString() + "</p></td>");
            sb.Append("<td width='18'><p align='left'><strong>&nbsp;</strong></p></td>");
            sb.Append("<td width='108' colspan='4'>");
            sb.Append("<p align='left'><strong>Birth Place:</strong></p></td>");
            sb.Append("<td width='233' colspan='12'><p align='left'>" + dtApplicantInfo.Rows[0]["DistrictOfDomicile"].ToString() + "</p></td>");
            sb.Append("<td width='1' colspan='2'><p>&nbsp;</td>");
            sb.Append("</tr>");
            sb.Append("<tr><td width='132' colspan='4'><p align='left' style='margin-left: 5px;'><strong>Marital Status:</strong></p></td>");
            sb.Append("<td width='240' colspan='7'><p align='left'> " + dtApplicantInfo.Rows[0]["MaritalStatus"].ToString() + "</p></td>");
            sb.Append("<td width='18'><p align='left'><strong>&nbsp;</strong></p></td>");
            sb.Append("<td width='108' colspan='4'><p align='left'><strong>Religion:</strong></p></td>");
            sb.Append("<td width='233' colspan='12'><p align='left'>" + dtApplicantInfo.Rows[0]["Religion"].ToString() + "</p></td>");
            sb.Append("<td width='1' colspan='2'><p>&nbsp;</td></tr>");
            sb.Append("<tr><td width='132' colspan='4'><p align='left' style='margin-left: 5px;'><strong>Domicile:</strong></p></td>");
            sb.Append("<td width='240' colspan='7'><p align='left'>" + dtApplicantInfo.Rows[0]["UrbanorRural"].ToString() + "</p></td>");
            sb.Append("<td width='18'><p align='left'> <strong>&nbsp;</strong></p></td>");
            sb.Append("<td width='108' colspan='4'><p align='left'><strong>Nationality:</strong></p></td>");
            sb.Append("<td width='233' colspan='12'><p align='left'>" + dtApplicantInfo.Rows[0]["Nationality"].ToString() + "</p></td>");
            sb.Append("<td width='1' colspan='2'><p> &nbsp;</td></tr>");
            sb.Append("<tr><td width='132' colspan='4'><p align='left' style='margin-left: 5px;'><strong>Postal Address:</strong></p></td>");
            sb.Append("<td width='366' colspan='12'><p align='left'>" + dtApplicantInfo.Rows[0]["PostalAddress"].ToString() + ",</p></td>");
            sb.Append("<td width='48' colspan='2'><p align='left'><strong></strong></p></td>");
            sb.Append("<td width='185' colspan='10'><p align='left'></p></td>");
            sb.Append("<td width='1' colspan='2'><p>&nbsp;</td></tr>");
            sb.Append("<tr>");
            sb.Append("<td width='132' colspan='4'><p align='left' style='margin-left: 5px;'><strong>Permanent Address:</strong></p></td>");
            sb.Append("<td width='366' colspan='12'><p align='left'>" + dtApplicantInfo.Rows[0]["PermanentAddress"].ToString() + ",</p></td>");
            sb.Append("<td width='48' colspan='2'><p align='left'><strong></strong></p></td>");
            sb.Append("<td width='185' colspan='10'><p align='left'></p></td>");
            sb.Append("<td width='1' colspan='2'><p>&nbsp; </td></tr>");
            sb.Append("<tr>");
            sb.Append("<td width='132' colspan='4'><p align='left' style='margin-left: 5px;'><strong>Cell No. (Self):</strong></p></td>");
            sb.Append("<td width='240' colspan='7'><p align='left'>" + dtApplicantInfo.Rows[0]["MobileNumber"].ToString() + "</p></td>");
            sb.Append("<td width='18'><p align='left'><strong>&nbsp;</strong></p></td>");
            sb.Append("<td width='156' colspan='6'><p align='left'><strong>Landline No. (Home):</strong></p></td>");
            sb.Append("<td width='185' colspan='10'><p align='left'>" + dtApplicantInfo.Rows[0]["HomePhoneNumber"].ToString() + "</p></td>");
            sb.Append("<td width='1' colspan='2'><p>&nbsp;</td></tr>");
            sb.Append("<tr><td width='132' colspan='4'><p align='left' style='margin-left: 5px;'><strong>Email:</strong></p></td>");
            sb.Append("<td width='240' colspan='7'><p align='left'>" + dtApplicantInfo.Rows[0]["EmailAddress"].ToString() + "</p></td>");
            sb.Append("<td width='18'><p align='left'><strong>&nbsp;</strong></p></td>");
            sb.Append("<td width='156' colspan='6'><p align='left'><strong></strong></p></td>");
            sb.Append("<td width='185' colspan='10'><p align='left'></p></td>");
            sb.Append("<td width='1' colspan='2'><p>&nbsp; </td></tr></table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<table style ='font-family: Times New Roman; font-size: 10pt'>");
            sb.Append("<tr>");
            sb.Append("<td width='731' colspan='28'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong><u>GUARDIAN’S / SPONSOR’S PARTICULARS:</u></strong></p>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</table>");
            sb.Append("<table cellspacing='0' cellpadding='5' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt'cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tbody>");
            sb.Append(" <tr>");
            sb.Append("<td width='132' colspan='4'>");
            sb.Append(" <p align='left'>");
            sb.Append("<strong>Name:</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='240' colspan='7'>");
            sb.Append("<p align='left'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["GuardiansName"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='18'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>&nbsp;</strong></p>");
            sb.Append("</td>");
            sb.Append(" <td width='156' colspan='6'>");
            sb.Append(" <p align='left'>");
            sb.Append("<strong>Relation:</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='185' colspan='10'>");
            sb.Append("<p align='left'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["GuardiansRelation"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append(" <td width='1' colspan='2'>");
            sb.Append("<p>");
            sb.Append(" &nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='132' colspan='4'>");
            sb.Append(" <p align='left'>");
            sb.Append("<strong>Occupation:</strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='240' colspan='7'>");
            sb.Append("<p align='left'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["GuardiansOccupation"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='18'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>&nbsp;</strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='156' colspan='6'>");
            sb.Append(" <p align='left'>");
            sb.Append("<strong>Nature (Public/Private):</strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='185' colspan='10'>");
            sb.Append(" <p align='left'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["GuardiansNatureofJob"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append(" <tr>");
            sb.Append("<td width='132' colspan='4'>");
            sb.Append(" <p align='left'>");
            sb.Append(" <strong>Organization:</strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='240' colspan='7'>");
            sb.Append("<p align='left'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["GuardiansOrganization"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append(" <td width='18'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>&nbsp;</strong></p>");
            sb.Append("</td>");
            sb.Append(" <td width='156' colspan='6'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>Designation:</strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='185' colspan='10'>");
            sb.Append("<p align='left'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["GuardiansDesignation"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append(" <tr>");
            sb.Append(" <td width='132' colspan='4'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>Monthly Income:</strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='240' colspan='7'>");
            sb.Append("<p align='left'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["GuardiansMonthlyIncome"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append(" <td width='18'>");
            sb.Append(" <p align='left'>");
            sb.Append(" <strong>&nbsp;</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append(" <p align='left'>");
            sb.Append(" <strong>Contact No.:</strong></p>");
            sb.Append("</td>");
            sb.Append(" <td width='185' colspan='10'>");
            sb.Append(" <p align='left'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["GuardianMobileNumber"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</tbody>");
            sb.Append("</table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<table style ='font-family: Times New Roman; font-size: 10pt'>");
            sb.Append("<tr>");
            sb.Append("<td width='731' colspan='28'>");
            //sb.Append("<p align='left'>");
            sb.Append("<strong><u>EMERGENCY CONTACT DETAILS:</u></strong>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</table>");
            sb.Append("<table cellspacing='0' cellpadding='5' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tbody>");
            sb.Append("<tr>");
            sb.Append("<td width='132' colspan='4'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>Name:</strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='240' colspan='7'>");
            sb.Append(" <p align='left'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["EmergencyName"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='18'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>&nbsp;</strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>Relation:</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='185' colspan='10'>");
            sb.Append("<p align='left'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["EmergencyRelation"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='132' colspan='4'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>Address:</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='240' colspan='7'>");
            sb.Append("<p align='left'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["EmergencyAddress"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='18'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>&nbsp;</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append("<p align='left'>");
            sb.Append(" <strong>Cell No.:</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='185' colspan='10'>");
            sb.Append("<p align='left'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["EmergencyMnumber"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</tbody>");
            sb.Append("</table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<table style ='font-family: Times New Roman; font-size: 10pt'>");
            sb.Append("<tr>");
            sb.Append("<td width='731' colspan='28'>");
            sb.Append("<p align='left'>");
            sb.Append(" <strong><u>ACADEMIC HISTORY:</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</table>");
            sb.Append("<table cellspacing='0' cellpadding='0' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tbody>");
            sb.Append("<tr>");
            sb.Append("<td width='78' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Level</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Group</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='174' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Institution</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Board</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='72' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>From</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='89' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>To</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append(" </td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='78' colspan='2'>");
            sb.Append(" <p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["SSCDegreeName"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["SSCGroup"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='174' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["SSCInstitution"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='162' colspan='8'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["SSCBoard"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='72' colspan='5'>");
            sb.Append(" <p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["SSCYearFrom"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='89' colspan='2'>");
            sb.Append(" <p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["SSCYearTo"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append(" &nbsp;");
            sb.Append(" </td>");
            sb.Append(" </tr>");
            sb.Append("<tr>");
            sb.Append("<td width='78' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Roll No.</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Marks Obtained</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='174' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Total Marks</u></strong></p>");
            sb.Append("</td>");
            sb.Append(" <td width='162' colspan='8'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>Percentage %</u></strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='72' colspan='5'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>Grade</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='89' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong><u>Exam</u></strong><strong><u> </u></strong>");
            sb.Append("</p>");
            sb.Append(" </td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append(" &nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='85' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["SSCSeatNumber"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["SSCMarksObtained"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='174' colspan='5'>");
            sb.Append(" <p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["SSCTotalMarks"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append(" <td width='162' colspan='8'>");
            sb.Append(" <p align='center'>");
            sb.Append(" " + string.Format("{0:0.00}", dtApplicantInfo.Rows[0]["SSCPercentage"].ToString())  + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='72' colspan='5'>");
            sb.Append(" <p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["SSCGrade"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='89' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["SSCExamType"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append("&nbsp;");
            sb.Append(" </td>");
            sb.Append(" </tr>");
            sb.Append("</tbody>");
            sb.Append("</table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<br />");
            sb.Append("<table cellspacing='0' cellpadding='0' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tbody>");
            sb.Append(" <tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Level</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong><u>Group</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Institution</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong><u>Board</u></strong></p>");
            sb.Append("</td>");
            sb.Append(" <td width='72' colspan='5' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>From</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='89' colspan='2' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>To</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append(" </tr>");
            sb.Append("<tr>");
            sb.Append("<td width='78' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["HSCDegreeName"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["HSCGroup"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='174' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["HSCInstitution"].ToString() + "</p>");
            sb.Append("  </td>");
            sb.Append(" <td width='162' colspan='8'>");
            sb.Append(" <p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["HSCBoard"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='72' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["HSCYearFrom"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='89' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["HSCYearTo"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append(" &nbsp;");
            sb.Append(" </td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>Roll No.</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>Marks Obtained</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong><u>Total Marks</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append(" <strong><u>Percentage %</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='72' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Grade</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='89' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Exam</u></strong><strong><u> </u></strong>");
            sb.Append(" </p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append(" </td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='78' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["HSCSeatNumber"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append(" <p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["HSCMarksObtained"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append(" <td width='174' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["HSCTotalMarks"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + string.Format("{0:0.00}", dtApplicantInfo.Rows[0]["HSCPercentage"].ToString()) + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='72' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["HSCGrade"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='89' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["HSCExamType"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append(" </tbody>");
            sb.Append(" </table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<br />");
            sb.Append("<table cellspacing='0' cellpadding='0' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append(" <table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append(" <tbody>");
            sb.Append(" <tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>Level</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>Subjects</u></strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='174' colspan='5' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append(" <strong><u>Institution</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong><u>University</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='72' colspan='5' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append(" <strong><u>From</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='89' colspan='2' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append(" <strong><u>To</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append("&nbsp;");
            sb.Append(" </td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td width='78' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["B14Program"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B14MajorSubjects"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append(" <td width='174' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B14Institution"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B14University"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='72' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["B14YearFrom"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='89' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["B14YearTo"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append(" <tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Roll No.</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Marks Obtained</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Total Marks</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong><u>Percentage %</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='72' colspan='5' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append(" <strong><u>Grade</u></strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='89' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong><u>Exam</u></strong><strong><u> </u></strong>");
            sb.Append(" </p>");
            sb.Append("  </td>");
            sb.Append(" <td width='1' colspan='2'>");
            sb.Append("  <p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append(" <tr>");
            sb.Append("<td width='78' colspan='2'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["B14SeatNumber"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append(" <td width='156' colspan='6'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["B14MarksObtained"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='174' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B14TotalMarks"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='162' colspan='8'>");
            sb.Append("<p align='center'>");
            sb.Append("" + string.Format("{0:0.00}", dtApplicantInfo.Rows[0]["B14Percentage"].ToString()) + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='72' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["B14GradeOrDivision"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append(" <td width='95' colspan='3'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["B14ExamType"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</tbody>");
            sb.Append("</table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<br />");
            sb.Append("<table cellspacing='0' cellpadding='0' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tbody>");
            sb.Append(" <tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Level</u></strong></p>");
            sb.Append("</td>");
            sb.Append(" <td width='156' colspan='6' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Subjects</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Institution</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>University</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='72' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>From</u></strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='89' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>To</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append(" <tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B16Program"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["B16MajorSubjects"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["B16Institution"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B16University"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append(" <td width='72' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B16YearFrom"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append(" <td width='89' colspan='2' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B16YearTo"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append(" <p>");
            sb.Append(" &nbsp;");
            sb.Append(" </td>");
            sb.Append("</tr>");
            sb.Append(" <tr>");
            sb.Append(" <td width='78' colspan='2' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("  <strong><u>Roll No.</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>Marks Obtained</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Total Marks</u></strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong><u>Percentage %</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='72' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Grade</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='89 ' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Exam</u></strong><strong><u> </u></strong>");
            sb.Append("</p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append(" <p>");
            sb.Append("&nbsp;");
            sb.Append(" </td>");
            sb.Append(" </tr>");
            sb.Append("<tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B16SeatNumber"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B16MarksObtained"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B16TotalMarks"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + string.Format("{0:0.00}", dtApplicantInfo.Rows[0]["B16Percentage"].ToString()) + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='72' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B16GradeOrDivision"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='89' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["B16ExamType"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</tbody>");
            sb.Append("</table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<table cellspacing='0' cellpadding='0' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tbody>");
            sb.Append(" <tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Level</u></strong></p>");
            sb.Append("</td>");
            sb.Append(" <td width='156' colspan='6' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Subjects</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Institution</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>University</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='72' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>From</u></strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='89' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>To</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append(" <tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["M18Program"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["M18MajorSubjects"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["M18Institution"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["M18University"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append(" <td width='72' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["M18YearFrom"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append(" <td width='89' colspan='2' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["M18YearTo"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append(" <p>");
            sb.Append(" &nbsp;");
            sb.Append(" </td>");
            sb.Append("</tr>");
            sb.Append(" <tr>");
            sb.Append(" <td width='78' colspan='2' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("  <strong><u>Roll No.</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong><u>Marks Obtained</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Total Marks</u></strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong><u>Percentage %</u></strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='72' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Grade</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='89 ' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong><u>Exam</u></strong><strong><u> </u></strong>");
            sb.Append("</p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append(" <p>");
            sb.Append("&nbsp;");
            sb.Append(" </td>");
            sb.Append(" </tr>");
            sb.Append("<tr>");
            sb.Append("<td width='78' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["M18SeatNumber"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='6' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["M18MarksObtained"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='174' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["M18TotalMarks"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append("<td width='162' colspan='8' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + string.Format("{0:0.00}", dtApplicantInfo.Rows[0]["M18Percentage"].ToString()) + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='72' colspan='5' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["M18GradeOrDivision"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='89' colspan='2' valign='top'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["M18ExamType"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</tbody>");
            sb.Append("</table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<table style ='font-family: Times New Roman; font-size: 10pt'>");
            sb.Append(" <tr>");
            sb.Append("<td width='731' colspan='28'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong><u>NTS / OTHER TEST RECORD:</u></strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='1' colspan='2'>");
            sb.Append(" <p>");
            sb.Append(" &nbsp;");
            sb.Append("</td>");
            sb.Append(" </tr>");
            sb.Append("</table>");
            sb.Append("<table cellspacing='0' cellpadding='0' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append(" <tbody>");
            sb.Append(" <tr>");
            sb.Append("<td width='132' colspan='4'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong>Test Type</strong></p>");
            sb.Append(" </td>");
            sb.Append(" <td width='93' colspan='3'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong>Testing Service</strong></p>");
            sb.Append("</td>");
            sb.Append(" <td width='93' colspan='3'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong>Roll No.</strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='102' colspan='4'>");
            sb.Append("<p align='center'>");
            sb.Append(" <strong>Max. Marks</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='105' colspan='3'>");
            sb.Append(" <p align='center'>");
            sb.Append("<strong>Marks Obtain</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='87' colspan='6'>");
            sb.Append("<p align='center'>");
            sb.Append("<strong>% age</strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='119' colspan='5'>");
            sb.Append("<p align='center'>");
            sb.Append("Test Date</p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append("<p>");
            sb.Append(" &nbsp;");
            sb.Append("</td>");
            sb.Append(" </tr>");
            sb.Append("<tr>");
            sb.Append(" <td width='132' colspan='4'>");
            sb.Append(" <p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["NTSTestType"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append(" <td width='93' colspan='3'>");
            sb.Append(" <p align='center'>");
            sb.Append("  " + dtApplicantInfo.Rows[0]["NTSTestingService"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='93' colspan='3'>");
            sb.Append("<p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["NTSRollNumber"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append(" <td width='102' colspan='4'>");
            sb.Append(" <p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["NTSTestMaxScore"].ToString() + "</p>");
            sb.Append(" </td>");
            sb.Append(" <td width='105' colspan='3'>");
            sb.Append(" <p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["NTSTestScore"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='87' colspan='6'>");
            sb.Append("<p align='center'>");
            sb.Append(" " + dtApplicantInfo.Rows[0]["NTSTestScore"].ToString() + "</p>");
            sb.Append("</td>");
            sb.Append("<td width='119' colspan='5'>");
            sb.Append(" <p align='center'>");
            sb.Append("" + dtApplicantInfo.Rows[0]["NTSDate"].ToString().Replace(" 00:00:00","") + "</p>");
            sb.Append("</td>");
            sb.Append("<td colspan='2'>");
            sb.Append("<p>");
            sb.Append("&nbsp;");
            sb.Append("</td>");
            sb.Append(" </tr>");
            sb.Append("</tbody>");
            sb.Append("</table>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append(" <br />");
            sb.Append("<table cellspacing='0' cellpadding='5' border ='1'>");
            sb.Append("<tbody><tr><td>");
            sb.Append(" <table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tbody>");
            sb.Append(" <tr>");
            sb.Append("<td width='732' colspan='30' style ='text-align: justify;'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong><u>Undertaking:</u></strong></p>");
            sb.Append("<ol>");
            sb.Append("<li>I  <u>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + " </u>  S/o / D/o <u> " + dtApplicantInfo.Rows[0]["FathersName"].ToString() + " </u> CNIC/Form’B’#  <u> " + dtApplicantInfo.Rows[0]["CNICNumber"].ToString() + " </u>");
            sb.Append("<p>do hereby solemnly declare that I did not hide anything or mislead / provide false information. In case, any information or document(s) provided by me are found untrue or any forgery is detected, the University reserves the right to cancel my admission at any stage.</p>");
            sb.Append("</li>");
            sb.Append("<li>");
            sb.Append("</p>Grant of admission on provisional basis (Result awaited) can be cancelled, In case, I could not pass the pre-requisite examination with minimum required percentage of marks / CGPA (vary from undergraduate/graduate programs to post graduate programs)  or failed to submit the required result within stipulated time period. and I will not be liable to challenge the university’s decision or claim for entitlement of any fee refund.");
            sb.Append("</p>");
            sb.Append("</li>");
            sb.Append("<li>");
            sb.Append("<p>I will conduct myself as a responsible student and will not get myself involved  in any political/prohibited activity in the University premises, and all the rules and regulation set by SMIU will be binding on me from time to time.");
            sb.Append(" </p>");
            sb.Append(" </li>");
            sb.Append("<li>");
            sb.Append("<p> Original Marks Sheet / Transcript of last pre-requisite exam would be submitted at the time of admission and the same will be retained with the University, till the completion of degree program.");
            sb.Append(" </p>");
            sb.Append("</li>");
            sb.Append("<li><p>I have read and understood all the rules and regulations of admission criteria of SMIU and I accept / abide by the same.");
            // sb.Append(" </p>");
            sb.Append("</li>");
            sb.Append("</ol>");
            sb.Append("</td>");
            sb.Append(" </tr>");
            sb.Append("<tr>");
            sb.Append("<td width='150' colspan='5'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>&nbsp;</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='156' colspan='4'>");
            sb.Append("<p align='left'>");
            sb.Append(" <strong>&nbsp;</strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='162' colspan='14' valign='bottom'>");
            sb.Append("<p align='right'>");
            sb.Append("<strong>Candidate’s Signature:</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='246' colspan='14'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>____________________</strong></p>");
            sb.Append("</td>");
            sb.Append("<td width='18' colspan='3'>");
            sb.Append("<p align='left'>");
            sb.Append(" <strong>&nbsp;</strong></p>");
            sb.Append(" </td>");
            sb.Append("</tr>");
            sb.Append("</tbody>");
            sb.Append(" </table>");
            // sb.Append("<br>");
            sb.Append("</td></tr></tbody></table>");
            sb.Append("<br />");
            // read the Checklist             
            sb.Append("<table style='font-family: Times New Roman; font-size: 9pt' cellspacing='0' cellpadding='0' border ='0'>");
            sb.Append("<tr>");
            sb.Append("<td>");
            sb.Append("<p align='left'>");
            sb.Append("<strong><u>Document Checklist:</u></strong></p>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("<tr>");
            sb.Append("<td>");
            sb.Append("<p align='left'>");
            sb.Append("Following are the list of documents to be attched herewith at the time of submission of Admission Form.</p>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append(" </table>");
            sb.Append("<br>");
            DocumentCheckList objDocumentChkList = new DocumentCheckList();
            objDocumentChkList.SemesterId = Convert.ToInt32(dtApplicantInfo.Rows[0]["SemesterId"].ToString());
            if (dtApplicantInfo.Rows[0]["DegreeProgram"].ToString() == "Graduate" || dtApplicantInfo.Rows[0]["DegreeProgram"].ToString() == "1")
            {
                objDocumentChkList.DegreeProgram = 1;

            }
            else if (dtApplicantInfo.Rows[0]["DegreeProgram"].ToString() == "Undergraduate" || dtApplicantInfo.Rows[0]["DegreeProgram"].ToString() == "2")
            {
                objDocumentChkList.DegreeProgram = 2;

            }
            else if (dtApplicantInfo.Rows[0]["DegreeProgram"].ToString() == "Postgraduate" || dtApplicantInfo.Rows[0]["DegreeProgram"].ToString() == "3")
            {
                objDocumentChkList.DegreeProgram = 3;
            }
            DataTable dtable = objDocumentChkList.DisplayDocumentCheckListforFeespayment();
            if (dtable.Rows.Count > 0)
            {
                int index = 1;
                sb.Append("<table border='1'>");
                sb.Append("<tr><td>");
                sb.Append("<table border='0' cellspacing='2' cellpadding='2' style='font-family: Times New Roman; font-size: 9pt;'>");
                for (int i = 0; i < dtable.Rows.Count; i++)
                {
                    sb.Append("<tr>");
                    sb.Append("<td width='36' valign='top' align='center'>" + index.ToString() + "</td>");
                    sb.Append("<td width='528' valign='top'>" + dtable.Rows[i]["DocumentName"].ToString() + "</td>");
                    sb.Append("<td width='20' valign='top' border ='1' color ='#000000'><strong></strong></td>");
                    sb.Append("</tr>");
                    index++;
                }
                sb.Append("</table>");
                sb.Append("</td></tr></table>");
            }
            sb.Append("<br />");
            sb.Append("<table style ='font-family: Times New Roman; font-size: 9pt'>");
            sb.Append("<tr><td width='150' colspan='5' valign='bottom'><p align='right'><strong>Candidate’s Signature:</strong></p></td>");
            sb.Append("<td width='156' colspan='5' valign='bottom'><p align='left'><strong>_____________</strong></p></td>");
            sb.Append("<td width='96' colspan='5' valign='bottom'><p align='right'><strong>Dated:</strong></p></td>");
            sb.Append("<td colspan='5'><p align='left'><strong>_____________</strong></p></td></tr>");
            sb.Append("<tr>");
            sb.Append("<td width='150' colspan='5'>");
            sb.Append("<p align='right'>");
            sb.Append("<strong>Candidate’s Name:</strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='150' colspan='10'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>" + dtApplicantInfo.Rows[0]["StudentName"].ToString() + "</strong></p>");
            sb.Append(" </td>");
            sb.Append("<td width='70' colspan='5'>");
            sb.Append(" <p align='left'>");
            sb.Append("<strong> Reference No:" + dtApplicantInfo.Rows[0]["StudentID"].ToString() + "</strong></p>");
            sb.Append("</td>");
            sb.Append("<td colspan='5'>");
            sb.Append("<p align='left'>");
            sb.Append("<strong>&nbsp;</strong></p>");
            sb.Append("</td>");
            sb.Append("</tr>");
            sb.Append("</table>");

            return sb;

        }
        public string LoadImageURL(int StudentId)
        {
            try
            {
                string photoPath = "~/Document/Photo/";
                string[] photoFiles = Directory.GetFiles(HttpContext.Current.Server.MapPath(photoPath), "*" + StudentId.ToString() + "*.*");
                if (photoFiles.Count() > 0)
                {
                    string fileName = photoFiles[0];
                    int bkSlshIndex = fileName.LastIndexOf(@"\") + 1;
                    return Path.Combine(photoPath, fileName.Substring(bkSlshIndex, fileName.Length - bkSlshIndex));
                }
            }
            catch
            {
            }
            return "~/Content/Theme/images/noImage.jpg";
        }
    }
}