using AttentionCenter.Infraestructure.Implementation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;

namespace AttentionCenter.Entity
{
    public class AttentionCenterEntity
    {
        private SQLServer sqlServer;
        private string sAttentionCenterValue;

        public AttentionCenterEntity()
        {
            sqlServer = new SQLServer();
            sAttentionCenterValue = null;
        }

        public string AttentionCenterValue
        {
            get { return sAttentionCenterValue; }
            set { sAttentionCenterValue = value; }
        }

        //public int CodeAttentionCenter { get; set; }
        //public string Description { get; set; }

        //public string CodeGeoLocation { get; set; }

        //public string State { get; set; }

        public bool Load()
        {
            //Infraestructure.Settings settings = new Infraestructure.Settings();
            //settings.Save();
            try
            {
                sAttentionCenterValue = (sqlServer.ReadOneValue("SELECT CodeActivity FROM Activity;"));
                if (sAttentionCenterValue != null)
                    return true;
                return false;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }

        public List<CenterAttention> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strCbxCentroAtencion,string strIdComboActivo)
        {            
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiCbxCentroAtencion", SqlDbType = SqlDbType.Int, Value=strCbxCentroAtencion},
                        new SqlParameter() {ParameterName = "@psiEstado", SqlDbType = SqlDbType.NVarChar, Value=strIdComboActivo}

                        
                };
                var miLista = (sqlServer.ReadValues<CenterAttention>("usp_ListarCentroAtencion", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }

        }

        public List<CenterAttention> GetRecord(int codeAttentionCenter)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                     new SqlParameter() {ParameterName = "@FLAG", SqlDbType = SqlDbType.Int, Value=3},
                     new SqlParameter() {ParameterName = "@ID", SqlDbType = SqlDbType.Int,  Value=codeAttentionCenter}
                };
                var miLista = (sqlServer.ReadValues<CenterAttention>("usp_CurrentRow", sp));
                return miLista;

            } catch (Exception ex) {
                throw new Exception("No se pudo cargar obtener la fila requerida.", ex);
            }
        }

        public CenterAttention Save(CenterAttention oCenterAttention) {
            try {
                var id = -1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@Description", SqlDbType = SqlDbType.NVarChar, Value= oCenterAttention.Description.Trim() },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" },
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.NVarChar, Value= oCenterAttention.CodeAttentionCenter }
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    if (oCenterAttention.CodeAttentionCenter != 0)
                    {
                        id = sqlServer.Update("usp_ActualizarCentroAtencion", sp);                       
                    }
                    else
                    {
                        id = sqlServer.Save("usp_RegistrarCentroAtencion", sp);                       
                    }
                    if (id > 0)
                    {
                        tx.Complete();
                        oCenterAttention.Message = "Se registró satisfactoriamente";
                        oCenterAttention.MessageCode = "OK";
                        oCenterAttention.CodeAttentionCenter = id;
                    }
                    else
                    {
                        oCenterAttention.Message = "No se pudo registrar";
                        oCenterAttention.MessageCode = "ERR";
                        oCenterAttention.CodeAttentionCenter = id;
                    }
                }                
                return oCenterAttention;

            } catch (Exception ex)
            {
                throw new Exception("No se pudo guardar en la base de datos.", ex);
            }
        }

        public CenterAttention DeleteOne(CenterAttention oCenterAttention)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {                   
                     new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int,  Value=oCenterAttention.CodeAttentionCenter},
                     new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}

                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var respuesta = (sqlServer.DeleteOne("usp_EliminarCentroAtencion", sp)); 
                    if (respuesta > 0)
                    {
                        tx.Complete();
                        oCenterAttention.Message = "Se eliminó satisfactoriamente";
                        oCenterAttention.MessageCode = "OK";
                        oCenterAttention.CodeAttentionCenter = respuesta;

                    }
                    else
                    {
                        oCenterAttention.Message = "No se pudo eliminar";
                        oCenterAttention.MessageCode = "ERR";
                        oCenterAttention.CodeAttentionCenter = respuesta;
                    }
                }               
                return oCenterAttention;

            } catch (Exception ex) {
                throw new Exception("No se pudo eliminar la fila seleccionada.", ex);
            }
        }

        public List<CenterAttention> Autocomplete() {
            try {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 2 }
                };  
                var lista = (sqlServer.ReadValues<CenterAttention>("usp_ListarCombo", sp));
                return lista;
            } catch (Exception ex) {
                throw new Exception("Hubo un problema al consultar la Informacion",ex);
            }
        }
    }
}
