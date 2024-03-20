using SMIU_Admission.AppClasses.BusinessLogicLayer;
using System;
using System.Data;

namespace SMIU_Admission
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
        }
        protected void btnForgot_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(txtCNIC.Value) && !string.IsNullOrEmpty(txtEmail.Value))
                {
                    StudentRegistration objStudentRegistration = new StudentRegistration();
                    objStudentRegistration.EmailAddress = txtEmail.Value.Trim();
                    objStudentRegistration.CNICNumber = txtCNIC.Value.Trim();
                    DataTable dtApplicantInfo = objStudentRegistration.GetStudentInfobyEmailAddressAndCNICNUmber();
                    if (dtApplicantInfo.Rows.Count > 0)
                    {
                        string StudentPassword = dtApplicantInfo.Rows[0]["Password"].ToString();
                        string studentFullName = dtApplicantInfo.Rows[0]["StudentName"].ToString();
                        string EmailAddress = dtApplicantInfo.Rows[0]["EmailAddress"].ToString();
                        Session["AccountSuccess"] = "1";
                        Session["Message"] = "Your password has been sent to [" + EmailAddress + "]. Check also junk/spam folder of your mailbox for password recovery email.";
                        Response.Redirect("~/message.aspx", false);

                    }
                    else
                        lblError.Text = "Invalid Email or CNIC. Please provide correct Email & CNIC.";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error occured while retrieving your account password. Please contact Admission Department of SMIU.";
            }
            lblError.Visible = true;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }
    }
}
