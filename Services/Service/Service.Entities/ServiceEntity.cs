using Service.Infraestructure.Implementation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using Service.Entity;
using System.Transactions;

namespace Service.Entities
{
   public class ServiceEntity:Common
    {
        private SQLServer sqlServer;

        public ServiceEntity()
        {
            sqlServer =new SQLServer();
            ServiceName = null;
        }

        //private string iServiceCode;
        //public string ServiceCode
        //{
        //    get { return iServiceCode; }
        //    set { iServiceCode = value; }
        //}

        #region atributos
        public string ServiceName { get; set; }
        public int CodeService { get; set; }
        public string Description { get; set; }
        public int CodeTypeService { get; set; }
        public string NameTypeService { get; set; }
        public string UserName { get; set; }

        #endregion


        public bool Load()
        {
            Infraestructure.Settings settings = new Infraestructure.Settings();
           //   settings.Save();
          try
            {
                ServiceName = (sqlServer.ReadOneValue("SELECT CodeService,Description FROM Service where State=1"));
                if (ServiceName != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<ServiceEntity> Search(string strField, string strOrder, int strPagDesde, int strPagHasta,string strServicio, int strIdTipoServicio)
        {
            try {               
                    List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta",  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn", Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiServicio", Value=strServicio},
                        new SqlParameter() {ParameterName = "@psiIdTipoServicio", Value=strIdTipoServicio} 
                };

                //var jj = @"select CodeEntity,Description from Entity where State=1";
                var miLista = (sqlServer.ReadValues<ServiceEntity>("usp_ListarServicios", sp));
                return miLista;

            }
            catch (Exception ex) {
                throw new Exception(ex.Message);
            }
        }

        public List<ServiceEntity> GetRecord(int id)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                   new SqlParameter() {ParameterName = "@ID",  Value=id},
                   new SqlParameter() {ParameterName = "@FLAG",  Value=2}
                };
                var currentRow = (sqlServer.ReadValues<ServiceEntity>("usp_CurrentRow", sp));
                return currentRow;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


        public ServiceEntity Save(ServiceEntity oServiceEntity)
        {
            try {
                var id = -1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeService", SqlDbType = SqlDbType.Int, Value= oServiceEntity.CodeService },
                        new SqlParameter() {ParameterName = "@CodeTypeService", SqlDbType = SqlDbType.Int, Value= oServiceEntity.CodeTypeService },
                        new SqlParameter() {ParameterName = "@Description", SqlDbType = SqlDbType.NVarChar, Value= oServiceEntity.Description },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}   
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    if (oServiceEntity.CodeService != 0)
                    {
                        id = sqlServer.Update("usp_ActualizarServicio", sp);
                        //oServiceEntity.CodeService = id;
                    }
                    else
                    {
                        id = sqlServer.Save("usp_RegistrarServicio", sp);
                        //oServiceEntity.CodeService = id;
                    }
                    if (id > 0)
                    {
                        tx.Complete();
                        oServiceEntity.Message = "Se registró satisfactoriamente";
                        oServiceEntity.MessageCode = "OK";
                        oServiceEntity.CodeService = id;

                    }
                    else
                    {
                        oServiceEntity.Message = "No se pudo registrar";
                        oServiceEntity.MessageCode = "ERR";
                        oServiceEntity.CodeService = id;
                    }
                }                                    
                return oServiceEntity;
            }
            catch (Exception ex) {
                throw new Exception("No se pudo registrar la información en la Bade de Datos.", ex);
            }
        }


        public ServiceEntity Delete(ServiceEntity oServiceEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeServicio", SqlDbType = SqlDbType.Int, Value= oServiceEntity.CodeService },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = sqlServer.DeleteOne("usp_EliminarSevicio", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        oServiceEntity.Message = "Se eliminó satisfactoriamente";
                        oServiceEntity.MessageCode = "OK";
                        oServiceEntity.CodeService = id;

                    }
                    else
                    {
                        oServiceEntity.Message = "No se pudo eliminar";
                        oServiceEntity.MessageCode = "ERR";
                        oServiceEntity.CodeService = id;
                    }
                }               
                return oServiceEntity;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar.", ex);
            }
        }

        public List<ServiceEntity> Autocomplete() {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 1 }
                };
                var lista = (sqlServer.ReadValues<ServiceEntity>("usp_ListarCombo", sp));
                return lista;
            }
            catch (Exception ex) {
                throw new Exception("Hubo un problema al consultar la Información",ex);
            }
        }

        public List<TypeService> SearchTypeService()
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 3 }
                };
                var miLista = (sqlServer.ReadValues<TypeService>("usp_ListarCombo", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
