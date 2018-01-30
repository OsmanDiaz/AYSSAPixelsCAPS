using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;
namespace ClsDataApp
{
    public class CAspirante:CSqlvars
    {
        public CAspirante(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public ClsDataSets.DS_TB_ASP Detalle(string Id, string Nombre, string Apellido, DateTime FechaNacimiento, char Sexo,
           string TelefonoCasa,string TelefonoCelular, string Direccion, string email,string Dui, string Nit,char EstadoAspirante,int IdTipoAspirante,
           string IdPais, int IdDepartamento, int IdMunicipio, int IdTituloAcademico,
            string IdUsuario,string Discapacidad1,string Discapacidad2,string Discapacidad3
            , string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu,int OpcionConsulta)
        {
          
            ClsDataSets.DS_TB_ASP objDataSet = new ClsDataSets.DS_TB_ASP();

            try
            { 
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_ASPIRANTE_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NOMBRE", Nombre);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_APELLIDO", Apellido);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_NACIMIENTO", FechaNacimiento);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_SEXO", Sexo);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_TELEFONO_CASA", TelefonoCasa);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_TELEFONO_CELULAR", TelefonoCelular);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DIRECCION", Direccion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_EMAIL", email);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DUI", Dui);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NIT", Nit);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_ESTADO_ASPIRANTE", EstadoAspirante);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_TIPO_ASPIRANTE", IdTipoAspirante);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_PAIS", IdPais);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_DEPARTAMENTO", IdDepartamento);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_MUNICIPIO", IdMunicipio);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_TITULO_ACADEMICO", IdTituloAcademico);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_USUARIO", IdUsuario);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DISCAPACIDAD1", Discapacidad1);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DISCAPACIDAD2", Discapacidad2);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DISCAPACIDAD3", Discapacidad3);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);


                ObjAdapter.Fill(objDataSet, "TB_ASPIRANTE");

                ObjConnection.Close();

                if (ObjConnection.State != ConnectionState.Closed)
                {
                    ObjConnection.Close();
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }

            return objDataSet;
        }

        public DataQuery Actualizacion(string Id, string Nombre, string Apellido, DateTime FechaNacimiento, char Sexo,
           string TelefonoCasa,string TelefonoCelular, string Direccion, string email,string Dui, string Nit,char EstadoAspirante,int IdTipoAspirante,
           string IdPais, int IdDepartamento, int IdMunicipio, int IdTituloAcademico,
            string IdUsuario,string Discapacidad1,string Discapacidad2,string Discapacidad3, string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();

            try
            {

                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TB_ASPIRANTE_INSERT";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = "SP_TB_ASPIRANTE_UPDATE";
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