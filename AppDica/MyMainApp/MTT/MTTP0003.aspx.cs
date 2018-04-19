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
    public partial class MTTP0003 : FormaSISWeb, IAcciones
    {
        private DataView dvMenu;

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
            FillGVMenuSistema();
            LimpiarForm();
        }

        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVMenuSistema()
        {
            CMenuSistema objMenuSis = new CMenuSistema(_DataSistema.ConexionBaseDato);
            dvMenu = new DataView(objMenuSis.Detalle("", "", "", 0, _DataSistema.Cusuario,
                DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 0).TBC_MENU_SISTEMA);

            GVMenuSistema.DataSource = dvMenu;
            GVMenuSistema.DataBind();
        }

        protected void BtnGuardarMenu_Click(object sender, EventArgs e)
        {
            if (TxtCodigo.Text == null || TxtCodigo.Text == "" || TxtNombMenu.Text == null || TxtNombMenu.Text == "" ||
                TxtOrden.Text == null || TxtOrden.Text == "")
            {
                DespliegaMensajeUpdatePanel("Por favor, LLenar los Campos Obligatorios", UPDatos);
            }
            else
            {
            CMenuSistema objMenuSis = new CMenuSistema(_DataSistema.ConexionBaseDato);
            objResultado = objMenuSis.Actualizacion(TxtCodigo.Text, TxtNombMenu.Text,TxtDescripcion.Text,Convert.ToInt32(TxtOrden.Text)
                , _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                if(objResultado.CodigoError == 0)
                {
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPDatos);
                    LimpiarForm();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDatos);
                }
            }
        }

        protected void LimpiarForm()
        {
            TxtCodigo.Text = "";
            TxtNombMenu.Text = "";
            TxtOrden.Text = "";
            TxtDescripcion.Text = "";
        }

        

        protected void GVMenuSistema_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVMenuSistema.SelectedIndex;
                TxtIdCodiM.Text = GVMenuSistema.DataKeys[Id].Value.ToString();
                DatosMenu();
                PanelActuMenu.Visible = true;
                PanelMenu.Visible = false;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDatos);
            }
        }

        protected void DatosMenu()
        {
            CMenuSistema objMenuSis = new CMenuSistema(_DataSistema.ConexionBaseDato);
            dvMenu = new DataView(objMenuSis.Detalle(TxtIdCodiM.Text, "", "", 0
                , _DataSistema.Cusuario, DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 1).TBC_MENU_SISTEMA);
            if (dvMenu.Count > 0)
            {
                TxtCodigo2.Text = dvMenu.Table.Rows[0]["ID"].ToString();
                TxtNombMenu2.Text = dvMenu.Table.Rows[0]["DS_DESC_MENU"].ToString();
                TxtOrden2.Text = dvMenu.Table.Rows[0]["NM_ORDEN_MENU"].ToString();
                TxtDescripcion2.Text = dvMenu.Table.Rows[0]["DS_DESCRIPCION"].ToString();
            }
        }

        protected void BtnActuMenu_Click(object sender, EventArgs e)
        {
            try
            {
                CMenuSistema objMenuSis = new CMenuSistema(_DataSistema.ConexionBaseDato);
                objResultado = objMenuSis.Actualizacion(TxtCodigo2.Text, TxtNombMenu2.Text, TxtDescripcion2.Text, Convert.ToInt32(TxtOrden2.Text)
                    , _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                if (objResultado.CodigoError == 0)
                {
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPDatos);
                    FillGVMenuSistema();
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

       

        protected void BtnRegresar_Click(object sender, EventArgs e)
        {
            PanelActuMenu.Visible = false;
            PanelMenu.Visible = true;
        }

        protected void GVMenuSistema_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TextBox Id = GVMenuSistema.Rows[e.RowIndex].FindControl("TxtIdCodigo") as TextBox;
                CMenuSistema objSistema = new CMenuSistema(_DataSistema.ConexionBaseDato);
                objResultado = objSistema.Actualizacion(Id.Text, "", "", 0, _DataSistema.Cusuario, TipoActualizacion.Eliminar);
                if (objResultado.CodigoError == 0)
                {
                    FillGVMenuSistema();
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
