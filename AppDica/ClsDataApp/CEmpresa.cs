using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{
    public class CEmpresa : CSqlvars
    {
        public CEmpresa(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public ClsDataSets.DS_TB_EMP Detalle(int Id, string NombreEmpresa, string NombreContacto, string EmailContacto, string TelContacto, string NitEmpresa,
            string TelEmpresa, string DirEmpresa, int IdDepartamento, int IdMunicipio, string NombreRepre, string EmailRepresentante,string NitRepre,
            string DuiRepre, int IdActEco,string IdUsuario, string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu,int OpcionConsulta)
        {
            ClsDataSets.DS_TB_EMP objDataSet = new ClsDataSets.DS_TB_EMP();
            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_EMPRESA_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NOMBRE_EMPRESA", NombreEmpresa);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NOMBRE_CONTACTO", NombreContacto);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_EMAIL_CONTACTO", EmailContacto);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_TELEFONO_CONTACTO", TelContacto);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NIT_EMPRESA", NitEmpresa);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_TELEFONO_EMPRESA", TelEmpresa);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DIRECCION_EMPRESA", DirEmpresa);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_DEPARTAMENTO", IdDepartamento);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_MUNICIPIO", IdMunicipio);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NOMBRE_REPRESENTANTE", NombreRepre);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_EMAIL_REPRESENTATE", EmailRepresentante);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NIT_REPRESENTANTE", NitRepre);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DUI_REPRESENTANTE", DuiRepre);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ACT_ECO", IdActEco);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_USUARIO", IdUsuario);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);


                ObjAdapter.Fill(objDataSet, "TB_EMPRESA");

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

        public DataQuery Actualizacion(int Id, string NombreEmpresa, string NombreContacto, string EmailContacto, string TelContacto, string NitEmpresa,
            string TelEmpresa, string DirEmpresa, int IdDepartamento, int IdMunicipio, string NombreRepre, string EmailRepresentante, string NitRepre,
            string DuiRepre, int IdActEco, string IdUsuario, string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();

            try
            {

                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TB_EMPRESA_INSERT";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = "SP_TB_EMPRESA_UPDATE";
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
                ObjCommand.Parameters.AddWithValue("@DS_NOMBRE_EMPRESA", NombreEmpresa);
                ObjCommand.Parameters.AddWithValue("@DS_NOMBRE_CONTACTO", NombreContacto);
                ObjCommand.Parameters.AddWithValue("@DS_EMAIL_CONTACTO", EmailContacto);
                ObjCommand.Parameters.AddWithValue("@DS_TELEFONO_CONTACTO", TelContacto);
                ObjCommand.Parameters.AddWithValue("@DS_NIT_EMPRESA", NitEmpresa);
                ObjCommand.Parameters.AddWithValue("@DS_TELEFONO_EMPRESA", TelEmpresa);
                ObjCommand.Parameters.AddWithValue("@DS_DIRECCION_EMPRESA", DirEmpresa);
                ObjCommand.Parameters.AddWithValue("@ID_DEPARTAMENTO", IdDepartamento);
                ObjCommand.Parameters.AddWithValue("@ID_MUNICIPIO", IdMunicipio);
                ObjCommand.Parameters.AddWithValue("@DS_NOMBRE_REPRESENTANTE", NombreRepre);
                ObjCommand.Parameters.AddWithValue("@DS_EMAIL_REPRESENTATE", EmailRepresentante);
                ObjCommand.Parameters.AddWithValue("@DS_NIT_REPRESENTANTE", NitRepre);
                ObjCommand.Parameters.AddWithValue("@DS_DUI_REPRESENTANTE", DuiRepre);
                ObjCommand.Parameters.AddWithValue("@ID_ACT_ECO", IdActEco);
                ObjCommand.Parameters.AddWithValue("@ID_USUARIO", IdUsuario);
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