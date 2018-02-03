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

namespace MyMainApp.EMP
{
    public partial class sugerenciaaspirante : FormaSISWeb, IAcciones
    {
        private DataView dvAsignacionAspirante, dvPasantiaAspirante;
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
        public void Consultar() {
            CAsignacionAspirante objAsignacionAspirante = new CAsignacionAspirante(_DataSistema.ConexionBaseDato);
            dvAsignacionAspirante = new DataView(objAsignacionAspirante.Detalle(2, 0).ASIGNACION_PASANTIA);

            GVAsignacionAspirantes.DataSource = dvAsignacionAspirante;
            GVAsignacionAspirantes.DataBind();
        }

        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }

        protected void GVAsignacionAspirantes_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int Id = GVAsignacionAspirantes.SelectedIndex;

                string IdAspirante = GVAsignacionAspirantes.DataKeys[Id].Value.ToString();

                CPasantiaAspirante objPasantiaAspirante = new CPasantiaAspirante(_DataSistema.ConexionBaseDato);
                objResultado = objPasantiaAspirante.Actualizacion(0, IdAspirante, 2,
                 _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                FillGVAspirantes(IdAspirante);
            }
            catch (Exception ex)
            {
               // DespliegaMensajeUpdatePanel(ex.Message, UPProyecto);
            }
        }



        protected void FillGVAspirantes(string IdAspirante)
        {
            CPasantiaAspirante objPasantiaAspirante = new CPasantiaAspirante(_DataSistema.ConexionBaseDato);
            dvPasantiaAspirante = new DataView(objPasantiaAspirante.Detalle(0, "", 2,
            "", DateTime.Now, "", DateTime.Now, 2).TB_PASANTIA_ASPIRANTE);

            GVAspirantes.DataSource = dvPasantiaAspirante;
            GVAspirantes.DataBind();
        }

        protected void GVAspirantes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}