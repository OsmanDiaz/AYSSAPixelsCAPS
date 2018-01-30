using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsDataSets;
using ClsInterface;
using SIS.Framework.Common;

namespace ClsDataApp
{
    public class CUsuario :CSqlvars
    {
        DataQuery objResultado = new DataQuery();
        public CUsuario(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public DS_TBC_SIS Detalle(string Id, string NombreUsuario, string ClaveUsuario,
            string CodigoPerfil, string CorreoElectronico, char EstadoUsuario,  int OpcionConsulta)
        {
            DS_TBC_SIS objDataSet = new DS_TBC_SIS();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TBC_USUARIO_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NOMBRE_USUARIO", NombreUsuario);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_CLAVE_USUARIO", ClaveUsuario);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_PERFIL_USUARIO", CodigoPerfil);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DIRE_EMAIL", CorreoElectronico);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_ESTADO_USUARIO", EstadoUsuario);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                ObjAdapter.Fill(objDataSet, "TBC_USUARIO");

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

        public DataQuery Actualizacion(string Id, string NombreUsuario, string Password, string IdPerfil,
            string Email, char EstadoUsuario, string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            try
            {
                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TBC_USUARIO_INSERT";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = "";
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
                ObjCommand.Parameters.AddWithValue("@DS_NOMBRE_USUARIO", NombreUsuario);
                ObjCommand.Parameters.AddWithValue("@DS_PASSWORD", Password);
                 byte[] ClaveUsuarioE;
                if (Password.Trim().Length > 0)
                {
                    ClaveUsuarioE = GeneraClave(Password.Trim());
                    ObjCommand.Parameters.AddWithValue("@CD_CLAVE_USUARIO", ClaveUsuarioE);
                }
                else
                {
                    ObjCommand.Parameters.Add("@CD_CLAVE_USUARIO", System.Data.SqlDbType.VarBinary).Value = DBNull.Value;
                }
                ObjCommand.Parameters.AddWithValue("@ID_PERFIL_PERFIL", IdPerfil);
                ObjCommand.Parameters.AddWithValue("@DS_DIRE_EMAIL", Email);
                ObjCommand.Parameters.AddWithValue("@CD_ESTADO_USUARIO", EstadoUsuario);

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

                objResultado.CodigoAuxiliar = Id;
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


        private byte[] GeneraClave(string Contrasena)
        {
            byte[] ClaveEncriptada;
            CEncriptacion objEncripcion = new CEncriptacion();
            ClaveEncriptada = objEncripcion.Encrypt(CEncriptacion.ToBase64(Contrasena));

            return ClaveEncriptada;
        }

        public bool Autenticar(string Usuario, string ClaveUsuario)
        {
            bool resultado = false;
            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                SqlCommand ObjCommand = new SqlCommand("SP_TBC_USUARIO_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjCommand.CommandType = CommandType.StoredProcedure;
              
                ObjCommand.Parameters.AddWithValue("@ID", Usuario);
                ObjCommand.Parameters.AddWithValue("@DS_NOMBRE_USUARIO", "");
                ObjCommand.Parameters.AddWithValue("@CD_CLAVE_USUARIO", "");
                ObjCommand.Parameters.AddWithValue("@ID_PERFIL_USUARIO", "");
                ObjCommand.Parameters.AddWithValue("@DS_DIRE_EMAIL", "");
                ObjCommand.Parameters.AddWithValue("@CD_ESTADO_USUARIO", 0);
                ObjCommand.Parameters.AddWithValue("@OPCI_CONS", 1);

                ObjConnection.Open();

                SqlDataReader objReader = ObjCommand.ExecuteReader();

                CEncriptacion objEncripcion = new CEncriptacion();

                byte[] ClaveEncriptada;
                byte[] ClaveEncriptadaGuardada;

                while (objReader.Read())
                {
                    ClaveEncriptadaGuardada = ((byte[])objReader["CD_CLAVE_USUARIO"]);
                    ClaveEncriptada = objEncripcion.Encrypt(CEncriptacion.ToBase64(ClaveUsuario));
                    IStructuralEquatable ob1 = ClaveEncriptadaGuardada;

                    if (ob1.Equals(ClaveEncriptada, StructuralComparisons.StructuralEqualityComparer))
                    {
                        resultado = true;
                    }
                }

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
            return resultado;
        }
    }
}