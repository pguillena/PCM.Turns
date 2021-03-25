using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Zone.Infraestructure.Implementation;
using System.Transactions;

namespace Zone.Entity
{
    public class ZoneEntity
    {
        private SQLServer sqlServer;

        public ZoneEntity()
        {
            sqlServer = new SQLServer();           
            sZoneValue = null;
        }

        public string sZoneValue { get; set; }


        public bool Load()
        {           
            try
            {
                sZoneValue = (sqlServer.ReadOneValue("SELECT CodeService,Description FROM Service where State=1"));
                if (sZoneValue != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }


        public List<Zone> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strCbxCentroAtencion,string strtxtZona,int strCodeAttentionCenter,int strComboActivo)
        {
            string vzona = "";
            try
            {
                if (strtxtZona == null)
                {
                    vzona = "";
                }
                else
                {
                    vzona = strtxtZona;
                }
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiTxtZona", SqlDbType = SqlDbType.NVarChar, Value=vzona},
                        new SqlParameter() {ParameterName = "@psiCombo", SqlDbType = SqlDbType.NVarChar, Value=strComboActivo},
                        new SqlParameter() {ParameterName = "@psiCodeAttentionCenter", SqlDbType = SqlDbType.Int, Value=strCodeAttentionCenter}

                        
                };
                var miLista = (sqlServer.ReadValues<Zone>("usp_ListarZonas", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public Zone Save(Zone oZone) 
        {
            try {
                var id = -1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@Description", SqlDbType = SqlDbType.NVarChar, Value= oZone.ZoneName.Trim() },
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= oZone.CodeAttentionCenter},
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" },
                        new SqlParameter() {ParameterName = "@CodeZone", SqlDbType = SqlDbType.Int, Value= oZone.CodeZone }
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    if (oZone.CodeZone != 0)
                    {
                        id = sqlServer.Update("usp_ActualizarZona", sp);                     
                    }
                    else
                    {
                        id = sqlServer.Save("usp_RegistrarZona", sp);                      
                    }
                    if (id > 0)
                    {
                        tx.Complete();
                        oZone.Message = "Se registró satisfactoriamente";
                        oZone.MessageCode = "OK";
                        oZone.CodeZone = id;
                    }
                    else
                    {
                        oZone.Message = "No se pudo registrar";
                        oZone.MessageCode = "ERR";
                        oZone.CodeZone = id;
                    }
                }                    
                return oZone;

            } catch (Exception ex) {
                throw new Exception(ex.Message);
            }
        }

        public List<Entity.Zone> GetRecord(int CodeZone)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                     new SqlParameter() {ParameterName = "@FLAG", SqlDbType = SqlDbType.Int, Value=4},
                     new SqlParameter() {ParameterName = "@ID", SqlDbType = SqlDbType.Int,  Value=CodeZone}
                };
                var miLista = (sqlServer.ReadValues<Zone>("usp_CurrentRow", sp));
                return miLista;

            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar obtener la fila requerida.", ex);
            }
        }

        public Entity.Zone Delete(Entity.Zone oZone) {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeZone", SqlDbType = SqlDbType.Int, Value= oZone.CodeZone },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = sqlServer.Delete("usp_EliminarZona", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        oZone.Message = "Se eliminó satisfactoriamente";
                        oZone.MessageCode = "OK";
                        oZone.CodeZone = id;
                    }
                    else
                    {
                        oZone.Message = "No se pudo eliminar";
                        oZone.MessageCode = "ERR";
                        oZone.CodeZone = id;
                    }
                }
                return oZone;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al eliminar",ex);
            }
        }

        public List<Entity.Zone> Autocomplete()
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 5 }
                };
                var lista = (sqlServer.ReadValues<Entity.Zone>("usp_ListarCombo", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al consultar la Información", ex);
            }
        }


        public List<Entity.Zone> ListarZonaCentroAtencion(int CodeCenterAttention)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeCA", SqlDbType = SqlDbType.Int, Value= CodeCenterAttention }
                };
                var lista = (sqlServer.ReadValues<Entity.Zone>("usp_ListarZonaCentroA", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al consultar la Información", ex);
            }
        }

        public Zone SaveEntityZone(Entity.Zone oEntityZone)
        {
            try
            {
                DataTable tablaEntidad = new DataTable();
                tablaEntidad.Columns.Add("CodeEntity", typeof(int));
                for (int i = 0; i < oEntityZone.Lista.Length; i++)
                {
                    tablaEntidad.Rows.Add(oEntityZone.Lista[i]);
                }
                var id = 0;
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {

                    List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeZone", SqlDbType = SqlDbType.Int, Value= oEntityZone.CodeZone},
                        new SqlParameter() {ParameterName = "@TablaEntity", SqlDbType = SqlDbType.Structured, Value= tablaEntidad},
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" }
                    };

                    id = sqlServer.Save("usp_RegistrarEntidadZona", sp);

                    if (id > 0)
                    {
                        tx.Complete();
                        oEntityZone.Message = "Se registró satisfactoriamente";
                        oEntityZone.MessageCode = "OK";
                        oEntityZone.CodeZone = id;
                    }
                    else
                    {
                        oEntityZone.Message = "No se pudo registrar";
                        oEntityZone.MessageCode = "ERR";
                        oEntityZone.CodeZone = id;
                    }
                }
                return oEntityZone;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al guardar la Información", ex);
            }
        }


    }
}
