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
        private DataView dvBrecha, dvAspirantes;
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


                int IdHabilidadConocimiento = Convert.ToInt32(GVBrecha.DataKeys[Id].Values[0]);
                int IdNivelConocimiento = Convert.ToInt32(GVBrecha.DataKeys[Id].Values[1]);
                FillGVAspirantes(IdHabilidadConocimiento, IdNivelConocimiento);
                GVAspirantes.Visible=true;
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPBrecha);
            }
        }

        protected void FillGVAspirantes(int HabilidadConocimiento,int NivelConocimiento)
        {
            CBrecha objAspirantes = new CBrecha(_DataSistema.ConexionBaseDato);
            dvAspirantes = new DataView(objAspirantes.Detalle('A', HabilidadConocimiento, NivelConocimiento, 1).BRECHA);

            GVAspirantes.DataSource = dvAspirantes;
            GVAspirantes.DataBind();
        }

    }
}