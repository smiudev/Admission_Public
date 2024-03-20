using SMIU_Admission.AppClasses.BusinessLogicLayer;
using SMIU_Admission.Resources;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace SMIU_Admission.NewForms
{
    public partial class _Updates : System.Web.UI.Page
    {
        protected StudentCurrentStatus stdCurStatus;
        protected HandyUtility handyUtility;
        protected StudentPersonalInfo stdPer;
        protected StudentRegistration stdReg;
        public _Updates()
        {
            handyUtility = new HandyUtility();
            stdPer = new StudentPersonalInfo();
            stdReg = new StudentRegistration();
        }

        protected void ManageStatements()
        {
            if (stdCurStatus == StudentCurrentStatus.FeesApproved)
            {
                liAfterApproval.Visible = true;

                if (StaticUtility.Prospectus)
                {
                    spanProspectus.Visible = true;
                }
                if (StaticUtility.SamplePaper)
                {
                    spanTestPaper.Visible = true;
                }
                if (StaticUtility.AdmitCard)
                {
                    spanAdmitCard.Visible = true;
                }

                if (DateTime.Today >= StaticUtility.TestResultDate)
                {
                    spanResult.Visible = true;
                }
               
                if (DateTime.Today >= StaticUtility.FirstMeritDate)
                {
                    spanMerit.Visible = true;
                }
                if (DateTime.Today >= StaticUtility.SecondMeritDate)
                {
                    spanMerit2.Visible = true;
                    spanOrientation.Visible = false;
                }
                
                if (DateTime.Today >= StaticUtility.ThirdMeritDate)
                {
                    spanMerit3.Visible = true;
                    spanOrientation.Visible = false;
                }
            }
            else if (stdCurStatus == StudentCurrentStatus.DocumentsSubmit)
            {
                liAfterDocuments.Visible = true;
            }
            else if (stdCurStatus == StudentCurrentStatus.FinalSubmit)
            {
                liAfterSubmission.Visible = true;
            }
            else
            {
                liBeforeSubmit.Visible = true;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["RegistrationId"] != null)
                {   
                    stdPer.RegistrationID = Convert.ToInt32(Session["RegistrationId"]);
                    DataTable dt = stdPer.NEW_GetStudentInfoDataByRegistrationId();
                    if (dt.Rows.Count > 0)
                    {
                        int StudentId = int.Parse(dt.Rows[0]["StudentId"].ToString());
                        stdPer.StudentID = StudentId;
                        txtTracking.InnerText = txtTracking.InnerText.Replace("STUDENTID", StudentId.ToString()); txtTracking.InnerText.Replace("STUDENTID", StudentId.ToString());
                        txtTracking.Visible = true;
                        dt = stdPer.NEW_GetStudentAdmissionFormInfoByStudentId();
                        if (dt.Rows.Count > 0)
                        {
                            stdCurStatus = handyUtility.GetStudentCurrentStatus(StudentId);
                            ManageStatements();
                        }
                    }
                    else
                        liBeforeSubmit.Visible = true;
                }
                else
                {
                    Response.Redirect("~/index.aspx");
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
