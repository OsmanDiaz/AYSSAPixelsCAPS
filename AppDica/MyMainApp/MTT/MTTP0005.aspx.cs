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
    public partial class MTTP0005 : FormaSISWeb, IAcciones
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
            FillGVSistemaList();
        }
        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVSistemaList()
        {
            CSistema objListaS = new CSistema(_DataSistema.ConexionBaseDato);
            dvSistema = new DataView(objListaS.Detalle("", "", 0, "", _DataSistema.Cusuario, DateTime.Today
                , _DataSistema.Cusuario, DateTime.Today, 1).TBC_SISTEMA);
            GVSistemaList.DataSource = dvSistema;
            GVSistemaList.DataBind();
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            if (TxtCodigo.Text == null || TxtCodigo.Text == "" || TxtNombMenu.Text == null || TxtOrden.Text == null
                || TxtOrden.Text == "" )
            {
                DespliegaMensajeUpdatePanel("Por favor, LLenar los Campos Obligatorios", UPDatos);
            }
            else
            {
                CSistema objListaS = new CSistema(_DataSistema.ConexionBaseDato);
                objResultado = objListaS.Actualizacion(TxtCodigo.Text, TxtNombMenu.Text, Convert.ToInt32(TxtOrden.Text), TxtDescripcion.Text
                    , _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                if (objResultado.CodigoError == 0)
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
        protected void GVSistemaList_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVSistemaList.SelectedIndex;
                TxtIdCodiM.Text = GVSistemaList.DataKeys[Id].Value.ToString();
                DatosForm();
                PanelMenu1.Visible = false;
                PanelActuMenu1.Visible = true;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDatos);
            }
        }

        protected void DatosForm()
        {
            CSistema objListaS = new CSistema(_DataSistema.ConexionBaseDato);
            dvSistema = new DataView(objListaS.Detalle(TxtIdCodiM.Text, "", 0, ""
                ,_DataSistema.Cusuario,DateTime.Today,_DataSistema.Cusuario,DateTime.Today,2).TBC_SISTEMA);
            if (dvSistema.Count > 0)
            {
                TxtCodigo1.Text = dvSistema.Table.Rows[0]["ID"].ToString();
                TxtNombMenu1.Text = dvSistema.Table.Rows[0]["DS_NOMB_SIST"].ToString();
                TxtNumOrden1.Text = dvSistema.Table.Rows[0]["NM_ORDEN_SIST"].ToString();
                TxtDescripcion1.Text = dvSistema.Table.Rows[0]["DS_DESCRIPCION"].ToString();
            }
        }

        protected void BtnRegresar_Click(object sender, EventArgs e)
        {
            PanelMenu1.Visible = true;
            PanelActuMenu1.Visible = false;
        }

        protected void BtnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                CSistema objListaS = new CSistema(_DataSistema.ConexionBaseDato);
                objResultado = objListaS.Actualizacion(TxtCodigo1.Text, TxtNombMenu1.Text, Convert.ToInt32(TxtNumOrden1.Text), TxtDescripcion1.Text
                    , _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                if (objResultado.CodigoError == 0)
                {
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPDatos);
                    FillGVSistemaList();
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

        protected void GVSistemaList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TextBox Id = GVSistemaList.Rows[e.RowIndex].FindControl("TxtIdCodigo") as TextBox;
                CSistema objListaS = new CSistema(_DataSistema.ConexionBaseDato);
                objResultado = objListaS.Actualizacion(Id.Text,"",0,"", _DataSistema.Cusuario, TipoActualizacion.Eliminar);
                if (objResultado.CodigoError == 0)
                {
                    FillGVSistemaList();
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