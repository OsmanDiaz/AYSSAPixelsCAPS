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
            FillGVListaPasantia();

            
            
        }
        public void Adicionar() { }
        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVListaPasantia()
        {
            
            CPasantia objPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
           
            DataView dvPasantia = new DataView(objPasantia.Detalle(0, "", "", 0, 0, "", "", DateTime.Today,
            "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Today, "", DateTime.Today, 6).TB_PASANTIA);
            
            GVListaPasantia.DataSource = dvPasantia;
            GVListaPasantia.DataBind();

        }

        protected void GVListaPasantia_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVListaPasantia.SelectedIndex;

                TxtIdPasantia.Text = GVListaPasantia.DataKeys[Id].Value.ToString();
                FillGVListaAspirtantePasantia();
                PanelListaAspirantePasantia.Visible = true;
                PanelListaContratos.Visible = false;
                PanelContratoPasante.Visible = false;

            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPListaContrato);
            }
        }

        protected void FillGVListaAspirtantePasantia()
        {
            CPasantia objListaPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            DataView dvListaPasantia = new DataView(objListaPasantia.Detalle(Convert.ToInt32(TxtIdPasantia.Text), "", "", 0, 0, "", "", DateTime.Today,
            "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Today, "", DateTime.Today, 9).TB_PASANTIA);

            GVListaAspirantePasantia.DataSource = dvListaPasantia;
            GVListaAspirantePasantia.DataBind();
            
        }

        protected void BtnRegresarEmpresa_Click(object sender, EventArgs e)
        {
            PanelListaAspirantePasantia.Visible = false;
            PanelListaContratos.Visible = true;
        }

        protected void GVListaAspirantePasantia_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVListaAspirantePasantia.SelectedIndex;

                TxtIdAspirante.Text = Convert.ToString(GVListaAspirantePasantia.DataKeys[Id].Values[0]);
                PanelListaAspirantePasantia.Visible = false;
                 CargarReporte();
                PanelContratoPasante.Visible = true;

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
            DataView dvPasantiaA = new DataView(objPasantiaA.Detalle(0, TxtIdAspirante.Text, 0, _DataSistema.Cusuario
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
        
    }
}