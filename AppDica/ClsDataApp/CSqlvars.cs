using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using ClsInterface;

namespace ClsDataApp
{
    public class CSqlvars : IDisposable
    {
        protected SqlConnection ObjConnection;
        protected SqlDataAdapter ObjAdapter;
        protected SqlParameter ObjParam;
        protected SqlCommand ObjCommand;
        protected SqlDataReader ObjReader;
        protected string _ConexionData;

        public void Dispose()
        {
            if (ObjConnection.State != ConnectionState.Closed)
            {
                ObjConnection.Close();
            }

            ObjConnection = null;
            ObjAdapter = null;
            ObjParam = null;
            ObjCommand = null;
            ObjReader = null;
        }

    }
}