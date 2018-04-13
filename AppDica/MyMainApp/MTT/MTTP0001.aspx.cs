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

namespace MyMainApp.MANTENIMIENTOS
{
    public partial class MTTP0001 : FormaSISWeb, IAcciones
    {
        private DataView dvPerfil;

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
            FillGVDetallePerfil();
            LimpiarForm();
        }
        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVDetallePerfil()
        {
            CPerfilUsuario objPerfil = new CPerfilUsuario(_DataSistema.ConexionBaseDato);
            dvPerfil = new DataView(objPerfil.Detalle("", "", "", ' ', _DataSistema.Cusuario, DateTime.Today,
                _DataSistema.Cusuario, DateTime.Today, 2).TBC_PERFIL_USUARIO);
            GVDetallePerfil.DataSource = dvPerfil;
            GVDetallePerfil.DataBind();
        }

        protected void BtnGuardarPerfil_Click(object sender, EventArgs e)
        {

            if (TxtCodigo.Text == null || TxtCodigo.Text == "" || TxtNombre.Text == null || TxtNombre.Text == "")
            {
                DespliegaMensajeUpdatePanel("Por favor, LLenar los Campos", UPDetalle);
            }
            else {
                CPerfilUsuario objNuevoPerfil = new CPerfilUsuario(_DataSistema.ConexionBaseDato);
                objResultado = objNuevoPerfil.Actualizacion(TxtCodigo.Text, TxtNombre.Text,
                    TxtDescripcion.Text, Convert.ToChar(CboEstadoP.SelectedValue), _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                if (objResultado.CodigoError == 0)
                {
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPDetalle);
                    LimpiarForm();
                }

                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDetalle);
                }
            }
        }

        protected void LimpiarForm()
        {
            TxtCodigo.Text = "";
            TxtNombre.Text = "";
            TxtDescripcion.Text = "";
        }

        protected void GVDetallePerfil_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //eliminar perfil
            try
            {
                TextBox Id = GVDetallePerfil.Rows[e.RowIndex].FindControl("TxtIdCodigo") as TextBox;
                CPerfilUsuario objPerfil = new CPerfilUsuario(_DataSistema.ConexionBaseDato);
                objResultado = objPerfil.Actualizacion(Id.Text, "", "", ' ', _DataSistema.Cusuario, TipoActualizacion.Eliminar);
                
                if (objResultado.CodigoError == 0)
                {
                    FillGVDetallePerfil();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDetalle);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDetalle);
            }
        }

        protected void GVDetallePerfil_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVDetallePerfil.SelectedIndex;
                TxtIdCodiP.Text = GVDetallePerfil.DataKeys[Id].Value.ToString();
                DatosPerfil();
                PanelPerfil.Visible = false;
                PanelActuPerfil.Visible = true;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDetalle);
            }
        }

        protected void DatosPerfil()
        {
            CPerfilUsuario objPerfil = new CPerfilUsuario(_DataSistema.ConexionBaseDato);
            dvPerfil = new DataView(objPerfil.Detalle(TxtIdCodiP.Text, "", "", ' ', _DataSistema.Cusuario, DateTime.Today,
                _DataSistema.Cusuario, DateTime.Today, 3).TBC_PERFIL_USUARIO);
            if (dvPerfil.Count > 0)
            {
                TxtCodigo2.Text = dvPerfil.Table.Rows[0]["ID"].ToString();
                TxtNombre2.Text = dvPerfil.Table.Rows[0]["DS_NOMBRE_PERFIL"].ToString();
                TxtDescripcion2.Text = dvPerfil.Table.Rows[0]["DS_DESCRIPCION"].ToString();
                
            }
        }

        protected void BtnRegresar_Click(object sender, EventArgs e)
        {

            PanelPerfil.Visible = true;
            PanelActuPerfil.Visible = false;
        }

        protected void BtnActualizarP_Click(object sender, EventArgs e)
        {
            try
            {
                CPerfilUsuario objNuevoPerfil = new CPerfilUsuario(_DataSistema.ConexionBaseDato);
                objResultado = objNuevoPerfil.Actualizacion(TxtCodigo2.Text, TxtNombre2.Text,
                    TxtDescripcion2.Text, Convert.ToChar(CboEstado2.SelectedValue), _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                if (objResultado.CodigoError == 0)
                {
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPDetalle);
                    FillGVDetallePerfil();
                }

                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDetalle);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDetalle);
            }
        }

    }
}