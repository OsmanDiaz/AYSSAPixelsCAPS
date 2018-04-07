﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{
    public class COpciSistPerfil : CSqlvars
    {
        public COpciSistPerfil(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public ClsDataSets.DS_TBC_SIS Detalle(string IdPerfilUsuario, string IdCodiSist, string IdMenuSistema,
            string IdOpcionSistema, double CorrConfOpciSist, double CorrOpciSistPerfil,
            string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {
            ClsDataSets.DS_TBC_SIS objDataSet = new ClsDataSets.DS_TBC_SIS();
            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TBC_OPCI_SIST_PERFIL_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_PERFIL_USUARIO", IdPerfilUsuario);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_CODI_SIST", IdCodiSist);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_MENU_SISTEMA", IdMenuSistema);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_OPCION_SISTEMA", IdOpcionSistema);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@NM_CORR_CONF_OPCI_SIST", CorrConfOpciSist);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@NM_CORR_OPCI_SIST_PERFIL", CorrOpciSistPerfil);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                ObjAdapter.Fill(objDataSet, "TBC_OPCI_SIST_PERFIL");
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
         public DataQuery Actualizacion(string IdPerfilUsuario, string IdCodiSist, string IdMenuSistema,
            string IdOpcionSistema, double CorrConfOpciSist, double CorrOpciSistPerfil,
             int OpcionConsulta, string LoginUsuario, TipoActualizacion OpcionActualizacion)
         {
             DataQuery objResultado = new DataQuery();
            try
            {
                string StrCommand = "";

                switch (OpcionActualizacion)
                {
                    case TipoActualizacion.Adicionar:
                        StrCommand = "SP_TBC_OPCI_SIST_PERFIL_INSERT";
                        break;
                    case TipoActualizacion.Actualizar:
                        StrCommand = "SP_TBC_OPCI_SIST_PERFIL_UPDATE";
                        break;
                    case TipoActualizacion.Eliminar:
                        StrCommand = "SP_TBC_OPCI_SIST_PERFIL_DELETE";
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
                    ObjParam = ObjCommand.Parameters.Add("@ID_PERFIL_USUARIO", SqlDbType.Int, 0);
                    ObjParam.Direction = ParameterDirection.Output;
                }
                else
                {
                    ObjCommand.Parameters.AddWithValue("@ID_PERFIL_USUARIO", IdPerfilUsuario);
                }
                ObjCommand.Parameters.AddWithValue("@ID_CODI_SIST", IdCodiSist);
                ObjCommand.Parameters.AddWithValue("@ID_MENU_SISTEMA", IdMenuSistema);
                ObjCommand.Parameters.AddWithValue("@ID_OPCION_SISTEMA", IdOpcionSistema);
                ObjCommand.Parameters.AddWithValue("@NM_CORR_CONF_OPCI_SIST", CorrConfOpciSist);
                ObjCommand.Parameters.AddWithValue("@NM_CORR_OPCI_SIST_PERFIL", CorrOpciSistPerfil);
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

                objResultado.CodigoAuxiliar = (object)ObjCommand.Parameters["@ID_PERFIL_USUARIO"].Value;
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