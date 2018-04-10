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
        private DataView dvRegistroAspirante, dvAspiranteAsignado, dvTipoDocumento, dvAspirante, dvListaAspirante,dvPrueba,
            dvEscolaridad, dvHabilidad, dvDestreza;

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
            FillGVListaRegistroAspirantes();
        }
        public void Adicionar() { }
        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVRegistroAspirante()
        {
            CAspirante objRegistroAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
             dvRegistroAspirante = new DataView(objRegistroAspirante.Detalle("", "", "", DateTime.Now, 'X',
           "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Now, "", DateTime.Now, 5).TB_ASPIRANTE);
            
            GVRegistroAspirante.DataSource = dvRegistroAspirante;
            GVRegistroAspirante.DataBind();
            
        }

        protected void FillGVAspiranteAsignado()
        {
            CAspirante objAspiranteAsignado = new CAspirante(_DataSistema.ConexionBaseDato);
             dvAspiranteAsignado = new DataView(objAspiranteAsignado.Detalle("", "", "", DateTime.Now, 'X',
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
                PanelRegistroIq.Style["visibility"] = "show";

            }

            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPRegistroAspirante);
            }
        }

       

        protected void FillCboTipoDocumento()
        {
            CDocumento objTipoDocumento = new CDocumento(_DataSistema.ConexionBaseDato);
             dvTipoDocumento = new DataView(objTipoDocumento.Detalle(0, "", "", 'A', _DataSistema.CPerfilusuario, "", DateTime.Now, "", DateTime.Now, 2).TBC_DOCUMENTO);

            CboTipoDocumento.DataSource = dvTipoDocumento;
            CboTipoDocumento.DataBind();  
        }
        protected void ArchivoIq_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
        {
       string ruta = Server.MapPath("~/ASP/Documentos/");
            string savePath = MapPath("~/ASP/Documentos/" + _DataSistema.Cusuario + "_" + CboTipoDocumento.SelectedValue + Path.GetFileName(e.FileName));
            ((AsyncFileUpload)sender).SaveAs(savePath);
        }


        protected void BtnGuardarNotaIq_Click(object sender, EventArgs e)
        {
            try
            {
                string nombreArchivo = _DataSistema.Cusuario + "_" + CboTipoDocumento.SelectedValue + ArchivoIq.FileName;
                ArchivoIq.PersistFile = false; ArchivoIq.PersistFile = true;

                CDocumentoAspirante objDocumentoAspirante = new CDocumentoAspirante(_DataSistema.ConexionBaseDato);
                objResultado = objDocumentoAspirante.Actualizacion(0, "", nombreArchivo, Convert.ToInt32(CboTipoDocumento.SelectedValue), TxtIdAspirante.Text
                , _DataSistema.Cusuario, TipoActualizacion.Adicionar);


                    CNotaIq objNotasIqAspirante = new CNotaIq(_DataSistema.ConexionBaseDato);
                    objResultado = objNotasIqAspirante.Actualizacion(0, Convert.ToDouble(TxtNotaIq.Text), TxtObservacion.Text, TxtIdAspirante.Text, _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPRegistroAspirante);
                        //string Id = GVRegistroAspirante.SelectedRow.Cells[1].Text;
                        //TxtIdAspirante.Text = Id;
                        FillGVRegistroIq();                   
                        //PanelRegistroAspirante.Visible = true;
                        //PanelRegistroIq.Visible = false;
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UUPEntregable);
                    }
                
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPRegistroAspirante);
            }
        }

        protected void FillGVRegistroIq()
        {
            
            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            dvAspirante = new DataView(objAspirante.Detalle("", "", "", DateTime.Today, 'X',
           "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Today, "", DateTime.Today, 1).TB_ASPIRANTE);
            
            if (dvAspirante.Count > 0)
            {
                TxtIdAspirante.Text = dvAspirante.Table.Rows[0]["ID"].ToString();

            } CNotaIq objPruebaIq = new CNotaIq(_DataSistema.ConexionBaseDato);
            dvPrueba = new DataView(objPruebaIq.Detalle(0, ' ', "", TxtIdAspirante.Text, "", DateTime.Today
                , "", DateTime.Today, 3).TB_NOTA_IQ);
            GVRegistroIq.DataSource = dvPrueba;
            GVRegistroIq.DataBind();
        }

        protected void FillCamposDatosGenerales()
        {
            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
          dvAspirante = new DataView(objAspirante.Detalle(TxtIdAspirante.Text, "", "", DateTime.Today, 'X',
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
            PanelRegistroIq.Style["visibility"] = "hidden";
            PanelRegistroAspirante.Visible = true;
        }
        protected void LimpiarIq()
        {
            TxtNotaIq.Text = "";
            TxtObservacion.Text = "";

        }

        protected void FillGVListaRegistroAspirantes()
        {
            CAspirante objListaAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
             dvListaAspirante = new DataView(objListaAspirante.Detalle("", "", "", DateTime.Now, 'X',
           "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Now, "", DateTime.Now,7).TB_ASPIRANTE);

            GVListaRegistroAspirantes.DataSource = dvListaAspirante;
            GVListaRegistroAspirantes.DataBind();

        }

        protected void FillDatosAspirante()
        {//datos para perfil aspirante
            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            dvAspirante = new DataView(objAspirante.Detalle(TxtIdPasante.Text, "", "", DateTime.Now,
                'x', "", "", "", "", "", "", 'x', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Now, "", DateTime.Now, 4).TB_ASPIRANTE);
            if (dvAspirante.Count > 0)
            {
                /* datos de aspirantes para el perfil */
                TxtNombreA.Text = dvAspirante.Table.Rows[0]["DS_NOMBRE"].ToString();
                TxtApellidoA.Text = dvAspirante.Table.Rows[0]["DS_APELLIDO"].ToString();
                TxtFechNac.Text = dvAspirante.Table.Rows[0]["FECH_NACIMIENTO"].ToString();
                TxtNitA.Text = dvAspirante.Table.Rows[0]["DS_NIT"].ToString();
                TxtTipoAspirante.Text = dvAspirante.Table.Rows[0]["DS_TIPO_ASPIRANTE"].ToString();
                TxtEmail.Text = dvAspirante.Table.Rows[0]["DS_EMAIL"].ToString();
                TxtDui.Text = dvAspirante.Table.Rows[0]["DS_DUI"].ToString();
                TxtSexo.Text = dvAspirante.Table.Rows[0]["DS_SEXO"].ToString();
                TxtTratamiento.Text = dvAspirante.Table.Rows[0]["DS_TITULO"].ToString();
                TxtTelCasa.Text = dvAspirante.Table.Rows[0]["DS_TELEFONO_CASA"].ToString();
                TxtTelCel.Text = dvAspirante.Table.Rows[0]["DS_TELEFONO_CELULAR"].ToString();
                TxtDiscapacidad1.Text = dvAspirante.Table.Rows[0]["DS_DISCAPACIDAD1"].ToString();
                TxtDiscapacidad2.Text = dvAspirante.Table.Rows[0]["DS_DISCAPACIDAD2"].ToString();
                TxtDiscapacidad3.Text = dvAspirante.Table.Rows[0]["DS_DISCAPACIDAD3"].ToString();
                TxtDireccion.Text = dvAspirante.Table.Rows[0]["DS_DIRECCION"].ToString();
                TxtPais.Text = dvAspirante.Table.Rows[0]["DS_PAIS"].ToString();
                TxtDepartamento.Text = dvAspirante.Table.Rows[0]["DS_DEPARTAMENTO"].ToString();
                TxtMunicipio.Text = dvAspirante.Table.Rows[0]["DS_MUNICIPIO"].ToString();

            }

        }
        protected void GVListaRegistroAspirantes_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Id = GVListaRegistroAspirantes.SelectedIndex;

            TxtIdPasante.Text=GVListaRegistroAspirantes.DataKeys[Id].Value.ToString();
            FillDatosAspirante();
            FillGVNotaIq();
            FillGVEscolaridadA();
            FillGVHabilidadA();
            FillGVDestrezaA();
            PanelListaRegistros.Visible = false;
            PanelPerfil.Visible = true;
            
        }

        protected void BtnRegresarLista_Click(object sender, EventArgs e)
        {
            PanelListaRegistros.Visible = true;
            PanelPerfil.Visible = false;
        }

        protected void FillGVNotaIq()
        {//datos para perfil aspirante
            CNotaIq objPruebaIq = new CNotaIq(_DataSistema.ConexionBaseDato);
            dvPrueba = new DataView(objPruebaIq.Detalle(0, ' ', "", TxtIdPasante.Text, "", DateTime.Today
                ,"", DateTime.Today, 3).TB_NOTA_IQ);
            if (dvPrueba.Count <= 0)
            {
                lblPruebaIq.Text = "NO HAY REGISTRO DE LA PRUEBA DE COEFICIENTE";
                lblPruebaIq.Visible = true;
                GVNotaIq.Visible = false;
            }
            else {
                lblPruebaIq.Visible = false;
                GVNotaIq.Visible = true;
                GVNotaIq.DataSource = dvPrueba;
                GVNotaIq.DataBind();
            }
            
        }

        protected void FillGVEscolaridadA()
        {//datos para perfil aspirante
            CEscolaridadAspirante objEscolaridad = new CEscolaridadAspirante(_DataSistema.ConexionBaseDato);
            dvEscolaridad = new DataView(objEscolaridad.Detalle(0, TxtIdPasante.Text, 0, 0, 0, 0, "", "", 0
                , 0, "", DateTime.Now, "", DateTime.Now, 3).TB_ESCOLARIDAD_ASPIRANTE);
            if (dvEscolaridad.Count <= 0)
            {
                lblEscolaridad.Text = "DATOS INCOMPLETOS POR EL ASPIRANTE";
                lblEscolaridad.Visible = true;
                GVEscolaridadA.Visible = false;
            }
            else
            {
                lblEscolaridad.Visible = false;
                GVEscolaridadA.Visible = true;
                GVEscolaridadA.DataSource = dvEscolaridad;
                GVEscolaridadA.DataBind();
            }
        }

        protected void FillGVHabilidadA()
        {//datos para perfil aspirante
            CHabilidadAspirante objHabilidad = new CHabilidadAspirante(_DataSistema.ConexionBaseDato);
            dvHabilidad = new DataView(objHabilidad.Detalle(0, 0, TxtIdPasante.Text, 0, 0, "",
                DateTime.Now, "", DateTime.Now, 2).TB_HABILIDAD_ASPIRANTE);
            if (dvHabilidad.Count <= 0)
            {
                lblHabilidadA.Text = "DATOS INCOMPLETOS POR EL ASPIRANTE";
                lblHabilidadA.Visible = true;
                GVHabilidadA.Visible = false;
            }
            else
            {
                lblHabilidadA.Visible = false;
                GVHabilidadA.Visible = true;
                GVHabilidadA.DataSource = dvHabilidad;
                GVHabilidadA.DataBind();
            }
        }

        protected void FillGVDestrezaA()
        {//datos para perfil aspirante
            CDestrezaAspirante objDestreza = new CDestrezaAspirante(_DataSistema.ConexionBaseDato);
            dvDestreza = new DataView(objDestreza.Detalle(0, 0, TxtIdPasante.Text, "", DateTime.Now,
                "", DateTime.Now, 2).TB_DESTREZA_ASPIRANTE);
            if (dvDestreza.Count <= 0)
            {
                lblDestrezaA.Text = "DATOS INCOMPLETOS POR EL ASPIRANTE";
                lblDestrezaA.Visible = true;
                GVDestrezaA.Visible = false;
            }
            else
            {
                lblDestrezaA.Visible = false;
                GVDestrezaA.Visible = true;
                GVDestrezaA.DataSource = dvDestreza;
                GVDestrezaA.DataBind();
            }
        }
        
    }
}