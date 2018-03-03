using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClsInterface;
using dica;
using ClsDataApp;
using System.Data;

namespace MyMainApp.ASP
{
    public partial class ASPP0002 : FormaSISWeb, IAcciones
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
        }

        public void Adicionar() { }

        public void Modificar() { }

        public void Eliminar() { }

        public void Imprimir() { }

        public void Limpiar() { }


        protected void BtnGuardarEncuestaSemanalP_Click(object sender, EventArgs e)
        {
            TxtIdAspirante.Text = _DataSistema.Cusuario;
            String usuario = null;
            usuario = TxtIdAspirante.Text;
            if (usuario != null || usuario != "")
            {
            try
            {
                CEncuestaAspirante objEncuestaAspirante = new CEncuestaAspirante(_DataSistema.ConexionBaseDato);
                objResultado=objEncuestaAspirante.Actualizacion(0,TxtIdAspirante.Text,Convert.ToChar(RB1.SelectedValue),Convert.ToChar(RB2.SelectedValue),
                    Convert.ToChar(RB3.SelectedValue), Convert.ToChar(RB4.SelectedValue),Convert.ToChar(RB5.SelectedValue), Convert.ToChar(RB6.SelectedValue), _DataSistema.Cusuario, TipoActualizacion.Adicionar);
                if(objResultado.CodigoError ==0)
                {
                    Consultar();
                    DespliegaMensajeUpdatePanel("Registro Guardado Correctamente",UPPanelEncuestaSemanal);
                    LimpiarEncuesta();
                }
                else
                {
                    DespliegaMensajeUpdatePanel(objResultado.MensajeError,UPPanelEncuestaSemanal);
                }
            }
                catch (Exception ex)
                {
                    DespliegaMensajeUpdatePanel(ex.Message, UPPanelEncuestaSemanal);
                }
            }
        }

        protected void LimpiarEncuesta()
        {
            TxtIdAspirante.Text = "0";
            RB1.SelectedValue = null;
            RB2.SelectedValue = null;
            RB3.SelectedValue = null;
            RB4.SelectedValue = null;
            RB5.SelectedValue = null;
            RB6.SelectedValue = null;

        }

    }
}