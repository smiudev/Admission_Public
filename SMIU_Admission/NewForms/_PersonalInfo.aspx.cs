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
using static System.Net.Mime.MediaTypeNames;
using System.Web;
using SMIU_Admission.Resources;

namespace SMIU_Admission.NewForms
{
    public partial class _PersonalInfo : System.Web.UI.Page
    {
        protected StudentPersonalInfo stdPer;
        protected StudentRegistration stdReg;

        public _PersonalInfo()
        {
            stdReg = new StudentRegistration();
            stdPer = new StudentPersonalInfo();
        }

        protected void PopulateRegistrationData(DataTable dt)
        {
            PopulateName(dt.Rows[0]["FirstName"].ToString());
            txtCNIC.Value = dt.Rows[0]["CNICNumber"].ToString();
            txtMobileNo.Value = dt.Rows[0]["MobileNumber"].ToString();
            txtEmail.Value = dt.Rows[0]["EmailAddress"].ToString();
        }

        protected void PopulatePersonalData(DataTable dt)
        {
            imgPhoto.ImageUrl = new HandyUtility().LoadImageURL(stdPer.StudentID);
            DataRow row = dt.Rows[0];            
            txtCNIC.Value = row["CNICNumber"].ToString();
            txtPassport.Value = row["PassportNumber"].ToString();
            txtFirstname.Value = row["Firstname"].ToString();
            txtMiddlename.Value = row["Middlename"].ToString();
            txtLastname.Value = row["Lastname"].ToString();
            txtFatherName.Value = row["FathersName"].ToString();
            txtFatherOccupation.Value = row["FathersOccupation"].ToString();
            ddlNationality.SelectedItem.Text = row["Nationality"].ToString();
            ddlReligion.SelectedItem.Text =row["Religion"].ToString();
            ddlGender.SelectedItem.Text = row["Gender"].ToString();
            txtDOBLocked.Value = row["DateofBirth"].ToString().Replace(" 00:00:00","");
            ddlDomicile.SelectedItem.Text = row["UrbanorRural"].ToString();
            ddlMarital.SelectedItem.Text = row["MaritalStatus"].ToString();
            txtPermanentAddress.Value = row["PermanentAddress"].ToString();
            txtPostalAddress.Value = row["PostalAddress"].ToString();
            txtHomeNo.Value = row["HomePhoneNumber"].ToString()!="0"? row["HomePhoneNumber"].ToString():"";
            txtMobileNo.Value = row["MobileNumber"].ToString();
            txtEmail.Value = row["EmailAddress"].ToString();
            txtDomicileDistrict.Value = row["DistrictOfDomicile"].ToString();
        }

        protected void LockData()
        {
            uploadPhoto.Visible = false;
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
            txtDOBLocked.Disabled = true;
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
                        stdPer.StudentID = Convert.ToInt32(Session["StudentId"]);
                        dt = stdPer.NEW_GetStudentInfoDataByStudentId();
                        if (dt.Rows.Count > 0)
                        {   
                            PopulatePersonalData(dt);
                            LockData();
                            txtImageFormat.Visible = false;
                            txtDOBLocked.Visible = true;
                            txtDOB.Visible = false;
                            btnSave.Visible = false;
                            lblSuccess.Visible = true;
                            lblSuccess.Text = "Personal Information submitted successfully.";
                        }
                    }
                    else
                    {
                        stdReg.RegistrationID = Convert.ToInt32(Session["RegistrationId"]);
                        dt = stdReg.GetStudentInfoByRegistrationID();
                        if (dt.Rows.Count > 0)
                        {
                            PopulateRegistrationData(dt);
                        }
                    }

                }

            }
            catch { }
        }

        private void PopulateName(string nameValue)
        {
            var name = nameValue.Split(' ');
            if (name.Length == 2)
            {
                txtFirstname.Value = name[0];
                txtLastname.Value = name[1];
            }
            else if (name.Length == 3)
            {
                txtFirstname.Value = name[0];
                txtMiddlename.Value = name[1];
                txtLastname.Value = name[2];
            }
            else
            {
                txtFirstname.Value = nameValue;
            }
        }

        bool ValidateForm(ref string errorMsg)
        {
            if (uploadPhoto.HasFile)
            {
                if (uploadPhoto.FileName.ToUpper().EndsWith(".JPG")
                    || uploadPhoto.FileName.ToUpper().EndsWith(".PNG")
                    || uploadPhoto.FileName.ToUpper().EndsWith(".JPEG")
                    || uploadPhoto.FileName.ToUpper().EndsWith(".GIF"))
                {

                    long allowedFileSize = 1048576; //1MB
                    if (uploadPhoto.PostedFile.ContentLength <= allowedFileSize)                    
                        return true;                    
                    else
                        errorMsg = "Error: Image file size must not exceed allowed the size.";
                }
                else
                    errorMsg = "Error: Unsupported file extention. Upload the image file with allowed extentions (JPG, JPEG, PNG and GIF) only.";

            }
            else
                errorMsg = "Error: Please browse your photo first.";
            
            return false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["RegistrationId"] != null)
            {
                string errorMessage = "";
                if (Page.IsValid && ValidateForm(ref errorMessage))
                {
                    stdPer.RegistrationID = Convert.ToInt32(Session["RegistrationId"].ToString());
                    stdPer.CNICNumber = txtCNIC.Value.Trim();
                    stdPer.PassportNumber = txtPassport.Value ?? string.Empty;
                    stdPer.FirstName = txtFirstname.Value.Trim();
                    stdPer.MiddleName = txtMiddlename.Value ?? string.Empty;
                    stdPer.LastName = txtLastname.Value.Trim();
                    stdPer.FathersName = txtFatherName.Value.Trim();
                    stdPer.FathersOccupation = txtFatherOccupation.Value.Trim();
                    stdPer.Nationality = stdPer.Country = ddlNationality.SelectedItem.Text.Trim();
                    stdPer.Religion = ddlReligion.SelectedItem.Text.Trim();
                    stdPer.Gender = ddlGender.SelectedItem.Text.Trim();
                    stdPer.DateofBirth = string.IsNullOrEmpty(txtDOB.Value)?DateTime.Today:Convert.ToDateTime(txtDOB.Value.Trim());
                    stdPer.MaritalStatus = ddlMarital.SelectedItem.Text.Trim();
                    stdPer.PermanentAddress = txtPermanentAddress.Value.Trim();
                    stdPer.PostalAddress = txtPostalAddress.Value.Trim();
                    stdPer.HomePhoneNumber = string.IsNullOrEmpty(txtHomeNo.Value) ? 0 : Convert.ToInt64(txtHomeNo.Value.Trim());
                    stdPer.MobileNumber = string.IsNullOrEmpty(txtMobileNo.Value) ? 0 : Convert.ToInt64(txtMobileNo.Value.Trim());
                    stdPer.EmailAddress = txtEmail.Value.Trim();
                    stdPer.DistrictOfDomicile = txtDomicileDistrict.Value.Trim();
                    stdPer.UrbanorRural = ddlDomicile.SelectedItem.Value;
                    stdPer.PostalCode = stdPer.City = stdPer.PostalCity = stdPer.PlaceOfBirth = stdPer.PermanentCity = string.Empty;
                    stdPer.IsFinalSubmitted = false;
                    int StudentId = stdPer.NEW_InsertStudentPersonalInfo();
                    if (StudentId > 0)
                    {
                        Session["StudentId"] = StudentId;
                        bool isSaved = SaveImage(uploadPhoto);
                        if (isSaved)
                            Response.Redirect("~/NewForms/_GuardianInfo.aspx");
                    }

                }
                lblError.Visible = true;
                lblError.Text = errorMessage;
            }
            else
                Response.Redirect("~/index.aspx");
        }

        private bool SaveImage(FileUpload upload)
        {
            try
            {
                int dotIndex = upload.PostedFile.FileName.LastIndexOf(".");
                int length = upload.PostedFile.FileName.Length;
                string ext = upload.PostedFile.FileName.Substring(dotIndex, length - dotIndex);
                string imgName = "~/Document/Photo/"+Session["StudentId"].ToString() + "_Photo" + ext;
                upload.SaveAs(Server.MapPath(imgName));
                upload.Dispose();
                return true;
            }
            catch (Exception e)
            {

            }
            return false;
        }
    }
}