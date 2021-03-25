using Appointment.Infraestructure.Implementation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Transactions;

namespace Appointment.Entity
{
    public class ReportAppointmentEntity
    {
        private SQLServer sqlServer;
        private string sAppointmentValue;

        public ReportAppointmentEntity()
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


    }
}
