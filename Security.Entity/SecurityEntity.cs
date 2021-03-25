using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;
using Security.Infraestructure.Implementation;

namespace Security.Entity
{
    public class SecurityEntity
    {
        private SQLServer sqlServer;

        public SecurityEntity()
        {
            sqlServer = new SQLServer();
            sSecurityEntity = null;
        }
        public string sSecurityEntity { get; set; }
        public bool Load()
        {
            return true;
        }

        public List<Usuario> ListarUsuarioLocal(int strPagDesde, int strPagHasta, string strField, string strOrder, string Credencial, string Clave)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@Credencial", SqlDbType = SqlDbType.NVarChar, Value=Credencial},
                        new SqlParameter() {ParameterName = "@Clave", SqlDbType = SqlDbType.NVarChar, Value=Clave}
                };
                var miLista = (sqlServer.ReadValues<Entity.Usuario>("usp_ListarUsuarioLocal", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al consultar la Información", ex);
            }
        }

    }
}
