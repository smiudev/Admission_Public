using System;

namespace SMIU_Admission
{
    public partial class Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["AccountSuccess"] != null)
                    {
                        if (Session["AccountSuccess"].ToString() == "1")
                        {
                            lblSuccess.Visible = true;
                            headingSuccess.Visible = true;
                            lblSuccess.Text = Session["Message"].ToString();
                        }
                        else
                        {
                            lblError.Visible = true;
                            headingError.Visible = true;
                            lblError.Text = Session["Message"].ToString();
                            
                        }
                        lnkLogin.Visible = true;
                        Session.Clear();
                        Session.Abandon();
                    }
                    else
                    {
                        Response.Redirect("~/index.aspx");
                    }
                }
                
            }
            catch(Exception ex)
            {
                
            }
        }
    }
}
