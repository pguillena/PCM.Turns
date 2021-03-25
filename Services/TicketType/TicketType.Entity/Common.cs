using System;
using System.Collections.Generic;
using System.Text;

namespace TicketType.Entity
{
    public class Common
    {
        public int RowNumber { get; set; }
        public int PageCount { get; set; }
        public int TotalRows { get; set; }
        public int strPagHasta { get; set; }
        public int strPagDesde { get; set; }
        public string strOrder { get; set; }
        public string strField { get; set; }
        public string MessageCode { get; set; }
        public string Message { get; set; }
    }
}
