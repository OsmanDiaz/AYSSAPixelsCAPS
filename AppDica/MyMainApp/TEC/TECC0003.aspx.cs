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
            FillGVListaAspirtantePasantia();
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

                TxtIdPasantia.Text = Convert.ToString(GVListaPasantia.DataKeys[Id].Values[0]);
                FillGVListaPasantia();
                PanelListaAspirantePasantia.Visible = true;
                PanelListaContratos.Visible = false;

            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPListaContrato);
            }
        }

        protected void FillGVListaAspirtantePasantia()
        {
            CPasantia objListaPasantia = new CPasantia(_DataSistema.ConexionBaseDato);
            DataView dvListaPasantia = new DataView(objListaPasantia.Detalle(0, "", "", 0, 0, "", "", DateTime.Today,
            "", "", "", 'A', 0, 0, 0, 0, 0, "", "", "", DateTime.Today, "", DateTime.Today, 7).TB_PASANTIA);

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

                TxtIdPasante.Text = Convert.ToString(GVListaAspirantePasantia.DataKeys[Id].Values[0]);
                FillCamposPasantia(TxtIdPasante.Text);
                //TxtIdConsulEntrega.Text = Convert.ToString(GVAspirantesEntregables.DataKeys[Id].Values[1]);
                PanelContratoPasante.Visible = true;
                PanelListaAspirantePasantia.Visible = false;

            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPListaContrato);
            }
        }

        private void FillCamposPasantia(string IdPasante)
        {
            CPasantiaAspirante objPasantiaA = new CPasantiaAspirante(_DataSistema.ConexionBaseDato);
            DataView dvPasantiaA = new DataView(objPasantiaA.Detalle(0, IdPasante, 0, _DataSistema.Cusuario
                ,DateTime.Today,"",DateTime.Today,3).TB_PASANTIA_ASPIRANTE);
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
                //INFORMACION PARA MOSTRAR EN LAS CLAUSULAS
                LblAcuerdo.Text = LblAcuerdo.Text.Replace("{{nombre_empresa}}", dvPasantiaA.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString());
                LblAcuerdo.Text = LblAcuerdo.Text.Replace("{{nombre_pasante}}", dvPasantiaA.Table.Rows[0]["NOMBRE_COMPLETO"].ToString());
                LblClausula1.Text = LblClausula1.Text.Replace("{{nombre_pasante}}", dvPasantiaA.Table.Rows[0]["NOMBRE_COMPLETO"].ToString());
                LblClausula1.Text = LblClausula1.Text.Replace("{{nombre_empresa}}", dvPasantiaA.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString());
                LblClausula2.Text = LblClausula2.Text.Replace("{{nombre_empresa}}", dvPasantiaA.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString());
                LblClausula2.Text = LblClausula2.Text.Replace("{{nombre_pasante}}", dvPasantiaA.Table.Rows[0]["NOMBRE_COMPLETO"].ToString());
                LblClausula3.Text = LblClausula3.Text.Replace("{{fecha_inicio_pasantia}}", dvPasantiaA.Table.Rows[0]["FECH_INICIO_PASANTIA"].ToString());
                LblClausula3.Text = LblClausula3.Text.Replace("{{fecha_fin_pasantia}}", dvPasantiaA.Table.Rows[0]["FECHA_FIN_PASANTIA"].ToString());
                LblClausula3.Text = LblClausula3.Text.Replace("{{nombre_pasante}}", dvPasantiaA.Table.Rows[0]["NOMBRE_COMPLETO"].ToString());
                LblClausula5.Text = LblClausula5.Text.Replace("{{nombre_empresa}}", dvPasantiaA.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString());
                LblClausula6.Text = LblClausula6.Text.Replace("{{nombre_empresa}}", dvPasantiaA.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString());
                LblResponsable.Text = LblResponsable.Text.Replace("{{nombre_responsable}}", dvPasantiaA.Table.Rows[0]["DS_NOMBRE_CONTACTO"].ToString());
                LblEmpresa.Text = LblEmpresa.Text.Replace("{{nombre_empresa}}", dvPasantiaA.Table.Rows[0]["DS_NOMBRE_EMPRESA"].ToString());
                LblPasante.Text = LblPasante.Text.Replace("{{nombre_pasante}}", dvPasantiaA.Table.Rows[0]["NOMBRE_COMPLETO"].ToString());
            }
        }
        
    }
}