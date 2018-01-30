using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;
using ClsInterface;

namespace MyMainApp
{
    public class Global : System.Web.HttpApplication
    {

        ClsSistema MyDataSistema;
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
        new ScriptResourceDefinition
        {
            Path = "~/js/jquery.min.js"
        }
    );
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            MyDataSistema = new ClsSistema();
            MyDataSistema.ConexionBaseDato = System.Configuration.ConfigurationManager.AppSettings.Get("ConexionSIS");
            MyDataSistema.CodigoEmpresa = "0001";

            Session["MyDataSistema"] = MyDataSistema;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}