using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;
using Window.Infraestructure.Implementation;

namespace Window.Entity
{
    public class WindowEntity
    {
        private SQLServer sqlServer;

        public WindowEntity()
        {
            sqlServer = new SQLServer();
            sWindowValue = null;
        }

        public string sWindowValue { get; set; }

        public bool Load()
        {
            try
            {
                sWindowValue = (sqlServer.ReadOneValue("SELECT CodeService,Description FROM Service where State=1"));
                if (sWindowValue != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }

        public List<Entity.Window> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strCboZona,int strCodeCenterAttention)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@psiCboZona", SqlDbType = SqlDbType.Int, Value=strCboZona},
                        new SqlParameter() {ParameterName = "@psiCboCentroAtencion", SqlDbType = SqlDbType.Int, Value=strCodeCenterAttention}
                };
                var miLista = (sqlServer.ReadValues<Entity.Window>("usp_ListarVentanilla", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo obtener la lista de ventanillas.", ex);
            }
        }

        public List<Entity.Window> Autocomplete()
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 6 }
                };
                var lista = (sqlServer.ReadValues<Entity.Window>("usp_ListarCombo", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al hacer la consulta a la BD",ex);
            }
        }

        public List<Entity.Window> GetRecord(int CodeWindow)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                   new SqlParameter() {ParameterName = "@ID",  Value=CodeWindow},
                   new SqlParameter() {ParameterName = "@FLAG",  Value=6}
                };
                var currentRow = (sqlServer.ReadValues<Entity.Window>("usp_CurrentRow", sp));
                return currentRow;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public Window Save(Window oWindow) {
            try
            {
                var id = -1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@Description", SqlDbType = SqlDbType.NVarChar, Value= oWindow.WindowName.Trim() },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin" },
                        new SqlParameter() {ParameterName = "@CodeWindow", SqlDbType = SqlDbType.Int, Value= oWindow.CodeWindow },
                        new SqlParameter() {ParameterName = "@CodeZone", SqlDbType = SqlDbType.Int, Value= oWindow.CodeZone},
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    if (oWindow.CodeWindow != 0)
                    {
                         id = sqlServer.Update("usp_ActualizarVentanilla", sp);
                        //oWindow.CodeWindow = id;
                    }
                    else
                    {
                         id = sqlServer.Save("usp_RegistrarVentanilla", sp);
                        //oWindow.CodeWindow = id;
                    }
                    if (id > 0)
                    {
                        tx.Complete();
                        oWindow.Message = "Se registró satisfactoriamente";
                        oWindow.MessageCode = "OK";
                        oWindow.CodeWindow = id;

                    }
                    else
                    {
                        oWindow.Message = "No se pudo registrar";
                        oWindow.MessageCode = "ERR";
                        oWindow.CodeWindow = id;
                    }
                }
                   
                return oWindow;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al guardar la Información",ex);
            }
        }

        public Window Delete(Window oWindow) {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeWindow", SqlDbType = SqlDbType.Int, Value= oWindow.CodeWindow },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = sqlServer.Delete("usp_EliminarWindow", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        oWindow.Message = "Se eliminó satisfactoriamente";
                        oWindow.MessageCode = "OK";
                        oWindow.CodeWindow = id;
                    }
                    else
                    {
                        oWindow.Message = "No se pudo eliminar";
                        oWindow.MessageCode = "ERR";
                        oWindow.CodeWindow = id;
                    }
                } 
                return oWindow;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al eliminar",ex);
            }

        }
    }
}
