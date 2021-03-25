using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;
using TicketType.Infraestructure.Implementation;

namespace TicketType.Entity
{
    public class TicketTypeEntity
    {
        private SQLServer sqlServer;
        private string sTicketTypeValue;
        public TicketTypeEntity()
        {
            sqlServer = new SQLServer();
            sTicketTypeValue = null;
        }

        //public string BannerValue
        //{
        //    get { return sTicketTypeValue; }
        //    set { sTicketTypeValue = value; }
        //}
        public bool Load()
        {            
            try
            {
                sTicketTypeValue = (sqlServer.ReadOneValue("select CodeBanner,BannerName from banner where State=1;"));
                if (sTicketTypeValue != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<Entity.TicketType> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strTipoTicket,int strPrioridad)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiTipoTicket", SqlDbType = SqlDbType.Int, Value=strTipoTicket},
                        new SqlParameter() {ParameterName = "@psiPrioridad", SqlDbType = SqlDbType.Int, Value=strPrioridad }
                };
                var miLista = (sqlServer.ReadValues<TicketType>("usp_ListarTipoTicket", sp));
                return miLista;

            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error al leer la base de datos",ex);
            }           
        }

        public List<TicketType> GetRecord(int CodeTicketType)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                   new SqlParameter() {ParameterName = "@ID",  Value=CodeTicketType},
                   new SqlParameter() {ParameterName = "@FLAG",  Value=7}
                };
                var currentRow = (sqlServer.ReadValues<Entity.TicketType>("usp_CurrentRow", sp));
                return currentRow;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error en la consulta de la Base de Datos",ex);
            }
        }


        public List<TicketType> AutocompleteTipoTicket() {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 8 }
                };
                var lista = (sqlServer.ReadValues<TicketType>("usp_ListarCombo", sp));
                return lista;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al consultar la Base de Datos",ex);
            }
        }


        public TicketType Save(TicketType oTicketType)
        {
            try
            {
                var id=-1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@Description", SqlDbType = SqlDbType.NVarChar, Value= oTicketType.Description.Trim() },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" },
                        new SqlParameter() {ParameterName = "@Priority", SqlDbType = SqlDbType.Int, Value= oTicketType.Priority },
                        new SqlParameter() {ParameterName = "@CodeTicketType", SqlDbType = SqlDbType.Int, Value= oTicketType.CodeTicketType},
                        new SqlParameter() {ParameterName = "@IsPreferential", SqlDbType = SqlDbType.Bit, Value= oTicketType.IsPreferential}
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    if (oTicketType.CodeTicketType != 0)
                    {
                        id = sqlServer.Update("usp_ActualizarTipoTicket", sp);
                        //oTicketType.CodeTicketType = id;
                    }
                    else
                    {
                        id = sqlServer.Save("usp_RegistrarTipoTicket", sp);                        
                    }                  
                    if (id > 0)
                    {
                        tx.Complete();
                        oTicketType.Message = "Se registró satisfactoriamente";
                        oTicketType.MessageCode = "OK";
                        oTicketType.CodeTicketType = id;

                    }
                    else
                    {
                        oTicketType.Message = "No se pudo registrar";
                        oTicketType.MessageCode = "ERR";
                        oTicketType.CodeTicketType = id;
                    }
                }                
                
                return oTicketType;

            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al guardar la información",ex);
            }
        }

        public TicketType Delete(TicketType oTicketType)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeTicketType", SqlDbType = SqlDbType.Int, Value= oTicketType.CodeTicketType },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = sqlServer.Delete("usp_EliminarTipoTicket", sp);
                   
                    if (id>0)
                    {
                        tx.Complete();
                        oTicketType.Message = "Se eliminó satisfactoriamente";
                        oTicketType.MessageCode = "OK";
                        oTicketType.CodeTicketType = id;
                    }
                    else
                    {
                        oTicketType.Message = "No se pudo eliminar";
                        oTicketType.MessageCode = "ERR";
                        oTicketType.CodeTicketType = id;
                    }
                }                   
                return oTicketType;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al eliminar", ex);
            }
        }


        public List<Entity.TicketType> GetTicketState(int strPagDesde, int strPagHasta, string strField, string strOrder, int strCodeTicketState)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiCodeTicketSate", SqlDbType = SqlDbType.Int, Value=strCodeTicketState}
                };
                var miLista = (sqlServer.ReadValues<TicketType>("usp_ListarTicketSate", sp));
                return miLista;

            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error al leer la base de datos", ex);
            }
        }

    }
}
