using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using ClsDataApp;
using ClsInterface;
using dica;
using Microsoft.Reporting.WebForms;

namespace MyMainApp
{
    public partial class ASPP0001 : FormaSISWeb,IAcciones
    {
        private DataView dvTituloAcademico, dvPais, dvDepartamento, dvMunicipio, dvTipoDocumento, dvDestreza,
            dvCategoriaHabilidad, dvConocimiento, dvNivel, dvNivelEducativo, dvOpcionAcademica, dvInstitucion,
            dvEscolaridad, dvHabilidad, dvDocumento, dvPantallas, dvEntregables, dvCategoriaEscolaridad, dvListaPasantia;
        private DataSet dsEscolaridad, dsPantalla;
        DataQuery objResultado = new DataQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            
                
            _DataSistema = (ClsSistema)Session["MyDataSistema"];

            /*
                Se Declara la constante Pantalla con la que se evaluara si el perfil de la persona posee privilegios
                para Abrir esta Pantalla
            */
            String Pantalla = "ASPP0001";
            String accesoPantalla;
            Boolean booleanPantalla = false;
            CMenu pantallasPermitidas = new CMenu(_DataSistema.ConexionBaseDato);
            if (_DataSistema.Cusuario != null)
            {
                dsPantalla = pantallasPermitidas.DetalleOpciones(_DataSistema.Cusuario, "", "", Pantalla, 4);
                foreach (System.Data.DataRow dr in dsPantalla.Tables["Table"].Rows)
                {
                    accesoPantalla = dr["ID_OPCION_SISTEMA"].ToString();
                    if (booleanPantalla=(accesoPantalla != null)) {
                        booleanPantalla = true;
                    }
                }
                if (booleanPantalla == false) {
                    Response.Redirect("~/Default.aspx");
                }
            }
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
            FillCamposDatosGenerales();
            FillCboTratamiento();
            FillCboPais();
            FillCboDepartamento();
            FillCboMunicipio();
            FillCboTipoDocumento();
            FillCboDestreza();
            FillCboCategoriaHabilidad();
            FillCboConocimiento();
            FillCboNivel();
            FillCboCategoriaEscolaridad();
            FillCboNivelEducativo();
            FillCboOpcionAcademica();
            FillCboInstitucion();
            FillGVEscolaridad();
            FillGVHabilidad();
            FillGVDestreza();
            FillGVDocumento();
            FillRepresentanteLegal();
            FillGVEntregables();
            FillGVPasantia();
            CargarReporte();
        }

        

        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillCboTratamiento()
        {
            CTituloAcademico objTituloAcademico = new CTituloAcademico(_DataSistema.ConexionBaseDato);
            dvTituloAcademico = new DataView(objTituloAcademico.Detalle(0, "", "", "", DateTime.Now, "", DateTime.Now, 0).TBC_TITULO_ACADEMICO);

            CboTratamiento.DataSource = dvTituloAcademico;
            CboTratamiento.DataBind();

            CboTratamientoRepresentante.DataSource = dvTituloAcademico;
            CboTratamientoRepresentante.DataBind();
        }

        protected void FillCboPais()
        {
            CPais objPais = new CPais(_DataSistema.ConexionBaseDato);
            dvPais = new DataView(objPais.Detalle(0, "", "", "", DateTime.Now, "", DateTime.Now, 0).TBC_PAIS);

            CboPais.DataSource = dvPais;
            CboPais.DataBind();

            CboPaisEscolaridad.DataSource = dvPais;
            CboPaisEscolaridad.DataBind();
        }

        protected void FillCboDepartamento()
        {
            CDepartamento objDepartamento = new CDepartamento(_DataSistema.ConexionBaseDato);
            dvDepartamento = new DataView(objDepartamento.Detalle(0,CboPais.SelectedValue, "", "", DateTime.Now, "", DateTime.Now, 2).TBC_DEPARTAMENTO);

            CboDepartamento.DataSource = dvDepartamento;
            CboDepartamento.DataBind();
        }

        protected void FillCboMunicipio()
        {
            CMunicipio objMunicipio = new CMunicipio(_DataSistema.ConexionBaseDato);
            dvMunicipio = new DataView(objMunicipio.Detalle(0, Convert.ToInt32(CboDepartamento.SelectedValue),  "", DateTime.Now, "", DateTime.Now,2).TBC_MUNICIPIO);

            CboMunicipio.DataSource = dvMunicipio;
            CboMunicipio.DataBind();
        }



        protected void FillCboTipoDocumento()
        {
            CDocumento objTipoDocumento = new CDocumento(_DataSistema.ConexionBaseDato);
            dvTipoDocumento = new DataView(objTipoDocumento.Detalle(0, "", "", 'A',_DataSistema.CPerfilusuario, "", DateTime.Now, "", DateTime.Now, 0).TBC_DOCUMENTO);

            CboTipoDocumento.DataSource = dvTipoDocumento;
            CboTipoDocumento.DataBind();
        }


        protected void FillCboDestreza()
        {
            CDestreza objDestreza = new CDestreza(_DataSistema.ConexionBaseDato);
            dvDestreza = new DataView(objDestreza.Detalle(0, "", "", 'A', "", DateTime.Now, "", DateTime.Now, 0).TBC_DESTREZA);

            CboDestreza.DataSource = dvDestreza;
            CboDestreza.DataBind();
        }

        protected void FillCboCategoriaHabilidad()
        {
            CCategoriaHabilidad objCategoriaHabilidad = new CCategoriaHabilidad(_DataSistema.ConexionBaseDato);
            dvCategoriaHabilidad = new DataView(objCategoriaHabilidad.Detalle(0, "", "", 'A', "", DateTime.Now, "", DateTime.Now, 0).TBC_CATEGORIA_HABILIDAD);

            CboCategoriaHabilidad.DataSource = dvCategoriaHabilidad;
            CboCategoriaHabilidad.DataBind();
        }


        protected void FillCboConocimiento()
        {
            CHabilidadConocimiento objConocimiento = new CHabilidadConocimiento(_DataSistema.ConexionBaseDato);
            dvConocimiento = new DataView(objConocimiento.Detalle(0, "", "", 'A', Convert.ToInt32(CboCategoriaHabilidad.SelectedValue), "", DateTime.Now, "", DateTime.Now, 2).TBC_HABILIDAD_CONOCIMIENTO);

            CboConocimiento.DataSource = dvConocimiento;
            CboConocimiento.DataBind();
        }

        protected void FillCboNivel()
        {
            CNivelConocimiento objNivel = new CNivelConocimiento(_DataSistema.ConexionBaseDato);
            dvNivel = new DataView(objNivel.Detalle(0, "", "", 'A', "", DateTime.Now, "", DateTime.Now, 0).TBC_NIVEL_CONOCIMIENTO);

            CboNivel.DataSource = dvNivel;
            CboNivel.DataBind();
        }

        protected void FillCboNivelEducativo()
        {
            CEscolaridad objNivelEducativo = new CEscolaridad(_DataSistema.ConexionBaseDato);
            dvNivelEducativo = new DataView(objNivelEducativo.Detalle(0,Convert.ToInt32(CboCategoriaEscolaridad.SelectedValue), "",  "", DateTime.Now, "", DateTime.Now, 2).TBC_ANIO_ESCOLARIDAD);

            CboNivelEducativo.DataSource = dvNivelEducativo;
            CboNivelEducativo.DataBind();
        }

        protected void FillCboOpcionAcademica()
        {
            COpcionAcademica objOpcionAcademica = new COpcionAcademica(_DataSistema.ConexionBaseDato);
            dvOpcionAcademica = new DataView(objOpcionAcademica.Detalle(0, Convert.ToInt32(CboCategoriaEscolaridad.SelectedValue), "", "", 'A', "", DateTime.Now, "", DateTime.Now, 2).TBC_OPCION_ACADEMICA);

            CboOpcionAcademica.DataSource = dvOpcionAcademica;
            CboOpcionAcademica.DataBind();
        }

        protected void FillCboInstitucion()
        {
            CCentroEscolar objInstitucion = new CCentroEscolar(_DataSistema.ConexionBaseDato);
            dvInstitucion = new DataView(objInstitucion.Detalle(0, "", "", "", DateTime.Now, "", DateTime.Now, 0).TBC_CENTRO_ESCOLAR);

            CboInstitucion.DataSource = dvInstitucion;
            CboInstitucion.DataBind();
        }

        protected void BtnGuardarDatoGeneral_Click(object sender, EventArgs e)
        {
            try
            {
                CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
                DataView dvAspirante = new DataView(objAspirante.Detalle(_DataSistema.Cusuario, "", "", DateTime.Today, 'X',
                "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Today, "", DateTime.Today, 3).TB_ASPIRANTE);
                /*
                    Este If se encarga de comprobar si el aspirante ya existe 
                */
                if (dvAspirante.Count > 0){
                    /*
                            Si estudiante es mayor a cero actualiza la informacion del estudiante 
                    */
                    objResultado = objAspirante.Actualizacion(_DataSistema.Cusuario, "", "", DateTime.Now, Convert.ToChar(RadioSexo.SelectedValue),
                     TxtTelCasa.Text, TxtTelCel.Text, TxtDireccion.Text, TxtEmail.Text, TxtDui.Text, TxtNit.Text, 'I', 0, CboPais.SelectedValue,
                     Convert.ToInt32(CboDepartamento.SelectedValue), Convert.ToInt32(CboMunicipio.SelectedValue),
                     Convert.ToInt32(CboTratamiento.SelectedValue), "", TxtDiscapacidad1.Text, TxtDiscapacidad2.Text, TxtDiscapacidad3.Text, _DataSistema.Cusuario,
                     TipoActualizacion.Actualizar);
                    int edad = Convert.ToInt32(TxtEdad.Text);

                    /*
                        If Para Comprobar que la consulta se desarrollo satisfactoriamente 
                    */
                    if (objResultado.CodigoError == 0){ // if resultado de consulta actualizar                    
                        FillCamposDatosGenerales();
                        /*
                            Observa si el estudiante es mayor a 18 años si este lo es despliega la informacion del representante legal.|                         
                        */
                        if (edad < 18){
                            CRepresentanteLegal objRepresentanteLegal = new CRepresentanteLegal(_DataSistema.ConexionBaseDato);
                            DataView dvRepresentanteLegal = new DataView(objRepresentanteLegal.Detalle(0,"","","","",'X',"",DateTime.Today,"","",_DataSistema.Cusuario,0,"",DateTime.Today,"",DateTime.Today,2).TBC_REPRESENTANTE_LEGAL);
                            if (dvRepresentanteLegal.Count > 0) {
                                objResultado = objRepresentanteLegal.Actualizacion(0, TxtNombreR.Text, TextApellidoR.Text, TextDuiR.Text, TextNitR.Text,
                                    Convert.ToChar(RadioSexoR.SelectedValue), TextEmailR.Text, Convert.ToDateTime(TextFechNacR.Text), TextTelR.Text,
                                    TextDireccionR.Text, _DataSistema.Cusuario, Convert.ToInt32(CboTratamientoRepresentante.SelectedValue),
                                    _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                                if (objResultado.CodigoError == 0)
                                {
                                    FillRepresentanteLegal();
                                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPDatoGeneral);
                                }else{
                                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDatoGeneral);
                                } // Termina IF (objResultado.CodigoError == 0)
                               
                            }else{
                                objResultado = objRepresentanteLegal.Actualizacion(0, TxtNombreR.Text, TextApellidoR.Text, TextDuiR.Text, TextNitR.Text,
                                    Convert.ToChar(RadioSexoR.SelectedValue), TextEmailR.Text, Convert.ToDateTime(TextFechNacR.Text), TextTelR.Text,
                                    TextDireccionR.Text, _DataSistema.Cusuario, Convert.ToInt32(CboTratamientoRepresentante.SelectedValue),
                                    _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                                if (objResultado.CodigoError == 0)
                                {

                                    FillRepresentanteLegal();
                                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPDatoGeneral);
                                }
                                else
                                {
                                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDatoGeneral);
                                } // Termina IF (objResultado.CodigoError == 0)
                            }// Termina IF (dvRepresentanteLegal.Count > 0)                            
                        }// Termina IF (edad < 18)
                    }else{
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDatoGeneral);
                    }// Termina IF (objResultado.CodigoError == 0)
                }
            }
            catch (Exception ex)
            {
                DespliegaMensaje(ex.Message);
            }
        }

        protected void FillCamposDatosGenerales()
        {
            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvAspirante = new DataView(objAspirante.Detalle(_DataSistema.Cusuario, "", "", DateTime.Today, 'X',
         "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Today, "", DateTime.Today, 3).TB_ASPIRANTE);
            if (dvAspirante.Count > 0)
            {   /* CARGA DE DATOS DE EL PRIMER REGISTRO */
                TxtNombre.Text = dvAspirante.Table.Rows[0]["DS_NOMBRE"].ToString();
                TxtApellido.Text = dvAspirante.Table.Rows[0]["DS_APELLIDO"].ToString();
                TxtEstado.Text = dvAspirante.Table.Rows[0]["CD_ESTADO_ASPIRANTE"].ToString();
                TxtFechNac.Text = dvAspirante.Table.Rows[0]["FECH_NACIMIENTO"].ToString();
                TxtEdad.Text = dvAspirante.Table.Rows[0]["EDAD"].ToString();
                TxtNit.Text = dvAspirante.Table.Rows[0]["DS_NIT"].ToString();
                TxtTipoAspirante.Text = dvAspirante.Table.Rows[0]["DS_TIPO_ASPIRANTE"].ToString();
                TxtEmail.Text = dvAspirante.Table.Rows[0]["DS_EMAIL"].ToString();
                if (Convert.ToInt32(dvAspirante.Table.Rows[0]["EDAD"].ToString())<18) {
                    PanelRepresentante.Visible = true;
                }

                /* CARGA DE DATOS DE EL POSTERIORES REGISTROS */

                TxtTelCasa.Text = dvAspirante.Table.Rows[0]["DS_TELEFONO_CASA"].ToString();
                TxtTelCel.Text = dvAspirante.Table.Rows[0]["DS_TELEFONO_CELULAR"].ToString();
                TxtDui.Text = dvAspirante.Table.Rows[0]["DS_DUI"].ToString();
                RadioSexo.SelectedValue = dvAspirante.Table.Rows[0]["DS_SEXO"].ToString();
                if (Convert.ToInt32(dvAspirante.Table.Rows[0]["ID_TITULO_ACADEMICO"].ToString()) > 0)
                {
                    CboTratamiento.SelectedValue = dvAspirante.Table.Rows[0]["ID_TITULO_ACADEMICO"].ToString();
                }
                TxtDiscapacidad1.Text = dvAspirante.Table.Rows[0]["DS_DISCAPACIDAD1"].ToString();
                TxtDiscapacidad2.Text = dvAspirante.Table.Rows[0]["DS_DISCAPACIDAD2"].ToString();
                TxtDiscapacidad3.Text = dvAspirante.Table.Rows[0]["DS_DISCAPACIDAD3"].ToString();
                if (dvAspirante.Table.Rows[0]["ID_PAIS"].ToString() != "")
                {
                    CboPais.SelectedValue = dvAspirante.Table.Rows[0]["ID_PAIS"].ToString();
                }
                if (Convert.ToInt32(dvAspirante.Table.Rows[0]["ID_DEPARTAMENTO"].ToString()) > 0)
                {
                    CboDepartamento.SelectedValue = dvAspirante.Table.Rows[0]["ID_DEPARTAMENTO"].ToString();
                }
                if (Convert.ToInt32(dvAspirante.Table.Rows[0]["ID_MUNICIPIO"].ToString()) > 0)
                {
                    CboMunicipio.SelectedValue = dvAspirante.Table.Rows[0]["ID_MUNICIPIO"].ToString();
                }
                TxtDireccion.Text = dvAspirante.Table.Rows[0]["DS_DIRECCION"].ToString();

            }
        }

        protected void FillRepresentanteLegal() {
            CRepresentanteLegal objRepresentanteLegal = new CRepresentanteLegal(_DataSistema.ConexionBaseDato);
            DataView dvRepresentanteLegal = new DataView(objRepresentanteLegal.Detalle(0,"","","","",'X',"",DateTime.Today,"","",_DataSistema.Cusuario,0,"",DateTime.Today,"",DateTime.Today,2).TBC_REPRESENTANTE_LEGAL);
            if (dvRepresentanteLegal.Count > 0) {
                TxtNombreR.Text = dvRepresentanteLegal.Table.Rows[0]["DS_NOMBRE"].ToString();
                TextApellidoR.Text = dvRepresentanteLegal.Table.Rows[0]["DS_APELLIDO"].ToString();
                TextDuiR.Text = dvRepresentanteLegal.Table.Rows[0]["DS_DUI"].ToString();
                RadioSexoR.SelectedValue = dvRepresentanteLegal.Table.Rows[0]["DS_SEXO"].ToString();
                TextNitR.Text = dvRepresentanteLegal.Table.Rows[0]["DS_NIT"].ToString();
                TextEmailR.Text = dvRepresentanteLegal.Table.Rows[0]["DS_EMAIL"].ToString();
                //TextFechNacR.Text = (dvRepresentanteLegal.Table.Rows[0]["FECH_NACIMIENTO"].ToString());
                DateTime fecha = Convert.ToDateTime((dvRepresentanteLegal.Table.Rows[0]["FECH_NACIMIENTO"].ToString()));
                string fechaFormateada = fecha.ToString("dd/MM/yyyy");
                TextFechNacR.Text = fechaFormateada;
                TextTelR.Text = dvRepresentanteLegal.Table.Rows[0]["DS_TELEFONO"].ToString();
                TextDireccionR.Text = dvRepresentanteLegal.Table.Rows[0]["DS_DIRECCION"].ToString();
                if (Convert.ToInt32(dvRepresentanteLegal.Table.Rows[0]["ID_TITULO_ACADEMICO"].ToString()) > 0)
                {
                    CboTratamientoRepresentante.SelectedValue = dvRepresentanteLegal.Table.Rows[0]["ID_TITULO_ACADEMICO"].ToString();
                }
                
            }
        }

        protected void FillGVEscolaridad()
        {
            CEscolaridadAspirante objEscolaridad = new CEscolaridadAspirante(_DataSistema.ConexionBaseDato);
            dvEscolaridad = new DataView(objEscolaridad.Detalle(0, _DataSistema.Cusuario, 0,0, 0, 0, "", "", 0, 0, "", DateTime.Now, "", DateTime.Now, 3).TB_ESCOLARIDAD_ASPIRANTE);

            GVEscolaridad.DataSource = dvEscolaridad;
            GVEscolaridad.DataBind();
        }

        protected void FillGVHabilidad()
        {
            CHabilidadAspirante objHabilidad = new CHabilidadAspirante(_DataSistema.ConexionBaseDato);
            dvHabilidad = new DataView(objHabilidad.Detalle(0, 0, _DataSistema.Cusuario, 0, 0, "", DateTime.Now, "", DateTime.Now,2).TB_HABILIDAD_ASPIRANTE);

            GVHabilidad.DataSource = dvHabilidad;
            GVHabilidad.DataBind();
        }

        private void FillGVEntregables()
        {
            CConsultoriaEntregable objEntregable = new CConsultoriaEntregable(_DataSistema.ConexionBaseDato);
            dvEntregables = new DataView(objEntregable.Detalle(0, 0, "", "", DateTime.Today, "", 'X', "", "", _DataSistema.Cusuario, "", DateTime.Today, "", DateTime.Today, 3).TB_CONSULTORIA_ENTREGABLE);

            GVEntregable.DataSource = dvEntregables;
            GVEntregable.DataBind();
        }

        private void FillGVPasantia()
        {
            CActividadAspirante objActividad = new CActividadAspirante(_DataSistema.ConexionBaseDato);
            dvListaPasantia = new DataView(objActividad.Detalle(0,_DataSistema.Cusuario,0,"",'X',"",_DataSistema.Cusuario,DateTime.Today,_DataSistema.Cusuario,DateTime.Today,2).TB_ACTIVIDAD_ASPIRANTE);

            GVListaPasantia.DataSource = dvListaPasantia;
            GVListaPasantia.DataBind();
        }


        protected void FillGVDestreza()
        {
            CDestrezaAspirante objDestreza = new CDestrezaAspirante(_DataSistema.ConexionBaseDato);
            dvDestreza = new DataView(objDestreza.Detalle(0, 0, _DataSistema.Cusuario, "", DateTime.Now, "", DateTime.Now, 2).TB_DESTREZA_ASPIRANTE);

            GVDestreza.DataSource = dvDestreza;
            GVDestreza.DataBind();
        }


        protected void FillGVDocumento()
        {
            CDocumentoAspirante objDocumento = new CDocumentoAspirante(_DataSistema.ConexionBaseDato);
            dvDocumento = new DataView(objDocumento.Detalle(0, "", "", 0, _DataSistema.Cusuario, "", DateTime.Now, "", DateTime.Now, 2).TB_DOCUMENTO_ASPIRANTE);

            GVDocumento.DataSource = dvDocumento;
            GVDocumento.DataBind();
        }

        protected void BtnEscolaridadGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                decimal Nota = Convert.ToDecimal(TxtNotas.Text);
                String datoEscolaridad, datoCarrera, datoCEscolar, datoPais, datoOtra, datoAnio;
                Boolean existe = false;
                String datoInserEscolaridad, datoInserCarrera, datoInserCEscolar, datoInserPais, datoInserOtra, datoInserAnio;
                CEscolaridadAspirante objEscolaridadAspirante = new CEscolaridadAspirante(_DataSistema.ConexionBaseDato);
                dsEscolaridad = objEscolaridadAspirante.Detalle(0, _DataSistema.Cusuario, 0, 0, 0,0, "", "", 0, 0, "", DateTime.Now, "", DateTime.Now, 4);
                foreach (System.Data.DataRow dr1 in dsEscolaridad.Tables["TB_ESCOLARIDAD_ASPIRANTE"].Rows)
                {
                    datoEscolaridad = dr1["DS_ESCOLARIDAD"].ToString();
                    datoCarrera = dr1["DS_CARRERA"].ToString();
                    datoCEscolar = dr1["DS_CENTRO_ESCOLAR"].ToString();
                    datoPais = dr1["DS_PAIS"].ToString();
                    datoOtra = dr1["DS_OTRA"].ToString();
                    datoAnio = dr1["NM_ANIO_FIN"].ToString();

                    datoInserEscolaridad = CboNivelEducativo.SelectedValue;
                    datoInserCarrera = CboOpcionAcademica.SelectedValue;
                    datoInserCEscolar = CboInstitucion.SelectedValue;
                    datoInserPais = CboPais.SelectedValue;
                    datoInserOtra = TxtOtraInstitucion.Text;
                    datoInserAnio = TxtAnioFin.Text;

                    if ((datoEscolaridad == datoInserEscolaridad) && (datoCarrera == datoInserCarrera) && (datoCEscolar == datoInserCEscolar) && (datoPais == datoInserPais) && (datoOtra == datoInserOtra) && (datoAnio == datoInserAnio))
                    {
                        existe = true;
                    }
                }
                if (existe == true)
                {
                    DespliegaMensajeUpdatePanel("Escolaridad ya registrada", UPEscolaridad);
                }
                else {
                    objResultado = objEscolaridadAspirante.Actualizacion(0, _DataSistema.Cusuario, Convert.ToInt32(CboCategoriaEscolaridad.SelectedValue), Convert.ToInt32(CboNivelEducativo.SelectedValue),
                        Convert.ToInt32(CboOpcionAcademica.SelectedValue), Convert.ToInt32(CboInstitucion.SelectedValue),
                        CboPaisEscolaridad.SelectedValue, TxtOtraInstitucion.Text, Convert.ToInt32(TxtAnioFin.Text), Nota
                    , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVEscolaridad();
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPEscolaridad);
                    }
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPEscolaridad);
            }
        }

        protected void BtnGuardarHabilidad_Click(object sender, EventArgs e)
        {
            try
            {
                CHabilidadAspirante objHabilidadAspirante = new CHabilidadAspirante(_DataSistema.ConexionBaseDato);
                objResultado = objHabilidadAspirante.Actualizacion(0, Convert.ToInt32(CboConocimiento.Text), _DataSistema.Cusuario,
                    Convert.ToInt32(CboCategoriaHabilidad.SelectedValue), Convert.ToInt32(CboNivel.SelectedValue) 
                , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                if (objResultado.CodigoError == 0)
                {
                    FillGVHabilidad();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError,UPDestreza);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDestreza);
            }
        }

        protected void BtnGuardarDestreza_Click(object sender, EventArgs e)
        {
            try
            {
                CDestrezaAspirante objDestrezaAspirante = new CDestrezaAspirante(_DataSistema.ConexionBaseDato);
                objResultado = objDestrezaAspirante.Actualizacion(0, Convert.ToInt32(CboDestreza.SelectedValue), _DataSistema.Cusuario
                , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                if (objResultado.CodigoError == 0)
                {
                    FillGVDestreza();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError,UPDestreza);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDestreza);
            }
        }

        protected void BtnGuardarDocumento_Click(object sender, EventArgs e)
        {
            try
            {
               /* if (FileDocumento.HasFile)
                {*/
                    string nombreArchivo = _DataSistema.Cusuario + "_" + CboTipoDocumento.SelectedValue + FileDocumento.FileName;
                 /*   string ruta = Server.MapPath("~/ASP/Documentos/");
                    FileDocumento.PostedFile.SaveAs(ruta + nombreArchivo);*/

                    CDocumentoAspirante objDocumentoAspirante = new CDocumentoAspirante(_DataSistema.ConexionBaseDato);
                    objResultado = objDocumentoAspirante.Actualizacion(0, TxtDescripcionDocumento.Text, nombreArchivo, Convert.ToInt32(CboTipoDocumento.SelectedValue), _DataSistema.Cusuario
                    , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVDocumento();
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDocumento);
                    }
               /*  }
               else
                {
                    DespliegaMensaje("Adjuntar Archivo");
                }*/
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message,UPDocumento);
            }
        }


        protected void GVDocumento_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                    string ruta = Server.MapPath("~/ASP/Documentos/");
                   /* var uri = new Uri("file://SERVERNAME/FOLDER$/FOLDER/image.jpg", UriKind.Absolute);
                    System.IO.File.Delete(uri.LocalPath);*/
                    TextBox Id = GVDocumento.Rows[e.RowIndex].FindControl("TxtIDDocumento") as TextBox;
                    CDocumentoAspirante objDocumentoAspirante = new CDocumentoAspirante(_DataSistema.ConexionBaseDato);
                    objResultado = objDocumentoAspirante.Actualizacion(Convert.ToInt32(Id.Text), "", "", 0, ""
                    , _DataSistema.Cusuario, TipoActualizacion.Eliminar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVDocumento();
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDocumento);
                    }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDocumento);
            }
        }

        protected void FileDocumento_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            string ruta = Server.MapPath("~/ASP/Documentos/");
            string savePath = MapPath("~/ASP/Documentos/" + _DataSistema.Cusuario + "_" + CboTipoDocumento.SelectedValue + Path.GetFileName(e.FileName));
            ((AsyncFileUpload)sender).SaveAs(savePath);
        }

        protected void GVDestreza_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TextBox Id = GVDestreza.Rows[e.RowIndex].FindControl("TxtIDDestreza") as TextBox;
                CDestrezaAspirante objDestrezaAspirante = new CDestrezaAspirante(_DataSistema.ConexionBaseDato);
                objResultado = objDestrezaAspirante.Actualizacion(Convert.ToInt32(Id.Text), 0, _DataSistema.Cusuario
                , _DataSistema.Cusuario, TipoActualizacion.Eliminar);

                if (objResultado.CodigoError == 0)
                {
                    FillGVDestreza();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDestreza);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDestreza);
            }
        }

        protected void GVHabilidad_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TextBox Id = GVHabilidad.Rows[e.RowIndex].FindControl("TxtIDHabilidad") as TextBox;
                CHabilidadAspirante objHabilidadAspirante = new CHabilidadAspirante(_DataSistema.ConexionBaseDato);
                objResultado = objHabilidadAspirante.Actualizacion(Convert.ToInt32(Id.Text), 0, _DataSistema.Cusuario,
                    0, 0
                , _DataSistema.Cusuario, TipoActualizacion.Eliminar);

                if (objResultado.CodigoError == 0)
                {
                    FillGVHabilidad();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPHabilidad);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPHabilidad);
            }
        }

        protected void GVEscolaridad_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TextBox Id = GVEscolaridad.Rows[e.RowIndex].FindControl("TxtIDEscolaridad") as TextBox;
                CEscolaridadAspirante objEscolaridadAspirante = new CEscolaridadAspirante(_DataSistema.ConexionBaseDato);
                objResultado = objEscolaridadAspirante.Actualizacion(Convert.ToInt32(Id.Text), _DataSistema.Cusuario, 0,0,
                    0, 0, "", "", 0, 0
                , _DataSistema.Cusuario, TipoActualizacion.Eliminar);

                if (objResultado.CodigoError == 0)
                {
                    FillGVEscolaridad();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPEscolaridad);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message,UPEscolaridad);
            }
        }

        protected void CboPais_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCboDepartamento();
        }

        protected void CboDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCboMunicipio();
        }

        protected void CboCategoriaHabilidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCboConocimiento();
        }


        
        protected void FillCboCategoriaEscolaridad()
        {
            CCategoriaEscolaridad objCategoriaEscolaridad = new CCategoriaEscolaridad(_DataSistema.ConexionBaseDato);
            dvCategoriaEscolaridad = new DataView(objCategoriaEscolaridad.Detalle(0, "", "", 'A', "", DateTime.Now, "", DateTime.Now, 0).TBC_CATEGORIA_ESCOLARIDAD);

            CboCategoriaEscolaridad.DataSource = dvCategoriaEscolaridad;
            CboCategoriaEscolaridad.DataBind();
        }

        protected void CboCategoriaEscolaridad_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCboNivelEducativo();
            FillCboOpcionAcademica();
        }

        protected void CargarReporte()
        {
            DataTable dt;

            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvAspirante = new DataView(objAspirante.Detalle(_DataSistema.Cusuario, "", "", DateTime.Today, 'X',
         "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Today, "", DateTime.Today, 4).TB_ASPIRANTE);

            dt = dvAspirante.ToTable();
            RVFichaAspirante.Visible = true;
            RVFichaAspirante.LocalReport.ReportPath = "ASP/RptFichaAspirante.rdlc";
            RVFichaAspirante.LocalReport.DataSources.Clear();
            RVFichaAspirante.LocalReport.DataSources.Add(new ReportDataSource("TB_ASPIRANTE", dt));

            DataTable dt2;
            CEscolaridadAspirante objEscolaridad = new CEscolaridadAspirante(_DataSistema.ConexionBaseDato);
            DataView dvEscolaridad = new DataView(objEscolaridad.Detalle(0, _DataSistema.Cusuario, 0, 0, 0, 0, "", "", 0, 0, "", DateTime.Now,
                "", DateTime.Now, 3).TB_ESCOLARIDAD_ASPIRANTE);
            dt2 = dvEscolaridad.ToTable();
            RVFichaAspirante.LocalReport.DataSources.Add(new ReportDataSource("TB_ESCOLARIDAD_ASPIRANTE", dt2));

            DataTable dt3;
            CHabilidadAspirante objHabilidad = new CHabilidadAspirante(_DataSistema.ConexionBaseDato);
            DataView dvHabilidad = new DataView(objHabilidad.Detalle(0, 0, _DataSistema.Cusuario, 0, 0, "",
                DateTime.Now, "", DateTime.Now, 2).TB_HABILIDAD_ASPIRANTE);
            dt3 = dvHabilidad.ToTable();
            RVFichaAspirante.LocalReport.DataSources.Add(new ReportDataSource("TB_HABILIDAD_ASPIRANTE", dt3));

            DataTable dt4;
            CDestrezaAspirante objDestreza = new CDestrezaAspirante(_DataSistema.ConexionBaseDato);
            DataView dvDestreza = new DataView(objDestreza.Detalle(0, 0, _DataSistema.Cusuario, "",
                DateTime.Now, "", DateTime.Now, 2).TB_DESTREZA_ASPIRANTE);
            dt4 = dvDestreza.ToTable();
            RVFichaAspirante.LocalReport.DataSources.Add(new ReportDataSource("TB_DESTREZA_ASPIRANTE", dt4));

            DataTable dt5;
            CPasantiaAspirante objPasantiaAspirante = new CPasantiaAspirante(_DataSistema.ConexionBaseDato);
            DataView dvPasantiaAspirante = new DataView(objPasantiaAspirante.Detalle(0, "", 0, "", DateTime.Now, "",
                DateTime.Now, 2).TB_PASANTIA_ASPIRANTE);
            dt5 = dvPasantiaAspirante.ToTable();
            RVFichaAspirante.LocalReport.DataSources.Add(new ReportDataSource("TB_PASANTIA_ASPIRANTE", dt5));
        }

        protected void GVEntregable_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string Id = GVEntregable.SelectedRow.Cells[1].Text;                
                TxtIdEntregable.Text = Id;
                FillCamposEntregable();
                FillGVEntregables();
                PanelListaEntregable.Visible = false;
                PanelEntregable.Visible = true;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UUPEntregable);
            }
        }

        private void FillCamposEntregable()
        {            
            CConsultoriaEntregable objEntregable = new CConsultoriaEntregable(_DataSistema.ConexionBaseDato);
            dvEntregables = new DataView(objEntregable.Detalle(0, 0, "", "", DateTime.Today, "", 'X', "", "", _DataSistema.Cusuario, "", DateTime.Today, "", DateTime.Today, 3).TB_CONSULTORIA_ENTREGABLE);
            if (dvEntregables.Count > 0) {                
                TxtIdConsultoria.Text = dvEntregables.Table.Rows[0]["ID_CONSULTORIA"].ToString();
                TxtNombreEntregable.Text = dvEntregables.Table.Rows[0]["DS_ENTREGABLE"].ToString();
                TxtDuracionEntregable.Text = dvEntregables.Table.Rows[0]["DS_DURACION_ENT"].ToString();
                TxtFechaEntregaEntregable.Text = dvEntregables.Table.Rows[0]["FECH_ENTREGA_ENT"].ToString();
                TxtDescripcion.Text = dvEntregables.Table.Rows[0]["DS_DESCRIPCION_ENT"].ToString();
                TxtEstadoEntregable.Text = dvEntregables.Table.Rows[0]["CD_ESTADO_ENTREGABLE"].ToString();
                TxtNombreConsultoria.Text = dvEntregables.Table.Rows[0]["DS_NOMBRE_CONSULTORIA"].ToString();
            }
        }

        protected void BtnGuardarEntregableConsultoria_Click(object sender, EventArgs e)
        {

            try
            {
                string nombreArchivo = _DataSistema.Cusuario + "_" + Convert.ToString(TxtIdConsultoria.Text) + "_" + Convert.ToString(TxtIdEntregable.Text) + "_" + FileEntregable.FileName;
                CConsultoriaEntregable objConsultoriaEntregable = new CConsultoriaEntregable(_DataSistema.ConexionBaseDato);
                objResultado = objConsultoriaEntregable.Actualizacion(Convert.ToInt32(TxtIdEntregable.Text), Convert.ToInt32(TxtIdConsultoria.Text), TxtNombreEntregable.Text, TxtDescripcion.Text,
                Convert.ToDateTime(TxtFechaEntregaEntregable.Text), TxtDuracionEntregable.Text, Convert.ToChar(TxtEstadoEntregable.Text), Convert.ToString(nombreArchivo), "", _DataSistema.Cusuario, _DataSistema.Cusuario, TipoActualizacion.Actualizar);

                if (objResultado.CodigoError == 0)
                {
                    FillGVEntregableDetalle();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UUPEntregable);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDocumento);
            }
        }

        protected void FileEntregable_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            bool exists = System.IO.Directory.Exists(Server.MapPath("~/ASP/Entregables/" + Convert.ToString(TxtNombreConsultoria.Text) + "/"));
            if (!exists)
            {
                System.IO.Directory.CreateDirectory(Server.MapPath("~/ASP/Entregables/" + Convert.ToString(TxtNombreConsultoria.Text) + "/"));
            }
            string savePath = MapPath("~/ASP/Entregables/" + TxtNombreConsultoria.Text + "/" + _DataSistema.Cusuario + "_" + Convert.ToString(TxtIdConsultoria.Text) + "_" + Convert.ToString(TxtIdEntregable.Text) + "_" + Path.GetFileName(e.FileName));
            ((AsyncFileUpload)sender).SaveAs(savePath);
        }

        private void FillGVEntregableDetalle()
        {
            CConsultoriaEntregable objEntregable = new CConsultoriaEntregable(_DataSistema.ConexionBaseDato);
            dvEntregables = new DataView(objEntregable.Detalle(0, 0, "", "", DateTime.Today, "", 'X', "", "", _DataSistema.Cusuario, "", DateTime.Today, "", DateTime.Today, 3).TB_CONSULTORIA_ENTREGABLE);

            GVEntregableAspirante.DataSource = dvEntregables;
            GVEntregableAspirante.DataBind();

        }
    }
}