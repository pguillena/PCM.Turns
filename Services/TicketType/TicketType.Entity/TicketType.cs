using System;
using System.Collections.Generic;
using System.Text;

namespace TicketType.Entity
{
    public class TicketType:Common
    {
        public int CodeTicketType { get; set; }
        public string Description { get; set; }
        public int Priority { get; set; }
        public string Visible { get; set; }
        public int IsPreferential { get; set; }
        public string UserName { get; set; }
    }
}
