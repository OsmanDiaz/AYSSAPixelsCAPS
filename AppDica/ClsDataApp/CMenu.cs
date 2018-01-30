using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsDataSets;

namespace ClsDataApp
{
    public class CMenu : CSqlvars
    {
        private string _ConexionData;
        private string _NombreForma;
        private string _DescripcionOpcionSistema;

         public CMenu(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

         public string NombreForma
         {
             get
             {
                 return _NombreForma;
             }
             set
             {
                 _NombreForma = value;
             }
         }

         public string DescripcionOpcionSistema
         {
             get
             {
                 return _DescripcionOpcionSistema;
             }
             set
             {
                 _DescripcionOpcionSistema = value;
             }
         }

         public void DetalleOpcion(string CodigoOpcion, string DescripcionOpcion, int OpcionConsulta)
         {
             try
             {
                 ObjConnection = new SqlConnection(_ConexionData);
                 ObjCommand = new SqlCommand("PRAL_DATA_GLB_OPCIONES_SISTEMA", ObjConnection);
                 //ObjParam = new SqlParameter;
                 ObjCommand.CommandType = CommandType.StoredProcedure;

                 ObjCommand.Parameters.AddWithValue("@CD_CODI_OPCI_SIST", CodigoOpcion);
                 ObjCommand.Parameters.AddWithValue("@DS_CODI_OPCI_SIST", DescripcionOpcion);
                 ObjCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                 ObjConnection.Open();

                 SqlDataReader objReader = ObjCommand.ExecuteReader();

                 while (objReader.Read())
                 {
                     _NombreForma = objReader.GetString(objReader.GetOrdinal("DS_NOMBRE_FORMA"));
                     _DescripcionOpcionSistema = objReader.GetString(objReader.GetOrdinal("DS_CODI_OPCI_SIST"));
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
         }

         public DataSet DetalleOpciones(string CodigoUsuario, string Menu, string SubMenu, string Pantalla, int OpcionConsulta)
         {
             DataSet objDataset = new DataSet();
             try
             {
                 ObjConnection = new SqlConnection(_ConexionData);
                 ObjAdapter = new SqlDataAdapter("SP_TB_OPCION_USUARIO", ObjConnection);
                 ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                 ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_USUARIO", CodigoUsuario);
                 ObjAdapter.SelectCommand.Parameters.AddWithValue("@MENU", Menu);
                 ObjAdapter.SelectCommand.Parameters.AddWithValue("@SUBMENU", SubMenu);
                 ObjAdapter.SelectCommand.Parameters.AddWithValue("@PANTALLA", Pantalla);
                 ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                 ObjAdapter.Fill(objDataset);

                 ObjConnection.Close();

                 if (ObjConnection.State != ConnectionState.Closed)
                 {
                     ObjConnection.Close();
                 }
             }
             catch (Exception ex)
             {
                 System.ApplicationException appEx = new System.ApplicationException(ex.Message);
                 throw appEx;
             }
             return objDataset;
         }

         public DS_TBC_SIS Detalle(string CodigoForma, string DescripcionForma, int OpcionConsulta)
         {
             DS_TBC_SIS objDataSet = new DS_TBC_SIS();

             try
             {

                 ObjConnection = new SqlConnection(_ConexionData);
                 ObjAdapter = new SqlDataAdapter("PRAL_DATA_GLB_OPCIONES_SISTEMA", ObjConnection);
                 ObjParam = new SqlParameter();
                 ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                 ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_CODI_OPCI_SIST", CodigoForma);
                 ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_CODI_OPCI_SIST", DescripcionForma);
                 ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);


                 ObjAdapter.Fill(objDataSet, "GLB_OPCIONES_SISTEMA");

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