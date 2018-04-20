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
    public partial class MTTP0006 : FormaSISWeb, IAcciones
    {
        private DataView dvPermisoP, dvPerfil, dvSistema, dvMenu2, dvMenu3;
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
            FillGVPermisoPerfil();
            FillCboPerfil();
            FillCboMenu1();
            FillCboMenu2();
            FillCboMenu3();
        }
        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVPermisoPerfil()
        {//lista de registros
            COpciSistPerfil objPermisoP = new COpciSistPerfil(_DataSistema.ConexionBaseDato);
            dvPermisoP = new DataView(objPermisoP.Detalle("","","","",0,0,""
                , _DataSistema.Cusuario, DateTime.Today, _DataSistema.Cusuario, DateTime.Today,0).TBC_OPCI_SIST_PERFIL);
            GVPermisoPerfil.DataSource=dvPermisoP;
            GVPermisoPerfil.DataBind();
        }

        protected void FillCboPerfil()
        {//combo perfil
            CPerfilUsuario objPerfil = new CPerfilUsuario(_DataSistema.ConexionBaseDato);
            dvPerfil = new DataView(objPerfil.Detalle("", "", "", ' ', _DataSistema.Cusuario, DateTime.Today, _DataSistema.Cusuario
                , DateTime.Today, 0).TBC_PERFIL_USUARIO);
            CboPerfil.DataSource = dvPerfil;
            CboPerfil.DataBind();
        }

        protected void FillCboMenu1()
        {//combo menu nivel 1
            CSistema objSistema = new CSistema(_DataSistema.ConexionBaseDato);
            dvSistema = new DataView(objSistema.Detalle("", "", 0, "", _DataSistema.Cusuario, DateTime.Today,
                _DataSistema.Cusuario, DateTime.Today, 1).TBC_SISTEMA);
            CboMenu1.DataSource = dvSistema;
            CboMenu1.DataBind();
        }

        protected void FillCboMenu2()
        {//combo menu nivel 2
            CMenuSistema objMenu2 = new CMenuSistema(_DataSistema.ConexionBaseDato);
            dvMenu2 = new DataView(objMenu2.Detalle("", "", "", 0, _DataSistema.Cusuario, DateTime.Today
                , _DataSistema.Cusuario, DateTime.Today, 0).TBC_MENU_SISTEMA);
            CboMenu2.DataSource = dvMenu2;
            CboMenu2.DataBind();
        }

        protected void FillCboMenu3()
        {//combo menu nivel 3
            COpcionSistema objMenu3 = new COpcionSistema(_DataSistema.ConexionBaseDato);
            dvMenu3 = new DataView(objMenu3.Detalle("", "", "", "", ""
                , _DataSistema.Cusuario, DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 0).TBC_OPCION_SISTEMA);
            CboMenu3.DataSource = dvMenu3;
            CboMenu3.DataBind();
        }

        protected void BtnDatosGuardar_Click(object sender, EventArgs e)
        {
            COpciSistPerfil objPermisoP = new COpciSistPerfil(_DataSistema.ConexionBaseDato);
            objResultado = objPermisoP.Actualizacion(Convert.ToString(CboPerfil.SelectedValue), Convert.ToString(CboMenu1.SelectedValue)
                , Convert.ToString(CboMenu2.SelectedValue), Convert.ToString(CboMenu3.SelectedValue), Convert.ToDouble(TxtNumSistema.Text)
                , Convert.ToDouble(TxtNumPerfil.Text), TxtDescripcion.Text, _DataSistema.Cusuario, TipoActualizacion.Adicionar);
            if (objResultado.CodigoError == 0)
            {
                DespliegaMensajeUpdatePanel("Resgistro Guardado Correctamente", UPDetalle);
            }
            else
            {
                DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDetalle);
            }
        }
    }
}