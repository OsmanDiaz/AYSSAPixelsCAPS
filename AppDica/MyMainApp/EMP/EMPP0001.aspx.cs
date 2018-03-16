using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClsDataApp;
using ClsInterface;
using dica;
using Microsoft.Reporting.WebForms;

namespace MyMainApp.EMP
{
    public partial class EMPP0001 : FormaSISWeb, IAcciones
    {
        private DataView dvActividadEconomica, dvEmpresa, dvDepartamento, dvMunicipio, dvHabilidad, dvDestreza, dvPasantia,
            dvAreaPasantia, dvCategoriaHabilidad, dvConocimiento, dvNivel, dvNivelEducativo, dvOpcionAcademica, dvEscolaridadPasantia,
            dvConsultoria, dvEntregable, dvCategoriaEscolaridad, dvPasantiaActividad, dvPasantiaAspirante, dvActividadAspirante,dvRendimiento, objExiste,
            dvEncuestaRendimiento, dvAceptacionAspirante, dvAspirante;
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

        protected void BtnGuardarDatosGenerales_Click(object sender, EventArgs e)
        {
            CEmpresa objEmpresa = new CEmpresa(_DataSistema.ConexionBaseDato);
            dvEmpresa = new DataView(objEmpresa.Detalle(0, TxtEmpresa.Text, TxtNombreContact.Text, TxtEmailC.Text, TxtTelC.Text, _DataSistema.Cusuario,
                TxtTelEmpresa.Text, TxtDirEmpresa.Text, 0, 0,
            TxtNombRepre.Text, TxtEmailRep.Text, TxtNitRep.Text, TxtDuiRep.Text, 0, _DataSistema.Cusuario, _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 2).TB_EMPRESA);

            try
            {
                if (dvEmpresa.Count > 0)
                {
                    objResultado = objEmpresa.Actualizacion(Convert.ToInt32(TxtIDEmpresa.Text), TxtEmpresa.Text, TxtNombreContact.Text, TxtEmailC.Text, TxtTelC.Text, TxtNitEmpresa.Text,
                   TxtTelEmpresa.Text, TxtDirEmpresa.Text, Convert.ToInt32(CboDepartamento.SelectedValue), Convert.ToInt32(CboMunicipio.SelectedValue),
                    TxtNombRepre.Text, TxtEmailRep.Text, TxtNitRep.Text, TxtDuiRep.Text, Convert.ToInt32(CboActEcono.SelectedValue), _DataSistema.Cusuario, _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                }
                else
                {
                    objResultado = objEmpresa.Actualizacion(0, TxtEmpresa.Text, TxtNombreContact.Text, TxtEmailC.Text, TxtTelC.Text, TxtNitEmpresa.Text,
                   TxtTelEmpresa.Text, TxtDirEmpresa.Text, Convert.ToInt32(CboDepartamento.SelectedValue), Convert.ToInt32(CboMunicipio.SelectedValue),
                    TxtNombRepre.Text, TxtEmailRep.Text, TxtNitRep.Text, TxtDuiRep.Text, Convert.ToInt32(CboActEcono.SelectedValue), _DataSistema.Cusuario, _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                    TxtIDEmpresa.Text = Convert.ToString(objResultado.CodigoAuxiliar);
                }
                FillCamposDatosGenerales();
                DespliegaMensajeUpdatePanel("Registro Guardado", UPDatoGeneral);
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPDatoGeneral);
            }
        }

        public void Consultar()
        {
            FillCamposDatosGenerales();
            FillCamposPasantia();
            FillCboActEcono();
            FillCboDepartamento();
            FillCboMunicipio();
            FillCboAreaPasantia();
            FillGVPasantia();
            FillGVHabilidad();
            FillGVDestreza();
            FillCboCategoriaEscolaridad();
            FillCboNivelEducativo();
            FillCboOpcionAcademica();
            FillCboNivel();
            FillCboCategoriaHabilidad();
            FillCboConocimiento();
            FillCboDestreza();
            FillGVNivelEducativo();
            FillGVContrato();
            CargarReporte();
            FillGVAspirantesEntregables();
            FillDatosEmpresa();
            FillCamposAspirante();
                     
        }

        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillCamposDatosGenerales()
        {
            CEmpresa objEmpresa = new CEmpresa(_DataSistema.ConexionBaseDato);
            dvEmpresa = new DataView(objEmpresa.Detalle(0, TxtEmpresa.Text, TxtNombreContact.Text, TxtEmailC.Text, TxtTelC.Text, _DataSistema.Cusuario,
                TxtTelEmpresa.Text, TxtDirEmpresa.Text, 0, 0,
            TxtNombRepre.Text, TxtEmailRep.Text, TxtNitRep.Text, TxtDuiRep.Text, 0, _DataSistema.Cusuario, _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 2).TB_EMPRESA);
            if (dvEmpresa.Count > 0)
            {
                TxtIDEmpresa.Text = dvEmpresa.Table.Rows[0]["ID"].ToString();
                TxtEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString();
                LblEmpresa.Text = TxtEmpresa.Text;
                CboActEcono.SelectedValue = dvEmpresa.Table.Rows[0]["ID_ACT_ECO"].ToString();
                TxtNombreContact.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString();
                TxtEmailC.Text = dvEmpresa.Table.Rows[0]["DS_EMAIL_CONTACTO"].ToString();
                TxtTelC.Text = dvEmpresa.Table.Rows[0]["DS_TELEFONO_CONTACTO"].ToString();
                TxtNitEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_NIT_EMPRESA"].ToString();
                TxtTelEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_TELEFONO_EMPRESA"].ToString();
                TxtDirEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_DIRECCION_EMPRESA"].ToString();
                CboDepartamento.SelectedValue = dvEmpresa.Table.Rows[0]["ID_DEPARTAMENTO"].ToString();
                CboMunicipio.SelectedValue = dvEmpresa.Table.Rows[0]["ID_MUNICIPIO"].ToString();
                TxtNombRepre.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_REPRESENTANTE"].ToString();
                TxtEmailRep.Text = dvEmpresa.Table.Rows[0]["DS_EMAIL_REPRESENTATE"].ToString();
                TxtNitRep.Text = dvEmpresa.Table.Rows[0]["DS_NIT_REPRESENTANTE"].ToString();
                TxtDuiRep.Text = dvEmpresa.Table.Rows[0]["DS_DUI_REPRESENTANTE"].ToString();
            }
        }

        protected void FillCboActEcono()
        {
            CActividadEconomica objActividadEconomica = new CActividadEconomica(_DataSistema.ConexionBaseDato);
            dvActividadEconomica = new DataView(objActividadEconomica.Detalle(0, "", "", DateTime.Now, "", DateTime.Now, 0).TBC_ACTIVIDAD_ECONOMICA);

            CboActEcono.DataSource = dvActividadEconomica;
            CboActEcono.DataBind();
        }

        protected void FillCboDepartamento()
        {
            CDepartamento objDepartamento = new CDepartamento(_DataSistema.ConexionBaseDato);
            dvDepartamento = new DataView(objDepartamento.Detalle(0, "SV", "", "", DateTime.Now, "", DateTime.Now, 2).TBC_DEPARTAMENTO);

            CboDepartamento.DataSource = dvDepartamento;
            CboDepartamento.DataBind();
        }

        protected void FillCboMunicipio()
        {
            CMunicipio objMunicipio = new CMunicipio(_DataSistema.ConexionBaseDato);
            dvMunicipio = new DataView(objMunicipio.Detalle(0, Convert.ToInt32(CboDepartamento.SelectedValue), "", DateTime.Now, "", DateTime.Now, 2).TBC_MUNICIPIO);

            CboMunicipio.DataSource = dvMunicipio;
            CboMunicipio.DataBind();
        }

        protected void CboDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCboMunicipio();
        }


        protected void FillGVHabilidad()
        {
            CHabilidadPasantia objHabilidad = new CHabilidadPasantia(_DataSistema.ConexionBaseDato);
            dvHabilidad = new DataView(objHabilidad.Detalle(0, Convert.ToInt32(TxtIDPasantia.Text), 0, 0, "", DateTime.Now, "", DateTime.Now, 2).TB_PASANTIA_HABILIDAD);

            GVHabilidad.DataSource = dvHabilidad;
            GVHabilidad.DataBind();
        }

        protected void FillGVDestreza()
        {
            CDestrezaPasantia objDestrezaPasantia = new CDestrezaPasantia(_DataSistema.ConexionBaseDato);
            dvDestreza = new DataView(objDestrezaPasantia.Detalle(0, Convert.ToInt32(TxtIDPasantia.Text), 0, "", DateTime.Now, "", DateTime.Now, 2).TB_DESTREZA_PASANTIA);

            GVDestreza.DataSource = dvDestreza;
            GVDestreza.DataBind();
        }

        protected void FillGVPasantia()
        {
            CPasantia objPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            dvPasantia = new DataView(objPasantia.Detalle(0, "", "", Convert.ToInt32(TxtIDEmpresa.Text), 0, "", "", DateTime.Now,
            "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Now, "", DateTime.Now, 3).TB_PASANTIA);
            if (dvPasantia.Count > 0)
            {
                TxtFechInicioPasantia.Text = dvPasantia.Table.Rows[0]["FECH_INICIO_PASANTIA"].ToString();
            }
            GVPasantia.DataSource = dvPasantia;
            GVPasantia.DataBind();

            GVPasantiaAsignacion.DataSource = dvPasantia;
            GVPasantiaAsignacion.DataBind();
        }

        protected void BtnGuardarPasantia_Click(object sender, EventArgs e)
        {
            CPasantia objPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            dvPasantia = new DataView(objPasantia.Detalle(Convert.ToInt32(TxtIDPasantia.Text), "", "", 0, 0, "", "", DateTime.Now,
             "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Now, "", DateTime.Now, 1).TB_PASANTIA);

            try
            {
                if (dvPasantia.Count > 0)
                {
                    objResultado = objPasantia.Actualizacion(Convert.ToInt32(TxtIDPasantia.Text), TxtNombEva.Text, TxtEmailEva.Text
                        , Convert.ToInt32(TxtIDEmpresa.Text), Convert.ToInt32(CboAreaPasantia.SelectedValue), TxtTituloPasantia.Text, TxtDescPasantia.Text, Convert.ToDateTime(TxtFechInicio.Text),
          TxtDuracion.Text, TxtDe.Text, TxtA.Text, Convert.ToChar(CboEstadoPasantia.SelectedValue), Convert.ToInt32(CboDias1.SelectedValue), Convert.ToInt32(CboDias2.SelectedValue), Convert.ToInt32(TxtEdadDe.Text), Convert.ToInt32(TxtEdadA.Text), Convert.ToInt32(TxtCantVacantes.Text),
             TxtSucursal.Text, TxtDireccion.Text, _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                    
                }
                else
                {
                    objResultado = objPasantia.Actualizacion(Convert.ToInt32(TxtIDPasantia.Text), TxtNombEva.Text, TxtEmailEva.Text
                        , Convert.ToInt32(TxtIDEmpresa.Text), Convert.ToInt32(CboAreaPasantia.SelectedValue), TxtTituloPasantia.Text, TxtDescPasantia.Text, Convert.ToDateTime(TxtFechInicio.Text),
          TxtDuracion.Text, TxtDe.Text, TxtA.Text, Convert.ToChar(CboEstadoPasantia.SelectedValue), Convert.ToInt32(CboDias1.SelectedValue), Convert.ToInt32(CboDias2.SelectedValue), Convert.ToInt32(TxtEdadDe.Text), Convert.ToInt32(TxtEdadA.Text), Convert.ToInt32(TxtCantVacantes.Text),
             TxtSucursal.Text, TxtDireccion.Text, _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                    if (objResultado.CodigoError == 0)
                    {
                        TxtIDPasantia.Text = Convert.ToString(objResultado.CodigoAuxiliar);
                       
                        Consultar();
                        DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPPasantia);
                    }
                }
                if (objResultado.CodigoError == 0)
                {
                    Consultar();
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPPasantia);
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPPasantia);
                }

            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPPasantia);
            }
        }


        protected void FillCboAreaPasantia()
        {
            CAreaPasantia objAreaPasantia = new CAreaPasantia(_DataSistema.ConexionBaseDato);
            dvAreaPasantia = new DataView(objAreaPasantia.Detalle(0, "", "", DateTime.Now, "", DateTime.Now, 0).TBC_AREA_EMPRESA);

            CboAreaPasantia.DataSource = dvAreaPasantia;
            CboAreaPasantia.DataBind();
        }

        protected void FillCamposPasantia()
        {
            CPasantia objPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            dvPasantia = new DataView(objPasantia.Detalle(Convert.ToInt32(TxtIDPasantia.Text), "", "", 0, 0, "", "", DateTime.Now,
             "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Now, "", DateTime.Now, 1).TB_PASANTIA);
            if (dvPasantia.Count > 0)
            {
                TxtIDPasantia.Text = dvPasantia.Table.Rows[0]["ID"].ToString();
                TxtTituloPasantia.Text = dvPasantia.Table.Rows[0]["NOMBRE_PASANTIA"].ToString();
                LblPasantia.Text = TxtTituloPasantia.Text;
                TxtNombEva.Text = dvPasantia.Table.Rows[0]["DS_NOMBRE_EVAL"].ToString();
                TxtEmailEva.Text = dvPasantia.Table.Rows[0]["DS_EMAIL_CONTACTO"].ToString();
                TxtIDEmpresa.Text = dvPasantia.Table.Rows[0]["ID_EMPRESA"].ToString();
                CboAreaPasantia.SelectedValue = dvPasantia.Table.Rows[0]["ID_AREA"].ToString();
                TxtDescPasantia.Text = dvPasantia.Table.Rows[0]["DS_PASANTIA"].ToString();
                TxtFechInicio.Text = (dvPasantia.Table.Rows[0]["FECH_INICIO_PASANTIA"].ToString()).Substring(0, 10);
                TxtDuracion.Text = dvPasantia.Table.Rows[0]["DS_DURACION"].ToString();
                TxtDe.Text = dvPasantia.Table.Rows[0]["DS_HORARIO_DE"].ToString();
                TxtA.Text = dvPasantia.Table.Rows[0]["DS_HORARIO_A"].ToString();
                CboEstadoPasantia.SelectedValue = dvPasantia.Table.Rows[0]["CD_ESTADO_PASANTIA"].ToString();
                CboDias1.SelectedValue = dvPasantia.Table.Rows[0]["NM_DIAS_DE"].ToString();
                CboDias2.SelectedValue = dvPasantia.Table.Rows[0]["NM_DIAS_A"].ToString();
                TxtEdadDe.Text = dvPasantia.Table.Rows[0]["NM_EDAD_DE"].ToString();
                TxtEdadA.Text = dvPasantia.Table.Rows[0]["NM_EDAD_A"].ToString();
                TxtCantVacantes.Text = dvPasantia.Table.Rows[0]["NM_VACANTES"].ToString();
                TxtSucursal.Text = dvPasantia.Table.Rows[0]["DS_SUCURSAL"].ToString();
                TxtDireccion.Text = dvPasantia.Table.Rows[0]["DS_DIRECCION_SUCURSAL"].ToString();
            }
        }

        protected void BtnGuardarHabilidad_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(TxtIDPasantia.Text) > 0)
                {
                    CHabilidadPasantia objHabilidadPasantia = new CHabilidadPasantia(_DataSistema.ConexionBaseDato);
                    objResultado = objHabilidadPasantia.Actualizacion(0, Convert.ToInt32(TxtIDPasantia.Text), Convert.ToInt32(CboConocimiento.SelectedValue),
                        Convert.ToInt32(CboNivel.SelectedValue)
                    , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVHabilidad();
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPPasantia);
                    }
                }
                else
                {
                    DespliegaMensajeUpdatePanel("No se ha seleccionado una pasantia para agregar Habilidad", UPPasantia);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPPasantia);
            }
        }

        protected void BtnGuardarDestreza_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(TxtIDPasantia.Text) > 0)
                {
                    CDestrezaPasantia objDestrezaPasantia = new CDestrezaPasantia(_DataSistema.ConexionBaseDato);
                    objResultado = objDestrezaPasantia.Actualizacion(0, Convert.ToInt32(TxtIDPasantia.Text), Convert.ToInt32(CboDestreza.SelectedValue)
                    , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVDestreza();
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPPasantia);
                    }
                }
                else
                {
                    DespliegaMensajeUpdatePanel("No se ha seleccionado una pasantia para agregar Destreza", UPPasantia);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPPasantia);
            }
        }


        protected void GVPasantia_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                TextBox Id = GVPasantia.Rows[e.RowIndex].FindControl("TxtIDPasantiaGV") as TextBox;
                TxtIDPasantia.Text = Id.Text;
                Consultar();
                //-------------paneles visibles para actualizar pasantia--------------------
                PanelPasantia.Visible = true;
                BtnFinalizarPasantia.Visible = true;
                PanelListadoPasantia.Visible = false;
                FillGVActividades();
                DespliegaMensajeUpdatePanel("Registro Seleccionado", UPPasantia);
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPPasantia);
            }
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
            dvNivelEducativo = new DataView(objNivelEducativo.Detalle(0, Convert.ToInt32(CboCategoriaEscolaridad.SelectedValue), "", "", DateTime.Now, "", DateTime.Now, 2).TBC_ANIO_ESCOLARIDAD);

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

        protected void CboCategoriaHabilidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCboConocimiento();
        }


        protected void BtnGuardarNivel_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(TxtIDPasantia.Text) > 0)
                {
                    CEscolaridadPasantia objEscolaridadPasantia = new CEscolaridadPasantia(_DataSistema.ConexionBaseDato);
                    objResultado = objEscolaridadPasantia.Actualizacion(0, Convert.ToInt32(TxtIDPasantia.Text), Convert.ToInt32(CboCategoriaEscolaridad.SelectedValue), Convert.ToInt32(CboNivelEducativo.SelectedValue), Convert.ToInt32(CboOpcionAcademica.SelectedValue),
                      _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVNivelEducativo();
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPPasantia);
                    }
                }
                else
                {
                    DespliegaMensajeUpdatePanel("No se ha seleccionado una pasantia para agregar Nivel Educativo", UPPasantia);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPPasantia);
            }
        }


        protected void FillGVNivelEducativo()
        {
            CEscolaridadPasantia objEscolaridadPasantia = new CEscolaridadPasantia(_DataSistema.ConexionBaseDato);
            dvEscolaridadPasantia = new DataView(objEscolaridadPasantia.Detalle(0, Convert.ToInt32(TxtIDPasantia.Text), 0, 0, 0, "", DateTime.Now, "", DateTime.Now, 2).TB_ESCOLARIDAD_PASANTIA);

            GVNivelEducativo.DataSource = dvEscolaridadPasantia;
            GVNivelEducativo.DataBind();
        }

        protected void BtnProyectoGuardar_Click(object sender, EventArgs e)
        {
            CConsultoria objConsultoria = new CConsultoria(_DataSistema.ConexionBaseDato);
            dvConsultoria = new DataView(objConsultoria.Detalle(Convert.ToInt32(TxtIdProyecto.Text), TxtContrato.Text, "", TxtDescProyecto.Text, DateTime.Now, 0, TxtDuracionC.Text,
               Convert.ToChar(CboEstadoPro.SelectedValue), Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 1).TB_PASANTIA);

            try
            {
                double Monto = Convert.ToDouble(TxtMontoPro.Text);
                if (dvConsultoria.Count > 0)
                {
                    objResultado = objConsultoria.Actualizacion(Convert.ToInt32(TxtIdProyecto.Text), TxtContrato.Text, TxtTituloProyecto.Text, TxtDescProyecto.Text, DateTime.Now, Monto, TxtDuracionC.Text,
               Convert.ToChar(CboEstadoPro.SelectedValue), Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                }
                else
                {
                    objResultado = objConsultoria.Actualizacion(Convert.ToInt32(TxtIdProyecto.Text), TxtContrato.Text, TxtTituloProyecto.Text, TxtDescProyecto.Text, DateTime.Now, Monto, TxtDuracionC.Text,
               Convert.ToChar(CboEstadoPro.SelectedValue), Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                    if (objResultado.CodigoError == 0)
                    {
                        TxtIdProyecto.Text = Convert.ToString(objResultado.CodigoAuxiliar);
                        Consultar();
                        DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPProyecto);
                        PanelProyecto.Visible = true; 
                        
                        PanelRegistroProyecto.Visible = false;
                      
                        
                    }
                }
                if (objResultado.CodigoError == 0)
                {
                    Consultar();
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPProyecto);
                    
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPProyecto);
                }

            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPProyecto);
            }
        }


        protected void FillGVContrato()
        {
            CConsultoria objConsultoria = new CConsultoria(_DataSistema.ConexionBaseDato);
            dvConsultoria = new DataView(objConsultoria.Detalle(0, TxtContrato.Text, "", TxtDescProyecto.Text, DateTime.Now, 0, TxtDuracionC.Text,
                Convert.ToChar(CboEstadoPro.SelectedValue), Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 2).TB_CONSULTORIA);

            GVContrato.DataSource = dvConsultoria;
            GVContrato.DataBind();
        }

        protected void GVContrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVContrato.SelectedIndex;

                TxtIdProyecto.Text = GVContrato.DataKeys[Id].Value.ToString();
                FillCamposProyecto();
                FillGVEntregable();
                TxtNombrePro.Text = TxtTituloProyecto.Text;
                PanelProyecto.Visible = false;
                PanelEntregable.Visible = false;
                PanelListaEntregable.Visible = true;
               
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPProyecto);
            }
        }

        

        protected void BtnCancelarEntregable_Click(object sender, EventArgs e)
        {//de registro entregable regresar a listado entregable
            PanelListaEntregable.Visible = true;
            PanelEntregable.Visible = false;
        }

        protected void BtnGuardarEntregable_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToInt32(TxtIdProyecto.Text) > 0)
                {
                    CConsultoriaEntregable objConsultoriaEntregable = new CConsultoriaEntregable(_DataSistema.ConexionBaseDato);
                    objResultado = objConsultoriaEntregable.Actualizacion(0, Convert.ToInt32(TxtIdProyecto.Text), TxtNombEntregable.Text,
                        TxtDescripPasantia.Text, Convert.ToDateTime(TxtFechaEntrega.Text), TxtDuracionE.Text,
                        'P', "", "", "", _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVEntregable();
                    }
                    if (objResultado.CodigoError == 0)
                    {
                        Consultar();
                        DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPProyecto);
                        PanelEntregable.Visible = false;
                        PanelListaEntregable.Visible = true;
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPProyecto);
                    }
                }
                else
                {
                    DespliegaMensajeUpdatePanel("No se ha seleccionado una pasantia para agregar Entregables", UPProyecto);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPProyecto);
            }
        }

        protected void FillGVEntregable()
        {
            CConsultoriaEntregable objEntregable = new CConsultoriaEntregable(_DataSistema.ConexionBaseDato);
            dvEntregable = new DataView(objEntregable.Detalle(0, Convert.ToInt32(TxtIdProyecto.Text), "", "", DateTime.Now, "",
                'A', "", "", "",
                _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 2).TB_CONSULTORIA_ENTREGABLE);

            GVEntregable.DataSource = dvEntregable;
            GVEntregable.DataBind();
        }

        protected void FillCamposProyecto()
        {
            CConsultoria objConsultoria = new CConsultoria(_DataSistema.ConexionBaseDato);
            dvConsultoria = new DataView(objConsultoria.Detalle(Convert.ToInt32(TxtIdProyecto.Text), TxtContrato.Text, "", TxtDescProyecto.Text, DateTime.Now, 0, TxtDuracionC.Text,
                Convert.ToChar(CboEstadoPro.SelectedValue), Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 3).TB_CONSULTORIA);

            if (dvConsultoria.Count > 0)
            {
                TxtTituloProyecto.Text = dvConsultoria.Table.Rows[0]["DS_NOMBRE_CONSULTORIA"].ToString();
                LblProyecto.Text = TxtTituloProyecto.Text;
                TxtContrato.Text = dvConsultoria.Table.Rows[0]["DS_NUMERO_CONTRATO"].ToString();
                TxtDuracionC.Text = dvConsultoria.Table.Rows[0]["DS_CONTRATO_DURACION"].ToString();
                TxtDescProyecto.Text = dvConsultoria.Table.Rows[0]["DS_DESCRIPCION"].ToString();
                TxtFechIniCont.Text = (dvConsultoria.Table.Rows[0]["FECH_INICIO_CONTRATO"].ToString()).Substring(0, 10);
                CboEstadoPro.SelectedValue = dvConsultoria.Table.Rows[0]["CD_ESTADO"].ToString();
                TxtMontoPro.Text = dvConsultoria.Table.Rows[0]["NM_MONTO_CONSULTORIA"].ToString();
            }
        }

        
        protected void CboCategoriaEscolaridad_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillCboNivelEducativo();
            FillCboOpcionAcademica();
        }

        protected void FillCboCategoriaEscolaridad()
        {
            CCategoriaEscolaridad objCategoriaEscolaridad = new CCategoriaEscolaridad(_DataSistema.ConexionBaseDato);
            dvCategoriaEscolaridad = new DataView(objCategoriaEscolaridad.Detalle(0, "", "", 'A', "", DateTime.Now, "", DateTime.Now, 0).TBC_CATEGORIA_ESCOLARIDAD);

            CboCategoriaEscolaridad.DataSource = dvCategoriaEscolaridad;
            CboCategoriaEscolaridad.DataBind();
        }

        protected void CargarReporte()
        {
            DataTable dtE;
            CEmpresa objEmpresa = new CEmpresa(_DataSistema.ConexionBaseDato);
            DataView dvEmpresa = new DataView(objEmpresa.Detalle(Convert.ToInt32(TxtIDEmpresa.Text), TxtEmpresa.Text, TxtNombreContact.Text, TxtEmailC.Text, TxtTelC.Text, _DataSistema.Cusuario,
                TxtTelEmpresa.Text, TxtDirEmpresa.Text, 0, 0,
            TxtNombRepre.Text, TxtEmailRep.Text, TxtNitRep.Text, TxtDuiRep.Text, 0, _DataSistema.Cusuario, _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 4).TB_EMPRESA);
            dtE = dvEmpresa.ToTable();
            RVEmpresa.LocalReport.DataSources.Add(new ReportDataSource("TB_EMPRESA", dtE));


            DataTable dtP;
            CPasantia objPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            DataView dvPasantia = new DataView(objPasantia.Detalle(0, "", "", Convert.ToInt32(TxtIDEmpresa.Text), 0, "", "", DateTime.Now,
            "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Now, "", DateTime.Now, 3).TB_PASANTIA);
            dtP = dvPasantia.ToTable();
            RVEmpresa.LocalReport.DataSources.Add(new ReportDataSource("TB_PASANTIA", dtP));

            DataTable dtPR;
            CConsultoria objConsultoria = new CConsultoria(_DataSistema.ConexionBaseDato);
            DataView dvConsultoria = new DataView(objConsultoria.Detalle(Convert.ToInt32(TxtIdProyecto.Text), TxtContrato.Text, "", TxtDescProyecto.Text, DateTime.Now, 0, TxtDuracionC.Text,
                Convert.ToChar(CboEstadoPro.SelectedValue), Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 4).TB_CONSULTORIA);
            dtPR = dvConsultoria.ToTable();
            RVEmpresa.LocalReport.DataSources.Add(new ReportDataSource("TB_CONSULTORIA", dtPR));
        }

        protected void BtnActividades_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(TxtIDPasantia.Text) > 0)
            {
                try
                {
                    CPasantiaActividad objPasantiaActividad = new CPasantiaActividad(_DataSistema.ConexionBaseDato);
                    objResultado = objPasantiaActividad.Actualizacion(0, Convert.ToInt32(TxtIDPasantia.Text), TxtActividad.Text,
                   TxtDescripActividad.Text, Convert.ToDateTime(TxtFechaEntregaA.Text), TxtDuracionA.Text
                    , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVActividades();
                        TxtActividad.Text = null;
                        TxtDuracionA.Text = null;
                        TxtFechaEntregaA.Text = null;
                        TxtDescripActividad.Text = null;
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPPasantia);
                    }
                }
                catch (Exception ex)
                {
                    DespliegaMensajeUpdatePanel(ex.Message, UPPasantia);
                }
            }
            else
            {
                DespliegaMensajeUpdatePanel("No se ha seleccionado una pasantia para agregar Actividad", UPPasantia);
            }

        }


        protected void FillGVActividades()
        {
            CPasantiaActividad objPasantiaActividad = new CPasantiaActividad(_DataSistema.ConexionBaseDato);
            if (TxtFechaEntregaA.Text == null || TxtFechaEntregaA.Text == "")
            {
                dvPasantiaActividad = new DataView(objPasantiaActividad.Detalle(0, Convert.ToInt32(TxtIDPasantia.Text), TxtActividad.Text,
                TxtDescripActividad.Text, DateTime.Now, TxtDuracionA.Text, "", DateTime.Now, "", DateTime.Now, 2).TB_PASANTIA_ACTIVIDAD);

                GVActividades.DataSource = dvPasantiaActividad;
                GVActividades.DataBind();
            }else {                
                dvPasantiaActividad = new DataView(objPasantiaActividad.Detalle(0, Convert.ToInt32(TxtIDPasantia.Text), TxtActividad.Text,
                TxtDescripActividad.Text, Convert.ToDateTime(TxtFechaEntregaA.Text), TxtDuracionA.Text, "", DateTime.Now, "", DateTime.Now, 2).TB_PASANTIA_ACTIVIDAD);

                GVActividades.DataSource = dvPasantiaActividad;
                GVActividades.DataBind();
            }            
        }

        protected void GVPasantia_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVPasantia.SelectedIndex;

                TxtIDPasantia.Text = GVPasantia.DataKeys[Id].Value.ToString();
                Consultar();
                FillGVAspirantes();
                GVPasantia.Visible = false;
                PanelAspirantes.Visible = true;
                /*  BtnCancelarHabilidad.Visible = false;
                  BtnGuardarPasantia.Visible = false;*/
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPPasantia);
            }
        }



        protected void FillGVAspirantes()
        {
            CPasantiaAspirante objPasantiaAspirante = new CPasantiaAspirante(_DataSistema.ConexionBaseDato);
            dvPasantiaAspirante = new DataView(objPasantiaAspirante.Detalle(0, "", Convert.ToInt32(TxtIDPasantia.Text),
            "", DateTime.Now, "", DateTime.Now, 2).TB_PASANTIA_ASPIRANTE);

            GVAspirantes.DataSource = dvPasantiaAspirante;
            GVAspirantes.DataBind();
        }

        protected void BtnRegresarPasantias_Click(object sender, EventArgs e)
        {
            GVPasantia.Visible = true;
            PanelAspirantes.Visible = false;
        }

        protected void GVAspirantes_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Id = GVAspirantes.SelectedIndex;

            string Usuario = GVAspirantes.DataKeys[Id].Value.ToString();
            FillGVActividadAspirante(Usuario);
            PanelActividadAspirante.Visible = true;
            PanelAspirantes.Visible = false;
        }

        protected void FillGVActividadAspirante(string Usuario)
        {
            CActividadAspirante objActividadAspirante = new CActividadAspirante(_DataSistema.ConexionBaseDato);
            dvActividadAspirante = new DataView(objActividadAspirante.Detalle(0, Usuario, 0, "", 'A', "", "",
            "", DateTime.Now, "", DateTime.Now, 2).TB_PASANTIA_ASPIRANTE);

            GVActividadAspirante.DataSource = dvActividadAspirante;
            GVActividadAspirante.DataBind();
        }

        protected void BtnRegresarAspirantes_Click(object sender, EventArgs e)
        {

            PanelAspirantes.Visible = true;
            PanelActividadAspirante.Visible = false;
        }

        protected void FillGVAspirantesEntregables()
        {
            CConsultoriaEntregable objEntregable = new CConsultoriaEntregable(_DataSistema.ConexionBaseDato);
            DataView dvEntregablesA = new DataView(objEntregable.Detalle(Convert.ToInt32(TxtIdProyecto.Text),
              Convert.ToInt32(TxtIdConsultoA.Text), "", "", DateTime.Today, "", 'X', "", "", "", "", DateTime.Today,
              "", DateTime.Today, 4).TB_CONSULTORIA_ENTREGABLE);

               GVAspirantesEntregables.DataSource = dvEntregablesA;
               GVAspirantesEntregables.DataBind();
        }

        protected void GVEntregable_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVEntregable.SelectedIndex;

                TxtIdProyecto.Text =Convert.ToString(GVEntregable.DataKeys[Id].Values[0]);
                TxtEntregableNomb.Text =Convert.ToString(GVEntregable.DataKeys[Id].Values[1]);
                FillGVAspirantesEntregables();
                TxtProyectoNomb.Text = TxtTituloProyecto.Text;//
                PanelAspirantesE.Visible = true;
                PanelListaEntregable.Visible = false;
                
            }
            catch (Exception ex)
            {
               DespliegaMensajeUpdatePanel(ex.Message, UPProyecto);
            }
        }

        protected void FillCamposAspirante()
        {
            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvAspirante = new DataView(objAspirante.Detalle(TxtIdAspirante.Text, "", "", DateTime.Today, 'X',
         "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Today, "", DateTime.Today, 3).TB_ASPIRANTE);
            if (dvAspirante.Count > 0)
            {   /* muestra los datos del aspirante seleccionado */
                TxtNombre.Text = dvAspirante.Table.Rows[0]["DS_NOMBRE"].ToString();
                TxtApellido.Text = dvAspirante.Table.Rows[0]["DS_APELLIDO"].ToString();

            }
        }

        protected void GVAspirantesEntregables_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVAspirantesEntregables.SelectedIndex;

                TxtIdAspirante.Text = Convert.ToString(GVAspirantesEntregables.DataKeys[Id].Values[0]);
                TxtIdConsulEntrega.Text = Convert.ToString(GVAspirantesEntregables.DataKeys[Id].Values[1]);
                FillCamposEntregable(TxtIdAspirante.Text);
                FillCamposAspirante();
                LimpiarDatosObser();
                PanelAspirantesE.Visible = false;
                PanelDetalleEntregable.Visible = true;
                
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPProyecto);
            }
        }
        protected void LimpiarDatosObser()
        {
            TxtObservEntregable.Text = "";

        }
        protected void BtnCancelarObservacion_Click(object sender, EventArgs e)
        {/* de observacion entregable regresar a listado aspirante*/
            PanelAspirantesE.Visible = true;
            PanelDetalleEntregable.Visible = false;
        }

        private void FillCamposEntregable(string IdAspirante)
        {
            CConsultoriaEntregable objEntregable = new CConsultoriaEntregable(_DataSistema.ConexionBaseDato);
            DataView dvEntregables = new DataView(objEntregable.Detalle(0, 0, "", "", DateTime.Today, "", 'X', "", ""
                , IdAspirante, _DataSistema.Cusuario, DateTime.Today, "", DateTime.Today, 3).TB_CONSULTORIA_ENTREGABLE);
            if (dvEntregables.Count > 0)
            {  /*muestra los datos del entregable perteneciente al aspirante */
                TxtIdConsultoria.Text = dvEntregables.Table.Rows[0]["ID_CONSULTORIA"].ToString();
                TxtNombreEntregable.Text = dvEntregables.Table.Rows[0]["DS_ENTREGABLE"].ToString();
                TxtDuracionEntregable.Text = dvEntregables.Table.Rows[0]["DS_DURACION_ENT"].ToString();
                TxtFechaEntregaEntregable.Text = dvEntregables.Table.Rows[0]["FECH_ENTREGA_ENT"].ToString();
                TxtDescripcion.Text = dvEntregables.Table.Rows[0]["DS_DESCRIPCION_ENT"].ToString();
                TxtIdAspirante.Text = dvEntregables.Table.Rows[0]["ID_ASPIRANTE"].ToString();

            }
        }

        protected void BtnRegresar1_Click(object sender, EventArgs e)
        {//de lista aspirante regresar a lista de entregables
            PanelAspirantesE.Visible = false;
            PanelListaEntregable.Visible = true;
        }

        protected void BtnNuevoProyecto_Click(object sender, EventArgs e)
        {//registro de nuevo proyecto
            LimpiarDatosProyecto();
            PanelProyecto.Visible = false;
            PanelRegistroProyecto.Visible = true;
           
        }

        protected void BtnRegresarPro_Click(object sender, EventArgs e)
        {//de nuevo proyecto regresar a listado de proyecto
            PanelProyecto.Visible = true;
            PanelRegistroProyecto.Visible = false;
        }

        protected void BtnNuevoEntregable_Click(object sender, EventArgs e)
        {//nuevo registro de entregable
            PanelEntregable.Visible = true;
            PanelListaEntregable.Visible = false;
        }

        protected void BtnRegresarProyec_Click(object sender, EventArgs e)
        {//lista de entregable regresar a lista proyecto
            PanelListaEntregable.Visible = false;
            PanelProyecto.Visible = true;
        }

        protected void BtnNuevaPasantia_Click(object sender, EventArgs e)
        {//de lista pasantia a nuevo registro pasantia
            LimpiarDatosPasantia();
            PanelPasantia.Visible = true;
            PanelListadoPasantia.Visible = false;
        }

        protected void BtnRegresarListaPasantia_Click(object sender, EventArgs e)
        {//de nuevo registro pasantia a listado pasantia
            PanelPasantia.Visible = false;
            PanelListadoPasantia.Visible = true;
        }

        protected void LimpiarDatosProyecto()
        {
           TxtIdProyecto.Text = "0";
           TxtContrato.Text= "";
           TxtDescProyecto.Text= "";
           TxtDuracionC.Text= "";
           TxtTituloProyecto.Text = "";
           TxtFechIniCont.Text = "";
           TxtMontoPro.Text = "";
    
        }

        protected void LimpiarDatosPasantia()
        {
            TxtIdConsultoria.Text = "0";
            TxtTituloPasantia.Text = "";
            TxtNombEva.Text = "";
            TxtEmailEva.Text = "";
            FillCboAreaPasantia();
            TxtDescPasantia.Text = "";
            TxtFechInicio.Text = "";
            TxtDuracion.Text = "";
            TxtDe.Text = "";
            TxtA.Text = "";
            TxtEdadDe.Text = "";
            TxtEdadA.Text = "";
            TxtCantVacantes.Text = "";
            TxtSucursal.Text = "";
            TxtDireccion.Text = "";
            TxtIDPasantia.Text = "0";
            FillGVNivelEducativo();
            FillGVHabilidad();
            FillGVDestreza();
        }

        protected void BtnGuardarObservacion_Click(object sender, EventArgs e)
        {
            try
            {
                
                    CConsultoriaEntregableAp objAprobarEntregable = new CConsultoriaEntregableAp(_DataSistema.ConexionBaseDato);
                    objResultado = objAprobarEntregable.Actualizacion(Convert.ToInt32(TxtIdConsulEntrega.Text), Convert.ToInt32(TxtIdProyecto.Text), TxtNombreEntregable.Text,
                        TxtDescripcion.Text, Convert.ToDateTime(TxtFechaEntregaEntregable.Text), TxtDuracionEntregable.Text, Convert.ToChar(CboEstadoEntregable.SelectedValue), "",
                        TxtObservEntregable.Text, TxtIdAspirante.Text, _DataSistema.Cusuario, TipoActualizacion.Actualizar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVEntregable();
                    }
                    if (objResultado.CodigoError == 0)
                    {
                        Consultar();
                        DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPProyecto);
                        PanelDetalleEntregable.Visible = false;
                        PanelAspirantesE.Visible = true;
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPProyecto);
                    }
                
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPProyecto);
            }
        }

        protected void FillDatosEmpresa()
        {
            CEmpresa objEmpresa = new CEmpresa(_DataSistema.ConexionBaseDato);
            dvEmpresa = new DataView(objEmpresa.Detalle(0, TxtEmpresa.Text, TxtNombreContact.Text, TxtEmailC.Text, TxtTelC.Text, _DataSistema.Cusuario,
                TxtTelEmpresa.Text, TxtDirEmpresa.Text, 0, 0,
            TxtNombRepre.Text, TxtEmailRep.Text, TxtNitRep.Text, TxtDuiRep.Text, 0, _DataSistema.Cusuario, _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 2).TB_EMPRESA);
            if (dvEmpresa.Count > 0)
            {
                TxtIDEmpresa.Text = dvEmpresa.Table.Rows[0]["ID"].ToString();
                LblInfoEmp.Text = LblInfoEmp.Text.Replace("{{ds_nombre_empresa}}",dvEmpresa.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString());
                LblInfoEmp.Text = LblInfoEmp.Text.Replace("{{ds_nombre_contacto}}", dvEmpresa.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString());
                LblInfoEmp.Text = LblInfoEmp.Text.Replace("{{ds_telefono_contacto}}", dvEmpresa.Table.Rows[0]["DS_TELEFONO_CONTACTO"].ToString());
                LblInfoEmp.Text = LblInfoEmp.Text.Replace("{{ds_direccion_empresa}}", dvEmpresa.Table.Rows[0]["DS_DIRECCION_EMPRESA"].ToString());
            }
            else
            {
                LblInfoEmp.Text = "No existe Empresa registrada para este usuario";
            }
        }

        protected void BtnGuardarEncuesta_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(TxtIDEmpresa.Text) > 0)
            {
                try
                {
                    CEncuestaRendimientoAspirante objRendimientoAspirante = new CEncuestaRendimientoAspirante(_DataSistema.ConexionBaseDato);
                    objResultado = objRendimientoAspirante.Actualizacion(0, Convert.ToInt32(TxtIDEmpresa.Text),
                        TxtPregunta1.Text, TxtPregunta2.Text, TxtPregunta3.Text, TxtPregunta4.Text, TxtPregunta5.Text, TxtPregunta6.Text,
                        TxtPregunta7.Text, TxtPregunta8.Text, TxtPregunta9.Text, _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        Consultar();
                        DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPEncuestaDes);
						dvEncuestaRendimiento = new DataView(objRendimientoAspirante.Detalle(0, Convert.ToInt32(TxtIDEmpresa.Text), "", "",
                            "", "", "", "", "", "", "", _DataSistema.Cusuario, DateTime.Now, _DataSistema.Cusuario, DateTime.Now, 3).TB_ENCUESTA_EVALUACION_RENDIMIENTO_ASPIRANTE);
                        if (dvEncuestaRendimiento.Count > 0) {
                            TxtIdEvaRendimiento.Text = dvEncuestaRendimiento.Table.Rows[0]["ID"].ToString();
                        }
                        CargarReporteDesempeñoLaboral();							
                        LimpiarEncuesta();
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPEncuestaDes);
                    }

                }
                catch (Exception ex)
                {
                    DespliegaMensajeUpdatePanel(ex.Message, UPEncuestaDes);
                }
            }
            else
            {
                DespliegaMensajeUpdatePanel("No existe Empresa registrada para este usuario", UPEncuestaDes);
            }
        }
        public void LimpiarEncuesta()
        {
            TxtIDEmpresa.Text = "0";
            TxtPregunta1.Text = "";
            TxtPregunta2.Text = "";
            TxtPregunta3.Text = "";
            TxtPregunta4.Text = "";
            TxtPregunta5.Text = "";
            TxtPregunta6.Text = "";
            TxtPregunta7.Text = "";
            TxtPregunta8.Text = "";
            TxtPregunta9.Text = "";
        }

        protected void GVPasantiaAsignacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Id = GVPasantiaAsignacion.SelectedIndex;
            TxtIDPasantia.Text = GVPasantiaAsignacion.DataKeys[Id].Value.ToString();
            FillPasantiaActividad();
            PanelActividadAspiranteEmpresa.Visible = false;
            PanelPasantiaAct.Visible = true;
        }

        protected void FillPasantiaActividad()
        {
            CPasantiaActividad objPasantiaActividad = new CPasantiaActividad(_DataSistema.ConexionBaseDato);
            dvPasantiaActividad = new DataView(objPasantiaActividad.Detalle(0,Convert.ToInt32(TxtIDPasantia.Text),"","",DateTime.Now,"",_DataSistema.Cusuario,DateTime.Now,_DataSistema.Cusuario,DateTime.Now,2).TB_PASANTIA_ACTIVIDAD);
           
            GVPasantiaActividad.DataSource = dvPasantiaActividad;
            GVPasantiaActividad.DataBind();
        }

        protected void BtnRegresarActividadPasantia_Click(object sender, EventArgs e)
        {
            PanelActividadAspiranteEmpresa.Visible = true;
            PanelPasantiaAct.Visible = false;
            PanelListaAspirante.Visible = false;
        }

        protected void GVPasantiaActividad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Id = GVPasantiaActividad.SelectedIndex;
            TxtIDActividad.Text = GVPasantiaActividad.DataKeys[Id].Value.ToString();
            FillGVListaAspirante();
            PanelPasantiaAct.Visible = false;
            PanelListaAspirante.Visible = true;
        }

        protected void FillGVListaAspirante()
        {
            CPasantiaActividad objPasantiaActividad = new CPasantiaActividad(_DataSistema.ConexionBaseDato);
            dvPasantiaActividad = new DataView(objPasantiaActividad.Detalle(Convert.ToInt32(TxtIDActividad.Text),
            Convert.ToInt32(TxtIDPasantia.Text), "", "", DateTime.Now, "", "", DateTime.Now, "", DateTime.Now, 4).TB_PASANTIA_ACTIVIDAD);
            GVListaAspirante.DataSource = dvPasantiaActividad;
            GVListaAspirante.DataBind();
        }

        protected void BtnAtrasListaAspirante_Click(object sender, EventArgs e)
        {
            PanelActividadAspiranteEmpresa.Visible = false;
            PanelPasantiaAct.Visible = true;
            PanelListaAspirante.Visible = false;
        }

        protected void GVListaAspirante_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Id = GVListaAspirante.SelectedIndex;
            TxtIdAspirante.Text = Convert.ToString(GVListaAspirante.DataKeys[Id].Values[0]);
            AddActividadAspirante();
        }

        protected void AddActividadAspirante()
        {
            CActividadAspirante objActividadAspirante = new CActividadAspirante(_DataSistema.ConexionBaseDato);
             objExiste = new DataView(objActividadAspirante.Detalle(0, TxtIdAspirante.Text, Convert.ToInt32(TxtIDActividad.Text), "", 'x', "", "", _DataSistema.Cusuario, DateTime.Now, _DataSistema.Cusuario, DateTime.Now, 8).TB_ACTIVIDAD_ASPIRANTE);
            try
            {

                if (objExiste.Count > 0)
                {
                    DespliegaMensaje("Usuario ya se encuentra asignado a esta actividad");
                }
                else
                {
                    objResultado = objActividadAspirante.Actualizacion(0, TxtIdAspirante.Text, Convert.ToInt32(TxtIDActividad.Text), "", 'A', "", "",DateTime.Today,_DataSistema.Cusuario, TipoActualizacion.Adicionar);
                    if (objResultado.CodigoError == 0)
                    {
                        FillGVListaAspirante();
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPDatoActividadAspirante);
                        //UPDatoActividadAspirante
                    }
                }
            }
            catch (Exception e) {
                DespliegaMensajeUpdatePanel(e.Message, UPDatoActividadAspirante);
            }

        }
		protected void CargarReporteDesempeñoLaboral()
        {
            DataTable dl;
            //cargar los datos de la empresa y pasante para el informe final pasantia

            CEmpresa objEmpresa = new CEmpresa(_DataSistema.ConexionBaseDato);
            dvEmpresa = new DataView(objEmpresa.Detalle(0,"", "", "", "", _DataSistema.Cusuario,
                "", "", 0, 0,
            "", "", "", "", 0, _DataSistema.Cusuario, _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 2).TB_EMPRESA);

            dl = dvEmpresa.ToTable();
            RVDesempeñoLaboral.Visible = true;
            RVDesempeñoLaboral.LocalReport.ReportPath = "EMP/RptDesempeñoLaboralPasante.rdlc";
            RVDesempeñoLaboral.LocalReport.DataSources.Clear();
            RVDesempeñoLaboral.LocalReport.DataSources.Add(new ReportDataSource("TB_EMPRESA", dl));

            DataTable dl2;
            CEncuestaRendimientoAspirante objRendimiento = new CEncuestaRendimientoAspirante(_DataSistema.ConexionBaseDato);

                dvRendimiento = new DataView(objRendimiento.Detalle(Convert.ToInt32(TxtIdEvaRendimiento.Text), Convert.ToInt32(TxtIDEmpresa.Text), TxtPregunta1.Text, TxtPregunta2.Text, TxtPregunta3.Text,
                TxtPregunta4.Text, TxtPregunta5.Text, TxtPregunta6.Text, TxtPregunta7.Text, TxtPregunta8.Text, TxtPregunta9.Text, ""
                 , DateTime.Today, "", DateTime.Today, 2).TB_ENCUESTA_EVALUACION_RENDIMIENTO_ASPIRANTE);
                dl2 = dvRendimiento.ToTable();
                RVDesempeñoLaboral.LocalReport.DataSources.Add(new ReportDataSource("TB_ENCUESTA_EVALUACION_RENDIMIENTO_ASPIRANTE", dl2));

        }

        protected void GVPasantia_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ListaAspirante") {

                int Id = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GVPasantia.Rows[Id];
                TxtIDPasantia.Text = GVPasantia.DataKeys[Id].Value.ToString();
                FillGVAceptacionAspirante();
                PanelListadoPasantia.Visible = false;
                PanelAceptacionAspirante.Visible = true;
            }
        }

        protected void FillGVAceptacionAspirante()
        {
            CAceptacionPasantia objAceptacionAspirante = new CAceptacionPasantia(_DataSistema.ConexionBaseDato);
            dvAceptacionAspirante = new DataView(objAceptacionAspirante.Detalle(0, "", Convert.ToInt32(TxtIDPasantia.Text), "", 'x', 'x', "",
                _DataSistema.Cusuario, DateTime.Now, _DataSistema.Cusuario, DateTime.Now, 4).TB_ACEPTACION_PASANTIA);
            if (dvAceptacionAspirante.Count <= 0)
            {
                lblAceptacionAspirante.Text = "NO EXISTEN ASPIRANTES PENDIENTES DE ACEPTACION PARA ESTA PASANTIA";
                lblAceptacionAspirante.Visible = true;
            }
            else {
                lblAceptacionAspirante.Visible = false;
                GVAceptacionAspirante.DataSource = dvAceptacionAspirante;
                GVAceptacionAspirante.DataBind();
            }

        }

        protected void GVAceptacionAspirante_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PerfilAspirante")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GVAceptacionAspirante.Rows[Id];
                TxtIdAspirante.Text = GVAceptacionAspirante.DataKeys[Id].Value.ToString();
                FillDatosAspirante();
                PanelAceptacionAspirante.Visible = false;
                CargarReporte2();
                PanelInfoAspirante.Visible = true;
            }
            else if (e.CommandName == "AsignarAspirante")
            {
                int Id = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GVAceptacionAspirante.Rows[Id];
                TxtIdAspirante.Text = GVAceptacionAspirante.DataKeys[Id].Value.ToString();

            }
        }

        protected void FillDatosAspirante()
        {
            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            dvAspirante = new DataView(objAspirante.Detalle(TxtIdAspirante.Text, "", "", DateTime.Now, 'x', "", "", "", "", "", "", 'x', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Now, "", DateTime.Now, 1).TB_ASPIRANTE);
            if (dvAspirante.Count > 0) {
                /* CARGA DE DATOS DE EL PRIMER REGISTRO */
                TxtNombreAsp.Text = dvAspirante.Table.Rows[0]["DS_NOMBRE"].ToString();
                TxtApellidoAsp.Text = dvAspirante.Table.Rows[0]["DS_APELLIDO"].ToString();
                TxtFechNac.Text = dvAspirante.Table.Rows[0]["FECH_NACIMIENTO"].ToString();
                TxtNitAsp.Text = dvAspirante.Table.Rows[0]["DS_NIT"].ToString();
                TxtTipoAspirante.Text = dvAspirante.Table.Rows[0]["DS_TIPO_ASPIRANTE"].ToString();
                TxtEmail.Text = dvAspirante.Table.Rows[0]["DS_EMAIL"].ToString();


                /* CARGA DE DATOS DE EL POSTERIORES REGISTROS */

                TxtTelCasa.Text = dvAspirante.Table.Rows[0]["DS_TELEFONO_CASA"].ToString();
                TxtTelCel.Text = dvAspirante.Table.Rows[0]["DS_TELEFONO_CELULAR"].ToString();
                TxtDui.Text = dvAspirante.Table.Rows[0]["DS_DUI"].ToString();
                RadioSexo.SelectedValue = dvAspirante.Table.Rows[0]["DS_SEXO"].ToString();
                TxtDiscapacidad1.Text = dvAspirante.Table.Rows[0]["DS_DISCAPACIDAD1"].ToString();
                TxtDiscapacidad2.Text = dvAspirante.Table.Rows[0]["DS_DISCAPACIDAD2"].ToString();
                TxtDiscapacidad3.Text = dvAspirante.Table.Rows[0]["DS_DISCAPACIDAD3"].ToString();
                TxtDireccionAsp.Text = dvAspirante.Table.Rows[0]["DS_DIRECCION"].ToString();

            }
            
        }

        
        protected void CargarReporte2()
        {//reporte de aspirante boton informe completo
            DataTable dt;

            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvAspirante = new DataView(objAspirante.Detalle(TxtIdAspirante.Text, "", "", DateTime.Today, 'X',
         "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Today, "", DateTime.Today, 4).TB_ASPIRANTE);

            dt = dvAspirante.ToTable();
            RVFichaAspirante.Visible = true;
            RVFichaAspirante.LocalReport.ReportPath = "ASP/RptFichaAspirante.rdlc";
            RVFichaAspirante.LocalReport.DataSources.Clear();
            RVFichaAspirante.LocalReport.DataSources.Add(new ReportDataSource("TB_ASPIRANTE", dt));

            DataTable dt2;
            CEscolaridadAspirante objEscolaridad = new CEscolaridadAspirante(_DataSistema.ConexionBaseDato);
            DataView dvEscolaridad = new DataView(objEscolaridad.Detalle(0, TxtIdAspirante.Text, 0, 0, 0, 0, "", "", 0, 0, "", DateTime.Now,
                "", DateTime.Now, 3).TB_ESCOLARIDAD_ASPIRANTE);
            dt2 = dvEscolaridad.ToTable();
            RVFichaAspirante.LocalReport.DataSources.Add(new ReportDataSource("TB_ESCOLARIDAD_ASPIRANTE", dt2));

            DataTable dt3;
            CHabilidadAspirante objHabilidad = new CHabilidadAspirante(_DataSistema.ConexionBaseDato);
            DataView dvHabilidad = new DataView(objHabilidad.Detalle(0, 0, TxtIdAspirante.Text, 0, 0, "",
                DateTime.Now, "", DateTime.Now, 2).TB_HABILIDAD_ASPIRANTE);
            dt3 = dvHabilidad.ToTable();
            RVFichaAspirante.LocalReport.DataSources.Add(new ReportDataSource("TB_HABILIDAD_ASPIRANTE", dt3));

            DataTable dt4;
            CDestrezaAspirante objDestreza = new CDestrezaAspirante(_DataSistema.ConexionBaseDato);
            DataView dvDestreza = new DataView(objDestreza.Detalle(0, 0, TxtIdAspirante.Text, "",
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

        protected void BtnFinalizarPasantia_Click(object sender, EventArgs e)
        {//boton finalizar pasantia

           
            CPasantia objPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            dvPasantia = new DataView(objPasantia.Detalle(Convert.ToInt32(TxtIDPasantia.Text), "", "", 0, 0, "", "", DateTime.Now,
             "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Now, "", DateTime.Now, 1).TB_PASANTIA);
            try
            {
               
                    if (dvPasantia.Count > 0)
                    {
                        objResultado = objPasantia.Actualizacion(Convert.ToInt32(TxtIDPasantia.Text), TxtNombEva.Text, TxtEmailEva.Text
                                , Convert.ToInt32(TxtIDEmpresa.Text), Convert.ToInt32(CboAreaPasantia.SelectedValue), TxtTituloPasantia.Text, TxtDescPasantia.Text, Convert.ToDateTime(TxtFechInicio.Text),
                  TxtDuracion.Text, TxtDe.Text, TxtA.Text, 'F', Convert.ToInt32(CboDias1.SelectedValue), Convert.ToInt32(CboDias2.SelectedValue), Convert.ToInt32(TxtEdadDe.Text), Convert.ToInt32(TxtEdadA.Text), Convert.ToInt32(TxtCantVacantes.Text),
                     TxtSucursal.Text, TxtDireccion.Text, _DataSistema.Cusuario, TipoActualizacion.Actualizar);

                    }
                 if (objResultado.CodigoError == 0)
                    {
                        Consultar();
                        DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPPasantia);
                        PanelPasantia.Visible = false;
                        PanelListadoPasantia.Visible = true;
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPPasantia);
                    }
                }
            
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPPasantia);
            }
        }

        }
       
    }