using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{
    public class CEncuestaAspirante : CSqlvars
    {
        public CEncuestaAspirante(string ConexionData)
        {
            _ConexionData = ConexionData;
        }
        public ClsDataSets.DS_TB_ASP Detalle(int Id, string IdAspirante, char RespuestaAtencion, char RespuestaClases,
            char RespuestaInstalaciones, char RespuestaHardware, char RespuestaOpinionF, char RespuestaOpinionI, 
           string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {
            ClsDataSets.DS_TB_ASP objDataSet = new ClsDataSets.DS_TB_ASP();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_ENCUESTA_SEMANAL_ASPIRANTE_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ASPIRANTE", IdAspirante);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_RESPUESTA_ATENCION", RespuestaAtencion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_RESPUESTA_CLASES", RespuestaClases);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_RESPUESTA_INSTALACIONES", RespuestaInstalaciones);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_RESPUESTA_HARDWARE", RespuestaHardware);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_RESPUESTA_OPINION_F", RespuestaOpinionF);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_RESPUESTA_OPINION_I", RespuestaOpinionI);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                ObjAdapter.Fill(objDataSet, "TB_ENCUESTA_SEMANAL_ASPIRANTE");

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
        public DataQuery Actualizacion(int Id, string IdAspirante, char RespuestaAtencion, char RespuestaClases,
            char RespuestaInstalaciones, char RespuestaHardware, char RespuestaOpinionF, char RespuestaOpinionI,
           string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();
            try
            {
                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TB_ENCUESTA_SEMANAL_ASPIRANTE_INSERT";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = " ";
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

                if (OpcionActualizacion == TipoActualizacion.Adicionar)
                {
                    ObjParam = ObjCommand.Parameters.Add("@ID", SqlDbType.Int, 0);
                    ObjParam.Direction = ParameterDirection.Output;
                }
                else
                {
                    ObjCommand.Parameters.AddWithValue("@ID", Id);
                }
                ObjCommand.Parameters.AddWithValue("@ID_ASPIRANTE", IdAspirante);
                ObjCommand.Parameters.AddWithValue("@CD_RESPUESTA_ATENCION", RespuestaAtencion);
                ObjCommand.Parameters.AddWithValue("@CD_RESPUESTA_CLASES", RespuestaClases);
                ObjCommand.Parameters.AddWithValue("@CD_RESPUESTA_INSTALACIONES", RespuestaInstalaciones);
                ObjCommand.Parameters.AddWithValue("@CD_RESPUESTA_HARDWARE", RespuestaHardware);
                ObjCommand.Parameters.AddWithValue("@CD_RESPUESTA_OPINION_F", RespuestaOpinionF);
                ObjCommand.Parameters.AddWithValue("@CD_RESPUESTA_OPINION_I", RespuestaOpinionI);
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