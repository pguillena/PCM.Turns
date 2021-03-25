using System;
using System.Collections.Generic;
using System.Text;
using TicketType.Domain.Interface;
using TicketType.Entity;

namespace TicketType.Domain.Implementation
{
    public class TicketTypeDomain: ITicketTypeDomain
    {
        TicketTypeEntity ticketTypeEntity;

        public TicketTypeDomain()
        {
            ticketTypeEntity = new TicketTypeEntity();
            ticketTypeEntity.Load();
        }

        public List<Entity.TicketType> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strTipoTicket,int strPrioridad)
        {
            return ticketTypeEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder, strTipoTicket, strPrioridad);
        }

        public List<Entity.TicketType> GetRecord(int CodeTicketType)
        {
            return ticketTypeEntity.GetRecord(CodeTicketType);
        }

        public List<Entity.TicketType> AutocompleteTipoTicket() {
            return ticketTypeEntity.AutocompleteTipoTicket();
        }

        public Entity.TicketType Save(Entity.TicketType oTicketType) {
            return ticketTypeEntity.Save(oTicketType);
        }

        public Entity.TicketType Delete(Entity.TicketType oTicketType)
        {
            return ticketTypeEntity.Delete(oTicketType);
        }
        
    }
}
