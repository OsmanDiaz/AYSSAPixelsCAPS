using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{
    public class CRepresentanteLegal : CSqlvars
    {
        public CRepresentanteLegal(string ConexcionData)
        {
            _ConexionData = ConexcionData;
        }

        public ClsDataSets.DS_TB_ASP Detalle(int Id, string NombreR, string ApellidoR, string DuiR, string NitR, char SexoR, string EmailR, DateTime FechaNacimientoR,
            string TelefonoR, string Direccion, string IdAspirante, int IdTituloAcademico, string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {
            ClsDataSets.DS_TB_ASP objDataSet = new ClsDataSets.DS_TB_ASP();
            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TBC_REPRESENTANTE_LEGAL_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NOMBRE", NombreR);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_APELLIDO", ApellidoR);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DUI", DuiR);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NIT", NitR);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_SEXO", SexoR);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_EMAIL", EmailR);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_NACIMIENTO", FechaNacimientoR);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_TELEFONO", TelefonoR);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DIRECCION", Direccion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ASPIRANTE", IdAspirante);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_TITULO_ACADEMICO", IdTituloAcademico);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                ObjAdapter.Fill(objDataSet, "TBC_REPRESENTANTE_LEGAL");

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
        public DataQuery Actualizacion(int Id, string NombreR, string ApellidoR, string DuiR, string NitR, char SexoR, string EmailR, DateTime FechaNacimientoR,
            string TelefonoR, string Direccion, string IdAspirante, int IdTituloAcademico, string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();
            try
            {
                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TBC_REPRESENTANTE_LEGAL_INSERT";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = "SP_TBC_REPRESENTANTE_LEGAL_UPDATE";
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
                ObjCommand.Parameters.AddWithValue("@DS_NOMBRE", NombreR);
                ObjCommand.Parameters.AddWithValue("@DS_APELLIDO", ApellidoR);
                ObjCommand.Parameters.AddWithValue("@DS_DUI", DuiR);
                ObjCommand.Parameters.AddWithValue("@DS_NIT", NitR);
                ObjCommand.Parameters.AddWithValue("@DS_SEXO", SexoR);
                ObjCommand.Parameters.AddWithValue("@DS_EMAIL", EmailR);
                ObjCommand.Parameters.AddWithValue("@FECH_NACIMIENTO", FechaNacimientoR);
                ObjCommand.Parameters.AddWithValue("@DS_TELEFONO", TelefonoR);
                ObjCommand.Parameters.AddWithValue("@DS_DIRECCION", Direccion);
                ObjCommand.Parameters.AddWithValue("@ID_ASPIRANTE", IdAspirante);
                ObjCommand.Parameters.AddWithValue("@ID_TITULO_ACADEMICO", IdTituloAcademico);
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