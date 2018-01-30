using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyMainApp
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Uri uriAnterior = Request.UrlReferrer;
            string sRuta = "";
            if (uriAnterior != null)
            {
                sRuta = uriAnterior.AbsolutePath;
            }
            Session["MyDataSistema"] = null;
            Session.Abandon();
            Session.RemoveAll();
            Session.Clear();
            FormsAuthentication.SignOut();

            Response.Redirect("~/Default.aspx");
        }
    }
}