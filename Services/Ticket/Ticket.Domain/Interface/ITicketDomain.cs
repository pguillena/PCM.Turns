using System;
using System.Collections.Generic;
using System.Text;
using Ticket.Entity;

namespace Ticket.Domain.Interface
{
    public interface ITicketDomain
    {
        Ticket SaveTicket(Ticket oTicket);

        List<Ticket> ListarTicket();

        List<Ticket> ReportTicket(int CodeTicket);

        Ticket ObtenerTicket(Ticket oTicket);

        List<ServiceTicket> ListarServiciosTicket(Ticket oTicket);

        int SaveServiciosTicket(ServiceTicket oServiceTicket);

        List<Ticket> ListarTicketAtendidos(string UserName);

        int AbandonoTicket(Ticket oTicket);

        int TicketPendientexAtender(Ticket oTicket);

        List<Ticket> ListarTicketGenerados(int PersonId, int IdPeople,int IdEstado);

        List<Ticket> AutoCompletePeople();

        List<Ticket> ConsultaCita(int CodeAttentionCenter, string ndoc);

    }
}
