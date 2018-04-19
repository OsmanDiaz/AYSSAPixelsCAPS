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
            LimpiarForm();
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

        protected void GVOpcionSistema_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVOpcionSistema.SelectedIndex;
                TxtIdCodiS.Text = GVOpcionSistema.DataKeys[Id].Value.ToString();
                DatosSistema();
                PanelActuSistema.Visible = true;
                PanelSistema.Visible = false;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDatos);
            }
        }

        protected void DatosSistema()
        {
            COpcionSistema objSistema = new COpcionSistema(_DataSistema.ConexionBaseDato);
            dvSistema = new DataView(objSistema.Detalle(TxtIdCodiS.Text, "", "", "", "", _DataSistema.Cusuario
                , DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 3).TBC_OPCION_SISTEMA);
            if (dvSistema.Count > 0)
            {
                TxtCodigo2.Text = dvSistema.Table.Rows[0]["ID"].ToString();
                TxtNombre2.Text = dvSistema.Table.Rows[0]["DS_CODI_OPCI_SIST"].ToString();
                TxtNombMenu2.Text = dvSistema.Table.Rows[0]["DS_NOMBRE_FORMA"].ToString();
                TxtRuta2.Text = dvSistema.Table.Rows[0]["DS_RUTA_FORMA"].ToString();
                TxtDescripcion2.Text = dvSistema.Table.Rows[0]["DS_DESCRIPCION"].ToString();
            }
        }

        protected void BtnRegresar_Click(object sender, EventArgs e)
        {
            PanelActuSistema.Visible = false;
            PanelSistema.Visible = true;
        }

       

        protected void LimpiarForm()
        { 
            TxtCodigo.Text="";
            TxtNombre.Text="";
            TxtNombMenu.Text="";
            TxtRuta.Text="";
            TxtDescripcion.Text = "";
        }

        protected void BtnGuardarSistema_Click(object sender, EventArgs e)
        {
            if (TxtCodigo.Text == null || TxtCodigo.Text == "" || TxtNombre.Text == null || TxtNombre.Text == "" ||
               TxtNombMenu.Text == null || TxtNombMenu.Text == "" || TxtRuta.Text == null || TxtRuta.Text == "")
            {
                DespliegaMensajeUpdatePanel("Por favor, LLenar los Campos Obligatorios", UPDatos);
            }
            else
            {
                COpcionSistema objNuevoSistema = new COpcionSistema(_DataSistema.ConexionBaseDato);
                objResultado = objNuevoSistema.Actualizacion(TxtCodigo.Text, TxtNombre.Text, TxtNombMenu.Text, TxtRuta.Text,
                    TxtDescripcion.Text, _DataSistema.Cusuario, TipoActualizacion.Adicionar);
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

        protected void GVOpcionSistema_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TextBox Id = GVOpcionSistema.Rows[e.RowIndex].FindControl("TxtIdCodigo") as TextBox;
                COpcionSistema objSist = new COpcionSistema(_DataSistema.ConexionBaseDato);
                objResultado = objSist.Actualizacion(Id.Text, "", "", "", "", _DataSistema.Cusuario, TipoActualizacion.Eliminar);
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

        protected void BtnActualizarS_Click(object sender, EventArgs e)
        {
            try
            {
                COpcionSistema objSist = new COpcionSistema(_DataSistema.ConexionBaseDato);
                objResultado = objSist.Actualizacion(TxtCodigo2.Text, TxtNombre2.Text, TxtNombMenu2.Text, TxtRuta2.Text
                    , TxtDescripcion2.Text, _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                if (objResultado.CodigoError == 0)
                {
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPDatos);
                    FillGVOpcionSistema();
                }
                else {
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