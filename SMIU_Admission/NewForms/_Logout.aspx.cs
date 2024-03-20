using System;
namespace SMIU_Admission.NewForms
{
    public partial class _Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }
    }
}
