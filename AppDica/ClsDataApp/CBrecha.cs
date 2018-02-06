using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsDataSets;

namespace ClsDataApp
{
    public class CBrecha : CSqlvars
    {
        public CBrecha(string ConexionData)
        {
            _ConexionData = ConexionData;
        }
        public DS_TB_TEC Detalle(int IdPasantia,  int OpcionConsulta)
        {

            DS_TB_TEC objDataSet = new DS_TB_TEC();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_BRECHA_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);


                ObjAdapter.Fill(objDataSet, "BRECHA");

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
    }
}