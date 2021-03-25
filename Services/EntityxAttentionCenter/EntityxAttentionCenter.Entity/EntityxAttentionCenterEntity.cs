using EntityxAttentionCenter.Infraestructure.Implementation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;

namespace EntityxAttentionCenter.Entity
{
    public class EntityxAttentionCenterEntity
    {
        private SQLServer sqlServer;
        private string sEntityxAttentionCenterEntityValue;
        public EntityxAttentionCenterEntity()
        {
            sqlServer = new SQLServer();
            sEntityxAttentionCenterEntityValue = null;
        }
        public string Value
        {
            get { return sEntityxAttentionCenterEntityValue; }
            set { sEntityxAttentionCenterEntityValue = value; }
        }
        public bool Load()
        {
            Infraestructure.Settings settings = new Infraestructure.Settings();

            //settings.Save();


            try
            {
                sEntityxAttentionCenterEntityValue = (sqlServer.ReadOneValue("select CodeBanner,BannerName from banner where State=1;"));
                if (sEntityxAttentionCenterEntityValue != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<EntityAttentionCenter> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strCentroAtencion,string strIdComboActivo)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiCboCentroAtencion", SqlDbType = SqlDbType.Int, Value=strCentroAtencion},
                        new SqlParameter() {ParameterName = "@psiCboEstado", SqlDbType = SqlDbType.NVarChar, Value=strIdComboActivo}
                };
                var miLista = (sqlServer.ReadValues<EntityAttentionCenter>("usp_ListarEntidadCentroAtencion", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<EntityAttentionCenter> CurrentAttentionCenterEntity(int CodeAttentionCenter)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {                                      
                    new SqlParameter() {ParameterName = "@psCodeAttentionCenter", SqlDbType = SqlDbType.Int,  Value=CodeAttentionCenter}
                };
                var miLista = (sqlServer.ReadValues<EntityAttentionCenter>("usp_ListaDataCentroAtencionEntidad", sp));
                return miLista;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al consultar a la Base de Datos", ex);
            }
        }

        public EntityAttentionCenter Save(EntityAttentionCenter oEntityAttentionCenter) {
            try
            {
                DataTable tablaEntidad = new DataTable();
                tablaEntidad.Columns.Add("CodeEntity", typeof(int));
                for (int i = 0; i < oEntityAttentionCenter.Lista.Length; i++)
                {
                    tablaEntidad.Rows.Add(oEntityAttentionCenter.Lista[i]);
                }
                var id = 0;
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {                   
                    
                    List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= oEntityAttentionCenter.CodeAttentionCenter},
                        new SqlParameter() {ParameterName = "@TablaEntity", SqlDbType = SqlDbType.Structured, Value= tablaEntidad},
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" }
                    };                   

                    id = sqlServer.Save("usp_RegistrarCentroAtencionxEntidad", sp);
                    
                    if (id > 0)
                    {
                        tx.Complete();
                        oEntityAttentionCenter.Message = "Se registró satisfactoriamente";
                        oEntityAttentionCenter.MessageCode = "OK";
                        oEntityAttentionCenter.CodeAttentionCenter = id;
                    }
                    else
                    {
                        oEntityAttentionCenter.Message = "No se pudo registrar";
                        oEntityAttentionCenter.MessageCode = "ERR";
                        oEntityAttentionCenter.CodeAttentionCenter = id;
                    }
                }
                return oEntityAttentionCenter;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al guardar la Información", ex);
            }
        }


        public EntityAttentionCenter Delete(EntityAttentionCenter oEntityAttentionCenter)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeCodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= oEntityAttentionCenter.CodeAttentionCenter },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                { 
                     var id = sqlServer.DeleteOne("usp_EliminarCentroAtencionxEntidad", sp);
                    
                    if (id>0)
                    {
                        tx.Complete();
                        oEntityAttentionCenter.Message = "Se Eliminó satisfactoriamente";
                        oEntityAttentionCenter.CodeAttentionCenter = id;
                    }
                    else
                    {
                        oEntityAttentionCenter.Message = "No se pudo Eliminar";
                        oEntityAttentionCenter.MessageCode = "ERR";
                        oEntityAttentionCenter.CodeAttentionCenter = id;
                    }                
                }               
                return oEntityAttentionCenter;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar.", ex);
            }
        }
                       
    }
}
