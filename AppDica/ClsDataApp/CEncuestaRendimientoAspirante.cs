﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{
    public class CEncuestaRendimientoAspirante : CSqlvars
    {
        public CEncuestaRendimientoAspirante(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public ClsDataSets.DS_TB_EMP Detalle(int Id, int IdEmpresa, string Respuesta1, string Respuesta2,
            string Respuesta3, string Respuesta4, string Respuesta5, string Respuesta6, string Respuesta7, string Respuesta8, string Respuesta9,
           string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {
            ClsDataSets.DS_TB_EMP objDataSet = new ClsDataSets.DS_TB_EMP();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_ENCUESTA_EVALUACION_RENDIMIENTO_ASPIRANTE_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_EMPRESA", IdEmpresa);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA_1", Respuesta1);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA_2", Respuesta2);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA_3", Respuesta3);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA_4", Respuesta4);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA_5", Respuesta5);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA_6", Respuesta6);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA_7", Respuesta7);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA_8", Respuesta8);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_RESPUESTA_9", Respuesta9);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                ObjAdapter.Fill(objDataSet, "TB_ENCUESTA_EVALUACION_RENDIMIENTO_ASPIRANTE");

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
        public DataQuery Actualizacion(int Id, int IdEmpresa, string Respuesta1, string Respuesta2,
            string Respuesta3, string Respuesta4, string Respuesta5, string Respuesta6, string Respuesta7, string Respuesta8, string Respuesta9,
           string LoginUsuario, TipoActualizacion OpcionActualizacion)
        {
            DataQuery objResultado = new DataQuery();
            try
            {
                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TB_ENCUESTA_EVALUACION_RENDIMIENTO_ASPIRANTE_INSERT";
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

                if (OpcionActualizacion == TipoActualizacion.Adicionar)
                {
                    ObjParam = ObjCommand.Parameters.Add("@ID", SqlDbType.Int, 0);
                    ObjParam.Direction = ParameterDirection.Output;
                }
                else
                {
                    ObjCommand.Parameters.AddWithValue("@ID", Id);
                }
                ObjCommand.Parameters.AddWithValue("@ID_EMPRESA", IdEmpresa);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA_1", Respuesta1);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA_2", Respuesta2);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA_3", Respuesta3);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA_4", Respuesta4);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA_5", Respuesta5);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA_6", Respuesta6);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA_7", Respuesta7);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA_8", Respuesta8);
                ObjCommand.Parameters.AddWithValue("@DS_RESPUESTA_9", Respuesta9);
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