using System;
using System.ComponentModel.DataAnnotations;

namespace Turns.Web.Models
{
    public class GEAppointmentReport
    {
        //public int CodeAppointment { get; set;}
        //public int CodeAttentionCenter { get; set; }
        //public int CodeServiceEntity { get; set; }
        //public int CodeChannelTypeAttention { get; set; }
        //public int CodeReservationType { get; set; }
        //public string DescriptionName { get; set; }
        //public string AppointmentDateBegin { get; set; }
        //public string AppointmentDateEnd { get; set;}
        //public string DescriptionSchedule { get; set; }
        public string Item { get; set; }
        public string Ciudadano { get; set; }
        public string Documento { get; set; }
 
        public string CentroAtencion { get; set; }
        public string Tramite { get; set; }
        public string TipoAtencion { get; set; }
        public string Fecha { get; set; }
        public string Horario { get; set; }
        //public string strField { get; set; }
        //public string strOrder { get; set; }
        //public string strPagDesde { get; set; }
        //public string strPagHasta { get; set; }


    }
}
