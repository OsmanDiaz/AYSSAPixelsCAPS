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
    public partial class MTTP0004 : FormaSISWeb, IAcciones
    {
        private DataView dvOpcionS, dvSistema;

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
            FillCboMenu();
            FillCboOpcionMenu();
            FillCboCodSis();
        }

        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVOpcionSistema()
        {
            CConfOpciSist objOpcionS = new CConfOpciSist(_DataSistema.ConexionBaseDato);
            dvOpcionS = new DataView(objOpcionS.Detalle("", "", "", 0, 0, "", _DataSistema.Cusuario,
                DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 0).TBC_CONF_OPCI_SIST);

            GVOpcionSistema.DataSource = dvOpcionS;
            GVOpcionSistema.DataBind();
        }

        protected void FillCboCodSis()
        {
            //combo codigo sistema
            CSistema objSistema = new CSistema(_DataSistema.ConexionBaseDato);
            dvSistema = new DataView(objSistema.Detalle("", "", 0, "", _DataSistema.Cusuario, DateTime.Today, _DataSistema.Cusuario
                , DateTime.Today, 1).TBC_SISTEMA);
            CboCodSis.DataSource = dvSistema;
            CboCodSis.DataBind();
        }

        protected void FillCboMenu()
        {//COMBO CODIGO MENU
            CMenuSistema objMenuSis = new CMenuSistema(_DataSistema.ConexionBaseDato);
            dvOpcionS = new DataView(objMenuSis.Detalle("", "", "", 0, _DataSistema.Cusuario,
                DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 0).TBC_MENU_SISTEMA);
            CboMenu.DataSource = dvOpcionS;
            CboMenu.DataBind();

        }

        protected void FillCboOpcionMenu()
        {//COMBO CODIGO OPCION MENU
            COpcionSistema objOpciSis = new COpcionSistema(_DataSistema.ConexionBaseDato);
            dvOpcionS = new DataView(objOpciSis.Detalle("", "", "", "", "", _DataSistema.Cusuario,
                DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 0).TBC_OPCION_SISTEMA);
            CboOpcionMenu.DataSource = dvOpcionS;
            CboOpcionMenu.DataBind();
        }

        protected void BtnDatosGuardar_Click(object sender, EventArgs e)
        {
            CConfOpciSist objConf = new CConfOpciSist(_DataSistema.ConexionBaseDato);
            objResultado = objConf.Actualizacion(Convert.ToString(CboCodSis.SelectedValue), Convert.ToString(CboMenu.SelectedValue), Convert.ToString(CboOpcionMenu.SelectedValue)
                , 0, 0, TxtDescripcion.Text, _DataSistema.Cusuario, TipoActualizacion.Adicionar);
            if (objResultado.CodigoError == 0)
            {
                DespliegaMensajeUpdatePanel("Resgistro Guardado Correctamente", UPDetalle);
                LimpiarForm();
            }
            else
            {
                DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDetalle);
            }
        }

        protected void LimpiarForm()
        {
            TxtDescripcion.Text = "";
            FillCboCodSis();
            FillCboMenu();
            FillCboOpcionMenu();
        }
        
        
        protected void GVOpcionSistema_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TextBox Id = GVOpcionSistema.Rows[e.RowIndex].FindControl("TxtIdCodigo") as TextBox;
                TextBox Id2 = GVOpcionSistema.Rows[e.RowIndex].FindControl("TxtIdMenu") as TextBox;
                TextBox Id3 = GVOpcionSistema.Rows[e.RowIndex].FindControl("TxtIdSistema") as TextBox;
                CConfOpciSist objConf = new CConfOpciSist(_DataSistema.ConexionBaseDato);
                objResultado = objConf.Actualizacion(Id.Text, Id2.Text,Id3.Text, 0, 0, "", _DataSistema.Cusuario, TipoActualizacion.Eliminar);
                if (objResultado.CodigoError == 0)
                {
                    FillGVOpcionSistema();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDatos);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDatos);
            }
        }

        
    }
}