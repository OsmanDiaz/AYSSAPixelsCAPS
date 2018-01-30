using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClsDataApp;
using ClsInterface;
using dica;

namespace MyMainApp
{
    public partial class Login : FormaSISWeb
    {
        DataView dvUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            _DataSistema = (ClsSistema)Session["MyDataSistema"];
        }

        protected void BtnInicioSesion_Click(object sender, EventArgs e)
        {
            bool bAutenticado = false;
            CUsuario objUsuario = new CUsuario(_DataSistema.ConexionBaseDato);
            bAutenticado = objUsuario.Autenticar(txtUsuario.Text, txtPassword.Text);
            _DataSistema.Autenticado = bAutenticado;
            if (bAutenticado)
            {
                _DataSistema.Cusuario = txtUsuario.Text;
                if (CargaDatosUsuarioActivo(_DataSistema.Cusuario))
                {
                    _DataSistema.Autenticado = true;
                    Session["MyDataSistema"] = _DataSistema;
                    FormsAuthentication.RedirectFromLoginPage(txtUsuario.Text, false);
                 //   Response.Redirect("ASP/ASPP0001.aspx");
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    _DataSistema.Autenticado = false;
                    DespliegaMensaje("Usuario no se encuentra Activo. Favor Verifique.");
                }

            }
            else
            {
                _DataSistema.Autenticado = false;
                DespliegaMensaje("Usuario o Contraseña incorrecta.");
            }
        }

         protected bool CargaDatosUsuarioActivo(string Usuario)
        {
            bool resultado = false;
            CUsuario objUsuario = new CUsuario(_DataSistema.ConexionBaseDato);
            dvUsuario = new DataView(objUsuario.Detalle(Usuario, "", "","","",'X', 2).TBC_USUARIO);
            if (dvUsuario.Count > 0)
            {
                _DataSistema.NombreUsuario = dvUsuario.Table.Rows[0]["DS_NOMBRE_USUARIO"].ToString();
                _DataSistema.CPerfilusuario = dvUsuario.Table.Rows[0]["ID_PERFIL_USUARIO"].ToString();
                _DataSistema.PerfilUsuario = dvUsuario.Table.Rows[0]["DS_NOMBRE_PERFIL"].ToString();
                _DataSistema.EstadoUsuario = dvUsuario.Table.Rows[0]["CD_ESTADO_USUARIO"].ToString();
                if (_DataSistema.EstadoUsuario == "A")
                { 
                    resultado = true;
                }
            }
            return resultado;
        }

         protected void BtnRegistrarme_Click(object sender, EventArgs e)
         {
             Response.Redirect("Registro.aspx");
         }

      /*   private void CargaParametrosInterfaz()
         {
             CParametrosInterfaz objParametros = new CParametrosInterfaz(_DataSistema.ConexionBaseDato);
             objParametros.ObtenerParametros();
             _DataSistema.NombreAplicacion = objParametros.NombreSistema;
             _DataSistema.NombreCortoAplicacion = objParametros.NombreCortoSistema;
             _DataSistema.ColorTextoSistema = objParametros.ColorTextoSistema;
             _DataSistema.UnidadUsuaria = objParametros.UnidadUsuaria;
             _DataSistema.ColorPrincipal = objParametros.ColorPrincipal;
             _DataSistema.ColorSecundario = objParametros.ColorSecundario;
             _DataSistema.ColorAuxiliar = objParametros.ColorAuxiliar;
             _DataSistema.ImagenSistema = objParametros.ImagenSistema;

             Session["MyDataSistema"] = _DataSistema;
         }*/
    }
}