using System;
using System.Collections.Generic;
using System.Text;
using Ticket.Domain.Interface;
using Ticket.Entity;

namespace Ticket.Domain.Implementation
{
    public class TicketDomain: ITicketDomain
    {
        TicketEntity ticketEntity;

        public TicketDomain()
        {
            ticketEntity = new TicketEntity();
            ticketEntity.Load();
        }

        public Ticket SaveTicket(Ticket oTicket) {
            return ticketEntity.SaveTicket(oTicket);
        }
        public List<Ticket> ListarTicket() {
            return ticketEntity.ListarTicket();
        }

        public List<Ticket> ReportTicket(int CodeTicket)
        {
            return ticketEntity.ReportTicket(CodeTicket);
        }
        public Ticket ObtenerTicket(Ticket oTicket)
        {
            return ticketEntity.ObtenerTicket(oTicket);
        }
        public List<ServiceTicket> ListarServiciosTicket(Ticket oTicket) 
        {
            return ticketEntity.ListarServiciosTicket(oTicket);
        }

        public int SaveServiciosTicket(ServiceTicket oServiceTicket) 
        {
            return ticketEntity.SaveServiciosTicket(oServiceTicket);
        }

        public List<Ticket> ListarTicketAtendidos(string UserName) 
        {
            return ticketEntity.ListarTicketAtendidos(UserName);
        }
        public List<Ticket> ConsultaCita(int CodeAttentionCenter, string ndoc)
        {
            return ticketEntity.ConsultaCita(CodeAttentionCenter, ndoc);
        }


        public int AbandonoTicket(Ticket oTicket) 
        {
            return ticketEntity.AbandonoTicket(oTicket);
        }

        public int TicketPendientexAtender(Ticket oTicket)
        {
            return ticketEntity.TicketPendientexAtender(oTicket);
        }

        public List<Ticket> ListarTicketGenerados(int PersonId,int IdPeople,int IdEstado) 
        {
            return ticketEntity.ListarTicketGenerados(PersonId,IdPeople, IdEstado);
        }

        public List<Ticket> AutoCompletePeople() {
            return ticketEntity.AutoCompletePeople();
        }
    }
}
