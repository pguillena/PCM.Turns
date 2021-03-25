using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;
using Video.Infraestructure.Implementation;

namespace Video.Entity
{
    public class VideoEntity
    {
        private SQLServer sqlServer;

        public VideoEntity()
        {
            sqlServer = new SQLServer();
            sVideoEntity = null;
        }
        public string sVideoEntity { get; set; }
        public bool Load()
        {
            try
            {
                sVideoEntity = (sqlServer.ReadOneValue("SELECT CodeService,Description FROM Service where State=1"));
                if (sVideoEntity != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<Entity.Video> Autocomplete() {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 7 }
                };
                var lista = (sqlServer.ReadValues<Entity.Video>("usp_ListarCombo", sp));
                return lista;

            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al consultar con la BD", ex);
            }
        }

        public List<Video> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,string strCboEstado,int strCboVideo)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},                  
                        new SqlParameter() {ParameterName = "@psiCboEstado", SqlDbType = SqlDbType.VarChar, Value=strCboEstado},
                        new SqlParameter() {ParameterName = "@psiCboVideo", SqlDbType = SqlDbType.Int, Value=strCboVideo}
                };
                var miLista = (sqlServer.ReadValues<Entity.Video>("usp_ListarVideo", sp));
                return miLista;              
            }
            catch (Exception ex) 
            {
                throw new Exception("Hubo un problema al consultar la Información",ex);
            }            
        }

        public Video Save(Video oVideo)
        {
            try
            {
                var id = -1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeVideo", SqlDbType = SqlDbType.Int, Value= oVideo.CodeVideo },
                        //new SqlParameter() {ParameterName = "@CodeTypeService", SqlDbType = SqlDbType.Int, Value= oVideo.CodeTypeService },
                        new SqlParameter() {ParameterName = "@VideoName", SqlDbType = SqlDbType.NVarChar, Value= oVideo.VideoName },
                        new SqlParameter() {ParameterName = "@VideoAdress", SqlDbType = SqlDbType.NVarChar, Value= oVideo.VideoAdress },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"},
                        new SqlParameter(){ ParameterName="@Route",SqlDbType=SqlDbType.NVarChar,Value=oVideo.Route}
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    //if (oVideo.CodeVideo != 0)
                    //{
                    //    id = sqlServer.Update("usp_ActualizarServicio", sp);
                    //    oVideo.CodeVideo = id;
                    //}
                    //else
                    //{
                        id = sqlServer.Save("usp_RegistrarVideo", sp);
                        //oVideo.CodeVideo = id;
                    //}
                    if (id > 0)
                    {
                        tx.Complete();
                        oVideo.Message = "Se registró satisfactoriamente";
                        oVideo.MessageCode = "OK";
                        oVideo.CodeVideo = id;

                    }
                    else
                    {
                        oVideo.Message = "No se pudo registrar";
                        oVideo.MessageCode = "ERR";
                        oVideo.CodeVideo = id;
                    }
                }
                return oVideo;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo registrar la información en la Bade de Datos.", ex);
            }
        }

        public Video Delete(Video oVideo) {
            try
            {
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = -1;
                    List<SqlParameter> sp = new List<SqlParameter>()
                    {
                            new SqlParameter() {ParameterName = "@CodeVideo", SqlDbType = SqlDbType.Int, Value= oVideo.CodeVideo }, 
                            new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                    };
                    id = sqlServer.Save("usp_EliminarVideo", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        oVideo.Message = "Se eliminó satisfactoriamente";
                        oVideo.MessageCode = "OK";
                        oVideo.CodeVideo = id;
                    }
                    else {
                        oVideo.Message = "No se pudo eliminar";
                        oVideo.MessageCode = "ERR";
                        oVideo.CodeVideo = id;
                    }
                    return oVideo;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo elimimar el registro de la Bade de Datos.", ex);
            }        
        }

        public Video Aprobar(Video oVideo)
        {
            try
            {
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = -1;
                    List<SqlParameter> sp = new List<SqlParameter>()
                    {
                            new SqlParameter() {ParameterName = "@CodeVideo", SqlDbType = SqlDbType.Int, Value= oVideo.CodeVideo },
                            new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                    };
                    id = sqlServer.Save("usp_AprobarVideo", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        oVideo.Message = "Se aprobó satisfactoriamente";
                        oVideo.MessageCode = "OK";
                        oVideo.CodeVideo = id;
                    }
                    else
                    {
                        oVideo.Message = "No se pudo aprobar";
                        oVideo.MessageCode = "ERR";
                        oVideo.CodeVideo = id;
                    }
                    return oVideo;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo elimimar el registro de la Bade de Datos.", ex);
            }
        }

        public List<Video> ListarVideoAprobado() {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 10 }
                };
                var lista = (sqlServer.ReadValues<Entity.Video>("usp_ListarCombo", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error al listar.", ex);
            }
        }
    }
}
