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
        private DataView dvBrecha, dvAspirantes, dvCurso;
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
                TxtIdHabilidadConocimiento.Text =Convert.ToString(IdHabilidadConocimiento);
                int IdNivelConocimiento = Convert.ToInt32(GVBrecha.DataKeys[Id].Values[1]);
                FillGVAspirantes(IdHabilidadConocimiento, IdNivelConocimiento);
                PanelSugerida.Visible = true;
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

        protected void GVAspirantes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            TextBox Id = GVAspirantes.Rows[e.RowIndex].FindControl("TxtIDAspiranteGV") as TextBox;
            TextBox Nombre=GVAspirantes.Rows[e.RowIndex].FindControl("TxtNombreAspiranteGV") as TextBox;

            TxtIdAspirante.Text = Id.Text;
            TxtNombreAspirante.Text = Nombre.Text;
            FillCboCurso(Convert.ToInt32(TxtIdHabilidadConocimiento.Text), 0);
            PanelCurso.Visible = true;

            FillGVAspirantesCurso();
        }

        protected void FillCboCurso(int HabilidadConocimiento, int NivelConocimiento)
        {
            CCurso objCurso = new CCurso(_DataSistema.ConexionBaseDato);
            dvCurso = new DataView(objCurso.DetalleEnca(0,"","", HabilidadConocimiento, NivelConocimiento,0,'A',"",DateTime.Now,"",DateTime.Now, 2).TB_ENCA_CURSO);

            CboCurso.DataSource = dvCurso;
            CboCurso.DataBind();
        }

        protected void BtnAgregarACurso_Click(object sender, EventArgs e)
        {
            try
            {
                if (TxtIdAspirante.Text != "0")
                {
                    CCurso objCurso = new CCurso(_DataSistema.ConexionBaseDato);
                    objResultado = objCurso.ActualizacionDetalle(0,Convert.ToInt32(CboCurso.SelectedValue),TxtIdAspirante.Text, 0, "",  'A'
                    , _DataSistema.Cusuario, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        FillGVAspirantesCurso();
                    }
                    else
                    {
                        DespliegaMensajeUpdatePanel(objResultado.MensajeError, UPBrecha);
                    }
                }
                else
                {
                    DespliegaMensajeUpdatePanel("No se ha seleccionado un Aspirante", UPBrecha);
                }
            }
            catch (Exception ex)
            {
                DespliegaMensajeUpdatePanel(ex.Message, UPBrecha);
            }
        }


        protected void FillGVAspirantesCurso()
        {
            CCurso objCurso = new CCurso(_DataSistema.ConexionBaseDato);
            dvCurso = new DataView(objCurso.Detalle(0,Convert.ToInt32(CboCurso.SelectedValue),TxtIdAspirante.Text, 0, "",  'A', "", DateTime.Now, "", DateTime.Now, 2).TB_DETA_CURSO);

            GVAspirantesCurso.DataSource = dvCurso;
            GVAspirantesCurso.DataBind();
        }

        protected void CboCurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillGVAspirantesCurso();
        }


    }
}