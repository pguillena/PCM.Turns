using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;
using Entity.Infraestructure.Implementation;

namespace Entity.Entity
{
    public class EntityEntity:Common
    {
        private SQLServer sqlServer;
        private string sEntityValue;

        public EntityEntity()
        {
            sqlServer = new SQLServer();
            sEntityValue = null;
        }

        public string EntityValue
        {
            get { return sEntityValue; }
            set { sEntityValue = value; }
        }

        public int CodeEntity { get; set; }
        public string Description { get; set; }
        public string Abreviation { get; set; }
        public string State { get; set; }
        public string UrlLogo { get; set; }
        public string UserName { get; set; }

        public bool Load()
        {
            //Infraestructure.Settings settings = new Infraestructure.Settings();
            //settings.Save();
            try
            {
                sEntityValue = (sqlServer.ReadOneValue("select CodeEntity,Description,State from Entity where State=1"));
                if (sEntityValue != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }


        public List<EntityEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdDescripcion,string strIdComboActivo)
        {            
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psidDescripcion",SqlDbType = SqlDbType.Int,Value=strIdDescripcion},
                        new SqlParameter() {ParameterName = "@psiEstado", SqlDbType = SqlDbType.NVarChar, Value=strIdComboActivo},

                };
                var miLista = (sqlServer.ReadValues<EntityEntity>("usp_ListarEntidades", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<EntityEntity> GetRecord(int id)
        {            
            try {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                   new SqlParameter() {ParameterName = "@ID",  Value=id},
                   new SqlParameter() {ParameterName = "@FLAG",  Value=1}
                };
                var currentRow = (sqlServer.ReadValues<EntityEntity>("usp_CurrentRow", sp));
                return currentRow;               
            }
            catch (Exception ex) {
                throw new Exception(ex.Message);
            }
        }

            
        public EntityEntity Insert(EntityEntity oEntity)
        {       
            try
            {
                var id = -1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@Description", SqlDbType = SqlDbType.NVarChar, Value= oEntity.Description.Trim() },
                        new SqlParameter() {ParameterName = "@Abreviation", SqlDbType = SqlDbType.NVarChar, Value= oEntity.Abreviation.Trim() },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" },
                        new SqlParameter() {ParameterName = "@CodeEntity", SqlDbType = SqlDbType.Int, Value= oEntity.CodeEntity }
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {

                    if (oEntity.CodeEntity != 0)
                    {
                        id = sqlServer.Update("usp_ActualizarEntidad", sp);
                        //oEntity.CodeEntity = id;
                    }
                    else
                    {
                        id = sqlServer.InsertOne("usp_RegistrarEntidad", sp);
                        //oEntity.CodeEntity = id;
                    }
                    if (id > 0)
                    {
                        tx.Complete();
                        oEntity.Message = "Se registró satisfactoriamente";
                        oEntity.MessageCode = "OK";
                        oEntity.CodeEntity = id;
                    }
                    else
                    {
                        oEntity.Message = "No se pudo registrar";
                        oEntity.MessageCode = "ERR";
                        oEntity.CodeEntity = id;
                    }
                }               
                return oEntity;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error al registrar en la Base de Datos", ex);
            }
        }

        public EntityEntity Delete(EntityEntity oEntity)
        {   try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeEntity", SqlDbType = SqlDbType.Int, Value= oEntity.CodeEntity },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}               
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = sqlServer.DeleteOne("usp_EliminarEntidad", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        oEntity.Message = "Se eliminó satisfactoriamente";
                        oEntity.MessageCode = "OK";
                        oEntity.CodeEntity = id;
                    }
                    else
                    {
                        oEntity.Message = "No se pudo eliminar";
                        oEntity.MessageCode = "ERR";
                        oEntity.CodeEntity = id;
                    }  
                }                    
                return oEntity;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar.", ex);
            }
        }

        public List<EntityEntity> Autocomplete()
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 4 }
                };
                var lista = (sqlServer.ReadValues<EntityEntity>("usp_ListarCombo", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al consultar la Información", ex);
            }          
        }

        public List<EntityEntity> AutocompleteCentroA(int strCodeCentroAttention)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@codeCA", SqlDbType = SqlDbType.Int, Value= strCodeCentroAttention }
                };
                var lista = (sqlServer.ReadValues<EntityEntity>("usp_ListarEntidadCentroA", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al consultar la Información", ex);
            }
        }

        public List<EntityEntity> ListaEntityZone(int codeZone)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@codeZone", SqlDbType = SqlDbType.Int, Value= codeZone }
                };
                var lista = (sqlServer.ReadValues<EntityEntity>("usp_ListarEntidadZona", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al consultar la Información", ex);
            }
        }
    }
}
