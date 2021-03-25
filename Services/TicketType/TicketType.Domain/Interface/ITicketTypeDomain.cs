using System;
using System.Collections.Generic;
using System.Text;

namespace TicketType.Domain.Interface
{
    public interface ITicketTypeDomain
    {
        List<Entity.TicketType> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strTipoTicket,int strPrioridad);

        List<Entity.TicketType> GetRecord(int CodeTicketType);

        List<Entity.TicketType> AutocompleteTipoTicket();

        Entity.TicketType Save(Entity.TicketType oTicketType);

        Entity.TicketType Delete(Entity.TicketType oTicketType);
        
    }
}
