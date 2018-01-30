using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{
    public class CConsultoria :CSqlvars
    {
        public CConsultoria(string ConexcionData)
        {
            _ConexionData = ConexcionData;
        }

        public ClsDataSets.DS_TB_EMP Detalle(int Id, string NumContrato, string NombreProyecto,string Descripcion, DateTime FechContrato,
            double MontoProyecto, string DuracionProyecto, char Estado, int IdEmpresa, string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {
            ClsDataSets.DS_TB_EMP objDataSet = new ClsDataSets.DS_TB_EMP();

            try 
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_CONSULTORIA_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NUMERO_CONTRATO", NumContrato);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NOMBRE_CONSULTORIA", NombreProyecto);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DESCRIPCION", Descripcion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_INICIO_CONTRATO", FechContrato);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@NM_MONTO_CONSULTORIA", MontoProyecto);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_CONTRATO_DURACION", DuracionProyecto);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_ESTADO", Estado);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_EMPRESA", IdEmpresa);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                ObjAdapter.Fill(objDataSet, "TB_CONSULTORIA");

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
        public DataQuery Actualizacion(int Id, string NumContrato, string NombreProyecto,string Descripcion, DateTime FechContrato,
            double MontoProyecto, string DuracionProyecto, char Estado, int IdEmpresa, string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();
            try
            {
                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TB_CONSULTORIA_INSERT";
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
                ObjCommand.Parameters.AddWithValue("@DS_NUMERO_CONTRATO", NumContrato);
                ObjCommand.Parameters.AddWithValue("@DS_NOMBRE_CONSULTORIA", NombreProyecto);
                ObjCommand.Parameters.AddWithValue("@DS_DESCRIPCION", Descripcion);
                ObjCommand.Parameters.AddWithValue("@FECH_INICIO_CONTRATO", FechContrato);
                ObjCommand.Parameters.AddWithValue("@NM_MONTO_CONSULTORIA", MontoProyecto);
                ObjCommand.Parameters.AddWithValue("@DS_CONTRATO_DURACION", DuracionProyecto);
                ObjCommand.Parameters.AddWithValue("@CD_ESTADO", Estado);
                ObjCommand.Parameters.AddWithValue("@ID_EMPRESA", IdEmpresa);
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