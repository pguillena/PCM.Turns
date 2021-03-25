using BannerxZone.Infraestructure.Implementation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;

namespace BannerxZone.Entity
{
    public class BannerxZoneEntity
    {
        private SQLServer sqlServer;
        private string sBannerxZoneValue;
        public BannerxZoneEntity()
        {
            sqlServer = new SQLServer();
            sBannerxZoneValue = null;
        }

        public bool Load()
        {
            Infraestructure.Settings settings = new Infraestructure.Settings();
            //   settings.Save();
            try
            {
                //ServiceName = (sqlServer.ReadOneValue("SELECT CodeService,Description FROM Service where State=1"));
                if (sBannerxZoneValue != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<BannerZone> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdCentroAtencion, string strIdComboActivo)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiCbxCentroAtencion", SqlDbType = SqlDbType.Int, Value=strIdCentroAtencion},
                        new SqlParameter() {ParameterName = "@psiCboEstado", SqlDbType = SqlDbType.VarChar, Value=strIdComboActivo}
                };
                var miLista = (sqlServer.ReadValues<BannerZone>("usp_ListarBannerxZone", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo obtener la lista de Entidad por Servicio.", ex);
            }
        }

        public List<BannerZone> CurrentBannerAttentionCenter(int CodeAttentionCenter)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@psCodeAttentionCenter", SqlDbType = SqlDbType.Int,  Value=CodeAttentionCenter}               
                };
                var miLista = (sqlServer.ReadValues<BannerZone>("usp_ListarZonexAttentionCenter", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo obtener la lista.", ex);
            }
        }

        public BannerZone Save(BannerZone oBannerZone)
        {
            try
            {
                DataTable TablaBanner = new DataTable();
                TablaBanner.Columns.Add("CodeBanner", typeof(int));
                for (int i = 0; i < oBannerZone.Lista.Length; i++)
                {
                    TablaBanner.Rows.Add(oBannerZone.Lista[i]);
                }
                var id = 0;
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    List<SqlParameter> sp = new List<SqlParameter>()
                    {                       
                        new SqlParameter() {ParameterName = "@CodeZone", SqlDbType = SqlDbType.Int, Value= oBannerZone.CodeZone},
                        new SqlParameter() {ParameterName = "@TablaBanner", SqlDbType = SqlDbType.Structured, Value= TablaBanner},
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" }
                    };
                    id = sqlServer.Save("usp_RegistrarBannerxZona", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        oBannerZone.Message = "Se registró satisfactoriamente";
                        oBannerZone.MessageCode = "OK";
                        oBannerZone.CodeBannerZone = id;
                    }
                    else
                    {
                        oBannerZone.Message = "No se pudo registrar";
                        oBannerZone.MessageCode = "ERR";
                        oBannerZone.CodeBannerZone = id;
                    }
                }
                return oBannerZone;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al guardar la Información", ex);
            }
        }

        public List<BannerZone> ListBannerxAttentionCenter(int CodeZone) 
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {                     
                   new SqlParameter() {ParameterName = "@psCodeZone", SqlDbType = SqlDbType.Int,  Value=CodeZone}
                };
                var miLista = (sqlServer.ReadValues<BannerZone>("usp_ListarBannerxAttentionCenter",sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo obtener la lista.", ex);
            }
        }
    }
}
