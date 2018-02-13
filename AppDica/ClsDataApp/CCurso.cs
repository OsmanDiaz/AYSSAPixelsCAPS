using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsDataSets;
using ClsInterface;

namespace ClsDataApp
{
    public class CCurso : CSqlvars
    {
        public CCurso(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public DS_TB_TEC DetalleEnca(int Id,string NombreCurso,string DescripcionCurso, int IdHabilidadConocimiento
            , int IdNivelConocimiento, int CantidadAspirantes, char Estado, string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {

            DS_TB_TEC objDataSet = new DS_TB_TEC();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_ENCA_CURSO_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NOMBRE_CURSO", NombreCurso);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DESCRIPCION_CURSO", DescripcionCurso);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_HABILIDAD_CONOCIMIENTO", IdHabilidadConocimiento);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_NIVEL_CONOCIMIENTO", IdNivelConocimiento);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@NM_CANTIDAD_ASPIRANTES", CantidadAspirantes);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_ESTADO", Estado);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);


                ObjAdapter.Fill(objDataSet, "TB_ENCA_CURSO");

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

        public DS_TB_TEC Detalle(int Id, int IdEncaCurso, string IdAspirante, float CalificacionFinal
           , string Observacion,  char Estado, string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {
            DS_TB_TEC objDataSet = new DS_TB_TEC();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_DETA_CURSO_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ENCA_CURSO", IdEncaCurso);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ASPIRANTE", IdAspirante);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@NM_CALIFICACION_FINAL", CalificacionFinal);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_OBSERVACION", Observacion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_ESTADO", Estado);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);


                ObjAdapter.Fill(objDataSet, "TB_DETA_CURSO");

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

        public DataQuery ActualizacionDetalle(int Id, int IdEncaCurso, string IdAspirante, float CalificacionFinal
           , string Observacion, char Estado, string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();
            try
            {
                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TB_DETA_CURSO_INSERT";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = " ";
                        break;
                    case TipoActualizacion.Eliminar:
                        StrCommand = " ";
                        break;
                    case TipoActualizacion.No_Definida:
                        objResultado.CodigoError = -1;
                        objResultado.MensajeError = "Opcion de Actualizacion No Definida. Objeto COpcionesSistemas. Metodo Actualizacion";
                        //return objResultado;
                        break;
                } ObjConnection = new SqlConnection(_ConexionData);

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

                ObjCommand.Parameters.AddWithValue("@ID_ENCA_CURSO", IdEncaCurso);
                ObjCommand.Parameters.AddWithValue("@ID_ASPIRANTE", IdAspirante);
                ObjCommand.Parameters.AddWithValue("@NM_CALIFICACION_FINAL", CalificacionFinal);
                ObjCommand.Parameters.AddWithValue("@DS_OBSERVACION", Observacion);
                ObjCommand.Parameters.AddWithValue("@CD_ESTADO", Estado);
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