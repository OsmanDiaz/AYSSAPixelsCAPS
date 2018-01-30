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
            dvConsultoria, dvEntregable, dvCategoriaEscolaridad, dvPasantiaActividad;
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

        public void Consultar() {
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
            TxtNombRepre.Text, TxtEmailRep.Text, TxtNitRep.Text, TxtDuiRep.Text,0, _DataSistema.Cusuario, _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 2).TB_EMPRESA);
            if (dvEmpresa.Count > 0)
            {
                TxtIDEmpresa.Text = dvEmpresa.Table.Rows[0]["ID"].ToString();
                TxtEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString();
                LblEmpresa.Text = TxtEmpresa.Text;
                CboActEcono.SelectedValue=dvEmpresa.Table.Rows[0]["ID_ACT_ECO"].ToString();
                TxtNombreContact.Text=dvEmpresa.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString();
                TxtEmailC.Text=dvEmpresa.Table.Rows[0]["DS_EMAIL_CONTACTO"].ToString();
                TxtTelC.Text=dvEmpresa.Table.Rows[0]["DS_TELEFONO_CONTACTO"].ToString();
                TxtNitEmpresa.Text=dvEmpresa.Table.Rows[0]["DS_NIT_EMPRESA"].ToString();
                TxtTelEmpresa.Text =dvEmpresa.Table.Rows[0]["DS_TELEFONO_EMPRESA"].ToString();
                TxtDirEmpresa.Text =dvEmpresa.Table.Rows[0]["DS_DIRECCION_EMPRESA"].ToString();
                CboDepartamento.SelectedValue =dvEmpresa.Table.Rows[0]["ID_DEPARTAMENTO"].ToString();
                CboMunicipio.SelectedValue =dvEmpresa.Table.Rows[0]["ID_MUNICIPIO"].ToString();
                TxtNombRepre.Text =dvEmpresa.Table.Rows[0]["DS_NOMBRE_REPRESENTANTE"].ToString();
                TxtEmailRep.Text =dvEmpresa.Table.Rows[0]["DS_EMAIL_REPRESENTATE"].ToString();
                TxtNitRep.Text =dvEmpresa.Table.Rows[0]["DS_NIT_REPRESENTANTE"].ToString();
                TxtDuiRep.Text =dvEmpresa.Table.Rows[0]["DS_DUI_REPRESENTANTE"].ToString();     
            }
        }

        protected void FillCboActEcono() {
            CActividadEconomica objActividadEconomica = new CActividadEconomica(_DataSistema.ConexionBaseDato);
            dvActividadEconomica = new DataView(objActividadEconomica.Detalle(0, "", "", DateTime.Now, "", DateTime.Now, 0).TBC_ACTIVIDAD_ECONOMICA);

            CboActEcono.DataSource = dvActividadEconomica;
            CboActEcono.DataBind();
        }

        protected void FillCboDepartamento()
        {
            CDepartamento objDepartamento = new CDepartamento(_DataSistema.ConexionBaseDato);
            dvDepartamento = new DataView(objDepartamento.Detalle(0,"SV", "", "", DateTime.Now, "", DateTime.Now, 2).TBC_DEPARTAMENTO);

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
            dvDestreza = new DataView(objDestrezaPasantia.Detalle(0, Convert.ToInt32(TxtIDPasantia.Text),0, "", DateTime.Now, "", DateTime.Now, 2).TB_DESTREZA_PASANTIA);

            GVDestreza.DataSource = dvDestreza;
            GVDestreza.DataBind();
        }

        protected void FillGVPasantia()
        {
            CPasantia objPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            dvPasantia = new DataView(objPasantia.Detalle(0, "", "", Convert.ToInt32(TxtIDEmpresa.Text), 0, "", "", DateTime.Now,
            "", "", "", 'A', 0, 0, 0, 0, 0,"",  "", "", DateTime.Now, "", DateTime.Now, 3).TB_PASANTIA);

            GVPasantia.DataSource = dvPasantia;
            GVPasantia.DataBind();
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
                    objResultado = objPasantia.Actualizacion(Convert.ToInt32(TxtIDPasantia.Text), TxtNombEva.Text , TxtEmailEva.Text
                        , Convert.ToInt32(TxtIDEmpresa.Text), Convert.ToInt32(CboAreaPasantia.SelectedValue), TxtTituloPasantia.Text, TxtDescPasantia.Text, Convert.ToDateTime(TxtFechInicio.Text),
          TxtDuracion.Text, TxtDe.Text, TxtA.Text, Convert.ToChar(CboEstadoPasantia.SelectedValue), Convert.ToInt32(CboDias1.SelectedValue), Convert.ToInt32(CboDias2.SelectedValue), Convert.ToInt32(TxtEdadDe.Text), Convert.ToInt32(TxtEdadA.Text), Convert.ToInt32(TxtCantVacantes.Text),
             TxtSucursal.Text, TxtDireccion.Text, _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                }
                else
                {
                    objResultado = objPasantia.Actualizacion(Convert.ToInt32(TxtIDPasantia.Text), TxtNombEva.Text, TxtEmailEva.Text
                        , Convert.ToInt32(TxtIDEmpresa.Text), Convert.ToInt32(CboAreaPasantia.SelectedValue),TxtTituloPasantia.Text, TxtDescPasantia.Text, Convert.ToDateTime(TxtFechInicio.Text),
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
            dvPasantia = new DataView(objPasantia.Detalle(Convert.ToInt32(TxtIDPasantia.Text), "", "", 0, 0, "","", DateTime.Now,
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
                TxtFechInicio.Text = (dvPasantia.Table.Rows[0]["FECH_INICIO_PASANTIA"].ToString()).Substring(0,10);
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
                else {
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
            dvEscolaridadPasantia = new DataView(objEscolaridadPasantia.Detalle(0,Convert.ToInt32(TxtIDPasantia.Text),0, 0, 0, "", DateTime.Now, "", DateTime.Now, 2).TB_ESCOLARIDAD_PASANTIA);

            GVNivelEducativo.DataSource = dvEscolaridadPasantia;
            GVNivelEducativo.DataBind();
        }

        protected void BtnProyectoGuardar_Click(object sender, EventArgs e)
        {
            CConsultoria objConsultoria = new CConsultoria(_DataSistema.ConexionBaseDato);
            dvConsultoria = new DataView(objConsultoria.Detalle(Convert.ToInt32(TxtIdProyecto.Text), TxtContrato.Text,"", TxtDescProyecto.Text, DateTime.Now, 0, TxtDuracionC.Text,
               Convert.ToChar(CboEstadoPro.SelectedValue),Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 1).TB_PASANTIA);

            try
            {
                  double Monto = Convert.ToDouble(TxtMontoPro.Text);
                if (dvConsultoria.Count > 0)
                {
                    objResultado = objConsultoria.Actualizacion(Convert.ToInt32(TxtIdProyecto.Text), TxtContrato.Text,TxtTituloProyecto.Text, TxtDescProyecto.Text, DateTime.Now, Monto, TxtDuracionC.Text,
               Convert.ToChar(CboEstadoPro.SelectedValue),Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, TipoActualizacion.Actualizar);
                }
                else
                {
                    objResultado = objConsultoria.Actualizacion(Convert.ToInt32(TxtIdProyecto.Text), TxtContrato.Text, TxtTituloProyecto.Text, TxtDescProyecto.Text, DateTime.Now, Monto, TxtDuracionC.Text,
               Convert.ToChar(CboEstadoPro.SelectedValue),Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                    if (objResultado.CodigoError == 0)
                    {
                        TxtIdProyecto.Text = Convert.ToString(objResultado.CodigoAuxiliar);
                        Consultar();
                        DespliegaMensajeUpdatePanel("Registro Guardado Correctamente", UPProyecto);
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
            dvConsultoria = new DataView(objConsultoria.Detalle(0, TxtContrato.Text,"", TxtDescProyecto.Text, DateTime.Now, 0, TxtDuracionC.Text,
                Convert.ToChar(CboEstadoPro.SelectedValue), Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 2).TB_CONSULTORIA);

            GVContrato.DataSource = dvConsultoria;
            GVContrato.DataBind();
        }

        protected void GVContrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string Id = GVContrato.SelectedRow.Cells[1].Text;
                TxtIdProyecto.Text = Id;
                FillCamposProyecto();
                FillGVEntregable();
                PanelProyecto.Visible = false;
                PanelEntregable.Visible = true;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPProyecto);
            }
        }

        protected void BtnCancelarEntregable_Click(object sender, EventArgs e)
        {
            PanelProyecto.Visible = true;
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
                        'P', "", "", ""
                    , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVEntregable();
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
            dvConsultoria = new DataView(objConsultoria.Detalle(Convert.ToInt32(TxtIdProyecto.Text), TxtContrato.Text,"", TxtDescProyecto.Text, DateTime.Now, 0, TxtDuracionC.Text,
                Convert.ToChar(CboEstadoPro.SelectedValue), Convert.ToInt32(TxtIDEmpresa.Text), _DataSistema.Cusuario, DateTime.Now, "", DateTime.Now, 3).TB_CONSULTORIA);

            if (dvConsultoria.Count > 0)
            {
                TxtTituloProyecto.Text = dvConsultoria.Table.Rows[0]["DS_NOMBRE_CONSULTORIA"].ToString();
                LblProyecto.Text = TxtTituloProyecto.Text;
                TxtContrato.Text = dvConsultoria.Table.Rows[0]["DS_NUMERO_CONTRATO"].ToString();
                TxtDuracionC.Text = dvConsultoria.Table.Rows[0]["DS_CONTRATO_DURACION"].ToString();
                TxtDescProyecto.Text = dvConsultoria.Table.Rows[0]["DS_DESCRIPCION"].ToString();
                TxtFechIniCont.Text = (dvConsultoria.Table.Rows[0]["FECH_INICIO_CONTRATO"].ToString()).Substring(0,10);
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
         {   CPasantiaActividad objPasantiaActividad = new CPasantiaActividad(_DataSistema.ConexionBaseDato);
            objResultado = objPasantiaActividad.Actualizacion(0, Convert.ToInt32(TxtIDPasantia.Text), TxtActividad.Text,
           TxtDescripActividad.Text,Convert.ToDateTime(TxtFechaEntregaA.Text),    TxtDuracionA.Text
            , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

            if (objResultado.CodigoError == 0)
            {
                FillGVActividades();
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
                else {
                    DespliegaMensajeUpdatePanel("No se ha seleccionado una pasantia para agregar Actividad", UPPasantia);
                }

        }


        protected void FillGVActividades()
        {
            CPasantiaActividad objPasantiaActividad = new CPasantiaActividad(_DataSistema.ConexionBaseDato);
            dvPasantiaActividad = new DataView(objPasantiaActividad.Detalle(0, Convert.ToInt32(TxtIDPasantia.Text), TxtActividad.Text,
           TxtDescripActividad.Text, Convert.ToDateTime(TxtFechaEntregaA.Text), TxtDuracionA.Text, "", DateTime.Now, "", DateTime.Now, 2).TB_PASANTIA_ACTIVIDAD);

            GVActividades.DataSource = dvPasantiaActividad;
            GVActividades.DataBind();
        }


    }
}