using ClsInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClsDataApp
{
    public class CCProyectoPasantia : CSqlvars
    {
        public CCProyectoPasantia(String ConexionData) {
            _ConexionData = ConexionData;
        }
        public ClsDataSets.DS_TB_EMP Detalle(int Id, int IdConsultoria, int IdEmpresa, string NombEntregable, string Descripcion, DateTime FechEntrega,
        string Duracion, char EstadoEntregable, string UrlEntregable, string ObservacionEntregable, string IdAspirante, string UsuaCrea,
        DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {
            ClsDataSets.DS_TB_EMP objDataSet = new ClsDataSets.DS_TB_EMP();
            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_CONSULTORIA_ENTREGABLE_PASANTIA", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_CONSULTORIA", IdConsultoria);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_EMPRESA", IdEmpresa);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_ENTREGABLE", NombEntregable);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DESCRIPCION_ENT", Descripcion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ENTREGA_ENT", FechEntrega);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DURACION_ENT", Duracion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_ESTADO_ENTREGABLE", EstadoEntregable);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@URL_ENTREGABLE", UrlEntregable);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_OBSERVACION_ENTREGABLE", ObservacionEntregable);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ASPIRANTE", IdAspirante);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);

                ObjAdapter.Fill(objDataSet, "TB_CONSULTORIA_ENTREGABLE");

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