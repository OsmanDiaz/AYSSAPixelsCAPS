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
    public partial class TEC0001 : FormaSISWeb, IAcciones
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
            FillGVRegistroAspirante();
            FillGVAspiranteAsignado();
            
        }
        public void Adicionar() { }
        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void FillGVRegistroAspirante()
        {
            CAspirante objRegistroAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvRegistroAspirante = new DataView(objRegistroAspirante.Detalle("", "", "", DateTime.Now, 'X',
           "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Now, "", DateTime.Now, 5).TB_ASPIRANTE);

            GVRegistroAspirante.DataSource = dvRegistroAspirante;
            GVRegistroAspirante.DataBind();
        }

        protected void FillGVAspiranteAsignado()
        {
            CAspirante objAspiranteAsignado = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvAspiranteAsignado = new DataView(objAspiranteAsignado.Detalle("", "", "", DateTime.Now, 'X',
           "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Now, "", DateTime.Now, 6).TB_ASPIRANTE);

            GVAspiranteAsignado.DataSource = dvAspiranteAsignado;
            GVAspiranteAsignado.DataBind();
        }

        protected void GVRegistroAspirante_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string Id = GVRegistroAspirante.SelectedRow.Cells[1].Text;
                TxtIdAspirante.Text = Id;
                PanelRegistroAspirante.Visible = false;
                PanelRegistroIq.Visible = true;
            }

            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPRegistroAspirante);
            }
        }
        

        //protected void BtnGuardarNotaIq_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
              
        //    }
        //}
    }
}