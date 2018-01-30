using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{
    public class CEscolaridadAspirante : CSqlvars
    {
        public CEscolaridadAspirante(string ConexionData)
        {
            _ConexionData = ConexionData;
        }
        public ClsDataSets.DS_TB_ASP Detalle(int Id,string IdAspirante,int CategoriaEscolaridad, int IdEscolaridad, int IdOpcionAcademica, int IdInstitucion, string IdPais,
            string OtraInstitucion, int AnioFin, double Promedio,
            string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {
            ClsDataSets.DS_TB_ASP objDataSet = new ClsDataSets.DS_TB_ASP();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_ESCOLARIDAD_ASPIRANTE_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ASPIRANTE", IdAspirante);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_CATEGORIA_ESCOLARIDAD", CategoriaEscolaridad);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ANIO_ESCOLARIDAD", IdEscolaridad);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_OPCION_ACADEMICA", IdOpcionAcademica);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_CENTRO_ESCOLAR", IdInstitucion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_PAIS", IdPais);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_OTRA", OtraInstitucion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@NM_ANIO_FIN", AnioFin);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@NM_PROMEDIO_NOTA", Promedio);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                ObjAdapter.Fill(objDataSet, "TB_ESCOLARIDAD_ASPIRANTE");

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
        public DataQuery Actualizacion(int Id, string IdAspirante, int CategoriaEscolaridad, int IdEscolaridad, int IdOpcionAcademica, int IdInstitucion, string IdPais,
            string OtraInstitucion, int AnioFin, decimal Promedio, string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();
            try
            {
                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TB_ESCOLARIDAD_ASPIRANTE_INSERT";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = " ";
                        break;
                    case TipoActualizacion.Eliminar:
                        StrCommand = "SP_TB_ESCOLARIDAD_ASPIRANTE_DELETE";
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
                ObjCommand.Parameters.AddWithValue("@ID_CATEGORIA_ESCOLARIDAD", CategoriaEscolaridad);
                ObjCommand.Parameters.AddWithValue("@ID_ANIO_ESCOLARIDAD", IdEscolaridad);
                ObjCommand.Parameters.AddWithValue("@ID_OPCION_ACADEMICA", IdOpcionAcademica);
                ObjCommand.Parameters.AddWithValue("@ID_CENTRO_ESCOLAR", IdInstitucion);
                ObjCommand.Parameters.AddWithValue("@ID_PAIS", IdPais);
                ObjCommand.Parameters.AddWithValue("@DS_OTRA", OtraInstitucion);
                ObjCommand.Parameters.AddWithValue("@NM_ANIO_FIN", AnioFin);
                ObjCommand.Parameters.AddWithValue("@NM_PROMEDIO_NOTA", Promedio);
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