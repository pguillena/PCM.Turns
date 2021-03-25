using System;
using System.Collections.Generic;
using System.Text;


namespace Ticket
{
    public class Ticket:Common
    {
        public int CodeTicket { get; set; }
        public string TicketName { get; set; }
        public int CodeTicketState { get; set; }
        public int CodeTicketType { get; set; }
        public string TicketDate { get; set; }
        public int CodeAttentionCenter { get; set; }
        public string State { get; set; }
        public string NroDoc { get; set; }
        public List<Ticket> listaTicket { get; set; }
        public int CodeServiceEntity { get; set; }
        public int TipoDoc { get; set; }
        public string NombreCompleto { get; set; }
        public string Direccion { get; set; }
        public string EstadoCivil { get; set; }
        public string llamado { get; set; }
        public string Description { get; set; }
        public string RegistryDate { get; set; }
        public string UserName { get; set; }
        public string Nombre { get; set; }
        public string WindowName { get; set; }
        public string StateName { get; set; }
        public int PersonId { get; set; }
        public int Contador { get; set; }  
        public int CodePeople { get; set; }

        public int CodeAppointment { get; set; }


        public int RowNumber { get; set; }

        public string AppointmentDate { get; set; }
        public string DescriptionEntity { get; set; }
        public string ndoc { get; set; }

        public string DescriptionName { get; set; }
        public string DescriptionSchedule { get; set; }
        public int CodeDocumentType { get; set; }
        public string DescriptionDocumentType { get; set; }
        public int Intervalo { get; set; }
        public string FechaInicio { get; set; }
        public string FechaFin { get; set; }
        public int NroCitas { get; set; }
        public int DayNumber { get; set; }

        public int CodeReservationType { get; set; }
        public string AppointmentDateBegin { get; set; }
        public string AppointmentDateEnd { get; set; }
        public string strIdComboActivo { get; set; }

        //Entidades para Tipo Servicio
        public string DescriptionService { get; set; }

        //Entidades para Centro de Atencion
        public string DescriptionAttentionCenter { get; set; }
        public string CodeTypeDocument { get; set; }
        public string NumberDocument { get; set; }
        public string Dni { get; set; }
        public string FirstName { get; set; }
        public string FirstLastName { get; set; }
        public string SecondLastName { get; set; }
        public string DescriptionPeople { get; set; }
        public string DescriptionReservationType { get; set; }

        public string DescriptionChannelTypeAttention { get; set; }



    }
}
