using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;
using Microsoft.Reporting.Map.WebForms.BingMaps;
using SMIU_Admission.AppClasses.BusinessLogicLayer;
using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using SMIU_Admission.Resources;
using System.Web.UI;

namespace SMIU_Admission.NewForms
{
    public partial class _PreviewForm : System.Web.UI.Page
    {
        protected StudentPersonalInfo stdPer;
        private StudentProgram stdProgram;
        public _PreviewForm()
        {
            stdPer = new StudentPersonalInfo();
            stdProgram = new StudentProgram();
        }


        protected void LockData()
        {
            txtCNIC.Disabled = true;
            txtDOB.Disabled = true;
            txtDomicileDistrict.Disabled = true;
            txtEmail.Disabled = true;
            txtFatherName.Disabled = true;
            txtFatherOccupation.Disabled = true;
            txtFirstname.Disabled = true;
            txtHomeNo.Disabled = true;
            txtLastname.Disabled = true;
            txtMiddlename.Disabled = true;
            txtMobileNo.Disabled = true;
            txtPassport.Disabled = true;
            txtPermanentAddress.Disabled = true;
            txtPostalAddress.Disabled = true;
            ddlDomicile.Enabled = false;
            ddlGender.Enabled = false;
            ddlMarital.Enabled = false;
            ddlNationality.Enabled = false;
            ddlReligion.Enabled = false;

            txtGuardAddress.Disabled = true;
            txtGuardDesignation.Disabled = true;
            txtGuardIncome.Disabled = true;
            txtGuardMobileNo.Disabled = true;
            txtGuardName.Disabled = true;
            txtGuardOccu.Disabled = true;
            txtGuardOrganization.Disabled = true;
            txtGuardRelation.Disabled = true;
            ddlGuardJobNature.Enabled = false;
            txtEmrgAddress.Disabled = true;
            txtEmrgMobileNo.Disabled = true;
            txtEmrgRelation.Disabled = true;
            txtEmrgName.Disabled = true;

            ddlNTSType.Enabled = false;
            txtNTSDate.Disabled = true;
            txtNTSDate.Disabled = true;
            txtNTSRoll.Disabled = true;
            txtNTSService.Disabled = true;
            txtNTSObtainedMarks.Disabled = true;
            txtNTSTotalMarks.Disabled = true;

            txtInstitution.Disabled = true;
            ddlBoardSSC.Enabled = false;
            ddlDegreeSSC.Enabled = false;
            ddlExamTypeSSC.Enabled = false;
            ddlGradeSSC.Enabled = false;
            ddlGroupSSC.Enabled = false;
            txtFromYearSSC.Disabled = true;
            txtObtainedMarksSSC.Disabled = true;
            txtPassYearSSC.Disabled = true;
            txtPercentageSSC.Disabled = true;
            txtSeatNoSSC.Disabled = true;
            txtTotalMarksSSC.Disabled = true;
            ddlBoardHSC.Enabled = false;
            ddlDegreeHSC.Enabled = false;
            ddlExamTypeHSC.Enabled = false;
            ddlGradeHSC.Enabled = false;
            ddlGroupHSC.Enabled = false;
            txtFromYearHSC.Disabled = true;
            txtObtainedMarksHSC.Disabled = true;
            txtPassYearHSC.Disabled = true;
            txtPercentageHSC.Disabled = true;
            txtSeatNoHSC.Disabled = true;
            txtTotalMarksHSC.Disabled = true;
            txtInstitutionHSC.Disabled = true;
            txtSeatNoB14.Disabled = true;
            txtUniversityB14.Disabled = true;
            txtProgramB14.Disabled = true;
            txtObtainedMarksB14.Disabled = true;
            txtTotalMarksB14.Disabled = true;
            txtPercentageB14.Disabled = true;
            ddlGradeB14.Enabled = false;
            txtInstitutionB14.Disabled = true;
            txtFromYearB14.Disabled = true;
            txtPassYearB14.Disabled = true;
            ddlExamTypeB14.Enabled = false;
            txtMajorsB14.Disabled = true;
            txtSeatNoB16.Disabled = true;
            txtUniversityB16.Disabled = true;
            txtProgramB16.Disabled = true;
            txtObtainedMarksB16.Disabled = true;
            txtTotalMarksB16.Disabled = true;
            txtPercentageB16.Disabled = true;
            txtCGPAB16.Disabled = true;
            ddlGradeB16.Enabled = false;
            txtInstitutionB16.Disabled = true;
            txtFromYearB16.Disabled = true;
            txtPassYearB16.Disabled = true;
            ddlExamTypeB16.Enabled = false;
            txtMajorsB16.Disabled = true;
            txtSeatNoM18.Disabled = true;
            txtUniversityM18.Disabled = true;
            txtProgramM18.Disabled = true;
            txtObtainedMarksM18.Disabled = true;
            txtTotalMarksM18.Disabled = true;
            txtPercentageM18.Disabled = true;
            txtCGPAM18.Disabled = true;
            ddlGradeM18.Enabled = false;
            txtInstitutionM18.Disabled = true;
            txtFromYearM18.Disabled = true;
            txtPassYearM18.Disabled = true;
            ddlExamTypeM18.Enabled = false;
            txtMajorsM18.Disabled = true;

            ddlFirstChoice.Enabled = false;
            ddlSecondChoice.Enabled = false;
            ddlThirdChoice.Enabled = false;
            ddlFourthChoice.Enabled = false;
            ddlFifthChoice.Enabled = false;
            ddlSixthChoice.Enabled = false;
            ddlSeventhChoice.Enabled = false;
            ddlEighthChoice.Enabled = false;
            ddlNinthChoice.Enabled = false;
            ddlTenthChoice.Enabled = false;

            chkSelfFinance.Enabled = false;
            chkTransport.Enabled = false;
            txtTransport.Enabled = false;
        }

        private void PopulateAdmissionFormInfo(DataTable dt)
        {
            DataRow row = dt.Rows[0];
            imgPhoto.ImageUrl = new HandyUtility().LoadImageURL(stdPer.StudentID);
            txtCNIC.Value = row["CNICNumber"].ToString();
            txtPassport.Value = row["PassportNumber"].ToString();
            txtFirstname.Value = row["FirstName"].ToString();
            txtMiddlename.Value = row["MiddleName"].ToString();
            txtLastname.Value = row["LastName"].ToString();
            txtFatherName.Value = row["FathersName"].ToString();
            txtFatherOccupation.Value = row["FathersOccupation"].ToString();
            ddlNationality.SelectedItem.Text = row["Nationality"].ToString();
            ddlReligion.SelectedValue = row["Religion"].ToString();
            ddlGender.SelectedValue = row["Gender"].ToString();
            txtDOB.Value = row["DateofBirth"].ToString().Replace(" 00:00:00","");
            //txtPlaceOfBirth.Text = row["PlaceOfBirth"].ToString();
            ddlMarital.SelectedValue = row["MaritalStatus"].ToString();
            txtPermanentAddress.Value = row["PermanentAddress"].ToString();
            txtPostalAddress.Value = row["PostalAddress"].ToString();
            //txtCorrAddress.Text = row["PostalAddress"].ToString();
            //  txtCity.Text = row["City"].ToString();
            //txtPostalCode.Text = row["PostalCode"].ToString();
            //txtCountry.Text = row["Country"].ToString();
            txtHomeNo.Value = row["HomePhoneNumber"].ToString();
            txtMobileNo.Value = row["MobileNumber"].ToString();
            txtEmail.Value = row["EmailAddress"].ToString();
            // txtEmergencyContact.Text = row["EmergencyContactNo"].ToString();
            txtDomicileDistrict.Value = row["DistrictOfDomicile"].ToString();
            ddlDomicile.SelectedItem.Text = row["UrbanorRural"].ToString();
            //PermanenttxtCity.Text = row["PermanentCity"].ToString();
            //PostaltxtCity.Text = row["PostalCity"].ToString();
            //txtMobileNoHome.Text = row["MobileNumberHome"].ToString();
            txtEmrgName.Value = row["EmergencyName"].ToString();
            txtEmrgRelation.Value = row["EmergencyRelation"].ToString();
            txtEmrgAddress.Value = row["EmergencyAddress"].ToString();
            txtEmrgMobileNo.Value = row["EmergencyMnumber"].ToString();

            // Guardian's Information
            txtGuardName.Value = row["GuardiansName"].ToString();
            txtGuardOccu.Value = row["GuardiansOccupation"].ToString();
            txtGuardAddress.Value = row["GuardiansAddress"].ToString();
            txtGuardRelation.Value = row["GuardiansRelation"].ToString();
            ddlGuardJobNature.SelectedValue = row["GuardiansNatureofJob"].ToString();
            txtGuardOrganization.Value = row["GuardiansOrganization"].ToString();
            txtGuardDesignation.Value = row["GuardiansDesignation"].ToString();
            txtGuardIncome.Value = row["GuardiansMonthlyIncome"].ToString();
            txtGuardMobileNo.Value = row["GuardianMobileNumber"].ToString();

            //SSC
            ddlDegreeSSC.SelectedItem.Text = row["SSCDegreeName"].ToString();
            txtSeatNoSSC.Value = row["SSCSeatNumber"].ToString();
            ddlBoardSSC.SelectedItem.Text = row["SSCBoard"].ToString();
            ddlGroupSSC.SelectedItem.Text = row["SSCGroup"].ToString();
            txtObtainedMarksSSC.Value = row["SSCMarksObtained"].ToString();
            txtTotalMarksSSC.Value = row["SSCTotalMarks"].ToString();
            txtPercentageSSC.Value = row["SSCPercentage"].ToString();
            ddlGradeSSC.SelectedItem.Text = row["SSCGrade"].ToString();
            txtInstitution.Value = row["SSCInstitution"].ToString();
            txtFromYearSSC.Value = row["SSCYearFrom"].ToString();
            txtPassYearSSC.Value = row["SSCYearTo"].ToString();
            ddlExamTypeSSC.SelectedItem.Text = row["SSCExamType"].ToString();

            //HSC
            ddlDegreeHSC.SelectedItem.Text = row["HSCDegreeName"].ToString();
            txtSeatNoHSC.Value = row["HSCSeatNumber"].ToString();
            ddlBoardHSC.SelectedItem.Text = row["HSCBoard"].ToString();
            ddlGroupHSC.SelectedItem.Text = row["HSCGroup"].ToString();
            txtObtainedMarksHSC.Value = row["HSCMarksObtained"].ToString();
            txtTotalMarksHSC.Value = row["HSCTotalMarks"].ToString();
            txtPercentageHSC.Value = row["HSCPercentage"].ToString();
            ddlGradeHSC.SelectedItem.Text = row["HSCGrade"].ToString();
            txtInstitutionHSC.Value = row["HSCInstitution"].ToString();
            txtFromYearHSC.Value = row["HSCYearFrom"].ToString();
            txtPassYearHSC.Value = row["HSCYearTo"].ToString();
            ddlExamTypeHSC.SelectedItem.Text = row["HSCExamType"].ToString();

            ddlNTSType.SelectedItem.Value = row["NTSTestType"].ToString();
            txtNTSDate.Value = row["NTSDate"].ToString();
            txtNTSRoll.Value = row["NTSRollNumber"].ToString();
            txtNTSService.Value = row["NTSTestingService"].ToString();
            txtNTSObtainedMarks.Value = row["NTSTestScore"].ToString();
            txtNTSTotalMarks.Value = row["NTSTestMaxScore"].ToString();

            if (row["DegreeProgram"].ToString() == "Postgraduate")
            {
                ddlDegreeProgram.SelectedValue = "3";
                divBachelor14.Visible = false;

                //M18
                txtSeatNoM18.Value = row["M18SeatNumber"].ToString();
                txtUniversityM18.Value = row["M18University"].ToString();
                txtProgramM18.Value = row["M18Program"].ToString();
                txtObtainedMarksM18.Value = row["M18MarksObtained"].ToString();
                txtTotalMarksM18.Value = row["M18TotalMarks"].ToString();
                txtPercentageM18.Value = row["M18Percentage"].ToString();
                ddlGradeM18.SelectedItem.Text = row["M18GradeOrDivision"].ToString();
                txtInstitutionM18.Value = row["M18Institution"].ToString();
                txtFromYearM18.Value = row["M18YearFrom"].ToString();
                txtPassYearM18.Value = row["M18YearTo"].ToString();
                ddlExamTypeM18.SelectedItem.Text = row["M18ExamType"].ToString();
                txtMajorsM18.Value = row["M18MajorSubjects"].ToString();
                txtCGPAM18.Value = row["M18CGPA"].ToString();

                //B16
                txtSeatNoB16.Value = row["B16SeatNumber"].ToString();
                txtUniversityB16.Value = row["B16University"].ToString();
                txtProgramB16.Value = row["B16Program"].ToString();
                txtObtainedMarksB16.Value = row["B16MarksObtained"].ToString();
                txtTotalMarksB16.Value = row["B16TotalMarks"].ToString();
                txtPercentageB16.Value = row["B16Percentage"].ToString();
                ddlGradeB16.SelectedItem.Text = row["B16GradeOrDivision"].ToString();
                txtInstitutionB16.Value = row["B16Institution"].ToString();
                txtFromYearB16.Value = row["B16YearFrom"].ToString();
                txtPassYearB16.Value = row["B16YearTo"].ToString();
                ddlExamTypeB16.SelectedItem.Text = row["B16ExamType"].ToString();
                txtMajorsB16.Value = row["B16MajorSubjects"].ToString();
                txtCGPAB16.Value = row["B16CGPA"].ToString();
            }
            else if (row["DegreeProgram"].ToString() == "Undergraduate")
            {
                ddlDegreeProgram.SelectedValue = "2";                
                
                divMasters18.Visible = false;

                if (row["FirstChoice"].ToString().Contains("2"))
                {
                    divBachelor16.Visible = false;

                    //B14
                    txtSeatNoB14.Value = row["B14SeatNumber"].ToString();
                    txtUniversityB14.Value = row["B14University"].ToString();
                    txtProgramB14.Value = row["B14Program"].ToString();
                    txtObtainedMarksB14.Value = row["B14MarksObtained"].ToString();
                    txtTotalMarksB14.Value = row["B14TotalMarks"].ToString();
                    txtPercentageB14.Value = row["B14Percentage"].ToString();
                    ddlGradeB14.SelectedItem.Text = row["B14GradeOrDivision"].ToString();
                    txtInstitutionB14.Value = row["B14Institution"].ToString();
                    txtFromYearB14.Value = row["B14YearFrom"].ToString();
                    txtPassYearB14.Value = row["B14YearTo"].ToString();
                    ddlExamTypeB14.SelectedItem.Text = row["B14ExamType"].ToString();
                    txtMajorsB14.Value = row["B14MajorSubjects"].ToString();

                }
                else if (row["FirstChoice"].ToString().Contains("1.5"))
                {
                    divBachelor14.Visible = false;

                    //B16
                    txtSeatNoB16.Value = row["B16SeatNumber"].ToString();
                    txtUniversityB16.Value = row["B16University"].ToString();
                    txtProgramB16.Value = row["B16Program"].ToString();
                    txtObtainedMarksB16.Value = row["B16MarksObtained"].ToString();
                    txtTotalMarksB16.Value = row["B16TotalMarks"].ToString();
                    txtPercentageB16.Value = row["B16Percentage"].ToString();
                    ddlGradeB16.SelectedItem.Text = row["B16GradeOrDivision"].ToString();
                    txtInstitutionB16.Value = row["B16Institution"].ToString();
                    txtFromYearB16.Value = row["B16YearFrom"].ToString();
                    txtPassYearB16.Value = row["B16YearTo"].ToString();
                    ddlExamTypeB16.SelectedItem.Text = row["B16ExamType"].ToString();
                    txtMajorsB16.Value = row["B16MajorSubjects"].ToString();
                    txtCGPAB16.Value = row["B16CGPA"].ToString();

                }
                else
                {
                    divBachelor14.Visible = false;
                    divBachelor16.Visible = false;

                    divUndergraduateFacility.Visible = true;
                    if (!string.IsNullOrEmpty(row["SelfFinance"].ToString()) && Convert.ToBoolean(row["SelfFinance"].ToString()))
                        chkSelfFinance.Checked = true;

                    if (!string.IsNullOrEmpty(row["AvailTransport"].ToString()) && Convert.ToBoolean(row["AvailTransport"].ToString()))
                    {
                        chkTransport.Checked = true;
                        txtTransport.Visible = true;
                        txtTransport.Text = row["TransportDesc"] != null ? row["TransportDesc"].ToString() : "";
                    }
                }
                
            }
            else if (row["DegreeProgram"].ToString() == "Graduate")
            {
                divBachelor14.Visible = false;
                divMasters18.Visible = false;
                ddlDegreeProgram.SelectedValue = "1";
                
                //B16
                txtSeatNoB16.Value = row["B16SeatNumber"].ToString();
                txtUniversityB16.Value = row["B16University"].ToString();
                txtProgramB16.Value = row["B16Program"].ToString();
                txtObtainedMarksB16.Value = row["B16MarksObtained"].ToString();
                txtTotalMarksB16.Value = row["B16TotalMarks"].ToString();
                txtPercentageB16.Value = row["B16Percentage"].ToString();
                ddlGradeB16.SelectedItem.Text = row["B16GradeOrDivision"].ToString();
                txtInstitutionB16.Value = row["B16Institution"].ToString();
                txtFromYearB16.Value = row["B16YearFrom"].ToString();
                txtPassYearB16.Value = row["B16YearTo"].ToString();
                ddlExamTypeB16.SelectedItem.Text = row["B16ExamType"].ToString();
                txtMajorsB16.Value = row["B16MajorSubjects"].ToString();
                txtCGPAB16.Value = row["B16CGPA"].ToString();
            }

            stdProgram.DegreeProgram = int.Parse(ddlDegreeProgram.SelectedItem.Value);
            DataTable dtPrograms = stdProgram.GetAllProgramsForDropDownbyDepartment();
            if (dtPrograms.Rows.Count > 0)
            {
                BindProgramChoices(dtPrograms, ddlFirstChoice, new System.Web.UI.WebControls.ListItem(row["FirstChoice"].ToString(), row["FirstChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlSecondChoice, new System.Web.UI.WebControls.ListItem(row["SecondChoice"].ToString(), row["SecondChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlThirdChoice, new System.Web.UI.WebControls.ListItem(row["ThirdChoice"].ToString(), row["ThirdChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlFourthChoice, new System.Web.UI.WebControls.ListItem(row["FourthChoice"].ToString(), row["FourthChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlFifthChoice, new System.Web.UI.WebControls.ListItem(row["FifthChoice"].ToString(), row["FifthChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlSixthChoice, new System.Web.UI.WebControls.ListItem(row["SixthChoice"].ToString(), row["SixthChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlSeventhChoice, new System.Web.UI.WebControls.ListItem(row["SeventhChoice"].ToString(), row["SeventhChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlEighthChoice, new System.Web.UI.WebControls.ListItem(row["EighthChoice"].ToString(), row["EighthChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlNinthChoice, new System.Web.UI.WebControls.ListItem(row["NinethChoice"].ToString(), row["NinethChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlTenthChoice, new System.Web.UI.WebControls.ListItem(row["TenthChoice"].ToString(), row["TenthChoiceCode"].ToString()));
            }
        }
        protected void BindProgramChoices(DataTable dt, DropDownList ddl, System.Web.UI.WebControls.ListItem item)
        {
            ddl.Items.Clear();
            ddl.DataSource = dt;
            ddl.DataTextField = "ProgramLongName";
            ddl.DataValueField = "ProgramCode";
            ddl.DataBind();
            ddl.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Program--", "-1"));
            ddl.SelectedItem.Text = item.Text;
            ddl.SelectedItem.Value = item.Value;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                lblError.Visible = false;
                lblSuccess.Visible = false;
                if (!Page.IsPostBack)
                {
                    if (Session["StudentId"] != null)
                    {
                        stdPer.StudentID = Convert.ToInt32(Session["StudentId"]);
                        DataTable dt = stdPer.NEW_GetStudentAdmissionFormInfoByStudentId();
                        if (dt.Rows.Count > 0)
                        {
                            if (dt.Rows[0]["IsFinalSubmitted"]!=null && Convert.ToBoolean(dt.Rows[0]["IsFinalSubmitted"]))
                            {   
                                divUndergraduateFacility.Visible = false;
                                PopulateAdmissionFormInfo(dt);
                                LockData();
                                lblSuccess.Visible = true;
                                lblSuccess.Text = "Your Admission form has been submitted successfully. Please check \"Application Updates\" menu for further information on Application process.";
                            }
                        }
                        else
                        {
                            divAcademicInfo.Visible = false;
                            lblError.Visible = true;
                            lblError.Text = "Please complete all steps and submit the form first.";
                        }
                    }
                }

            }
            catch { }
        }

        protected void btnApplicationForm_Click(object sender, EventArgs e)
        {
            int StudentId = int.Parse(Session["StudentId"].ToString());
            StringBuilder stringBuilder = new HandyUtility().GetAdmissionFormContent(StudentId);
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=" + StudentId + "_Admission_Form.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    StringReader sr = new StringReader(stringBuilder.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    htmlparser.Parse(sr);
                    pdfDoc.Close();
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }

        protected void btnFeeVoucher_Click(object sender, EventArgs e)
        {
            int StudentId = int.Parse(Session["StudentId"].ToString());
            StringBuilder stringBuilder = new HandyUtility().GetFeeVoucherContent(StudentId);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + StudentId + "_Fee_Voucher.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringReader sr = new StringReader(stringBuilder.ToString());
            Document pdfDoc = new Document(PageSize.A4.Rotate(), 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }

        protected void btnFeeVoucherHBL_Click(object sender, EventArgs e)
        {
            int StudentId = int.Parse(Session["StudentId"].ToString());
            //StringBuilder stringBuilder = new HandyUtility().GetFeeVoucherContentHBL(StudentId);
            StringBuilder stringBuilder = new HandyUtility().GetFeeVoucherContent(StudentId);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + StudentId + "_Fee_Voucher.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringReader sr = new StringReader(stringBuilder.ToString());
            Document pdfDoc = new Document(PageSize.A4.Rotate(), 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
    }
}

