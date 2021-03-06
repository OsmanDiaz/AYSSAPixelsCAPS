﻿using ClsInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClsDataApp
{
    public class CEncuestaSemanalEmpresa : CSqlvars
    {
        public CEncuestaSemanalEmpresa(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public ClsDataSets.DS_TB_EMP Detalle(int Id, string IdEmpresa,
        string Respuesta1, string Respuesta2, string Respuesta3,
        string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {

            ClsDataSets.DS_TB_EMP objDataSet = new ClsDataSets.DS_TB_EMP();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_ENCUESTA_SEMANAL_EMPRESA_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_EMPRESA", IdEmpresa);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA1", Respuesta1);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA2", Respuesta2);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA3", Respuesta3);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);


                ObjAdapter.Fill(objDataSet, "TB_ENCUESTA_SEMANAL_EMPRESA");

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

        public DataQuery Actualizacion(int Id,string IdEmpresa,
            string Respuesta1, string Respuesta2, string Respuesta3,
            string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();

            try
            {

                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TB_ENCUESTA_SEMANAL_EMPRESA_INSERT";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = "SP_TB_ENCUESTA_SEMANAL_EMPRESA_UPDATE";
                        break;
                    case TipoActualizacion.Eliminar:
                        StrCommand = "SP_TB_ENCUESTA_SEMANAL_EMPRESA_DELETE";
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
                ObjCommand.Parameters.AddWithValue("@ID_EMPRESA", IdEmpresa);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA1", Respuesta1);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA2", Respuesta2);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA3", Respuesta3);
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