using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{

    public class CAspiranteEstado : CSqlvars
    {
        public CAspiranteEstado(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public DataQuery Actualizacion(string Id, string Nombre, string Apellido, DateTime FechaNacimiento, char Sexo,
   string TelefonoCasa, string TelefonoCelular, string Direccion, string email, string Dui, string Nit, char EstadoAspirante, int IdTipoAspirante,
   string IdPais, int IdDepartamento, int IdMunicipio, int IdTituloAcademico,
    string IdUsuario, string Discapacidad1, string Discapacidad2, string Discapacidad3, string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();

            try
            {

                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = "SP_TB_ASPIRANTE_UPDATE_ESTADO";
                        break;
                    case TipoActualizacion.Eliminar:
                        StrCommand = "";
                        break;
                    case TipoActualizacion.No_Definida:
                        objResultado.CodigoError = -1;
                        objResultado.MensajeError = "Opcion de Actualizacion No Definida. Objeto COpcionesSistemas. Metodo Actualizacion";
                        //return objResultado;
                        break;
                }

                ObjConnection = new SqlConnection(_ConexionData);

                ObjCommand = new SqlCommand(StrCommand, ObjConnection);
                ObjParam = new SqlParameter();
                ObjCommand.CommandType = CommandType.StoredProcedure;


                ObjCommand.Parameters.AddWithValue("@ID", Id);
                ObjCommand.Parameters.AddWithValue("@DS_NOMBRE", Nombre);
                ObjCommand.Parameters.AddWithValue("@DS_APELLIDO", Apellido);
                ObjCommand.Parameters.AddWithValue("@FECH_NACIMIENTO", FechaNacimiento);
                ObjCommand.Parameters.AddWithValue("@DS_SEXO", Sexo);
                ObjCommand.Parameters.AddWithValue("@DS_TELEFONO_CASA", TelefonoCasa);
                ObjCommand.Parameters.AddWithValue("@DS_TELEFONO_CELULAR", TelefonoCelular);
                ObjCommand.Parameters.AddWithValue("@DS_DIRECCION", Direccion);
                ObjCommand.Parameters.AddWithValue("@DS_EMAIL", email);
                ObjCommand.Parameters.AddWithValue("@DS_DUI", Dui);
                ObjCommand.Parameters.AddWithValue("@DS_NIT", Nit);
                ObjCommand.Parameters.AddWithValue("@CD_ESTADO_ASPIRANTE", EstadoAspirante);
                ObjCommand.Parameters.AddWithValue("@ID_TIPO_ASPIRANTE", IdTipoAspirante);
                ObjCommand.Parameters.AddWithValue("@ID_PAIS", IdPais);
                ObjCommand.Parameters.AddWithValue("@ID_DEPARTAMENTO", IdDepartamento);
                ObjCommand.Parameters.AddWithValue("@ID_MUNICIPIO", IdMunicipio);
                ObjCommand.Parameters.AddWithValue("@ID_TITULO_ACADEMICO", IdTituloAcademico);
                ObjCommand.Parameters.AddWithValue("@ID_USUARIO", IdUsuario);
                ObjCommand.Parameters.AddWithValue("@DS_DISCAPACIDAD1", Discapacidad1);
                ObjCommand.Parameters.AddWithValue("@DS_DISCAPACIDAD2", Discapacidad2);
                ObjCommand.Parameters.AddWithValue("@DS_DISCAPACIDAD3", Discapacidad3);

                ObjCommand.Parameters.AddWithValue("@LOGIN_USUARIO", LoginUsuario);

                ObjParam = ObjCommand.Parameters.Add("@FILAS_AFECTADAS", SqlDbType.Int, 0);
                ObjParam.Direction = ParameterDirection.Output;

                ObjParam = ObjCommand.Parameters.Add("@NumeroError", SqlDbType.Decimal);
                ObjParam.Precision = 38;
                ObjParam.Scale = 0;
                ObjParam.Direction = ParameterDirection.Output;

                ObjParam = ObjCommand.Parameters.Add("@MensajeError", SqlDbType.NVarChar, 4000);
                ObjParam.Direction = ParameterDirection.Output;

                ObjConnection.Open();
                ObjCommand.ExecuteNonQuery();

                objResultado.CodigoAuxiliar = (object)ObjCommand.Parameters["@ID"].Value;
                objResultado.FilasAfectadas = (int)ObjCommand.Parameters["@FILAS_AFECTADAS"].Value;
                objResultado.CodigoError = (decimal)ObjCommand.Parameters["@NumeroError"].Value;
                objResultado.MensajeError = (string)ObjCommand.Parameters["@MensajeError"].Value;

                ObjConnection.Close();

                if (ObjConnection.State != ConnectionState.Closed)
                {
                    ObjConnection.Close();
                }

            }
            catch (Exception ex)
            {
                objResultado.CodigoError = -1;
                objResultado.MensajeError = ex.Message;
            }

            return objResultado;

        }
    }
}