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

namespace SMIU_Admission.NewForms
{
    public partial class _GuardianInfo : System.Web.UI.Page
    {
        protected StudentGuardiansInfo stdGuard;
        public _GuardianInfo()
        {
            stdGuard = new StudentGuardiansInfo();
        }

        protected void PopulateGuardianData(DataTable dt)
        {
            DataRow row = dt.Rows[0];
            txtGuardAddress.Value = row["GuardiansAddress"].ToString();
            txtGuardDesignation.Value = row["GuardiansDesignation"].ToString();
            txtGuardIncome.Value = row["GuardiansMonthlyIncome"].ToString();
            txtGuardMobileNo.Value = row["GuardianMobileNumber"].ToString();
            txtGuardName.Value = row["GuardiansName"].ToString();
            txtGuardOccu.Value = row["GuardiansOccupation"].ToString();
            txtGuardOrganization.Value = row["GuardiansOrganization"].ToString();
            txtGuardRelation.Value = row["GuardiansRelation"].ToString();
            ddlGuardJobNature.SelectedItem.Text = row["GuardiansNatureofJob"].ToString();
            txtEmrgAddress.Value = row["EmergencyAddress"].ToString();
            txtEmrgMobileNo.Value = row["EmergencyMnumber"].ToString();
            txtEmrgRelation.Value = row["EmergencyRelation"].ToString();
            txtEmrgName.Value = row["EmergencyName"].ToString();
        }

        protected void LockData()
        {
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
            txtEmrgMobileNo.Disabled=true;
            txtEmrgRelation.Disabled = true;
            txtEmrgName.Disabled = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Visible = false;
                lblSuccess.Visible = false;
                if (!Page.IsPostBack)
                {
                    DataTable dt;
                    if (Session["StudentId"] != null)
                    {

                        stdGuard.StudentID = Convert.ToInt32(Session["StudentId"]);
                        dt =  stdGuard.NEW_GetGuardianEmergencyInfoDataByStudentId();
                        if (dt.Rows.Count > 0)
                        {
                            PopulateGuardianData(dt);
                            LockData();
                            btnSave.Visible = false;
                            lblSuccess.Visible = true;
                            lblSuccess.Text = "Guardian/Sponsor and Emergency Information submitted successfully.";
                        }
                    }
                    else
                    {
                        divGuardianInfo.Visible = false;
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errorMessage="";
            if (Page.IsValid && ValidateForm(ref errorMessage))
            {
                stdGuard.StudentID = Convert.ToInt32(Session["StudentId"]);
                stdGuard.GuardiansAddress = txtGuardAddress.Value ?? string.Empty;
                stdGuard.GuardiansDesignation = txtGuardDesignation.Value ?? string.Empty;
                stdGuard.GuardiansMonthlyIncome = !string.IsNullOrEmpty(txtGuardIncome.Value) ? int.Parse(txtGuardIncome.Value.Trim()) : 0;
                stdGuard.GuardianMobileNumber = !string.IsNullOrEmpty(txtGuardMobileNo.Value) ? Convert.ToInt64(txtGuardMobileNo.Value.Trim()) : 0;
                stdGuard.GuardiansName = txtGuardName.Value ?? string.Empty;
                stdGuard.GuardiansOccupation = txtGuardOccu.Value ?? string.Empty;
                stdGuard.GuardiansOrganization = txtGuardOrganization.Value ?? string.Empty;
                stdGuard.GuardiansRelation = txtGuardRelation.Value ?? string.Empty;
                stdGuard.GuardiansNatureofJob = (ddlGuardJobNature.SelectedItem != null && !ddlGuardJobNature.SelectedItem.Text.ToUpper().Trim().Contains("SELECT")) ? ddlGuardJobNature.SelectedItem.Text.Trim() : string.Empty;
                stdGuard.EmergencyAddress = txtEmrgAddress.Value.Trim();
                stdGuard.EmergencyMobile = txtEmrgMobileNo.Value.Trim();
                stdGuard.EmergencyRelation = txtEmrgRelation.Value.Trim();
                stdGuard.EmergencyContactName = txtEmrgName.Value.Trim();
                int result = stdGuard.NEW_InsertStudentGuardianEmergencyInfo();
                if (result > -1)
                {
                    Response.Redirect("~/NewForms/_DegreeProgramInfo.aspx");
                }
            }
            lblError.Visible = true;
            lblError.Text = errorMessage;
        }
    }
}