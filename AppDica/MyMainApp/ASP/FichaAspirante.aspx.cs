using ClsDataApp;
using ClsInterface;
using dica;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyMainApp.ASP
{
    public partial class FichaAspirante : FormaSISWeb
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           _DataSistema = (ClsSistema)Session["MyDataSistema"];
           if (!IsPostBack)
           {
               DataTable dt;

               CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
               DataView dvAspirante = new DataView(objAspirante.Detalle(_DataSistema.Cusuario, "", "", DateTime.Today, 'X',
            "", "", "", "", "", "", 'X', 0, "", 0, 0, 0, "", "", "", "", "", DateTime.Today, "", DateTime.Today, 4).TB_ASPIRANTE);

               dt = dvAspirante.ToTable();
               ReportViewer1.Visible = true;
               ReportViewer1.LocalReport.ReportPath = "ASP/RptFichaAspirante.rdlc";
               ReportViewer1.LocalReport.DataSources.Clear();
               ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("TB_ASPIRANTE", dt));

               DataTable dt2;
               CEscolaridadAspirante objEscolaridad = new CEscolaridadAspirante(_DataSistema.ConexionBaseDato);
               DataView dvEscolaridad = new DataView(objEscolaridad.Detalle(0, _DataSistema.Cusuario, 0, 0,0, 0, "", "", 0, 0, "", DateTime.Now,
                   "", DateTime.Now, 3).TB_ESCOLARIDAD_ASPIRANTE);
               dt2 = dvEscolaridad.ToTable();
               ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("TB_ESCOLARIDAD_ASPIRANTE", dt2));

               DataTable dt3;
               CHabilidadAspirante objHabilidad = new CHabilidadAspirante(_DataSistema.ConexionBaseDato);
               DataView dvHabilidad = new DataView(objHabilidad.Detalle(0, 0, _DataSistema.Cusuario, 0, 0, "",
                   DateTime.Now, "", DateTime.Now, 2).TB_HABILIDAD_ASPIRANTE);
               dt3 = dvHabilidad.ToTable();
               ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("TB_HABILIDAD_ASPIRANTE", dt3));

               DataTable dt4;
               CDestrezaAspirante objDestreza = new CDestrezaAspirante(_DataSistema.ConexionBaseDato);
               DataView dvDestreza = new DataView(objDestreza.Detalle(0, 0, _DataSistema.Cusuario, "",
                   DateTime.Now, "", DateTime.Now, 2).TB_DESTREZA_ASPIRANTE);
               dt4 = dvDestreza.ToTable();
               ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("TB_DESTREZA_ASPIRANTE", dt4));
           }
        }
    }
}