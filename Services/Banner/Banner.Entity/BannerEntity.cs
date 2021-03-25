using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Transactions;
using Banner.Infraestructure.Implementation;


namespace Banner.Entity
{    public class BannerEntity:Common
    {
        private SQLServer sqlServer;
        private string sBannerValue;
        public BannerEntity()
        {
            sqlServer = new SQLServer();
            sBannerValue = null;
        }
        public string BannerValue
        {
            get { return sBannerValue; }
            set { sBannerValue = value; }
        }

        public int CodeBanner { get; set; }

        public string BannerName { get; set; }

        public string UserName { get; set; }

        public bool Load()
        {
            Infraestructure.Settings settings = new Infraestructure.Settings();

            //settings.Save();


            try
            {
                sBannerValue = (sqlServer.ReadOneValue("select CodeBanner,BannerName from banner where State=1;"));
                if (sBannerValue != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<BannerEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder)
        {   
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder}
                        //new SqlParameter() {ParameterName = "@psiTxtZona", SqlDbType = SqlDbType.NVarChar, Value=strtxtZona}
                };
                var miLista = (sqlServer.ReadValues<BannerEntity>("usp_ListarBanner", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<BannerEntity> CurrentRowBanner(int CodeBanner)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                     new SqlParameter() {ParameterName = "@FLAG", SqlDbType = SqlDbType.Int, Value=5},
                     new SqlParameter() {ParameterName = "@ID", SqlDbType = SqlDbType.Int,  Value=CodeBanner}
                };
                var miLista = (sqlServer.ReadValues<BannerEntity>("usp_CurrentRow", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto Solicitada.", ex);
            }
        }

        public BannerEntity Save(BannerEntity oBannerEntity)
        {
            try
            {
                var id = -1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@Description", SqlDbType = SqlDbType.NVarChar, Value= oBannerEntity.BannerName.Trim() },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" },
                        new SqlParameter() {ParameterName = "@CodeBanner", SqlDbType = SqlDbType.Int, Value= oBannerEntity.CodeBanner }
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    if (oBannerEntity.CodeBanner != 0)
                    {
                        id = sqlServer.Update("usp_ActualizarBanner", sp);
                        
                    }
                    else
                    {
                        id = sqlServer.Save("usp_RegistrarBanner", sp);
                      
                    }
                    if (id > 0)
                    {
                        tx.Complete();
                        oBannerEntity.Message = "Se registró satisfactoriamente";
                        oBannerEntity.MessageCode = "OK";
                        oBannerEntity.CodeBanner = id;
                    }
                    else
                    {
                        oBannerEntity.Message = "No se pudo registrar";
                        oBannerEntity.MessageCode = "ERR";
                        oBannerEntity.CodeBanner = id;
                    }
                }                    
                return oBannerEntity;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al guardar la información",ex);
            }
        }

        public BannerEntity Delete(BannerEntity oBannerEntity) {
            try
            {
                var id = 0;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeBanner", SqlDbType = SqlDbType.Int, Value= oBannerEntity.CodeBanner },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    id = sqlServer.Delete("usp_EliminarBanner", sp);                 

                    if (id > 0)
                    {
                        tx.Complete();
                        oBannerEntity.Message = "Se eliminó satisfactoriamente";
                        oBannerEntity.MessageCode = "OK";
                        oBannerEntity.CodeBanner = id;
                    }
                    else
                    {
                        oBannerEntity.Message = "No se pudo eliminar";
                        oBannerEntity.MessageCode = "ERR";
                        oBannerEntity.CodeBanner = id;
                    }
                }              
                    
                return oBannerEntity;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al eliminar",ex);
            }
        }

        public List<BannerEntity> Autocomplete()
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 9 }
                };
                var lista = (sqlServer.ReadValues<BannerEntity>("usp_ListarCombo", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al consultar la Información", ex);
            }
        }
    }
}
