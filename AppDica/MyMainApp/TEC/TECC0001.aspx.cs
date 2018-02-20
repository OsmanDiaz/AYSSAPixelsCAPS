using ClsDataApp;
using ClsInterface;
using dica;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.IO;

namespace MyMainApp.TEC
{
    public partial class TEC0001 : FormaSISWeb, IAcciones
    {
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
            FillGVRegistroAspirante();
            FillGVAspiranteAsignado();
            FillCboTipoDocumento();
        }
        public void Adicionar() { }
        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVRegistroAspirante()
        {
            CAspirante objRegistroAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvRegistroAspirante = new DataView(objRegistroAspirante.Detalle("", "", "", DateTime.Now, 'X',
           "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Now, "", DateTime.Now, 5).TB_ASPIRANTE);
            
            GVRegistroAspirante.DataSource = dvRegistroAspirante;
            GVRegistroAspirante.DataBind();
            
        }

        protected void FillGVAspiranteAsignado()
        {
            CAspirante objAspiranteAsignado = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvAspiranteAsignado = new DataView(objAspiranteAsignado.Detalle("", "", "", DateTime.Now, 'X',
           "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Now, "", DateTime.Now, 6).TB_ASPIRANTE);

            GVAspiranteAsignado.DataSource = dvAspiranteAsignado;
            GVAspiranteAsignado.DataBind();
        }

        protected void GVRegistroAspirante_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVRegistroAspirante.SelectedIndex;

                TxtIdAspirante.Text = GVRegistroAspirante.DataKeys[Id].Value.ToString();
                FillCamposDatosGenerales();
                LimpiarIq();
                PanelRegistroAspirante.Visible = false;
                PanelRegistroIq.Visible = true;

            }

            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPRegistroAspirante);
            }
        }

       

        protected void FillCboTipoDocumento()
        {
            CDocumento objTipoDocumento = new CDocumento(_DataSistema.ConexionBaseDato);
            DataView dvTipoDocumento = new DataView(objTipoDocumento.Detalle(0, "", "", 'A', _DataSistema.CPerfilusuario, "", DateTime.Now, "", DateTime.Now, 2).TBC_DOCUMENTO);

            CboTipoDocumento.DataSource = dvTipoDocumento;
            CboTipoDocumento.DataBind();  
        }

        protected void BtnGuardarNotaIq_Click(object sender, EventArgs e)
        {
            try
            {
                CNotaIq objNotasIqAspirante = new CNotaIq(_DataSistema.ConexionBaseDato);
                objResultado = objNotasIqAspirante.Actualizacion(0, Convert.ToDouble(TxtNotaIq.Text), TxtObservacion.Text,TxtIdAspirante.Text, _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                
                string nombreArchivo = _DataSistema.Cusuario + "_" + CboTipoDocumento.SelectedValue + FileDocumento.FileName;
                
                CDocumentoAspirante objDocumentoAspirante = new CDocumentoAspirante(_DataSistema.ConexionBaseDato);
                objResultado = objDocumentoAspirante.Actualizacion(0, "", nombreArchivo, Convert.ToInt32(CboTipoDocumento.SelectedValue), _DataSistema.Cusuario
                , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                

                if (objResultado.CodigoError == 0)
                {
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPRegistroAspirante);
                    string Id = GVRegistroAspirante.SelectedRow.Cells[1].Text;
                    TxtIdAspirante.Text = Id;
                    PanelRegistroAspirante.Visible = true;
                    PanelRegistroIq.Visible = false;
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPRegistroAspirante);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPRegistroAspirante);
            }
        }

        protected void FileDocumento_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            string ruta = Server.MapPath("~/ASP/Documentos/");
            string savePath = MapPath("~/ASP/Documentos/" + _DataSistema.Cusuario + "_" + CboTipoDocumento.SelectedValue + Path.GetFileName(e.FileName));
            ((AsyncFileUpload)sender).SaveAs(savePath);
        }

        protected void FillCamposDatosGenerales()
        {
            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvAspirante = new DataView(objAspirante.Detalle(TxtIdAspirante.Text, "", "", DateTime.Today, 'X',
         "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Today, "", DateTime.Today, 3).TB_ASPIRANTE);
            if (dvAspirante.Count > 0)
            {   /* CARGA DE DATOS DE EL PRIMER REGISTRO */
                TxtNombre.Text = dvAspirante.Table.Rows[0]["DS_NOMBRE"].ToString();
                TxtApellido.Text = dvAspirante.Table.Rows[0]["DS_APELLIDO"].ToString();
                TxtNit.Text = dvAspirante.Table.Rows[0]["DS_NIT"].ToString();
            }
        }

        protected void BtnRegresar_Click(object sender, EventArgs e)
        {
            PanelRegistroIq.Visible = false;
            PanelRegistroAspirante.Visible = true;
        }
        protected void LimpiarIq()
        {
            TxtNotaIq.Text = "";
            TxtObservacion.Text = "";

        }

    }
}