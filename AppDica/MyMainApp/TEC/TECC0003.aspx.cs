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
using System.Globalization;
using Microsoft.Reporting.WebForms;

namespace MyMainApp.TEC
{
    public partial class TECC0003 : FormaSISWeb, IAcciones
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
            //FillGVListaPasantia();
            FillGVListaAspirtantePasantia();
            TxtNombreEmpresa.Visible = false;
            LblAcuerdo.Visible = false;
            Label76.Visible = false;
            Label77.Visible = false;
            TxtResponsable.Visible = false;
            Label73.Visible = false;
            TxtDireccionR.Visible = false;
            Label1.Visible = false;
            TxtTelResponsable.Visible = false;
            Label2.Visible = false;
            TxtCorreoR.Visible = false;
            Label3.Visible = false;
            TxtNombrePasante.Visible = false;
            Label4.Visible = false;
            TxtDireccionPasante.Visible = false;
            Label5.Visible = false;
            TxtTelefonoPasante.Visible = false;
            Label6.Visible = false;
            TxtCorreoPasante.Visible = false;
        }
        public void Adicionar() { }
        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        //protected void FillGVListaPasantia()
        //{
            
        //    CPasantia objPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
           
        //    DataView dvPasantia = new DataView(objPasantia.Detalle(0, "", "", 0, 0, "", "", DateTime.Today,
        //    "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Today, "", DateTime.Today, 6).TB_PASANTIA);
            
        //    GVListaPasantia.DataSource = dvPasantia;
        //    GVListaPasantia.DataBind();

        //}

        //protected void GVListaPasantia_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        int Id = GVListaPasantia.SelectedIndex;

        //        TxtIdPasantia.Text = GVListaPasantia.DataKeys[Id].Value.ToString();
        //        FillGVListaAspirtantePasantia();
        //        PanelListaAspirantePasantia.Visible = true;
        //        PanelListaContratos.Visible = false;
        //        PanelContratoPasante.Visible = false;

        //    }
        //    catch (Exception ex)
        //    {
        //        DespliegaMensajeUpdatePanel(ex.Message, UPListaContrato);
        //    }
        //}

        protected void FillGVListaAspirtantePasantia()
        {
            
            CPasantia objListaPasantia2 = new CPasantia(_DataSistema.ConexionBaseDato);
            DataView dvListaPasantia2 = new DataView(objListaPasantia2.Detalle(0, "", "", 0, 0, "", "", DateTime.Today,
            "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Today, "", DateTime.Today, 9).TB_PASANTIA);

            GVListaAspirantePasantia.DataSource = dvListaPasantia2;
            GVListaAspirantePasantia.DataBind();
          
            
        }

        //protected void BtnRegresarEmpresa_Click(object sender, EventArgs e)
        //{
        //    PanelListaAspirantePasantia.Visible = false;
        //    PanelListaContratos.Visible = true;
        //}

        protected void GVListaAspirantePasantia_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVListaAspirantePasantia.SelectedIndex;

                TxtIdAspirante.Text = GVListaAspirantePasantia.DataKeys[Id].Values[0].ToString();
                TxtIdPasantia.Text = GVListaAspirantePasantia.DataKeys[Id].Values[1].ToString();
                //PanelListaAspirantePasantia.Visible = false;
                 CargarReporte();
                 FillCamposPasantia();
                PanelContratoPasante.Visible = true;
                PanelListaAspirantePasantia.Visible = false;
                TxtNombreEmpresa.Visible = true;
                LblAcuerdo.Visible = true;
                Label76.Visible = true;
                Label77.Visible = true;
                TxtResponsable.Visible = true;
                Label73.Visible = true;
                TxtDireccionR.Visible = true;
                Label1.Visible = true;
                TxtTelResponsable.Visible = true;
                Label2.Visible = true;
                TxtCorreoR.Visible = true;
                Label3.Visible = true;
                TxtNombrePasante.Visible = true;
                Label4.Visible = true;
                TxtDireccionPasante.Visible = true;
                Label5.Visible = true;
                TxtTelefonoPasante.Visible = true;
                Label6.Visible = true;
                TxtCorreoPasante.Visible = true;

            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPListaContrato);
            }
        }

        protected void CargarReporte()
        {
            DataTable rp;
            
            CPasantiaAspirante objPasantiaA = new CPasantiaAspirante(_DataSistema.ConexionBaseDato);
            DataView dvPasantiaA = new DataView(objPasantiaA.Detalle(0, TxtIdAspirante.Text, Convert.ToInt32(TxtIdPasantia.Text), _DataSistema.Cusuario
                , DateTime.Today, "", DateTime.Today, 3).TB_PASANTIA_ASPIRANTE);

            rp = dvPasantiaA.ToTable();
            RVContrato.Visible = true;
            RVContrato.LocalReport.ReportPath = "TEC/RptContratoPasante.rdlc";
            RVContrato.LocalReport.DataSources.Clear();
            RVContrato.LocalReport.DataSources.Add(new ReportDataSource("TB_PASANTIA_PASANTE", rp));
        }

        protected void BtnAtras_Click(object sender, EventArgs e)
        {
            PanelContratoPasante.Visible = false;
            PanelListaAspirantePasantia.Visible = true;
        }

        protected void BtnReporteContrato_Click(object sender, EventArgs e)
        {
            PanelContratoPasante.Visible = false;
            PanelListaAspirantePasantia.Visible = true;
        }
        protected void FillCamposPasantia()
        {
            CPasantiaAspirante objPasantiaA = new CPasantiaAspirante(_DataSistema.ConexionBaseDato);
            DataView dvPasantiaA = new DataView(objPasantiaA.Detalle(0, TxtIdAspirante.Text, 0, _DataSistema.Cusuario
                , DateTime.Today, "", DateTime.Today, 3).TB_PASANTIA_ASPIRANTE);
            if (dvPasantiaA.Count > 0)
            {//INFORMACION PARA MOSTRAR EN EL FORMULARIO
                TxtNombreEmpresa.Text = dvPasantiaA.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString();
                TxtResponsable.Text = dvPasantiaA.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString();
                TxtDireccionR.Text = dvPasantiaA.Table.Rows[0]["DS_DIRECCION_EMPRESA"].ToString();
                TxtTelResponsable.Text = dvPasantiaA.Table.Rows[0]["DS_TELEFONO_CONTACTO"].ToString();
                TxtCorreoR.Text = dvPasantiaA.Table.Rows[0]["DS_EMAIL_CONTACTO"].ToString();
                TxtNombrePasante.Text = dvPasantiaA.Table.Rows[0]["NOMBRE_COMPLETO"].ToString();
                TxtDireccionPasante.Text = dvPasantiaA.Table.Rows[0]["DS_DIRECCION"].ToString();
                TxtTelefonoPasante.Text = dvPasantiaA.Table.Rows[0]["TELEFONO_CONTACTO"].ToString();
                TxtCorreoPasante.Text = dvPasantiaA.Table.Rows[0]["DS_EMAIL"].ToString();
            }
        }

       
    }
}