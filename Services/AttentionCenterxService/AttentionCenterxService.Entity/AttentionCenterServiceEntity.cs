using AttentionCenterxService.Infraestructure.Implementation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;

namespace AttentionCenterxService.Entity
{
    public class AttentionCenterServiceEntity
    {
        private SQLServer sqlServer;
        private string sEntidadxServicioValue;

        public AttentionCenterServiceEntity()
        {
            sqlServer = new SQLServer();
            sEntidadxServicioValue = null;
        }

        public bool Load()
        {
            //Infraestructure.Settings settings = new Infraestructure.Settings();
            //settings.Save();
            try
            {
                sEntidadxServicioValue = (sqlServer.ReadOneValue("select CodeEntity,Description,State from Entity where State=1"));
                if (sEntidadxServicioValue != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<ServiceAttentionCenter> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strIdCentroAtencion,string strIdComboActivo)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiCentroAtencion", SqlDbType = SqlDbType.Int, Value=strIdCentroAtencion},
                        new SqlParameter() {ParameterName = "@psiCboEstado", SqlDbType = SqlDbType.Int, Value=strIdComboActivo}
                };
                var miLista = (sqlServer.ReadValues<ServiceAttentionCenter>("usp_ListarCentroAtencionServicio", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo obtener la lista de Entidad por Servicio.", ex);
            }
        }

        public List<Entity> ListCurrentEntity(int CodeAttentionCenter)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pCodeAttentionCenter", SqlDbType = SqlDbType.Int,  Value=CodeAttentionCenter }                 
                };
                var miLista = (sqlServer.ReadValues<Entity>("usp_ListarComboEntidad", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo obtener la lista de Entidad.", ex);
            }
        }

        public List<AttentionCenterService> ListService(int CodeEntity,int CodeAttentionCenter)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pCodeEntity", SqlDbType = SqlDbType.Int,  Value=CodeEntity},
                        new SqlParameter() {ParameterName = "@pCodeAttentionCenter", SqlDbType = SqlDbType.Int,  Value=CodeAttentionCenter}
                };
                var miLista = (sqlServer.ReadValues<AttentionCenterService>("usp_ListarTablaServicios", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo obtener la lista de Entidad.", ex);
            }
        }

        public AttentionCenterService Save(AttentionCenterService oAttentionCenterService)
        {
            try
            {
                DataTable TablaServicioEntidad = new DataTable();
                TablaServicioEntidad.Columns.Add("CodeServiceEntity", typeof(int));
                for (int i = 0; i < oAttentionCenterService.Lista.Length; i++)
                {
                    TablaServicioEntidad.Rows.Add(oAttentionCenterService.Lista[i]);
                }
                var id = 0;
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {                    
                    List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= oAttentionCenterService.CodeAttentionCenter},
                        new SqlParameter() {ParameterName = "@CodeEntity", SqlDbType = SqlDbType.Int, Value= oAttentionCenterService.CodeEntity},
                        new SqlParameter() {ParameterName = "@TablaServicioEntidad", SqlDbType = SqlDbType.Structured, Value= TablaServicioEntidad},
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" }
                    };
                    id = sqlServer.Save("usp_RegistrarCentroAtencionServicio", sp);                   
                    if (id > 0)
                    {
                        tx.Complete();
                        oAttentionCenterService.Message = "Se registró satisfactoriamente";
                        oAttentionCenterService.MessageCode = "OK";
                        oAttentionCenterService.CodeServiceEntity = id;
                    }
                    else
                    {
                        oAttentionCenterService.Message = "No se pudo registrar";
                        oAttentionCenterService.MessageCode = "ERR";
                        oAttentionCenterService.CodeServiceEntity = id;
                    }
                }
                return oAttentionCenterService;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al guardar la Información", ex);
            }        
        }

        public AttentionCenterService Delete(AttentionCenterService oAttentionCenterService) 
        {
            try
            {
                var id = 0;
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= oAttentionCenterService.CodeAttentionCenter },
                        new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value= oAttentionCenterService.CodeServiceEntity },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                    };
                    id = sqlServer.Delete("usp_EliminarCentroAtencionServicios", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        oAttentionCenterService.Message = "Se eliminó satisfactoriamente";
                        oAttentionCenterService.MessageCode = "OK";
                        oAttentionCenterService.CodeServAttenCenter = id;
                    }
                    else
                    {
                        oAttentionCenterService.Message = "No se pudo registrar";
                        oAttentionCenterService.MessageCode = "ERR";
                        oAttentionCenterService.CodeServAttenCenter = id;
                    }
                    return oAttentionCenterService;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al eliminar.", ex);
            } 
        }
    }
}
