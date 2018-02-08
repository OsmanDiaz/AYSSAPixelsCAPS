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
    public partial class TECP0001 : FormaSISWeb, IAcciones
    {
        private DataView dvBrecha;
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
            FillGVBrecha();
        }

        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }


        protected void FillGVBrecha()
        {
            CBrecha objBrecha = new CBrecha(_DataSistema.ConexionBaseDato);
            dvBrecha = new DataView(objBrecha.Detalle('A',0,0, 0).BRECHA);

            GVBrecha.DataSource = dvBrecha;
            GVBrecha.DataBind();
        }

        protected void GVBrecha_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVBrecha.SelectedIndex;


                string IdHabilidadConocimiento = Convert.ToString(GVBrecha.DataKeys[Id].Values[0]);
                string IdNivelConocimiento = Convert.ToString(GVBrecha.DataKeys[Id].Values[1]);
             //   string IdNivelConocimiento = GVBrecha.DataKeys[id_nivel_conocimiento].Value.ToString();
               /* FillCamposProyecto();
                FillGVEntregable();
                PanelProyecto.Visible = false;
                PanelEntregable.Visible = false;
                PanelListaEntregable.Visible = true;*/
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPBrecha);
            }
        }

    }
}