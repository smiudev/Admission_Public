using SMIU_Admission.AppClasses.BusinessLogicLayer;
using SMIU_Admission.Resources;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class MasterPages_PortalMaster : System.Web.UI.MasterPage
{
    private List<DropDownList> dropDownList;
    private ListItem item;
    protected StudentPersonalInfo stdPer;
    protected StudentRegistration stdReg;
    //private StudentProgram stdProgram;
    //private StudentProgramInfo stdPrgInfo;
    //private StudentGuardiansInfo stdGuard;
    //private StudentHSCEducation eduHSC;
    private HandyUtility handyUtility;
    private StudentCurrentStatus stdCurrStatus;
    public MasterPages_PortalMaster()
    {
        handyUtility = new HandyUtility();
        //stdProgram = new StudentProgram();
        stdPer = new StudentPersonalInfo();
        stdReg = new StudentRegistration();
        //eduHSC = new StudentHSCEducation();
        //stdGuard = new StudentGuardiansInfo();
        //stdPrgInfo = new StudentProgramInfo();
    }

    protected void ManageIcons()
    {
        if (stdCurrStatus == StudentCurrentStatus.FeesApproved || stdCurrStatus == StudentCurrentStatus.DocumentsSubmit)
        {
            iconCheckPersonal.Visible = iconCheckGuardian.Visible = iconCheckDegree.Visible = iconCheckAcademic.Visible = iconCheckDocs.Visible = true;
            iconCrossPersonal.Visible = iconCrossGuardian.Visible = iconCrossDegree.Visible = iconCrossAcademic.Visible = iconCrossDocs.Visible = false;
        }
        else if (stdCurrStatus == StudentCurrentStatus.FinalSubmit || stdCurrStatus == StudentCurrentStatus.EducationInfoSubmit)
        {
            iconCheckPersonal.Visible = iconCheckGuardian.Visible = iconCheckDegree.Visible = iconCheckAcademic.Visible = iconCrossDocs.Visible = true;
            iconCrossPersonal.Visible = iconCrossGuardian.Visible = iconCrossDegree.Visible = iconCrossAcademic.Visible = iconCheckDocs.Visible = false;
        }
        else if (stdCurrStatus == StudentCurrentStatus.DegreeInfoSubmit)
        {
            iconCheckPersonal.Visible = iconCheckGuardian.Visible = iconCheckDegree.Visible = iconCrossAcademic.Visible = iconCrossDocs.Visible = true;
            iconCrossPersonal.Visible = iconCrossGuardian.Visible = iconCrossDegree.Visible = iconCheckAcademic.Visible = iconCheckDocs.Visible = false;
        }
        else if (stdCurrStatus == StudentCurrentStatus.GuardianInfoSubmit)
        {
            iconCheckPersonal.Visible = iconCheckGuardian.Visible = iconCrossDegree.Visible = iconCrossAcademic.Visible = iconCrossDocs.Visible = true;
            iconCrossPersonal.Visible = iconCrossGuardian.Visible = iconCheckDegree.Visible = iconCheckAcademic.Visible = iconCheckDocs.Visible = false;
        }
        else if (stdCurrStatus == StudentCurrentStatus.PersonalInfoSubmit)
        {
            iconCheckPersonal.Visible = iconCrossGuardian.Visible = iconCrossDegree.Visible = iconCrossAcademic.Visible = iconCrossDocs.Visible = true;
            iconCrossPersonal.Visible = iconCheckGuardian.Visible = iconCheckDegree.Visible = iconCheckAcademic.Visible = iconCheckDocs.Visible = false;
        }
        else
        {
            iconCrossPersonal.Visible = iconCrossGuardian.Visible = iconCrossDegree.Visible = iconCrossAcademic.Visible = iconCrossDocs.Visible = true;
            iconCheckPersonal.Visible = iconCheckGuardian.Visible = iconCheckDegree.Visible = iconCheckAcademic.Visible = iconCheckDocs.Visible = false;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
                        if (Session["StudentId"] == null)
                            Session["StudentId"] = StudentId;

                        imgApplicant.ImageUrl = new HandyUtility().LoadImageURL(StudentId);
                        txtApplicantName.InnerText = dt.Rows[0]["FirstName"].ToString() + "[" + StudentId + "]";

                        stdCurrStatus = handyUtility.GetStudentCurrentStatus(StudentId);
                        ManageIcons();
                    }
                    else
                    {
                        stdReg.RegistrationID = Convert.ToInt32(Session["RegistrationId"]);
                        dt = stdReg.GetStudentInfoByRegistrationID();
                        if (dt.Rows.Count > 0) { }
                            txtApplicantName.InnerText = dt.Rows[0]["FirstName"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("~/index.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("~/index.aspx");
            }
        }
    }
}

