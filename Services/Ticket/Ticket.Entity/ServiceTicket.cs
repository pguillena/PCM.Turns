using System;
using System.Collections.Generic;
using System.Text;

namespace Ticket.Entity
{
    public class ServiceTicket:Common
    {
        public int CodeServiceTicket { get; set; }
        public int CodeService { get; set; }
        public int CodeTicket { get; set; }
        public int CodeEntity { get; set; }
        public string NameEntity { get; set; }
        public string NameService { get; set; }
        //public int[] Lista { get; set; }
        public List<ServiceTicket> listaTicket { get; set; }
        public bool CodeAtendido { get; set; }
        public string UserName { get; set; }
        public int PersonId { get; set; }
    }
}
