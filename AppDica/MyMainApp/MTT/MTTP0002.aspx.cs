using ClsDataApp;
using ClsInterface;
using dica;
using System.Data;
using System.IO;
using System.Linq;
using AjaxControlToolkit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyMainApp.MTT
{
    public partial class MTTP0002 : FormaSISWeb, IAcciones
    {
        private DataView dvSistema;

        protected void Page_Load(object sender, EventArgs e)
        {
            _DataSistema = (ClsSistema)Session["MyDataSistema"];
            if (_DataSistema.Cusuario == null)
            {
                Response.Redirect("~/Default.aspx");
            }

            if (!IsPostBack)
            {
                Consultar();
            }
        }
        public void Consultar()
        {
            FillGVOpcionSistema();
        }
        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVOpcionSistema()
        {
            COpcionSistema objOpciSis = new COpcionSistema(_DataSistema.ConexionBaseDato);
            dvSistema = new DataView(objOpciSis.Detalle("", "", "", "", "", _DataSistema.Cusuario, 
                DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 2).TBC_OPCION_SISTEMA);

            GVOpcionSistema.DataSource = dvSistema;
            GVOpcionSistema.DataBind();
        }
    }
}