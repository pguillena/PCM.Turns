using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;
using Ticket.Infraestructure.Implementation;

namespace Ticket.Entity
{
    public class TicketEntity
    {
        private SQLServer sqlServer;
        private string sTicketValue;
        public TicketEntity()
        {
            sqlServer = new SQLServer();
            sTicketValue = null;
        }
      
        public bool Load()
        {
            try
            {
                sTicketValue = (sqlServer.ReadOneValue("select CodeBanner,BannerName from banner where State=1;"));
                if (sTicketValue != null)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", ex);
            }
        }
        public List<Ticket> ConsultaCita(int CodeAttentionCenter, string ndoc)
        {
            string vdoc = "";
            try
            { 
                if (ndoc == null)
            {
                    vdoc = "";
                }
                else
                {

                    vdoc = ndoc;
                }
            
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@IdCenterAttention", SqlDbType = SqlDbType.Int,  Value=5},
                        new SqlParameter() {ParameterName = "@ndoc",SqlDbType = SqlDbType.NVarChar, Value=vdoc},

                };
                var miLista = (sqlServer.ReadValues<Ticket>("us_listar_cita_ca", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }

        public List<Ticket> ListarTicket() {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int,  Value=5}
                };
                var miLista = (sqlServer.ReadValues<Ticket>("usp_ListarTicket", sp));
                return miLista;
            }
            catch (Exception ex) { 
                throw new Exception("Hubo un error al Listar ticket",ex);
            }
        }

        public Ticket SaveTicket(Ticket oTicket) {
            try
            {
                DataTable TablaServiceEntity = new DataTable();
                TablaServiceEntity.Columns.Add("CodeServiceEntity", typeof(Int32));
                for (int i = 0; i < oTicket.listaTicket.Count; i++)
                {                    
                    TablaServiceEntity.Rows.Add(oTicket.listaTicket[i].CodeServiceEntity);
                }
                var id = -1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                    new SqlParameter() {ParameterName = "@NroDoc", SqlDbType = SqlDbType.NVarChar, Value=oTicket.NroDoc },
                    new SqlParameter() {ParameterName = "@TipoDoc", SqlDbType = SqlDbType.Int, Value=oTicket.TipoDoc },
                    new SqlParameter() {ParameterName = "@DatosPersonales", SqlDbType = SqlDbType.NVarChar, Value=oTicket.NombreCompleto },
                    new SqlParameter() {ParameterName = "@CodeTicketType", SqlDbType = SqlDbType.Int, Value=oTicket.CodeTicketType },
                    new SqlParameter() {ParameterName = "@TablaServiceEntity", SqlDbType = SqlDbType.Structured, Value= TablaServiceEntity },
                    new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= oTicket.UserName},
                    new SqlParameter() {ParameterName = "@PersonId", SqlDbType = SqlDbType.Int, Value= oTicket.PersonId},
                    new SqlParameter() {ParameterName = "@Direccion", SqlDbType = SqlDbType.NVarChar, Value= oTicket.Direccion},
                    new SqlParameter() {ParameterName = "@EstadoCivil", SqlDbType = SqlDbType.NVarChar, Value= oTicket.EstadoCivil}
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    //if (oTicket.CodeTicket != 0)
                    //{                      
                        id = sqlServer.Save("usp_RegistrarTicket", sp);
                    //}
                    if (id > 0)
                    {
                        tx.Complete();
                        oTicket.Message = "Se registró satisfactoriamente";
                        oTicket.MessageCode = "OK";
                        oTicket.CodeTicket = id;
                    }
                    else
                    {
                        oTicket.Message = "No se pudo registrar";
                        oTicket.MessageCode = "ERR";
                        oTicket.CodeTicket = id;
                    }
                }

                return oTicket;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error al guardar el ticket.", ex);
            }        
        }

        public List<Ticket> ReportTicket(int CodeTicket) {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeTicket", SqlDbType = SqlDbType.Int,  Value=CodeTicket}
                };
                var miLista = (sqlServer.ReadValues<Ticket>("usp_ReportTicket", sp));
                return miLista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error al Listar ticket", ex);
            }
        }

        public Ticket ObtenerTicket(Ticket oTicket) {
            try
            {
                var obTicket = new Ticket();
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@PersonId", SqlDbType = SqlDbType.Int,  Value=oTicket.PersonId},
                        new SqlParameter() {ParameterName = "@UserName", SqlDbType = SqlDbType.NVarChar,  Value=oTicket.UserName}
                };
                var listTicket = (sqlServer.ReadValues<Ticket>("usp_ObtenerTicket", sp));
                //obTicket = listTicket[0];
                if (listTicket.Count>0)
                {
                    obTicket.TicketName = listTicket[0].TicketName;
                    obTicket.Nombre = listTicket[0].Nombre;
                    obTicket.WindowName = listTicket[0].WindowName;
                    obTicket.CodeTicket = listTicket[0].CodeTicket;
                }
                
                return obTicket;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error al obtener Ticket",ex);
            }
        }

        public List<ServiceTicket> ListarServiciosTicket(Ticket oTicket) {
            try
            {
                var obTicket = new Ticket();
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeTicket", SqlDbType = SqlDbType.Int,  Value=oTicket.CodeTicket},
                        new SqlParameter() {ParameterName = "@PersonId", SqlDbType = SqlDbType.Int,  Value=oTicket.PersonId},
                        new SqlParameter() {ParameterName = "@UserName", SqlDbType = SqlDbType.NVarChar,  Value=oTicket.UserName}

                };
                var listTicket = (sqlServer.ReadValues<ServiceTicket>("usp_ListarServiciosTicket", sp));
                               
                return listTicket;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error al listar los servicios",ex);
            }
        }

        public int SaveServiciosTicket(ServiceTicket oServiceTicket) {

            try
            {
                var CodeTicket = 0;
                DataTable TablaService = new DataTable();
                TablaService.Columns.Add("CodeEntity", typeof(int));
                TablaService.Columns.Add("CodeService", typeof(int));
                TablaService.Columns.Add("CodeAtendido", typeof(bool));
                for (int i = 0; i < oServiceTicket.listaTicket.Count; i++)
                {
                    DataRow Row1;
                    Row1 = TablaService.NewRow();
                    Row1["CodeEntity"] = oServiceTicket.listaTicket[i].CodeEntity;
                    Row1["CodeService"] = oServiceTicket.listaTicket[i].CodeService;
                    Row1["CodeAtendido"] = oServiceTicket.listaTicket[i].CodeAtendido;
                    TablaService.Rows.Add(Row1);      
                }
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeTicket", SqlDbType = SqlDbType.NVarChar, Value=oServiceTicket.CodeTicket },
                        new SqlParameter() {ParameterName = "@TablaServicio", SqlDbType = SqlDbType.Structured, Value= TablaService},
                        new SqlParameter() {ParameterName = "@UserName", SqlDbType = SqlDbType.NVarChar, Value=oServiceTicket.UserName},
                        new SqlParameter() {ParameterName = "@PersonId", SqlDbType = SqlDbType.Int, Value=oServiceTicket.PersonId}

                    };

                    var id = sqlServer.Save("usp_RegistrarServiciosTicket", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        //oServiceTicket.Message = "Se registró satisfactoriamente";
                        //oServiceTicket.MessageCode = "OK";
                        CodeTicket = id;
                    }
                    else {
                        //oServiceTicket.Message = "No se pudo registrar";
                        //oServiceTicket.MessageCode = "ERR";
                        CodeTicket = id;
                    }
                }
                return CodeTicket;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al listar",ex);
            }
        }


        public List<Ticket> ListarTicketAtendidos(string UserName) {
            try
            {
                var obTicket = new Ticket();
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                    new SqlParameter() {ParameterName = "@UserName", SqlDbType = SqlDbType.NVarChar,  Value=UserName}
                };
                var listTicket = (sqlServer.ReadValues<Ticket>("usp_ListarTicketAtendidos", sp));

                return listTicket;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al listar",ex); ;
            }
            
        }

        public int AbandonoTicket(Ticket oTicket) {
            try
            {
                var obTicket = new Ticket();
                var id = 0;
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeTicket", SqlDbType = SqlDbType.Int,  Value=oTicket.CodeTicket},
                        new SqlParameter() {ParameterName = "@UserName", SqlDbType = SqlDbType.NVarChar,  Value=oTicket.UserName},
                        new SqlParameter() {ParameterName = "@PersonId", SqlDbType = SqlDbType.Int,  Value=oTicket.PersonId}


                    };
                    id = sqlServer.Save("usp_AbandonoTicket", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        //oServiceTicket.Message = "Se registró satisfactoriamente";
                        //oServiceTicket.MessageCode = "OK";                       
                    } 
                }   
                return id;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al guardar la Información",ex);
            }

        }

        public int TicketPendientexAtender(Ticket oTicket) 
        {
            try
            {    
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                    new SqlParameter() {ParameterName = "@PersonId", SqlDbType = SqlDbType.Int,  Value=oTicket.PersonId},
                    new SqlParameter() {ParameterName = "@UserName", SqlDbType = SqlDbType.NVarChar,  Value=oTicket.UserName}
                };
                var id = sqlServer.Save("usp_CantidadTicketXatender", sp);  
                return id;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al guardar la Información", ex);
            }
        }

        public List<Ticket> ListarTicketGenerados(int PersonId,int IdPeople,int IdEstado) {
            try
            {
                
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                    new SqlParameter() {ParameterName = "@PersonId", SqlDbType = SqlDbType.Int,  Value=PersonId},
                    new SqlParameter() {ParameterName = "@IdPeople", SqlDbType = SqlDbType.Int,  Value=IdPeople},
                    new SqlParameter() {ParameterName = "@IdEstado", SqlDbType = SqlDbType.Int,  Value=IdEstado}

                };
                var listTicket = (sqlServer.ReadValues<Ticket>("usp_ListarTicketGenerados", sp));

                return listTicket;
            }
            catch (Exception ex)
            {

                throw new Exception("Hubo un problema al listar", ex); ;
            }

        }

        public List<Ticket> AutoCompletePeople() {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@flag", SqlDbType = SqlDbType.Int, Value= 11 }
                };
                var lista = (sqlServer.ReadValues<Ticket>("usp_ListarCombo", sp));
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un problema al consultar la Información", ex);
            }
        }
    }
}
