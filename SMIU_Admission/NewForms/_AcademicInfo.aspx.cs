using Microsoft.Reporting.Map.WebForms.BingMaps;
using SMIU_Admission.AppClasses.BusinessLogicLayer;
using System;
using System.Data.SqlClient;

using System.Data;

using System.Xml.Linq;
using System.Dynamic;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Web.Globalization;
using AjaxControlToolkit.HTMLEditor.ToolbarButton;
using SMIU_Admission.AppClasses.UtilityClasses;
using System.IO;
using System.Configuration;
using System.Drawing;
using System.Net.Mail;
using Org.BouncyCastle.Crypto.Engines;
using System.Data.SqlTypes;
using SMIU_Admission.Resources;
using QMS.DataAccessLayer;

namespace SMIU_Admission.NewForms
{
    public partial class _AcademicInfo : System.Web.UI.Page
    {
        protected StudentGuardiansInfo stdGuard;
        protected StudentPersonalInfo stdPer;
        protected StudentProgramInfo stdPrgInfo;
        protected StudentHSCEducation eduHSC;
        protected Student14YearsEducation edu14;
        protected Student16YearsEducation edu16;
        protected Student18YearsEducation edu18;
        private StudentCurrentStatus stdCurStatus;
        private HandyUtility handyUtility;
        public _AcademicInfo()
        {
            handyUtility = new HandyUtility();
            stdGuard = new StudentGuardiansInfo();
            stdPer = new StudentPersonalInfo();
            stdPrgInfo = new StudentProgramInfo();
            eduHSC = new StudentHSCEducation();
            edu14 = new Student14YearsEducation();
            edu16 = new Student16YearsEducation();
            edu18 = new Student18YearsEducation();
        }

        protected void PopulateEducationInfo(DataTable dt)
        {
            DataRow row = dt.Rows[0];

            ddlDegreeSSC.SelectedItem.Text = row["SSCDegreeName"].ToString();
            txtSeatNoSSC.Value = row["SSCSeatNumber"].ToString();
            ddlBoardSSC.SelectedItem.Text = row["SSCBoard"].ToString();
            ddlGroupSSC.SelectedItem.Text = row["SSCGroup"].ToString();
            txtObtainedMarksSSC.Value= row["SSCMarksObtained"].ToString();
            txtTotalMarksSSC.Value = row["SSCTotalMarks"].ToString();
            txtPercentageSSC.Value= row["SSCPercentage"].ToString();
            ddlGradeSSC.SelectedItem.Text= row["SSCGrade"].ToString();
            txtInstitution.Value = row["SSCInstitution"].ToString();
            txtFromYearSSC.Value= row["SSCYearFrom"].ToString();
            txtPassYearSSC.Value= row["SSCYearTo"].ToString();
            ddlExamTypeSSC.SelectedItem.Text= row["SSCExamType"].ToString();

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

            ddlNTSType.SelectedItem.Text = row["NTSTestType"].ToString();
            txtNTSDateLocked.Value = row["NTSDate"].ToString();
            txtNTSRoll.Value = row["NTSRollNumber"].ToString();
            txtNTSService.Value = row["NTSTestingService"].ToString();
            txtNTSObtainedMarks.Value = row["NTSTestScore"].ToString();
            txtNTSTotalMarks.Value = row["NTSTestMaxScore"].ToString();

            if (divBachelor14.Visible)
            {
                txtSeatNoB14.Value= row["B14SeatNumber"].ToString();
                txtUniversityB14.Value = row["B14University"].ToString();
                txtProgramB14.Value = row["B14Program"].ToString();
                txtObtainedMarksB14.Value= row["B14MarksObtained"].ToString();
                txtTotalMarksB14.Value = row["B14TotalMarks"].ToString();
                txtPercentageB14.Value = row["B14Percentage"].ToString();
                ddlGradeB14.SelectedItem.Text = row["B14GradeOrDivision"].ToString();
                txtInstitutionB14.Value = row["B14Institution"].ToString();
                txtFromYearB14.Value = row["B14YearFrom"].ToString();
                txtPassYearB14.Value = row["B14YearTo"].ToString();
                ddlExamTypeB14.SelectedItem.Text = row["B14ExamType"].ToString();
                txtMajorsB14.Value = row["B14MajorSubjects"].ToString();
            }
            else if (divBachelor16.Visible)
            {
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

            if (divMasters18.Visible)
            {
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
            }



        }
        protected void LockData()
        {
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


            ddlNTSType.Enabled = false;
            txtNTSDate.Disabled = true;
            txtNTSDateLocked.Disabled = true;
            txtNTSRoll.Disabled = true;
            txtNTSService.Disabled = true;
            txtNTSObtainedMarks.Disabled = true;
            txtNTSTotalMarks.Disabled = true;

            if (divBachelor14.Visible)
            {
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
            }
            else if (divBachelor16.Visible)
            {
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
            }

            if(divMasters18.Visible)
            {
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
            }
        }

        private void PopupateInitialEducationData(DataTable dt)
        {
            DataRow row = dt.Rows[0];
            if (row["DegreeProgram"].ToString().ToUpper().Contains("UNDERGRADUATE"))
            {
                divMasters18.Visible = false;

                if (row["FirstChoice"].ToString().Contains("1.5"))
                    divBachelor14.Visible = false;
                else if (row["FirstChoice"].ToString().Contains("2"))
                    divBachelor16.Visible = false;
                else
                {
                    divBachelor14.Visible = false;
                    divBachelor16.Visible = false;
                }
            }
            else if (row["DegreeProgram"].ToString().ToUpper().Contains("POSTGRADUATE"))
                divBachelor14.Visible = false;
            else
            {
                divMasters18.Visible = false;
                divBachelor14.Visible = false;
            }
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
                        int StudentId = Convert.ToInt32(Session["StudentId"]);
                        stdCurStatus = handyUtility.GetStudentCurrentStatus(StudentId);
                        if(stdCurStatus >= StudentCurrentStatus.EducationInfoSubmit-1)
                        {
                            stdPrgInfo.StudentID = StudentId;
                            DataTable dt = stdPrgInfo.NEW_GetDegreeProgramInfoDataByStudentId();
                            if (dt.Rows.Count > 0)
                            {
                                PopupateInitialEducationData(dt);
                                eduHSC.StudentID = StudentId;
                                dt = eduHSC.NEW_GetStudentEducationInfoByStudentId();
                                if (dt.Rows.Count > 0)
                                {
                                    PopulateEducationInfo(dt);
                                    LockData();
                                    btnSave.Visible = false;
                                    txtNTSDate.Visible = false;
                                    txtNTSDateLocked.Visible = true;
                                    lblSuccess.Visible = true;
                                    lblSuccess.Text = "Personal Information submitted successfully.";
                                }
                            }
                            else
                            {
                                divAcademicInfo.Visible = false;
                                lblError.Visible = true;
                                lblError.Text = "Error: Complete previous step(s) of Application process first.";

                            }
                        }
                    }
                    else
                    {
                        divAcademicInfo.Visible = false;
                        lblError.Visible = true;
                        lblError.Text = "Error: Complete previous step(s) of Application process first.";
                    }
                }

            }
            catch { }
        }
        protected bool GetEligibility(string programChoice, ref string errorMessage)
        {
            string ProgramChoice = programChoice;
            if (divMasters18.Visible)
            {
                if (!string.IsNullOrEmpty(txtPercentageM18.Value) || !string.IsNullOrEmpty(txtCGPAM18.Value))
                {
                    if (!string.IsNullOrEmpty(txtPercentageM18.Value) && double.Parse(txtPercentageM18.Value) >= 60)
                        return true;
                    else if (!string.IsNullOrEmpty(txtCGPAM18.Value) && double.Parse(txtCGPAM18.Value) >= 3.0)
                        return true;
                    else
                        errorMessage = "Error: Eligibility criteria for Postgraduate failed. Required Percentage: 60% or CGPA: 3.0";
                }
                else
                    errorMessage = "Error: Provide Masters Percentage or CGPA";
            }
            else if (divBachelor16.Visible)
            {
                if (!string.IsNullOrEmpty(txtPercentageB16.Value) || !string.IsNullOrEmpty(txtCGPAB16.Value))
                {
                    if (!string.IsNullOrEmpty(txtPercentageB16.Value) && double.Parse(txtPercentageB16.Value) >= 50)
                        return true;
                    else if (!string.IsNullOrEmpty(txtCGPAB16.Value) && double.Parse(txtCGPAB16.Value) >= 2.5)
                        return true;
                    else
                        errorMessage = "Error: Eligibility criteria for Graduate failed.  Required Percentage: 50% or CGPA: 2.5"; ;
                }
                else
                    errorMessage = "Error: Provide Bachelors Percentage or CGPA";
            }
            else if (divBachelor14.Visible)
            {
                if (!string.IsNullOrEmpty(txtPercentageB14.Value))
                {
                    if (double.Parse(txtPercentageB14.Value) >= 45)
                        return true;
                    else
                        errorMessage = "Error: Eligibility criteria for Undergraduate failed. Required Percentage: 45%";
                }
                else
                    errorMessage = "Error: Provide Bachelors Percentage";
            }
            else
            {
                if (ddlGradeHSC.SelectedItem.Text.Contains("Awaiting"))
                    return true;
                else
                {
                    if (
                        ProgramChoice.Contains("BS Accounts And Finance")
                        || ProgramChoice.Contains("BS Computer Science")
                        || ProgramChoice.Contains("BS Media Studies")
                        || ProgramChoice.Contains("Bachelor of Business Administration (Morning)")
                        || ProgramChoice.Contains("BS Software Engineering")
                        || ProgramChoice.Contains("BS Artificial Intelligence")
                        || ProgramChoice.Contains("BS Mathematics")
                        //|| ProgramChoice.Contains("Bachelor of Education 1.5 years")
                        || ProgramChoice.Contains("BS Information Technology")
                        || ProgramChoice.Contains("BS Data Science")
                        || ProgramChoice.Contains("BS Cyber Security")
                    )
                    {
                        if (double.Parse(txtPercentageHSC.Value) >= 50)
                            return true;
                        else
                            errorMessage = "Error: Eligibility criteria for Undergraduate program failed. Required Percentage: 50%";
                    }
                    else
                    {
                        if (double.Parse(txtPercentageHSC.Value) >= 45)
                            return true;
                        else
                            errorMessage = "Error: Eligibility criteria for Undergraduate program failed. Required Percentage: 45%";
                    }

                }
            }
            return false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errorMessage = "";
            stdPrgInfo.StudentID = Convert.ToInt32(Session["StudentId"]);
            DataTable tempDT = stdPrgInfo.NEW_GetDegreeProgramInfoDataByStudentId();
            string programChoice = tempDT.Rows[0]["FirstChoice"].ToString();

            if (Page.IsValid && GetEligibility(programChoice, ref errorMessage))
            {
                StudentOtherEducation eduOther = new StudentOtherEducation();
                Student18YearsEducation edu18 = new Student18YearsEducation();
                Student16YearsEducation edu16 = new Student16YearsEducation();
                Student14YearsEducation edu14 = new Student14YearsEducation();
                StudentHSCEducation eduHSC = new StudentHSCEducation();
                StudentSSCEducation eduSSC = new StudentSSCEducation();
                StudentNTSTestInfo nts = new StudentNTSTestInfo();
                FeeVoucherInfo voucher = new FeeVoucherInfo();
                StudentPhoto photo = new StudentPhoto();
                
                voucher.StudentID = stdPer.StudentID = photo.StudentID = nts.StudentID = eduOther.StudentID = edu18.StudentId = edu16.StudentId = edu14.StudentId = eduHSC.StudentID = eduSSC.StudentID = Convert.ToInt32(Session["StudentId"]);                
                eduSSC.DegreeName = ddlDegreeSSC.SelectedItem.Value;
                eduSSC.SeatNumber = txtSeatNoSSC.Value;
                eduSSC.SSCBoard = ddlBoardSSC.SelectedItem.Value;
                eduSSC.SSCGroup = ddlGroupSSC.SelectedItem.Value;
                eduSSC.MarksObtained = string.IsNullOrEmpty(txtObtainedMarksSSC.Value) ? 0 : Convert.ToInt32(txtObtainedMarksSSC.Value.Trim());
                eduSSC.TotalMarks = string.IsNullOrEmpty(txtTotalMarksSSC.Value) ? 0 : Convert.ToInt32(txtTotalMarksSSC.Value.Trim());
                eduSSC.Percentage = String.Format("{0:0.00}", txtPercentageSSC.Value);
                eduSSC.SSCGrade = ddlGradeSSC.SelectedItem.Value;
                eduSSC.SSCInstitution = txtInstitution.Value;
                eduSSC.SSCYearFrom = Convert.ToInt32(txtFromYearSSC.Value);
                eduSSC.SSCYearTo = Convert.ToInt32(txtPassYearSSC.Value);
                eduSSC.SSCExamType = ddlExamTypeSSC.SelectedItem.Value;

                eduHSC.StudentID = Convert.ToInt32(Session["StudentId"]);
                eduHSC.MarksObtained = string.IsNullOrEmpty(txtObtainedMarksHSC.Value) ? 0 : Convert.ToInt32(txtObtainedMarksHSC.Value.Trim());
                eduHSC.TotalMarks = string.IsNullOrEmpty(txtTotalMarksHSC.Value) ? 0 : Convert.ToInt32(txtTotalMarksHSC.Value.Trim());
                eduHSC.SeatNumber = txtSeatNoHSC.Value;
                eduHSC.HSCYearFrom = int.Parse(txtFromYearHSC.Value);
                eduHSC.Percentage = String.Format("{0:0.00}", txtPercentageHSC.Value);
                eduHSC.HSCInstitution = txtInstitutionHSC.Value;
                eduHSC.HSCGrade = ddlGradeHSC.SelectedItem.Value;
                eduHSC.DegreeName = ddlDegreeHSC.SelectedItem.Value;
                eduHSC.HSCBoard = ddlBoardHSC.SelectedItem.Value;
                eduHSC.HSCExamType = ddlExamTypeHSC.SelectedItem.Value;
                eduHSC.HSCGroup = ddlGroupHSC.SelectedItem.Value;
                eduHSC.HSCYearTo = int.Parse(txtPassYearHSC.Value);

                nts.NTSTestType = ddlNTSType.SelectedItem.Value;
                nts.NTSTestingService = txtNTSService.Value;
                nts.NTSRollNumber = txtNTSRoll.Value;
                nts.NTSDate = string.IsNullOrEmpty(txtNTSDate.Value) ? (DateTime?)null : Convert.ToDateTime(txtNTSDate.Value);
                nts.NTSTestScore = string.IsNullOrEmpty(txtNTSObtainedMarks.Value) ? (int?)null : Convert.ToInt32(txtNTSObtainedMarks.Value);
                nts.NTSTestMaxScore = string.IsNullOrEmpty(txtNTSTotalMarks.Value) ? (int?)null : Convert.ToInt32(txtNTSTotalMarks.Value);

                DataTable dt = new DataTable();
                if (divMasters18.Visible)
                {

                    edu18.SeatNumber = txtSeatNoM18.Value ?? string.Empty;
                    edu18.University = txtUniversityM18.Value ?? string.Empty;
                    edu18.Program = txtProgramM18.Value ?? string.Empty;
                    edu18.MarksObtained = string.IsNullOrEmpty(txtObtainedMarksM18.Value) ? 0 : Convert.ToInt32(txtObtainedMarksM18.Value.Trim());
                    edu18.TotalMarks = string.IsNullOrEmpty(txtTotalMarksM18.Value) ? 0 : Convert.ToInt32(txtTotalMarksM18.Value.Trim());
                    edu18.Percentage = string.IsNullOrEmpty(txtPercentageM18.Value) ? 0 : Convert.ToDecimal(txtPercentageM18.Value);
                    edu18.GradeOrDivision = ddlGradeM18.SelectedItem.Value;
                    edu18.CGPA = txtCGPAM18.Value;
                    edu18.Institution = txtUniversityM18.Value ?? string.Empty;
                    edu18.YearFrom = int.Parse(txtFromYearM18.Value);
                    edu18.YearTo = int.Parse(txtPassYearM18.Value);
                    edu18.ExamType = ddlExamTypeM18.SelectedItem.Value;
                    edu18.MajorSubjects = txtMajorsM18.Value ?? string.Empty;

                    edu16.SeatNumber = txtSeatNoB16.Value ?? string.Empty;
                    edu16.University = txtUniversityB16.Value ?? string.Empty;
                    edu16.Program = txtProgramB16.Value ?? string.Empty;
                    edu16.MarksObtained = string.IsNullOrEmpty(txtObtainedMarksB16.Value) ? 0 : Convert.ToInt32(txtObtainedMarksB16.Value.Trim());
                    edu16.TotalMarks = string.IsNullOrEmpty(txtTotalMarksB16.Value) ? 0 : Convert.ToInt32(txtTotalMarksB16.Value.Trim());
                    edu16.Percentage = string.IsNullOrEmpty(txtPercentageB16.Value) ? 0 : Convert.ToDecimal(txtPercentageB16.Value);
                    edu16.GradeOrDivision = ddlGradeB16.SelectedItem.Value;
                    edu16.CGPA = txtCGPAB16.Value;
                    edu16.Institution = txtUniversityB16.Value ?? string.Empty;
                    edu16.YearFrom = int.Parse(txtFromYearB16.Value);
                    edu16.YearTo = int.Parse(txtPassYearB16.Value);
                    edu16.ExamType = ddlExamTypeB16.SelectedItem.Value;
                    edu16.MajorSubjects = txtMajorsB16.Value ?? string.Empty;

                }
                else if (divBachelor16.Visible)
                {
                    edu16.SeatNumber = txtSeatNoB16.Value ?? string.Empty;
                    edu16.University = txtUniversityB16.Value ?? string.Empty;
                    edu16.Program = txtProgramB16.Value ?? string.Empty;
                    edu16.MarksObtained = string.IsNullOrEmpty(txtObtainedMarksB16.Value) ? 0 : Convert.ToInt32(txtObtainedMarksB16.Value.Trim());
                    edu16.TotalMarks = string.IsNullOrEmpty(txtTotalMarksB16.Value) ? 0 : Convert.ToInt32(txtTotalMarksB16.Value.Trim());
                    edu16.Percentage = string.IsNullOrEmpty(txtPercentageB16.Value) ? 0 : Convert.ToDecimal(txtPercentageB16.Value);
                    edu16.GradeOrDivision = ddlGradeB16.SelectedItem.Value;
                    edu16.CGPA = txtCGPAB16.Value;
                    edu16.Institution = txtUniversityB16.Value ?? string.Empty;
                    edu16.YearFrom = int.Parse(txtFromYearB16.Value);
                    edu16.YearTo = int.Parse(txtPassYearB16.Value);
                    edu16.ExamType = ddlExamTypeB16.SelectedItem.Value;
                    edu16.MajorSubjects = txtMajorsB16.Value ?? string.Empty;
                }
                else if (divBachelor14.Visible)
                {
                    edu14.SeatNumber = txtSeatNoB14.Value ?? string.Empty;
                    edu14.University = txtUniversityB14.Value ?? string.Empty;
                    edu14.Program = txtProgramB14.Value ?? string.Empty;
                    edu14.MarksObtained = string.IsNullOrEmpty(txtObtainedMarksB14.Value) ? 0 : Convert.ToInt32(txtObtainedMarksB14.Value.Trim());
                    edu14.TotalMarks = string.IsNullOrEmpty(txtTotalMarksB14.Value) ? 0 : Convert.ToInt32(txtTotalMarksB14.Value.Trim());
                    edu14.Percentage = string.IsNullOrEmpty(txtPercentageB14.Value) ? 0 : Convert.ToDecimal(txtPercentageB14.Value);
                    edu14.GradeOrDivision = ddlGradeB14.SelectedItem.Value;
                    edu14.CGPA = txtPercentageB14.Value;
                    edu14.Institution = txtUniversityB14.Value ?? string.Empty;
                    edu14.YearFrom = int.Parse(txtFromYearB14.Value);
                    edu14.YearTo = int.Parse(txtPassYearB14.Value);
                    edu14.ExamType = ddlExamTypeB14.SelectedItem.Value;
                    edu14.MajorSubjects = txtMajorsB14.Value ?? string.Empty;
                }

                DataTable dtApplicant = stdPer.GetStudentInfoByReferenceIDForFeeVoucher();

                if (dtApplicant.Rows.Count > 0)
                {
                    Oracle_DB ora = new Oracle_DB();
                    long challan = ora.GetNextChallanNo();
                    while (ora.ChallanExist(challan) == 1)
                    {
                        challan += 1;
                    }

                    var result = ora.InsertVoucherInfoCMS(dtApplicant, challan);
                    if (result == 1)
                    {
                        voucher.VoucherID = challan.ToString();
                        bool isSucess = eduHSC.NEW_InsertStudentEducationInfo(stdPer, eduSSC, edu14, edu16, edu18, eduOther, nts, voucher, photo);
                        if (isSucess)
                            Response.Redirect("~/NewForms/_PreviewForm.aspx");
                        else
                        {
                            errorMessage = "Error occured while processing Admission Fee voucher";
                            ora.DeleteVoucherInfoCMS(stdPer.StudentID.ToString(), challan);
                        }
                    }
                    else
                        errorMessage = "Error occured while processing Fee voucher";
                }
                else
                    errorMessage = "Error occured while generating Fee voucher";

            }
            lblError.Visible = true;
            lblError.Text = errorMessage;
        }

        protected void txtObtainedMarksHSC_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtObtainedMarksHSC.Value) && !string.IsNullOrEmpty(txtTotalMarksHSC.Value))
            {
                if (int.Parse(txtObtainedMarksHSC.Value) <= int.Parse(txtTotalMarksHSC.Value))
                    txtPercentageHSC.Value = ((int.Parse(txtObtainedMarksHSC.Value) * 100) / int.Parse(txtTotalMarksHSC.Value)).ToString();
                else
                {
                    lblError.Text = "Error in HSC: Obtained marks can't not exceed total Marks.";
                    lblError.Visible = true;
                    txtPercentageHSC.Value = "";
                }
            }
        }

        protected void txtTotalMarksHSC_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtObtainedMarksHSC.Value) && !string.IsNullOrEmpty(txtTotalMarksHSC.Value))
            {
                if (int.Parse(txtObtainedMarksHSC.Value) <= int.Parse(txtTotalMarksHSC.Value))
                    txtPercentageHSC.Value = ((int.Parse(txtObtainedMarksHSC.Value) * 100) / int.Parse(txtTotalMarksHSC.Value)).ToString();
                else
                {
                    lblError.Text = "Error in HSC: Obtained marks can't not exceed total Marks.";
                    lblError.Visible = true;
                    txtPercentageHSC.Value = "";
                }
            }
        }

        protected void txtTotalMarksSSC_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtObtainedMarksSSC.Value) && !string.IsNullOrEmpty(txtTotalMarksSSC.Value))
            {
                if (int.Parse(txtObtainedMarksSSC.Value) <= int.Parse(txtTotalMarksSSC.Value))
                    txtPercentageSSC.Value = ((int.Parse(txtObtainedMarksSSC.Value) * 100) / int.Parse(txtTotalMarksSSC.Value)).ToString();
                else
                {
                    lblError.Text = "Error in SSC: Obtained marks can't not exceed total Marks.";
                    lblError.Visible = true;
                    txtPercentageSSC.Value = "";
                }

            }

        }

        protected void txtObtainedMarksSSC_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtObtainedMarksSSC.Value) && !string.IsNullOrEmpty(txtTotalMarksSSC.Value))
            {
                if(int.Parse(txtObtainedMarksSSC.Value) <= int.Parse(txtTotalMarksSSC.Value))
                    txtPercentageSSC.Value = ((int.Parse(txtObtainedMarksSSC.Value) * 100) / int.Parse(txtTotalMarksSSC.Value)).ToString();
                else
                {
                    lblError.Text = "Error in SSC: Obtained marks can't not exceed total Marks.";
                    lblError.Visible = true;
                    txtPercentageSSC.Value = "";
                }
            }
        }

    }

}