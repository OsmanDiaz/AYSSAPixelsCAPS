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
        private DataView dvEmpresa;
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



    }
}