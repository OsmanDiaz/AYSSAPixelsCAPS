using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsDataSets;

namespace ClsDataApp
{
    public class CCurso : CSqlvars
    {
        public CCurso(string ConexionData)
        {
            _ConexionData = ConexionData;
        }

        public DS_TB_TEC DetalleEnca(int Id,string NombreCurso,string DescripcionCurso, int IdHabilidadConocimiento
            , int IdNivelConocimiento, int CantidadAspirantes, char Estado, string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {

            DS_TB_TEC objDataSet = new DS_TB_TEC();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_ENCA_CURSO_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_NOMBRE_CURSO", NombreCurso);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_DESCRIPCION_CURSO", DescripcionCurso);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_HABILIDAD_CONOCIMIENTO", IdHabilidadConocimiento);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_NIVEL_CONOCIMIENTO", IdNivelConocimiento);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@NM_CANTIDAD_ASPIRANTES", CantidadAspirantes);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_ESTADO", Estado);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);


                ObjAdapter.Fill(objDataSet, "TB_ENCA_CURSO");

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

        public DS_TB_TEC Detalle(int Id, int IdEncaCurso, string IdAspirante, float CalificacionFinal
           , string Observacion,  char Estado, string UsuaCrea, DateTime FechCrea, string UsuaActu, DateTime FechActu, int OpcionConsulta)
        {
            DS_TB_TEC objDataSet = new DS_TB_TEC();

            try
            {
                ObjConnection = new SqlConnection(_ConexionData);
                ObjAdapter = new SqlDataAdapter("SP_TB_DETA_CURSO_GetByAll", ObjConnection);
                ObjParam = new SqlParameter();
                ObjAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID", Id);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ENCA_CURSO", IdEncaCurso);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@ID_ASPIRANTE", IdAspirante);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@NM_CALIFICACION_FINAL", CalificacionFinal);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@DS_OBSERVACION", Observacion);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@CD_ESTADO", Estado);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_CREA", UsuaCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_CREA", FechCrea);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@USUA_ACTU", UsuaActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@FECH_ACTU", FechActu);
                ObjAdapter.SelectCommand.Parameters.AddWithValue("@OPCI_CONS", OpcionConsulta);


                ObjAdapter.Fill(objDataSet, "TB_DETA_CURSO");

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