using Appointment.Infraestructure.Implementation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;

namespace Appointment.Entity
{
    public class AppointmentEntity
    {
        private SQLServer sqlServer;
        private string sAppointmentValue;

        public AppointmentEntity()
        {
            sqlServer = new SQLServer();
            sAppointmentValue = null;

        }


        public string AppointmentValue
        {
            get { return sAppointmentValue; }
            set { sAppointmentValue = value; }
        }
        //Entidades para citas
        public int CodeActivity { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public string DescriptionActivity { get; set; }
        public string ActivityDate { get; set; }
        public int StartQuota { get; set; }
        public int EndQuota { get; set; }
        public int Quota { get; set; }
        public bool Available { get; set; }
        public int RowNumber { get; set; }
        public int CodePeople { get; set; }
        public int CodeSchedule { get; set; }
        public int CodeServAttenCenter { get; set; }
        public int CodetypeAttention { get; set; }
        public string DescriptionChannelTypeAttention { get; set; }
        public int CodeChannelTypeAttention { get; set; }
        public int CodeUser { get; set; }
        public int CodePayment { get; set; }
        public int CodeAppointment { get; set; }
        public int CodeState { get; set; }
        public string AppointmentDate { get; set; }
        public int CodeEntity { get; set; }
        public string DescriptionEntity { get; set; }
        public string ndoc{ get; set; }

        public string DescriptionName { get; set; }
        public string DescriptionSchedule { get; set; }
        public int CodeDocumentType { get; set; }
        public string DescriptionDocumentType { get; set; }
        public int Intervalo { get; set; }
        public string FechaInicio { get; set; }
        public string FechaFin { get; set; }
        public int NroCitas { get; set; }
        public int DayNumber { get; set; }

        public int CodeServiceEntity { get; set; }
        public int CodeReservationType { get; set; }
        public string AppointmentDateBegin { get; set; }
        public string AppointmentDateEnd { get; set; }
        public string  strIdComboActivo { get; set; }

        //Entidades para Tipo Servicio
        public int CodeService { get; set; }
        public int resultado { get; set; }
        public string DescriptionService { get; set; }

        //Entidades para Centro de Atencion
        public int CodeAttentionCenter { get; set; }
        public string DescriptionAttentionCenter { get; set; }
        public string CodeTypeDocument { get; set; }
        public string NumberDocument { get; set; }
        public string Dni { get; set; }
        public string FirstName { get; set; }
        public string FirstLastName { get; set; }
        public string SecondLastName { get; set; }
        public string DescriptionPeople { get; set; }
        public string DescriptionReservationType { get; set; }
        

        public string Email { get; set; }
        public string Telephone { get; set; }
        public int Response { get; set; }
        public string RegistryUser { get; set; }
        public string RegistryDate { get; set; }
        public string MessageCode { get; set; }
        public string Message { get; set; }
        public int CodeEntityAttentionCenter { get; set; }

        public string Quota1 { get; set; }
        public string Quota2 { get; set; }
        public string Quota3 { get; set; }
        public string Quota4 { get; set; }
        public string Quota5 { get; set; }
        public string Quota6 { get; set; }
        public string Quota7 { get; set; }

        
        public string Item { get; set; }
        public string Ciudadano { get; set; }
        public string Documento { get; set; }
        public string Horario { get; set; }
        public string CentroAtencion { get; set; }
        public string Tramite { get; set; }
        public string TipoAtencion { get; set; }
        public string Fecha { get; set; }



        public bool Load()
        {
            //Infraestructure.Settings settings = new Infraestructure.Settings();

            //settings.Save();


            try
            {
                //sAppointmentValue = (sqlServer.ReadOneValue("SELECT CodeActivity FROM Activity;"));
                //if (sAppointmentValue != null)
                //    return true;
                return false;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }
        public List<AppointmentEntity> ListadoCitasCentroAtencion(string dni, int codcentroAtencion)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@dni", SqlDbType = SqlDbType.VarChar,  Value=dni},
                        new SqlParameter() {ParameterName = "@codCenterAttention", SqlDbType = SqlDbType.Int, Value=codcentroAtencion},

                };
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarCitasCiudadano", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }

        public List<AppointmentEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,
            string strIdComboActivo, int CodeAttentionCenter, int CodeChannelTypeAttention, int CodeReservationType
            , string AppointmentDateBegin, string AppointmentDateEnd)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value=CodeAttentionCenter},
                        new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value=CodeServiceEntity},
                        new SqlParameter() {ParameterName = "@CodeChannelTypeAttention", SqlDbType = SqlDbType.Int, Value=CodeChannelTypeAttention},
                        new SqlParameter() {ParameterName = "@CodeReservationType", SqlDbType = SqlDbType.Int, Value=CodeReservationType},
                        new SqlParameter() {ParameterName = "@AppointmentDateBegin", SqlDbType = SqlDbType.NVarChar, Value=(AppointmentDateBegin == null ? "-1" : AppointmentDateBegin)},
                        new SqlParameter() {ParameterName = "@AppointmentDateEnd", SqlDbType = SqlDbType.NVarChar, Value=(AppointmentDateEnd == null ? "-1" : AppointmentDateEnd)},

                };
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarReporteCitas", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }



        public List<AppointmentEntity> ConsultaCita(int CodeAttentionCenter, string ndoc)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@IdCenterAttention", SqlDbType = SqlDbType.Int,  Value=5},
                        new SqlParameter() {ParameterName = "@ndoc",SqlDbType = SqlDbType.NVarChar, Value=ndoc},

                };
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("us_listar_cita_ca", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }


        public List<AppointmentEntity> GetAllActivity()
        {
            //Infraestructure.Settings settings = new Infraestructure.Settings();
            //settings.Save();
            try
            {
                var jj = @"SELECT act.CodeActivity,sch.Description DescriptionActivity, act.ActivityDate,
                        convert(varchar(20),act.ActivityDate,23) + ' ' + convert(varchar(20),sch.StartTime,8) StartTime,
                        convert(varchar(20),act.ActivityDate,23) + ' ' + convert(varchar(20),sch.EndTime,8) EndTime,
                        act.Quota,act.Available FROM Activity act INNER JOIN Schedule sch ON act.CodeSchedule=sch.CodeSchedule 
                        WHERE sch.state = 1 AND act.state = 1";
                var miLista = (sqlServer.ReadValues<AppointmentEntity>(jj, null));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto Activity.", eXception);
            }
        }
        public List<AppointmentEntity> ListarServicexAttentionCenter(AppointmentEntity appointmentEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeAttentionCenter }
                };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarServicexAttentionCenter", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }


        public List<AppointmentEntity> GetPeople(AppointmentEntity appointmentEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeTypeDocument", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeTypeDocument },
                        new SqlParameter() {ParameterName = "@NumberDocument", SqlDbType = SqlDbType.Int, Value= appointmentEntity.NumberDocument },

                };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarPersona", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }


        public List<AppointmentEntity> GetActivityId(AppointmentEntity appointmentEntity)
        {
            if (appointmentEntity.Dni==null)
            {
                appointmentEntity.Dni = "";
            }

            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        //new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeServiceEntity },
                        //new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeAttentionCenter },
                        //new SqlParameter() {ParameterName = "@ActivityDate", SqlDbType = SqlDbType.NVarChar, Value= "0" }
                        new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeServiceEntity },
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeAttentionCenter },
                        new SqlParameter() {ParameterName = "@Dni", SqlDbType = SqlDbType.NVarChar, Value= appointmentEntity.Dni },
                        new SqlParameter() {ParameterName = "@ActivityDate", SqlDbType = SqlDbType.NVarChar, Value= "0" }


                };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarActividadxIdCalendar", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }

        public List<AppointmentEntity> GetActivityIdDate(AppointmentEntity appointmentEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                    {
                      
                        new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeServiceEntity },
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeAttentionCenter },
                        new SqlParameter() {ParameterName = "@Dni", SqlDbType = SqlDbType.NVarChar, Value= "" },
                        new SqlParameter() {ParameterName = "@ActivityDate", SqlDbType = SqlDbType.NVarChar, Value= appointmentEntity.ActivityDate }

                };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarActividadxIdCalendar", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }

        public List<AppointmentEntity> GetScheduleId(AppointmentEntity appointmentEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeServiceEntity },
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeAttentionCenter },
                        new SqlParameter() {ParameterName = "@CodeTimeInterval", SqlDbType = SqlDbType.Int, Value= appointmentEntity.Intervalo },
                        new SqlParameter() {ParameterName = "@CodeReservationType", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeReservationType },
                        new SqlParameter() {ParameterName = "@CodeChannelTypeAttention", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeChannelTypeAttention }
                };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarSchedulexIdCalendar", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }

        public List<AppointmentEntity> GetAttentionCenterId(int CodeServiceEntity)
        {
            //Infraestructure.Settings settings = new Infraestructure.Settings();

            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value= CodeServiceEntity }
                };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarCentroAtencionxServicioCombo", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }
        public List<AppointmentEntity> GetAllService()
        {
            try
            {

                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarServiciosComboAppointment", null));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }
        public List<AppointmentEntity> GetAllDocumentType()
        {
            try
            {

                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarTipoDocumento", null));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }
        public List<AppointmentEntity> GetAllChannelTypeAttention()
        {
            try
            {

                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarChannelTypeAttention", null));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }
        public List<AppointmentEntity> InsertActivity(List<AppointmentEntity> oAppointmentEntity)
        {

            try
            {
                var jh = @"dbo.sp_InsertarCita";

                List<SqlParameter> sph = new List<SqlParameter>()
                {
                    new SqlParameter() {ParameterName = "@tpmAppointmentEntity", SqlDbType = SqlDbType.Structured, Value = dtAppointment(oAppointmentEntity)}
                };

                var miListah = (sqlServer.ReadValues<AppointmentEntity>(jh, sph));

                return miListah;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }

        public List<AppointmentEntity> InsertScheduleAttentionCenter(List<AppointmentEntity> oAppointmentEntity)
        {

            try
            {
                var jh = @"dbo.sp_InsertarScheduleAttentionCenter";

                List<SqlParameter> sph = new List<SqlParameter>()
                {
                    new SqlParameter() {ParameterName = "@tpmScheduleAttentionCenter", SqlDbType = SqlDbType.Structured, Value = dtScheduleAttentionCenter(oAppointmentEntity)}
                };

                var miListah = (sqlServer.ReadValues<AppointmentEntity>(jh, sph));

                return miListah;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }


        public List<AppointmentEntity> ProgramarCita(AppointmentEntity oAppointmentEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeService", SqlDbType = SqlDbType.Int, Value= oAppointmentEntity.CodeService },
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= oAppointmentEntity.CodeAttentionCenter },
                        new SqlParameter() {ParameterName = "@StartQuota", SqlDbType = SqlDbType.Int, Value= oAppointmentEntity.StartQuota },
                        new SqlParameter() {ParameterName = "@Intervalo", SqlDbType = SqlDbType.Int, Value= oAppointmentEntity.Intervalo },
                        new SqlParameter() {ParameterName = "@FechaInicio", SqlDbType = SqlDbType.NVarChar, Value= oAppointmentEntity.FechaInicio },
                        new SqlParameter() {ParameterName = "@FechaFin", SqlDbType = SqlDbType.NVarChar, Value= oAppointmentEntity.FechaFin }
                };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ProgramarCitas", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }
        public List<AppointmentEntity> ExportNumberAppointment(AppointmentEntity appointmentEntity)
        {

            try
            {
                //List<SqlParameter> sp = new List<SqlParameter>()
                //    {
                //        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeAttentionCenter },
                //        new SqlParameter() {ParameterName = "@CodeChannelTypeAttention", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeChannelTypeAttention},
                //        new SqlParameter() {ParameterName = "@AppointmentDate", SqlDbType = SqlDbType.NVarChar, Value= appointmentEntity.AppointmentDate }
                //};
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=5000},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=1},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value="CodeAppointment"},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value="asc"},
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value=appointmentEntity.CodeAttentionCenter},
                        new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value=appointmentEntity.CodeServiceEntity},
                        new SqlParameter() {ParameterName = "@CodeChannelTypeAttention", SqlDbType = SqlDbType.Int, Value=appointmentEntity.CodeChannelTypeAttention},
                        new SqlParameter() {ParameterName = "@CodeReservationType", SqlDbType = SqlDbType.Int, Value=appointmentEntity.CodeReservationType},
                        new SqlParameter() {ParameterName = "@AppointmentDateBegin", SqlDbType = SqlDbType.NVarChar, Value=(appointmentEntity.AppointmentDateBegin == null ? "-1" : appointmentEntity.AppointmentDateBegin)},
                        new SqlParameter() {ParameterName = "@AppointmentDateEnd", SqlDbType = SqlDbType.NVarChar, Value=(appointmentEntity.AppointmentDateEnd == null ? "-1" : appointmentEntity.AppointmentDateEnd)},

                };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarReporteExcelCitas", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }
        private DataTable dtAppointment(List<AppointmentEntity> olistaAppointmentEntity)
        {
            DataTable dtAppointment = new DataTable();
            dtAppointment.Columns.Add("CodeAppointment", typeof(Int32));
            dtAppointment.Columns.Add("CodeActivity", typeof(Int32));
            dtAppointment.Columns.Add("CodeServiceEntity", typeof(Int32));
            dtAppointment.Columns.Add("CodeAttentionCenter", typeof(Int32));
            dtAppointment.Columns.Add("CodeSchedule", typeof(Int32));
            dtAppointment.Columns.Add("Dni", typeof(Int32));
            dtAppointment.Columns.Add("FirstName", typeof(string));
            dtAppointment.Columns.Add("FirstLastName", typeof(string));
            dtAppointment.Columns.Add("SecondLastName", typeof(string));
            dtAppointment.Columns.Add("Email", typeof(string));
            dtAppointment.Columns.Add("Telephone", typeof(string));
            dtAppointment.Columns.Add("AppointmentDate", typeof(string));
            dtAppointment.Columns.Add("CodeChannelTypeAttention", typeof(Int32));

            foreach (AppointmentEntity oAppointmentEntity in olistaAppointmentEntity)
            {
                DataRow newRow = dtAppointment.NewRow();
                newRow["CodeAppointment"] = oAppointmentEntity.CodeAppointment;
                newRow["CodeActivity"] = oAppointmentEntity.CodeActivity;
                newRow["CodeServiceEntity"] = oAppointmentEntity.CodeServiceEntity;
                newRow["CodeAttentionCenter"] = oAppointmentEntity.CodeAttentionCenter;
                newRow["CodeSchedule"] = oAppointmentEntity.CodeSchedule;
                newRow["Dni"] = oAppointmentEntity.Dni;
                newRow["FirstName"] = oAppointmentEntity.FirstName;
                newRow["FirstLastName"] = oAppointmentEntity.FirstLastName;
                newRow["SecondLastName"] = oAppointmentEntity.SecondLastName;
                newRow["Email"] = oAppointmentEntity.Email;
                newRow["Telephone"] = oAppointmentEntity.Telephone;
                newRow["AppointmentDate"] = oAppointmentEntity.AppointmentDate;
                newRow["CodeChannelTypeAttention"] = oAppointmentEntity.CodeChannelTypeAttention;

                dtAppointment.Rows.Add(newRow);
            }
            return dtAppointment;
        }


        private DataTable dtScheduleAttentionCenter(List<AppointmentEntity> olistaAppointmentEntity)
        {
            DataTable dtAppointment = new DataTable();

            dtAppointment.Columns.Add("CodeAttentionCenter", typeof(Int32));
            dtAppointment.Columns.Add("CodeServiceEntity", typeof(Int32));
            dtAppointment.Columns.Add("CodeSchedule", typeof(Int32));
            dtAppointment.Columns.Add("CodeChannelTypeAttention", typeof(Int32));
            dtAppointment.Columns.Add("CodeReservationType", typeof(Int32));
            dtAppointment.Columns.Add("Quota1", typeof(string));
            dtAppointment.Columns.Add("Quota2", typeof(string));
            dtAppointment.Columns.Add("Quota3", typeof(string));
            dtAppointment.Columns.Add("Quota4", typeof(string));
            dtAppointment.Columns.Add("Quota5", typeof(string));
            dtAppointment.Columns.Add("Quota6", typeof(string));
            dtAppointment.Columns.Add("Quota7", typeof(string));

            foreach (AppointmentEntity oAppointmentEntity in olistaAppointmentEntity)
            {
                DataRow newRow = dtAppointment.NewRow();

                newRow["CodeAttentionCenter"] = oAppointmentEntity.CodeAttentionCenter;
                newRow["CodeServiceEntity"] = oAppointmentEntity.CodeServiceEntity;
                newRow["CodeSchedule"] = oAppointmentEntity.CodeSchedule;
                newRow["CodeChannelTypeAttention"] = oAppointmentEntity.CodeChannelTypeAttention;
                newRow["CodeReservationType"] = oAppointmentEntity.CodeReservationType;
                newRow["Quota1"] = oAppointmentEntity.Quota1;
                newRow["Quota2"] = oAppointmentEntity.Quota2;
                newRow["Quota3"] = oAppointmentEntity.Quota3;
                newRow["Quota4"] = oAppointmentEntity.Quota4;
                newRow["Quota5"] = oAppointmentEntity.Quota5;
                newRow["Quota6"] = oAppointmentEntity.Quota6;
                newRow["Quota7"] = oAppointmentEntity.Quota7;


                dtAppointment.Rows.Add(newRow);
            }
            return dtAppointment;
        }


        public List<AppointmentEntity> GetAllConfigurationType(int PagDesde, int PagHasta, int CodeAttentionCenter, int CodeEntityAttentionCenter, int CodeServiceEntity)
        {
            try
            {
                List<AppointmentEntity> miLista = new List<AppointmentEntity>();
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                    new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int, Value= PagDesde },
                    new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value= PagHasta},
                    new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= CodeAttentionCenter },
                    new SqlParameter() {ParameterName = "@CodeEntityAttentionCenter", SqlDbType = SqlDbType.Int, Value= CodeEntityAttentionCenter },
                    new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value= CodeServiceEntity }
                };
                //ReadValues
                miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarServiceAttentionCenterCitas", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }
        public AppointmentEntity InsertServiceAttentionCenter(AppointmentEntity appointmentEntity)
        {
            try
            {
                var id = -1;
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeServAttenCenter", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeServAttenCenter },
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeAttentionCenter },
                        new SqlParameter() {ParameterName = "@CodeServiceEntity", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeServiceEntity },
                        new SqlParameter() {ParameterName = "@CodeEntity", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeEntity },
                        new SqlParameter() {ParameterName = "@CodeReservationType", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeReservationType },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.VarChar, Value = "Admin" }
                };
                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {

                    if (appointmentEntity.CodeServAttenCenter != 0)
                    {
                        id = sqlServer.Update("usp_ActualizarServiceAttentionCenterCitas", sp);
                    }
                    else
                    {
                        id = sqlServer.InsertOne("usp_RegistrarServiceAttentionCenterCitas", sp);
                    }
                    if (id > 0)
                    {
                        tx.Complete();
                        appointmentEntity.Message = "Se registró satisfactoriamente";
                        appointmentEntity.MessageCode = "OK";
                        appointmentEntity.CodeEntity = id;
                    }
                    else
                    {
                        appointmentEntity.Message = "No se pudo registrar";
                        appointmentEntity.MessageCode = "ERR";
                        appointmentEntity.CodeEntity = id;
                    }

                }
                return appointmentEntity;
            }
            catch (Exception ex)
            {
                throw new Exception("Hubo un error al registrar en la Base de Datos", ex);
            }
        }
        public AppointmentEntity DeleteServiceAttentionCenter(AppointmentEntity appointmentEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeServAttenCenter", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeServAttenCenter },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = sqlServer.DeleteOne("usp_EliminarServiceAttentionCenterCitas", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        appointmentEntity.Message = "Se eliminó satisfactoriamente";
                        appointmentEntity.MessageCode = "OK";
                        appointmentEntity.CodeServAttenCenter = id;
                    }
                    else
                    {
                        appointmentEntity.Message = "No se pudo eliminar";
                        appointmentEntity.MessageCode = "ERR";
                        appointmentEntity.CodeServAttenCenter = id;
                    }
                }
                return appointmentEntity;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar.", ex);
            }
        }




        public List<AppointmentEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, string strIdComboActivo, int CodeAttentionCenter, int CodeChannelTypeAttention, string AppointmentDateBegin)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value=CodeAttentionCenter},
                        new SqlParameter() {ParameterName = "@CodeChannelTypeAttention", SqlDbType = SqlDbType.Int, Value=CodeChannelTypeAttention},
                        new SqlParameter() {ParameterName = "@AppointmentDateBegin", SqlDbType = SqlDbType.NVarChar, Value=(AppointmentDateBegin == null ? "-1" : AppointmentDateBegin)},

                };
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarNroCitas", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }


        public List<AppointmentEntity> GetEntitybyAttentionCenter(AppointmentEntity appointmentEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodigoCentroAtencion", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeAttentionCenter }
                    };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarComboEntidadesxCentroAtencionCitas", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }


        public List<AppointmentEntity> GetServiceEntitybyCodeEntityComboCitas(AppointmentEntity appointmentEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                    {
                        new SqlParameter() {ParameterName = "@CodeEntity", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeEntity }
                    };
                //ReadValues
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ServiceEntitybyCodeEntityComboCitas", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }

        public List<AppointmentEntity> GetReservationType(int CodeReservationType)
        {
            try
            {
                List<AppointmentEntity> miLista = new List<AppointmentEntity>();
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                    new SqlParameter() {ParameterName = "@CodeReservationType", SqlDbType = SqlDbType.Int, Value= CodeReservationType }
                };
                //ReadValues
                miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ListarComboReservationType", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto ServiceCode.", eXception);
            }
        }

        public List<AppointmentEntity> GetRecordServiceAttentionCenter(int CodeServAttenCenter)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                     new SqlParameter() {ParameterName = "@CodeServAttenCenter", SqlDbType = SqlDbType.Int,  Value=CodeServAttenCenter}
                };
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_CurrentRowServiceAttentionCenterCitas", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar obtener la fila requerida.", eXception);
            }
        }


        public AppointmentEntity DeleteAppointment(AppointmentEntity appointmentEntity)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@CodeAppointment", SqlDbType = SqlDbType.Int, Value= appointmentEntity.CodeAppointment },
                        new SqlParameter() {ParameterName = "@RegistryUser", SqlDbType = SqlDbType.NVarChar, Value= "Admin"}
                };

                using (TransactionScope tx = new TransactionScope(TransactionScopeOption.Required))
                {
                    var id = sqlServer.DeleteOne("usp_EliminarCita", sp);
                    if (id > 0)
                    {
                        tx.Complete();
                        appointmentEntity.Message = "Se eliminó satisfactoriamente";
                        appointmentEntity.MessageCode = "OK";
                        appointmentEntity.CodeServAttenCenter = id;
                    }
                    else
                    {
                        appointmentEntity.Message = "No se pudo eliminar";
                        appointmentEntity.MessageCode = "ERR";
                        appointmentEntity.CodeServAttenCenter = id;
                    }
                }
                return appointmentEntity;
            }
            catch (Exception ex)
            {
                throw new Exception("No se pudo eliminar.", ex);
            }
        }

        public List<AppointmentEntity> GetReporteTicket(int strPagDesde, int strPagHasta, string strField, string strOrder,
            int CodeAttentionCenter, string NumberDocument,  int CodeTicketState, int CodeService
            , string TicketDateBegin, string TicketDateEnd)
        {
            try
            {
                List<SqlParameter> sp = new List<SqlParameter>()
                {
                        new SqlParameter() {ParameterName = "@pstrPagHasta", SqlDbType = SqlDbType.Int,  Value=strPagHasta},
                        new SqlParameter() {ParameterName = "@pstrPagDesde", SqlDbType = SqlDbType.Int, Value=strPagDesde},
                        new SqlParameter() {ParameterName = "@psiSortColumn",SqlDbType = SqlDbType.NVarChar, Value=strField},
                        new SqlParameter() {ParameterName = "@psiSortOrder", SqlDbType = SqlDbType.NVarChar, Value=strOrder},
                        new SqlParameter() {ParameterName = "@CodeAttentionCenter", SqlDbType = SqlDbType.Int, Value=CodeAttentionCenter},
                        new SqlParameter() {ParameterName = "@NumberDocument", SqlDbType = SqlDbType.NVarChar, Value=NumberDocument},
                        new SqlParameter() {ParameterName = "@CodeTicketState", SqlDbType = SqlDbType.Int, Value=CodeTicketState},
                        new SqlParameter() {ParameterName = "@CodeService", SqlDbType = SqlDbType.Int, Value=CodeService},
                        new SqlParameter() {ParameterName = "@TicketDateBegin", SqlDbType = SqlDbType.NVarChar, Value=(TicketDateBegin == null ? "-1" : TicketDateBegin)},
                        new SqlParameter() {ParameterName = "@TicketDateEnd", SqlDbType = SqlDbType.NVarChar, Value=(TicketDateEnd == null ? "-1" : TicketDateEnd)},

                };
                var miLista = (sqlServer.ReadValues<AppointmentEntity>("usp_ReporteTicket", sp));
                return miLista;
            }
            catch (Exception eXception)
            {
                throw new Exception("No se pudo cargar la información del objeto GetReporteTicket.", eXception);
            }
        }


    }
}
