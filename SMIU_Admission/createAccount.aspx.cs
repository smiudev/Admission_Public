using SMIU_Admission.AppClasses.BusinessLogicLayer;
using System;
using System.Data;

namespace SMIU_Admission
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Visible = false;
            }
            catch { }
        }

        bool ValidateForm(ref string message)
        {
            if (txtPassword.Value == txtConfirmPassword.Value && string.IsNullOrEmpty(txtPassword.Value))
            {
                message = "Confirm password does not match.";
                return false;
            }
            return true;
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string errorMessage = "";
            bool alreadyExist = false;
            if (Page.IsValid && ValidateForm(ref errorMessage))
            {
                StudentRegistration objStudentRegistration = new StudentRegistration();

                objStudentRegistration.CNICNumber = txtCNIC.Value.Trim();
                DataTable dtalreadyExist = objStudentRegistration.CheckIfCNICAleadyExist();
                if (dtalreadyExist.Rows.Count > 0)
                {
                    errorMessage = "Error: Account already exist with this CNIC.";
                    alreadyExist = true;
                }
                objStudentRegistration.EmailAddress = txtEmail.Value.Trim();
                dtalreadyExist = objStudentRegistration.CheckIfEmailAleadyExist();
                if (dtalreadyExist.Rows.Count > 0)
                {
                    errorMessage = "Error: Account already exist with this Email.";
                    alreadyExist = true;
                }

                if (!alreadyExist)
                {
                    objStudentRegistration.FirstName = txtName.Value;
                    objStudentRegistration.CNICNumber = txtCNIC.Value.Trim();
                    objStudentRegistration.EmailAddress = txtEmail.Value.Trim();
                    objStudentRegistration.MobileNumber = Convert.ToInt64(txtMobileNo.Value.Trim());
                    objStudentRegistration.Password = txtPassword.Value.Trim();

                    bool result = objStudentRegistration.New_InsertStudentRegistrationlInfo();
                    if (result)
                    {
                        Session["AccountSuccess"] = "1";
                        Session["Message"] = "Your account has been created successfully. Note down your account email and password and keep it safe.";
                        Response.Redirect("~/message.aspx");
                    }
                    else
                        errorMessage = "Error: Account registration failed. Please contact Admission Department.";
                }
            }
            lblError.Visible = true;
            lblError.Text = errorMessage;
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ForgotPassword.aspx");
        }
    }
}
