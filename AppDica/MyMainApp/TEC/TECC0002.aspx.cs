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

namespace MyMainApp.TEC
{
    public partial class TECC0002 : FormaSISWeb, IAcciones
    {
        private DataView dvEmpresa, dvPasantia, dvEscolaridad, dvHabilidad, dvConsultoria,
            dvEntregable, dvAsignacionAspirante, dvPasantiaAspirante, dvGeneral, dvListaGeneral, dvEncuesta;
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
            FillGVListaPasantia();
            FillInfoProyecto();
            FillInfoGeneral();
            FillGVResultadoPreg1();
            FillGVResultadoPreg2();
            FillGVResultadoPreg3();
            FillGVResultadoPreg4();
            FillGVResultadoPreg5();
            FillGVResultadoPreg6();
        }


        public void Adicionar() { }
        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }



        private void FillInfoEmpresa()
        {
            CEmpresa objEmpresa = new CEmpresa(_DataSistema.ConexionBaseDato);
            dvEmpresa = new DataView(objEmpresa.Detalle(Convert.ToInt32(TxtIdEmpresa.Text), _DataSistema.Cusuario, "", "", "", "", "", "", 0, 0, "", "", "", "", 0, "", _DataSistema.Cusuario, DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 0).TB_EMPRESA);
            if (dvEmpresa.Count > 0) {

                TxtNEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString();
                TxtNContacto.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString();
                TxtEContacto.Text = dvEmpresa.Table.Rows[0]["DS_EMAIL_CONTACTO"].ToString();
                TxtTelContacto.Text = dvEmpresa.Table.Rows[0]["DS_TELEFONO_CONTACTO"].ToString();
                TxtNitEmpresa1.Text = dvEmpresa.Table.Rows[0]["DS_NIT_EMPRESA"].ToString();
                TxtTelEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_TELEFONO_EMPRESA"].ToString();
                TxtDirEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_DIRECCION_EMPRESA"].ToString();
                TxtNRepresentante.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString();
                TxtERepresentante.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_REPRESENTANTE"].ToString();
                TxtNitRepresentante.Text = dvEmpresa.Table.Rows[0]["DS_NIT_REPRESENTANTE"].ToString();
                TxtDuiRepresentante.Text = dvEmpresa.Table.Rows[0]["DS_DUI_REPRESENTANTE"].ToString();
            }
        }



        protected void GVListaPasantia_SelectedIndexChaged(object sender, EventArgs e)
        {
            int Id = GVListaPasantia.SelectedIndex;

            TxtIdPasantia.Text = GVListaPasantia.DataKeys[Id].Value.ToString();
            FillInfoPasantia();
            FillGVAsignacionAspirantes();
            FillGVAspirantes();
            PanelListadoPasantia.Visible = false;
            PanelListadoAspPas.Visible = true;
        }


        private void FillGVListaPasantia()
        {
            CPasantia objPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            dvPasantia = new DataView(objPasantia.Detalle(0, "", "", 0, 0, "", "", DateTime.Today, "", "", "", 'X', 0, 0, 0, 0, 0, "", "", "", DateTime.Today, "", DateTime.Today, 4).TB_PASANTIA);
            GVListaPasantia.DataSource = dvPasantia;
            GVListaPasantia.DataBind();
        }

        private void FillInfoPasantia()
        {
            CPasantia objInfoPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            dvPasantia = new DataView(objInfoPasantia.Detalle(Convert.ToInt32(TxtIdPasantia.Text),"","",0,0,"","",DateTime.Today,"","","",'x',0,0,0,0,0,"","","",DateTime.Today,"",DateTime.Today,5).TB_PASANTIA);
            if (dvPasantia.Count > 0) {
                TxtNombreEmpresaPasantia.Text = dvPasantia.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString();
                TxtNombrePas.Text = dvPasantia.Table.Rows[0]["NOMBRE_PASANTIA"].ToString();
                TxtArea.Text = dvPasantia.Table.Rows[0]["DS_AREA"].ToString();
                TxtSucursalPasantia.Text = dvPasantia.Table.Rows[0]["DS_SUCURSAL"].ToString();
                TxtVacantes.Text = dvPasantia.Table.Rows[0]["NM_VACANTES"].ToString();
                TxtDescPasantia.Text = dvPasantia.Table.Rows[0]["DS_PASANTIA"].ToString();
            }
            FillCamposEscolaridad();
        }

        private void FillCamposEscolaridad()
        {
            CEscolaridadPasantia objEscolaridadPasantia = new CEscolaridadPasantia(_DataSistema.ConexionBaseDato);
            dvEscolaridad = new DataView(objEscolaridadPasantia.Detalle(0,Convert.ToInt32(TxtIdPasantia.Text),0,0,0,"",DateTime.Today,"",DateTime.Today,2).TB_ESCOLARIDAD_PASANTIA);
            if (dvEscolaridad.Count > 0) {
                TxtEscolaridad.Text = dvEscolaridad.Table.Rows[0]["DS_ESCOLARIDAD"].ToString();
                TxtEstudio.Text = dvEscolaridad.Table.Rows[0]["DS_ANIO"].ToString();
                TxtCarrera.Text = dvEscolaridad.Table.Rows[0]["DS_CARRERA"].ToString();
            }
            FillGVListaHabilidades();
        }

        private void FillGVListaHabilidades()
        {
            CHabilidadPasantia objHabilidadPasantia = new CHabilidadPasantia(_DataSistema.ConexionBaseDato);
            dvHabilidad = new DataView(objHabilidadPasantia.Detalle(0, Convert.ToInt32(TxtIdPasantia.Text), 0, 0, "", DateTime.Today, "", DateTime.Today, 2).TB_PASANTIA_HABILIDAD);
            GVHabilidadesPasantia.DataSource = dvHabilidad;
            GVHabilidadesPasantia.DataBind();
        }

        protected void BtnRegresarPasantia_Click(object sender, EventArgs e)
        {
            PanelListadoPasantia.Visible = true;
            PanelListadoAspPas.Visible = false;
        }



        private void FillInfoProyecto()
        {
            CConsultoria objConsultoria = new CConsultoria(_DataSistema.ConexionBaseDato);
            dvConsultoria = new DataView(objConsultoria.Detalle(0, "", "", "", DateTime.Today, 0, "", 'x', 0, "", DateTime.Today, "", DateTime.Today, 5).TB_CONSULTORIA);
            if(dvConsultoria.Count >0){
                TxtIdConsultoria.Text = dvConsultoria.Table.Rows[0]["ID"].ToString();
            }
        }



        private void FillInfoEntregable()
        {
            CCProyectoPasantia objConsultoriaEntregable = new CCProyectoPasantia(_DataSistema.ConexionBaseDato);
            dvEntregable = new DataView(objConsultoriaEntregable.Detalle(0,0,Convert.ToInt32(TxtIdEmpresa.Text),"","",DateTime.Today,"",'x',"","","","",DateTime.Today,"",DateTime.Today,1).TB_CONSULTORIA_ENTREGABLE);
            if(dvEntregable.Count > 0){
                TxtIdEntregable.Text = dvEntregable.Table.Rows[0]["ID"].ToString();
            }
            GVEntregables.DataSource = dvEntregable;
            GVEntregables.DataBind();
        }

        protected void GVListaEntregables_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GVAsignacionAspirantes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVAsignacionAspirantes.SelectedIndex;

                string IdAspirante = GVAsignacionAspirantes.DataKeys[Id].Value.ToString();

                CAceptacionPasantia objAceptacionPasantia = new CAceptacionPasantia(_DataSistema.ConexionBaseDato);
                objResultado = objAceptacionPasantia.Actualizacion(0, IdAspirante, Convert.ToInt32(TxtIdPasantia.Text),
                  "",  'X','P',"",
                 _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                FillGVAspirantes();
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPGeneral);
            }
        }

        protected void FillGVAsignacionAspirantes()
        {
            CAsignacionAspirante objAsignacionAspirante = new CAsignacionAspirante(_DataSistema.ConexionBaseDato);
            dvAsignacionAspirante = new DataView(objAsignacionAspirante.Detalle(Convert.ToInt32(TxtIdPasantia.Text), 0).ASIGNACION_PASANTIA);

            GVAsignacionAspirantes.DataSource = dvAsignacionAspirante;
            GVAsignacionAspirantes.DataBind();
        }

        protected void FillGVAspirantes()
        {
            CPasantiaAspirante objPasantiaAspirante = new CPasantiaAspirante(_DataSistema.ConexionBaseDato);
            dvPasantiaAspirante = new DataView(objPasantiaAspirante.Detalle(0, "", Convert.ToInt32(TxtIdPasantia.Text),
            "", DateTime.Now, "", DateTime.Now, 2).TB_PASANTIA_ASPIRANTE);

            GVAspirantes.DataSource = dvPasantiaAspirante;
            GVAspirantes.DataBind();
        }

        private void FillInfoGeneral()
        {
            CCProyectoPasantia objConsultoriaEntregable = new CCProyectoPasantia(_DataSistema.ConexionBaseDato);
            dvGeneral = new DataView(objConsultoriaEntregable.Detalle(0,0,0,"","",DateTime.Today,"",'x', "", "", "","", DateTime.Today,"",DateTime.Today, 2).TB_CONSULTORIA_ENTREGABLE);
            GVListaGeneral.DataSource = dvGeneral;
            GVListaGeneral.DataBind();
        }
        protected void GVListaGeneral_SelectedIndexChaged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVListaGeneral.SelectedIndex;

                TxtIdEmpresa.Text = GVListaGeneral.DataKeys[Id].Value.ToString();
                FillInfoEmpresa();
                FillInfoEntregablePasantia();
                PanelGeneral.Visible = false;
                PanelListadoProyectoEntregable.Visible = true;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPGeneral);
            }
        }

        private void FillInfoEntregablePasantia()
        {
            CCProyectoPasantia objConsultoriaEntregable = new CCProyectoPasantia(_DataSistema.ConexionBaseDato);
            dvEntregable = new DataView(objConsultoriaEntregable.Detalle2(0, Convert.ToInt32(TxtIdConsultoria.Text), Convert.ToInt32(TxtIdEmpresa.Text), "", "", DateTime.Today, "", 'x', "", "", "", "", DateTime.Today, "", DateTime.Today, 3).TB_PROYECTO_PASANTIA);
            if (dvEntregable.Count > 0)
            {
                TxtIdEntregable.Text = dvEntregable.Table.Rows[0]["ID_CONSULTORIA"].ToString();
                TxtIdActividadAspirante.Text = dvEntregable.Table.Rows[0]["ID_CONSULTORIA_ENTREGABLE"].ToString();
            }
            GVlistaEntregab.DataSource = dvEntregable;
            GVlistaEntregab.DataBind();
        }


        protected void BtnAtrasInfoEmpre_Click(object sender, EventArgs e)
        {
            PanelListadoProyectoEntregable.Visible = true;
            PanelInfoEmpre.Visible = false;
        }

        protected void GVListaEntregables1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Id = GVlistaEntregab.SelectedIndex;

            TxtIdEntregable.Text = Convert.ToString(GVlistaEntregab.DataKeys[Id].Values[0]);
            TxtTipoEntregable.Text = Convert.ToString(GVlistaEntregab.DataKeys[Id].Values[1]);
            TxtIdActividadAspirante.Text = Convert.ToString(GVlistaEntregab.DataKeys[Id].Values[2]);
            FillEntregableInfoEstado();
            PanelListadoProyectoEntregable.Visible = false;
            PanelInfoEntregable.Visible = true;
            if (TxtTipoEntregable.Text == "PASANTIA")
            {
                PanelPasantiaActivity.Visible = true;
                PanelPEntregableActivity.Visible = false;
            }
            else if (TxtTipoEntregable.Text == "PROYECTO")
            {
                PanelPEntregableActivity.Visible = true;
                PanelPasantiaActivity.Visible = false;
            }
        }

        private void FillEntregableInfoEstado()
        {
            if (TxtTipoEntregable.Text == "PASANTIA") {
                CActividadAspirante objPasantia = new CActividadAspirante(_DataSistema.ConexionBaseDato);
                dvPasantia = new DataView(objPasantia.Detalle(0, "", Convert.ToInt32(TxtIdEntregable.Text), "", 'x', "", "", _DataSistema.Cusuario, DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 4).TB_ACTIVIDAD_ASPIRANTE);
                if (dvPasantia.Count > 0)
                {
                    TxtIdEntregable.Text = dvPasantia.Table.Rows[0]["ID_PASANTIA_ACTIVIDAD"].ToString();
                    TxtNombreEmpresa1.Text = dvPasantia.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString();
                    TxtNombreEval.Text = dvPasantia.Table.Rows[0]["DS_NOMBRE_EVAL"].ToString();
                    TxtEmailEval.Text = dvPasantia.Table.Rows[0]["DS_EMAIL_CONTACTO"].ToString();
                    TxtPasantiaName.Text = dvPasantia.Table.Rows[0]["NOMBRE_PASANTIA"].ToString();
                    TxtActividad.Text = dvPasantia.Table.Rows[0]["DS_ACTIVIDAD"].ToString();
                }
                try {
                    CActividadAspirante objPasantia2 = new CActividadAspirante(_DataSistema.ConexionBaseDato);
                    dvPasantia = null;
                    dvPasantia = new DataView(objPasantia2.Detalle1(0,"",Convert.ToInt32(TxtIdEntregable.Text),"",'X',"","","",DateTime.Today,"",DateTime.Today,5).TB_ACTIVIDAD_ASPIRANTE_MONITOREO);
                    if (dvPasantia.Count > 0) {
                        TxtIdAspirante.Text = dvPasantia.Table.Rows[0]["ID_ASPIRANTE"].ToString();
                    }
                    GVlistaActividadPasantia.DataSource = dvPasantia;
                    GVlistaActividadPasantia.DataBind();
                }
                catch (Exception e) {
                    DespliegaMensajeUpdatePanel(e.Message, UPGeneral);
                }
                
                
            }
            else if (TxtTipoEntregable.Text == "PROYECTO") {
                CCProyectoPasantia objConsultoriaEntregable = new CCProyectoPasantia(_DataSistema.ConexionBaseDato);
                dvEntregable = new DataView(objConsultoriaEntregable.Detalle2(Convert.ToInt32(TxtIdActividadAspirante.Text), Convert.ToInt32(TxtIdEntregable.Text), Convert.ToInt32(TxtIdEmpresa.Text), "", "", DateTime.Today, "", 'x', "", "", "", "", DateTime.Today, "", DateTime.Today, 5).TB_PROYECTO_PASANTIA);
                if (dvEntregable.Count > 0)
                {
                    TxtIdEntregable.Text = dvEntregable.Table.Rows[0]["ID"].ToString();
                    TxtNombreEmpresa1.Text = dvEntregable.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString();
                    TxtContacto.Text = dvEntregable.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString();
                    TxtEmailCon.Text = dvEntregable.Table.Rows[0]["DS_EMAIL_CONTACTO"].ToString();
                    TxtConsultoria.Text = dvEntregable.Table.Rows[0]["DS_NOMBRE_CONSULTORIA"].ToString();
                    TxtEntregable.Text = dvEntregable.Table.Rows[0]["DS_ENTREGABLE"].ToString();
                }
            }

        }

        protected void BtnAtrasPasAct_Click(object sender, EventArgs e)
        {
            PanelListadoProyectoEntregable.Visible = true;
            PanelInfoEntregable.Visible = false;
            PanelPasantiaActivity.Visible = false;
            PanelPEntregableActivity.Visible = false;
        }

        protected void BtnAtrasConEnt_Click(object sender, EventArgs e)
        {
            PanelListadoProyectoEntregable.Visible = true;
            PanelInfoEntregable.Visible = false;
            PanelPasantiaActivity.Visible = false;
            PanelPEntregableActivity.Visible = false;
        }

        protected void GVAspirantes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnAtrasListaEntregab_Click(object sender, EventArgs e)
        {
            PanelGeneral.Visible = true;
            PanelListadoProyectoEntregable.Visible = false;
            GVlistaEntregab = null;
        }

        protected void GVlistaActividadPasantia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Id = GVlistaActividadPasantia.SelectedIndex;

            TxtIdAspirante.Text = Convert.ToString(GVlistaActividadPasantia.DataKeys[Id].Values[1]); 

        }

        //resultado encuesta semanal
        private void FillGVResultadoPreg1()
        {
            CEncuestaAspirante objEncuesta = new CEncuestaAspirante(_DataSistema.ConexionBaseDato);
            dvEncuesta = new DataView(objEncuesta.Detalle(0, "", ' ', ' ', ' ', ' ', ' ', ' ', _DataSistema.Cusuario
                , DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 4).TB_ENCUESTA_SEMANAL_ASPIRANTE);
            GVResultadoPreg1.DataSource = dvEncuesta;
            GVResultadoPreg1.DataBind();
        }
        private void FillGVResultadoPreg2()
        {
            CEncuestaAspirante objEncuesta = new CEncuestaAspirante(_DataSistema.ConexionBaseDato);
            dvEncuesta = new DataView(objEncuesta.Detalle(0, "", ' ', ' ', ' ', ' ', ' ', ' ', _DataSistema.Cusuario
                , DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 5).TB_ENCUESTA_SEMANAL_ASPIRANTE);
            GVResultadoPreg2.DataSource = dvEncuesta;
            GVResultadoPreg2.DataBind();
        }
        private void FillGVResultadoPreg3()
        {
            CEncuestaAspirante objEncuesta = new CEncuestaAspirante(_DataSistema.ConexionBaseDato);
            dvEncuesta = new DataView(objEncuesta.Detalle(0, "", ' ', ' ', ' ', ' ', ' ', ' ', _DataSistema.Cusuario
                , DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 6).TB_ENCUESTA_SEMANAL_ASPIRANTE);
            GVResultadoPreg3.DataSource = dvEncuesta;
            GVResultadoPreg3.DataBind();
        }
        private void FillGVResultadoPreg4()
        {
            CEncuestaAspirante objEncuesta = new CEncuestaAspirante(_DataSistema.ConexionBaseDato);
            dvEncuesta = new DataView(objEncuesta.Detalle(0, "", ' ', ' ', ' ', ' ', ' ', ' ', _DataSistema.Cusuario
                , DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 7).TB_ENCUESTA_SEMANAL_ASPIRANTE);
            GVResultadoPreg4.DataSource = dvEncuesta;
            GVResultadoPreg4.DataBind();
        }
        private void FillGVResultadoPreg5()
        {
            CEncuestaAspirante objEncuesta = new CEncuestaAspirante(_DataSistema.ConexionBaseDato);
            dvEncuesta = new DataView(objEncuesta.Detalle(0, "", ' ', ' ', ' ', ' ', ' ', ' ', _DataSistema.Cusuario
                , DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 8).TB_ENCUESTA_SEMANAL_ASPIRANTE);
            GVResultadoPreg5.DataSource = dvEncuesta;
            GVResultadoPreg5.DataBind();
        }
        private void FillGVResultadoPreg6()
        {
            CEncuestaAspirante objEncuesta = new CEncuestaAspirante(_DataSistema.ConexionBaseDato);
            dvEncuesta = new DataView(objEncuesta.Detalle(0, "", ' ', ' ', ' ', ' ', ' ', ' ', _DataSistema.Cusuario
                , DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 9).TB_ENCUESTA_SEMANAL_ASPIRANTE);
            GVResultadoPreg6.DataSource = dvEncuesta;
            GVResultadoPreg6.DataBind();
        }
    }
}