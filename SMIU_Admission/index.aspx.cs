using SMIU_Admission.AppClasses.BusinessLogicLayer;
using SMIU_Admission.Resources;
using System;
using System.Data;

namespace SMIU_Admission
{
    public partial class Index : System.Web.UI.Page
    {  
        void ClearSession()
        {
            Session.Clear();
            Session.Abandon();            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                if (!IsPostBack)
                {
                    lblError.Visible = false;
                    ClearSession();
                }
                
            }
            catch(Exception ex)
            {
                
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {   
            try
            {
                StudentRegistration objStudent = new StudentRegistration();
                objStudent.EmailAddress = txtEmail.Value.Trim();
                objStudent.Password = txtPassword.Value.Trim();
                DataTable dtUserInfo = objStudent.GetStudentInfobyUserNamePassword();
                if (dtUserInfo.Rows.Count > 0)
                {
                    Session["RegistrationId"] = dtUserInfo.Rows[0]["RegistrationId"].ToString();
                    StaticUtility.PopulateCurrentAdmissionDetails();
                    Session["StudentName"] = dtUserInfo.Rows[0]["StudentName"].ToString();
                    Session["EmailAddress"] = dtUserInfo.Rows[0]["EmailAddress"].ToString();
                    Session["Password"] = dtUserInfo.Rows[0]["Password"].ToString();
                    Session["SemesterId"] = dtUserInfo.Rows[0]["SemesterId"].ToString();
                    Response.Redirect("~/NewForms/_Updates.aspx", false);
                }
                else
                {
                    lblError.Text = "Error: Invalid Email or Password";
                    lblError.Visible = true;
                }
                
            }

            catch (Exception ex)
            {
                lblError.Text = "Error: Account login failed. Please contact Admission Department.";
                lblError.Visible = true;
            }

        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ForgotPassword.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreateAccount.aspx");
        }
    }
}
