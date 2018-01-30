using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClsInterface
{
   public interface IAcciones
    {
        void Consultar();
        void Adicionar();
        void Modificar();
        void Eliminar();
        void Imprimir();
        void Limpiar();
    }

    [Serializable()]
    public class ClsSistema
    { 
          private string _Cusuario;
          private bool _Autenticado;
        private string _NombreUsuario;
        private string _CPerfilusuario;
        private string _PerfilUsuario;
        private DataQuery _ObjInfoData;
        private string _ConexionBaseDato;
        private string _NombreAplicacion;
        private string _NombreCortoAplicacion;
        private string _NombreAplicacionImpresion;
        private string _CodigoOpcionSistema;
        private string _NombreOpcionSistema;
        private string _DescripcionOpcionSistema;
        private string _RefrescaCamposenCarga;
        private string _CodigoEmpresa;
        private string _CodigoAnio;
        private string _CodigoMes;
        private string _NecesitaCodigoEmpresa;
        private string _NecesitaPeriodoContable;
        private string _ValidaPeriodoContable;
        private string _CodigoEmpresaDefecto;
        private string _EstadoUsuario;
        //private  _TipoAutenticacionSistema As TipoAutenticacion
        private string _CodigoInstancia;
        private string _NombreInstancia;

        private string _ServidorDeReportes;


        private string _ColorTextoSistema;
        private string _UnidadUsuaria;
        private string _ColorPrincipal;
        private string _ColorSecundario;
        private string _ColorAuxiliar;
        private string _ImagenSistema;


        public string NombreAplicacionImpresion{
            get
            {
                return _NombreAplicacionImpresion;
            }
            set
            {
                _NombreAplicacionImpresion = value;
            }

        }

        public string CodigoInstancia
        {
            get
            {
                return _CodigoInstancia;
            }
            set
            {
                _CodigoInstancia = value;
            }
        }

        public string NombreInstancia
        {
            get
            {
                return _NombreInstancia;
            }
            set
            {
                _NombreInstancia = value;
            }
        }

        public string ValidaPeriodoContable
        {
            get
            {
                return _ValidaPeriodoContable;
            }
            set
            {
                _ValidaPeriodoContable = value;
            }
        }



        public string EstadoUsuario
        {
            get
            {
                return _EstadoUsuario;
            }
            set
            {
                _EstadoUsuario = value;
            }
        }

        public string CPerfilusuario
        {
            get
            {
                return _CPerfilusuario;
            }
            set
            {
                _CPerfilusuario = value;
            }
        }

        public string PerfilUsuario
        {
            get
            {
                return _PerfilUsuario;
            }
            set
            {
                _PerfilUsuario = value;
            }
        }

        public string CodigoEmpresaDefecto
        {
            get
            {
                return _CodigoEmpresaDefecto;
            }
            set
            {
                _CodigoEmpresaDefecto = value;
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
        public string NecesitaCodigoEmpresa
        {
            get
            {
                return _NecesitaCodigoEmpresa;
            }
            set
            {
                _NecesitaCodigoEmpresa = value;
            }
        }

        public string NecesitaPeriodoContable
        {
            get
            {
                return _NecesitaPeriodoContable;
            }
            set
            {
                _NecesitaPeriodoContable = value;
            }
        }

        public string CodigoEmpresa
        {
            get
            {
                return _CodigoEmpresa;
            }
            set
            {
                _CodigoEmpresa = value;
            }
        }

        public string CodigoAnio
        {
            get
            {
                return _CodigoAnio;
            }
            set
            {
                _CodigoAnio = value;
            }
        }

        public string CodigoMes
        {
            get
            {
                return _CodigoMes;
            }
            set
            {
                _CodigoMes = value;
            }
        }

        public string RefrescaCamposenCarga
        {
            get
            {
                return _RefrescaCamposenCarga;
            }
            set
            {
                _RefrescaCamposenCarga = value;
            }
        }

        public string CodigoOpcionSistema
        {
            get
            {
                return _CodigoOpcionSistema;
            }
            set
            {
                _CodigoOpcionSistema = value;
            }
        }
        public string NombreOpcionSistema
        {
            get
            {
                return _NombreOpcionSistema;

            }
            set
            {
                _NombreOpcionSistema = value;
            }
        }
        public string NombreAplicacion
        {
            get
            {
                return _NombreAplicacion;
            }
            set
            {
                _NombreAplicacion = value;
            }
        }

        public string NombreCortoAplicacion
        {
            get
            {
                return _NombreCortoAplicacion;
            }
            set
            {
                _NombreCortoAplicacion = value;
            }
        }
        public string ConexionBaseDato
        {
            get
            {
                return _ConexionBaseDato;
            }
            set
            {
                _ConexionBaseDato = value;
            }
        }
        public string Cusuario
        {
            get
            {
                return _Cusuario;
            }
            set
            {
                _Cusuario = value;
            }
        }

        public bool Autenticado
        {
            get
            {
                return _Autenticado;
            }
            set
            {
                _Autenticado = value;
            }
        }
        public string NombreUsuario
        {
            get
            {
                return _NombreUsuario;

            }
            set
            {
                _NombreUsuario = value;
            }
        }


        public string ColorTextoSistema
        {
            get
            {
                return _ColorTextoSistema;
            }
            set
            {
                _ColorTextoSistema = value;
            }
        }

        public string UnidadUsuaria
        {
            get
            {
                return _UnidadUsuaria;
            }
            set
            {
                _UnidadUsuaria = value;
            }
        }

        public string ColorPrincipal
        {
            get
            {
                return _ColorPrincipal;
            }
            set
            {
                _ColorPrincipal = value;
            }
        }

        public string ColorSecundario
        {
            get
            {
                return _ColorSecundario;
            }
            set
            {
                _ColorSecundario = value;
            }
        }

        public string ColorAuxiliar
        {
            get
            {
                return _ColorAuxiliar;
            }
            set
            {
                _ColorAuxiliar = value;
            }
        }

        public string ImagenSistema
        {
            get
            {
                return _ImagenSistema;
            }
            set
            {
                _ImagenSistema = value;
            }
        }

        public string ServidorDeReportes
        {
            get
            {
                return _ServidorDeReportes;
            }
            set
            {
                _ServidorDeReportes = value;
            }
        }

        public DataQuery ObjInfoData {
            get{
                return _ObjInfoData;
            }
        }

        
        public ClsSistema()
        {
            _ObjInfoData = new DataQuery();
        }
    }

    [Serializable()]
    public class DataQuery
    {
        public decimal CodigoError;
        public string MensajeError;
        public DataSet ObjData;
        public bool Resultado;
        public object CodigoAuxiliar;
        public int FilasAfectadas;

        public DataQuery()
        {
            CodigoError = 0;
            FilasAfectadas = 0;
            MensajeError = "";
            CodigoAuxiliar = "";
            Resultado = false;
        }
    }

    public enum TipoActualizacion
    {
        Adicionar = 1,
        Actualizar = 2,
        Eliminar = 3,
        No_Definida = 4
    }
    }

