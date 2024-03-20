using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class MasterPages_CreateMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string sessionLoginStatus = "";
        //bool chkLoggedIn = false;
        //try
        //{
        //    //  LoginStatus = Request.Cookies["smi"]["LoggedIn"];
        //    sessionLoginStatus = Session["LoggedIn"].ToString();

        //    if (sessionLoginStatus == null && sessionLoginStatus != "false")
        //    {
        //        try
        //        {
        //            chkLoggedIn = true;
        //        }
        //        catch
        //        {
        //            chkLoggedIn = false;
        //        }
        //    }
        //}
        //catch
        //{
        //    chkLoggedIn = false;
        //}


        ////Check user name and show options accoringly.
        ////bool chkLoggedIn = Convert.ToBoolean(Session["LoggedIn"]);

        //if (chkLoggedIn)
        //{
     
   //else
   //{
   //    Response.Redirect("Default.aspx?msg=1");
   //}
        //}
        //else
        //{
        //  //  String redirectURL = "Default.aspx";
        //  //  Server.Transfer(redirectURL, false);
        //}
    }
}
