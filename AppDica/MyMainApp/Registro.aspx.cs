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

namespace MyMainApp
{
    public partial class Registro : FormaSISWeb
    {
        private DataView dvTipoAspirante, dvConfMail;
        DataQuery objResultado = new DataQuery();
        protected void Page_Load(object sender, EventArgs e)
        {
            _DataSistema = (ClsSistema)Session["MyDataSistema"];
            if (!IsPostBack)
            {
                FillCboTipoAspitante();
            }
        }

        protected void BtnInicioRegistro_Click(object sender, EventArgs e)
        {
            string nit,fechaNacimiento,nombres,apellidos,email,perfil;
           
            nit = TxtNIT.Text;
            fechaNacimiento = TxtFechaNacimiento.Text;
            nombres = TxtNombres.Text;
            apellidos = TxtApellidos.Text;
            email = TxtEmail.Text;
            perfil = CboTipoAspitante.SelectedValue;
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789./$";
            var random = new Random();
            string password = new string(Enumerable.Repeat(chars, 10)
              .Select(s => s[random.Next(s.Length)]).ToArray());
            bool Sigue = VerificarUsuario(nit, fechaNacimiento, Convert.ToInt32(perfil));
            // Si sigue=true se procesa el ingreso
            if (Sigue== true)
            {
                CUsuario objUsuario = new CUsuario(_DataSistema.ConexionBaseDato);
                
                try
                {

                    objResultado = objUsuario.Actualizacion(nit, nombres+" "+apellidos, password, perfil,
            email, 'A', nit, TipoActualizacion.Adicionar);

                    if (objResultado.CodigoError == 0)
                    {
                        CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
                        objResultado = objAspirante.Actualizacion(nit,nombres, apellidos, Convert.ToDateTime(fechaNacimiento), 'X',
                         "", "", "", email, "", nit, 'P', Convert.ToInt32(perfil), "", 0, 0, 0, nit, "", "", "", nit,
                         TipoActualizacion.Adicionar);
                          CConfMail objConfMail = new CConfMail(_DataSistema.ConexionBaseDato);
                    DataView dvConfMail = new DataView(objConfMail.Detalle(1, "", "", "", 0,"", "","", DateTime.Now, "", DateTime.Now, 1).TBC_CONF_MAIL);
                        string asunto,body,correo;
                        asunto="Registro Usuario PIXELS CAPS";
                        body = "<h3 align='center'>Registrado a PIXELS CAPS</h3><br><label>Usuario:" + nit + "</label><br><label>Contraseña:" + password + "</label>";
                        correo = email;
                    objConfMail.SendMail(dvConfMail.Table.Rows[0]["DS_MAIL_FROM"].ToString(), dvConfMail.Table.Rows[0]["DS_MAIL_HEAD"].ToString(), dvConfMail.Table.Rows[0]["DS_SMTP"].ToString(),
                       Convert.ToInt32(dvConfMail.Table.Rows[0]["DS_PORT"].ToString()), dvConfMail.Table.Rows[0]["DS_MAIL"].ToString(), dvConfMail.Table.Rows[0]["DS_PASSWORD"].ToString(),
                       asunto, body, correo);
                        DespliegaMensaje("Usuario y Contraseña enviado al correo");
                    }
                    else
                    {
                        DespliegaMensaje(objResultado.MensajeError.Replace("'", ""));
                    }
                }
                catch (Exception ex)
                {
                    DespliegaMensaje(ex.Message);
                }
            }
            else{
            DespliegaMensaje("Usuario ya existe o no cumple rango de edades");
            }
        }
        

        protected bool VerificarUsuario(string Nit, string FechaNacimiento,int IdTipoAspirante)
        {   // Si retorna Falso no se procedera a el registro
           
            bool resultado = true;
            CAspirante objAspirante = new CAspirante(_DataSistema.ConexionBaseDato);
            DataView dvAspirante = new DataView(objAspirante.Detalle(Nit, "", "", Convert.ToDateTime(FechaNacimiento), 'X',
           "","", "", "", "", Nit, 'X',IdTipoAspirante,"", 0, 0, 0 , "","","","","", DateTime.Today, "", DateTime.Today, 2).TB_ASPIRANTE);
            if (dvAspirante.Count > 0)
            {
                resultado = false;
            }
            return resultado;
        }

        protected void FillCboTipoAspitante()
        {
            CTipoAspirante objTipoAspirante = new CTipoAspirante(_DataSistema.ConexionBaseDato);
            dvTipoAspirante = new DataView(objTipoAspirante.Detalle(0, "","",'A',"", DateTime.Now, "",DateTime.Now, 0).TBC_TIPO_ASPIRANTE);

            CboTipoAspitante.DataSource = dvTipoAspirante;
            CboTipoAspitante.DataBind();
        }
    }
}