using Microsoft.Reporting.Map.WebForms.BingMaps;
using SMIU_Admission.AppClasses.BusinessLogicLayer;
using System;
using System.Data.SqlClient;

using System.Data;

using System.Xml.Linq;
using System.Dynamic;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Web.WebSockets;
using SMIU_Admission.Resources;

namespace SMIU_Admission.NewForms
{
    public partial class _DegreeProgramInfo : System.Web.UI.Page
    {
        private List<DropDownList> dropDownList;
        private StudentProgram stdProgram;
        private StudentProgramInfo stdPrgInfo;
        private StudentGuardiansInfo stdGuard;
        private StudentCurrentStatus stdCurStatus;
        private HandyUtility handyUtility;
        public _DegreeProgramInfo()
        {
            handyUtility = new HandyUtility();
            stdProgram = new StudentProgram();
            stdGuard = new StudentGuardiansInfo();
            stdPrgInfo = new StudentProgramInfo();
        }

        protected void BindProgramChoices(DataTable dt, DropDownList ddl, ListItem item)
        {
            ddl.Items.Clear();
            ddl.DataSource = dt;
            ddl.DataTextField = "ProgramLongName";
            ddl.DataValueField = "ProgramCode";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("--Select Program--", "-1"));
            ddl.SelectedItem.Text = item.Text;
            ddl.SelectedItem.Value = item.Value;
        }
        protected void PopulateDegreeProgramInfo(DataTable dt)
        {

            DataRow row = dt.Rows[0];
            if (row["DegreeProgram"].ToString().ToUpper().Contains("UNDERGRADUATE"))
            {
                ddlDegreeProgram.SelectedValue = "2";
                divUndergraduateFacility.Visible = true;
                chkSelfFinance.Checked = Convert.ToBoolean(row["SelfFinance"]);
                chkTransport.Checked = Convert.ToBoolean(row["AvailTransport"]);
                if (chkTransport.Checked)
                {
                    divSpecifyLoc.Visible = true;
                    txtTransport.Text = row["TransportDesc"].ToString();
                }
            }
            else if (row["DegreeProgram"].ToString().ToUpper().Contains("POSTGRADUATE"))
            {
                divUndergraduateFacility.Visible = false;
                ddlDegreeProgram.SelectedValue = "3";
            }
            else
            {
                ddlDegreeProgram.SelectedValue = "1";
                divUndergraduateFacility.Visible = false;
            }


            

            stdProgram.DegreeProgram = int.Parse(ddlDegreeProgram.SelectedValue);
            DataTable dtPrograms = stdProgram.GetAllProgramsForDropDownbyDepartment();
            if (dtPrograms.Rows.Count > 0)
            {
                BindProgramChoices(dtPrograms, ddlFirstChoice, new ListItem(row["FirstChoice"].ToString(), row["FirstChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlSecondChoice, new ListItem(row["SecondChoice"].ToString(), row["SecondChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlThirdChoice, new ListItem(row["ThirdChoice"].ToString(), row["ThirdChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlFourthChoice, new ListItem(row["FourthChoice"].ToString(), row["FourthChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlFifthChoice, new ListItem(row["FifthChoice"].ToString(), row["FifthChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlSixthChoice, new ListItem(row["SixthChoice"].ToString(), row["SixthChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlSeventhChoice, new ListItem(row["SeventhChoice"].ToString(), row["SeventhChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlEighthChoice, new ListItem(row["EighthChoice"].ToString(), row["EighthChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlNinthChoice, new ListItem(row["NinethChoice"].ToString(), row["NinethChoiceCode"].ToString()));
                BindProgramChoices(dtPrograms, ddlTenthChoice,new ListItem(row["TenthChoice"].ToString(), row["TenthChoiceCode"].ToString()));
            }
        }

        protected void LockData()
        {
            ddlDegreeProgram.Enabled = false;
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
            chkTransport.Enabled = false;
            chkSelfFinance.Enabled = false;
            txtTransport.Enabled = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                dropDownList = new List<DropDownList>
                {
                    ddlFirstChoice,
                    ddlSecondChoice,
                    ddlThirdChoice,
                    ddlFourthChoice,
                    ddlFifthChoice,
                    ddlSixthChoice,
                    ddlSeventhChoice,
                    ddlEighthChoice,
                    ddlNinthChoice,
                    ddlTenthChoice
                };

                lblError.Visible = false;
                lblSuccess.Visible = false;
                if (!Page.IsPostBack)
                {
                    if (Session["StudentId"] != null)
                    {
                        int StudentId = Convert.ToInt32(Session["StudentId"]);
                        stdCurStatus = handyUtility.GetStudentCurrentStatus(StudentId);
                        if(stdCurStatus >= StudentCurrentStatus.DegreeInfoSubmit-1)
                        {
                            stdPrgInfo.StudentID = Convert.ToInt32(Session["StudentId"]);
                            DataTable dt = stdPrgInfo.NEW_GetDegreeProgramInfoDataByStudentId();
                            if (dt.Rows.Count > 0)
                            {
                                PopulateDegreeProgramInfo(dt);
                                LockData();
                                btnSave.Visible = false;
                                lblSuccess.Visible = true;
                                lblSuccess.Text = "Degree Program Information submitted successfully.";
                            }
                            //else
                            //{
                            //    ddlDegreeProgram.Items.RemoveAt(1);
                            //    ddlDegreeProgram.Items.RemoveAt(2);
                            //}
                        }
                        else
                        {
                            divDegreeProgramInfo.Visible = false;
                            lblError.Visible = true;
                            lblError.Text = "Error: Complete previous step(s) of Application process first.";
                        }
                    }
                    else
                    {
                        divDegreeProgramInfo.Visible = false;
                        lblError.Visible = true;
                        lblError.Text = "Error: Complete previous step(s) of Application process first.";
                    }
                }
            }
            catch { }
        }

        bool ValidateForm(ref string message)
        {
            return true;
        }
        protected bool GetEligibility()
        {
            return false;
        }

        private void InitialBindProgramData()
        {
            stdProgram.DegreeProgram = int.Parse(ddlDegreeProgram.SelectedValue);
            DataTable dt = stdProgram.GetAllProgramsForDropDownbyDepartment();

            foreach (var ddl in dropDownList)
            {
                ddl.Items.Clear();
                ddl.DataSource = dt;
                ddl.DataTextField = "ProgramLongName";
                ddl.DataValueField = "ProgramCode";
                ddl.DataBind();
                ddl.Items.Insert(0, new ListItem("--Select Program--", "-1"));
            }
        }

        private void BindProgramData(DropDownList ddl, DataTable dt)
        {

            string text = "";
            string value = "";
            text = ddl.SelectedItem.Text;
            value = ddl.SelectedItem.Value;

            ddl.Items.Clear();
            ddl.DataSource = dt;
            ddl.DataTextField = "ProgramLongName";
            ddl.DataValueField = "ProgramCode";
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("--Select Program--", "-1"));

            if (!string.IsNullOrEmpty(text))
            {
                ddl.SelectedItem.Text = text;
                ddl.SelectedItem.Value = value;
            }

            foreach (var dropdown in dropDownList)
            {
                if (ddl.ID != dropdown.ID)
                {
                    if (dropdown.SelectedItem != null && !dropdown.SelectedItem.Text.ToUpper().Contains("SELECT"))
                        ddl.Items.Remove(new ListItem(dropdown.SelectedItem.Text, dropdown.SelectedItem.Value));
                }
            }
        }
        private void PopulateProgramsData()
        {
            try
            {
                stdProgram.DegreeProgram = int.Parse(ddlDegreeProgram.SelectedValue);
                DataTable dt = stdProgram.GetAllProgramsForDropDownbyDepartment();
                BindProgramData(ddlFirstChoice, dt);
                BindProgramData(ddlSecondChoice, dt);
                BindProgramData(ddlThirdChoice, dt);
                BindProgramData(ddlFourthChoice, dt);
                BindProgramData(ddlFifthChoice, dt);
                BindProgramData(ddlSixthChoice, dt);
                BindProgramData(ddlSeventhChoice, dt);
                BindProgramData(ddlEighthChoice, dt);
                BindProgramData(ddlNinthChoice, dt);
                BindProgramData(ddlTenthChoice, dt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void ChangeChoice(DropDownList dropdown)
        {
            stdProgram.DegreeProgram = int.Parse(ddlDegreeProgram.SelectedValue);
            DataTable dt = stdProgram.GetAllProgramsForDropDownbyDepartment();
            foreach (var dd in dropDownList)
            {
                if (dd.ID != dropdown.ID)
                    BindProgramData(dd, dt);
            }
        }

        protected void ddlSecondChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);
        }

        protected void ddlThirdChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);
        }

        protected void ddlFourthChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);
        }

        protected void ddlTenthChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);
        }

        protected void ddlNinthChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);

        }

        protected void ddlEighthChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);
        }

        protected void ddlSeventhChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);
        }

        protected void ddlSixthChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);
        }

        protected void ddlFifthChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errorMsg = "";
            if(ValidateForm(ref errorMsg))
            {
                stdPrgInfo.DegreeProgram = ddlDegreeProgram.SelectedItem.Text;
                stdPrgInfo.FirstChoice = ddlFirstChoice.SelectedItem.Text;
                stdPrgInfo.FirstChoiceCode = int.Parse(ddlFirstChoice.SelectedItem.Value);
                stdPrgInfo.SecondChoice = ddlSecondChoice.SelectedItem.Text;
                stdPrgInfo.SecondChoiceCode = int.Parse(ddlSecondChoice.SelectedItem.Value);
                stdPrgInfo.ThirdChoice = ddlThirdChoice.SelectedItem.Text;
                stdPrgInfo.ThirdChoiceCode = int.Parse(ddlThirdChoice.SelectedItem.Value);
                stdPrgInfo.FourthChoice = ddlFourthChoice.SelectedItem.Text;
                stdPrgInfo.FourthChoiceCode = int.Parse(ddlFourthChoice.SelectedItem.Value);
                stdPrgInfo.FifthChoice = ddlFifthChoice.SelectedItem.Text;
                stdPrgInfo.FifthChoiceCode = int.Parse(ddlFifthChoice.SelectedItem.Value);
                stdPrgInfo.SixthChoice = ddlSixthChoice.SelectedItem.Text;
                stdPrgInfo.SixthChoiceCode = int.Parse(ddlSixthChoice.SelectedItem.Value);
                stdPrgInfo.SeventhChoice = ddlSeventhChoice.SelectedItem.Text;
                stdPrgInfo.SeventhChoiceCode = int.Parse(ddlSeventhChoice.SelectedItem.Value);
                stdPrgInfo.EighthChoice = ddlEighthChoice.SelectedItem.Text;
                stdPrgInfo.EighthChoiceCode = int.Parse(ddlEighthChoice.SelectedItem.Value);
                stdPrgInfo.NinethChoice = ddlNinthChoice.SelectedItem.Text;
                stdPrgInfo.NinethChoiceCode = int.Parse(ddlNinthChoice.SelectedItem.Value);
                stdPrgInfo.TenthChoice = ddlTenthChoice.SelectedItem.Text;
                stdPrgInfo.TenthChoiceCode = int.Parse(ddlTenthChoice.SelectedItem.Value);
                stdPrgInfo.SelfFinance  =   chkSelfFinance.Checked;
                stdPrgInfo.Transport = chkTransport.Checked;
                stdPrgInfo.PickupLocation = txtTransport.Text;
                stdPrgInfo.StudentID = Convert.ToInt32(Session["StudentId"]);
                bool isSuccess = stdPrgInfo.NEW_InsertDegreeSelfAndTransportInfo(stdPrgInfo);
                if (isSuccess)
                {
                    Response.Redirect("~/NewForms/_AcademicInfo.aspx");
                }
            }
            lblError.Visible = true;
            lblError.Text = errorMsg;
        }

        protected void chkTransport_CheckedChanged(object sender, EventArgs e)
        {
            divSpecifyLoc.Visible = chkTransport.Checked;
        }

        protected void ddlFirstChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            ChangeChoice((DropDownList)sender);
        }

        protected void ddlDegreeProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            InitialBindProgramData();

            if (ddlDegreeProgram.SelectedItem.Value == "2")
            {
                divUndergraduateFacility.Visible = true;
            }
            else
                divUndergraduateFacility.Visible = false;
        }
    }
}