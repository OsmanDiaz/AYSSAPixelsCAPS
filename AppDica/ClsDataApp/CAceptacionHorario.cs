using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{
    public class CAceptacionHorario:CSqlvars
    {
        public CAceptacionHorario(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public ClsDataSets.DS_TB_ASP Detalle(int Id, int IdAceptacionPasantia, bool LunesA, bool MartesA, bool MiercolesA,
            bool JuevesA, bool ViernesA, bool SabadoA, bool DomingoA, bool LunesP, bool MartesP, bool MiercolesP,
            bool JuevesP, bool ViernesP, bool SabadoP, bool DomingoP, 
            string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)

     {
            ClsDataSets.DS_TB_ASP objDataSet = new ClsDataSets.DS_TB_ASP();
            
            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_ACEPTACION_HORARIO_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ACEPTACION_PASANTIA", IdAceptacionPasantia);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_LUNES_A", LunesA);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_MARTES_A", MartesA);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_MIERCOLES_A", MiercolesA);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_JUEVES_A", JuevesA);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_VIERNES_A", ViernesA);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_SABADO_A", SabadoA);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_DOMINGO_A", DomingoA);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_LUNES_P", LunesP);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_MARTES_P", MartesP);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_MIERCOLES_P", MiercolesP);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_JUEVES_P", JuevesP);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_VIERNES_P", ViernesP);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_SABADO_P", SabadoP);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_DOMINGO_P", DomingoP);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                ObjAdapter.Fill(objDataSet, "TB_ACEPTACION_HORARIO");

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
        public DataQuery Actualizacion(int Id, int IdAceptacionPasantia, bool LunesA, bool MartesA, bool MiercolesA,
            bool JuevesA, bool ViernesA, bool SabadoA, bool DomingoA, bool LunesP, bool MartesP, bool MiercolesP,
            bool JuevesP, bool ViernesP, bool SabadoP, bool DomingoP, 
           string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();
            try
            {
                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TB_ACEPTACION_HORARIO_INSERT";
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
                ObjCommand.Parameters.AddWithValue("@ID_ACEPTACION_PASANTIA", IdAceptacionPasantia);
                ObjCommand.Parameters.AddWithValue("@CD_LUNES_A", LunesA);
                ObjCommand.Parameters.AddWithValue("@CD_MARTES_A", MartesA);
                ObjCommand.Parameters.AddWithValue("@CD_MIERCOLES_A", MiercolesA);
                ObjCommand.Parameters.AddWithValue("@CD_JUEVES_A", JuevesA);
                ObjCommand.Parameters.AddWithValue("@CD_VIERNES_A", ViernesA);
                ObjCommand.Parameters.AddWithValue("@CD_SABADO_A", SabadoA);
                ObjCommand.Parameters.AddWithValue("@CD_DOMINGO_A", DomingoA);
                ObjCommand.Parameters.AddWithValue("@CD_LUNES_P", LunesP);
                ObjCommand.Parameters.AddWithValue("@CD_MARTES_P", MartesP);
                ObjCommand.Parameters.AddWithValue("@CD_MIERCOLES_P", MiercolesP);
                ObjCommand.Parameters.AddWithValue("@CD_JUEVES_P", JuevesP);
                ObjCommand.Parameters.AddWithValue("@CD_VIERNES_P", ViernesP);
                ObjCommand.Parameters.AddWithValue("@CD_SABADO_P", SabadoP);
                ObjCommand.Parameters.AddWithValue("@CD_DOMINGO_P", DomingoP); 
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