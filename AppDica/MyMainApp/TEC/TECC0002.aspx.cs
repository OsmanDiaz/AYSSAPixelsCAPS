﻿using ClsDataApp;
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
<<<<<<< HEAD
        private DataView dvEmpresa, dvPasantia, dvEscolaridad, dvHabilidad, dvConsultoria,
            dvEntregable;
=======
        private DataView dvEmpresa, dvPasantia, dvEscolaridad, dvHabilidad;
>>>>>>> 896a17109aeea0e06dc96e38e15b043a6ec1e367
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
            FillGVListaEmpresa();
            FillGVListaPasantia();
            //FillGVAspiranteAsignado();
            //FillCboTipoDocumento();
        }

        public void Adicionar() { }
        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }


        private void FillGVListaEmpresa()
        {
            CEmpresa objEmpresa = new CEmpresa(_DataSistema.ConexionBaseDato);
            dvEmpresa = new DataView (objEmpresa.Detalle(0,_DataSistema.Cusuario,"","","","","","",0,0,"","","","",0,"",_DataSistema.Cusuario,DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 0).TB_EMPRESA);
            GVListaEmpresa.DataSource = dvEmpresa;
            GVListaEmpresa.DataBind();
        }

        protected void GVListaEmpresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVListaEmpresa.SelectedIndex;

                TxtIdEmpresa.Text = GVListaEmpresa.DataKeys[Id].Value.ToString();
                FillInfoEmpresa();
                PanelListaEmpresa.Visible = false;
                PanelDetalleInfoEmpresa.Visible = true;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPRegistroEmp);
            }
        }

        private void FillInfoEmpresa()
        {
            CEmpresa objEmpresa = new CEmpresa(_DataSistema.ConexionBaseDato);
            dvEmpresa = new DataView(objEmpresa.Detalle(Convert.ToInt32(TxtIdEmpresa.Text), _DataSistema.Cusuario, "", "", "", "", "", "", 0, 0, "", "", "", "", 0, "", _DataSistema.Cusuario, DateTime.Today, _DataSistema.Cusuario, DateTime.Today, 0).TB_EMPRESA);
            if (dvEmpresa.Count > 0) {
                TxtNombreEmp.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString();
                TxtNombreContacto.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString();
                TxtEmailContacto.Text = dvEmpresa.Table.Rows[0]["DS_EMAIL_CONTACTO"].ToString();
                TxtTelefonoContacto.Text = dvEmpresa.Table.Rows[0]["DS_TELEFONO_CONTACTO"].ToString();
                TxtNitEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_NIT_EMPRESA"].ToString();
                TxtTelefonoEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_TELEFONO_EMPRESA"].ToString();
                TxtDireccionEmpresa.Text = dvEmpresa.Table.Rows[0]["DS_DIRECCION_EMPRESA"].ToString();
                TxtRepresentanteLegal.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString();
                TxtEmailRepresentanteLegal.Text = dvEmpresa.Table.Rows[0]["DS_NOMBRE_REPRESENTANTE"].ToString();
                TxtNitRepresentanteLegal.Text = dvEmpresa.Table.Rows[0]["DS_NIT_REPRESENTANTE"].ToString();
                TxtDuiRepresentanteLegal.Text = dvEmpresa.Table.Rows[0]["DS_DUI_REPRESENTANTE"].ToString();
            }
            GVListaEmpresa.DataSource = dvEmpresa;
            GVListaEmpresa.DataBind();
        }

        protected void BtnAtrasDetalleEmpresa_Click(object sender, EventArgs e)
        {
            PanelListaEmpresa.Visible = true;
            PanelDetalleInfoEmpresa.Visible = false;
        }


        protected void GVListaPasantia_SelectedIndexChaged(object sender, EventArgs e)
        {
            int Id = GVListaPasantia.SelectedIndex;

            TxtIdPasantia.Text = GVListaPasantia.DataKeys[Id].Value.ToString();
            FillInfoPasantia();
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

<<<<<<< HEAD
        protected void GVListaProyectos_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVListaProyectos.SelectedIndex;

                TxtIdEmpresa.Text = GVListaProyectos.DataKeys[Id].Value.ToString();
                FillInfoEntregable();
                PanelListaProyectos.Visible = false;
                PanelEntregables.Visible = true;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPActividad);
            }
        }

        private void FillInfoProyecto()
        {
            CConsultoria objConsultoria = new CConsultoria(_DataSistema.ConexionBaseDato);
            dvConsultoria = new DataView(objConsultoria.Detalle(0, "", "", "", DateTime.Today, 0, "", 'x', 0, "", DateTime.Today, "", DateTime.Today, 5).TB_CONSULTORIA);
            if(dvConsultoria.Count >0){
                TxtIdConsultoria.Text = dvConsultoria.Table.Rows[0]["ID"].ToString();
            }
            GVListaProyectos.DataSource = dvConsultoria;
            GVListaProyectos.DataBind();
        }



        private void FillInfoEntregable()
        {
            CConsultoriaEntregable objConsultoriaEntregable = new CConsultoriaEntregable(_DataSistema.ConexionBaseDato);
            dvEntregable = new DataView(objConsultoriaEntregable.Detalle(0,Convert.ToInt32(TxtIdConsultoria.Text),"","",DateTime.Today,"",'x',"","","","",DateTime.Today,"",DateTime.Today,2).TB_CONSULTORIA_ENTREGABLE);
            if(dvEntregable.Count > 0){
                TxtIdEntregable.Text = dvEntregable.Table.Rows[0]["ID"].ToString();
            }
            GVEntregables.DataSource = dvEntregable;
            GVEntregables.DataBind();
        }

        protected void GVListaEntregables_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        
=======

>>>>>>> 896a17109aeea0e06dc96e38e15b043a6ec1e367
    }
}