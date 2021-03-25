using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;
using EntidadxServicio.Infraestructure.Implementation;

namespace EntidadxServicio.Entity
{
    public class EntidadxServicioEntity
    {
        private SQLServer sqlServer;
        private string sEntidadxServicioValue;

        public EntidadxServicioEntity()
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

        public List<ServicioEntidad> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdEntidad,string strIdComboActivo)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiEntidad", SqlDbType = SqlDbType.Int, Value=strIdEntidad},
                        new SqlParameter() {ParameterName = "@psiCboEstado", SqlDbType = SqlDbType.Int, Value=strIdComboActivo}
                };
                var miLista = (sqlServer.ReadValues<ServicioEntidad>("usp_ListarServicioEntidad", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo obtener la lista de Entidad por Servicio.", ex);
            }
        }

        public ServicioEntidad Save(ServicioEntidad oServicioEntidad)
        {
            try
            {
                DataTable TablaServicio = new DataTable();
                TablaServicio.Columns.Add("CodeServicio", typeof(int));
                for (int i = 0; i < oServicioEntidad.Lista.Length; i++)
                {
                    TablaServicio.Rows.Add(oServicioEntidad.Lista[i]);
                }
                var id = 0;
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    //var lista = (oServicioEntidad.Lista.TrimEnd(',')).Split(',');
                    //for (int i = 0; i < oServicioEntidad.Lista.Length; i++)
                    //{
                    List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeEntity", SqlDbType = SqlDbType.Int, Value= oServicioEntidad.CodeEntity},
                        new SqlParameter() {ParameterName = "@TablaServicio", SqlDbType = SqlDbType.Structured, Value= TablaServicio},
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" }
                    };
                    id = sqlServer.Save("usp_RegistrarEntidadServicio", sp);
                    //}
                    if (id > 0)
                    {
                        tx.Complete();
                        oServicioEntidad.Message = "Se registró satisfactoriamente";
                        oServicioEntidad.MessageCode = "OK";
                        oServicioEntidad.CodeServiceEntity = id;
                    }
                    else
                    {
                        oServicioEntidad.Message = "No se pudo registrar";
                        oServicioEntidad.MessageCode = "ERR";
                        oServicioEntidad.CodeServiceEntity = id;
                    }
                }
                return oServicioEntidad;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al guardar la Información", ex);
            }
        }

        public ServicioEntidad Delete(ServicioEntidad oServicioEntidad)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeEntity", SqlDbType = SqlDbType.Int, Value= oServicioEntidad.CodeEntity },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = sqlServer.DeleteOne("usp_EliminarServicioxEntidad", sp);

                    if (id > 0)
                    {
                        tx.Complete();
                        oServicioEntidad.Message = "Se Eliminó satisfactoriamente";
                        oServicioEntidad.CodeEntity = id;
                    }
                    else
                    {
                        oServicioEntidad.Message = "No se pudo Eliminar";
                        oServicioEntidad.MessageCode = "ERR";
                        oServicioEntidad.CodeEntity = id;
                    }
                }
                return oServicioEntidad;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar.", ex);
            }
        }   

        public List<Entity.ServicioEntidad> CurrentEntityService(int CodeEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {                                      
                    new SqlParameter() {ParameterName = "@psCodeEntity", SqlDbType = SqlDbType.Int,  Value=CodeEntity}                    
                };
                var miLista = (sqlServer.ReadValues<ServicioEntidad>("usp_ListarEntidadxServicio", sp));
                return miLista;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al consultar a la Base de Datos",ex);
            }
        }

        public List<ServicioEntidad> ListEntityService() {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                     //new SqlParameter() {ParameterName = "@psbandera", SqlDbType = SqlDbType.Int,  Value=bandera},
                     //new SqlParameter() {ParameterName = "@piiMaxFilas", SqlDbType = SqlDbType.Int,  Value=pMaxRows},
                     //new SqlParameter() {ParameterName = "@psiEmpezarCon", SqlDbType = SqlDbType.VarChar,  Value=pName_startsWith}
                };
                var lista = (sqlServer.ReadValues<ServicioEntidad>("usp_ListaServiciosEntidades", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al listar",ex);
            }        
        }

        public List<ServicioEntidad> ListFilter(int CodeService,int CodeEntity) {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                    new SqlParameter() {ParameterName = "@psCodeService", SqlDbType = SqlDbType.Int,  Value=CodeService},
                    new SqlParameter() {ParameterName = "@psCodeEntity", SqlDbType = SqlDbType.Int,  Value=CodeEntity}
                };
                var lista = (sqlServer.ReadValues<ServicioEntidad>("usp_filtrarEntidadServicios", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al listar", ex);
            }
        }             

        public List<JQSelectBE> Autocomplete(int pMaxRows, string pName_startsWith)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@piiMaxFilas", SqlDbType = SqlDbType.Int, Value= pMaxRows },
                        new SqlParameter() {ParameterName = "@psiEmpezarCon", SqlDbType = SqlDbType.NVarChar, Value=pName_startsWith }                    
                };
                var currentRow = (sqlServer.ReadValues<JQSelectBE>("usp_Autocompletar", sp));
                return currentRow;

            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al leer la Base de Datos", ex);
            }
        }
    }
}
