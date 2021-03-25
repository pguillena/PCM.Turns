using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Turns.Web.Models
{
    public class GEAppointmentPeople
    {
        internal string cCodMaeDocumento;
        internal int iRegUsuaRegistra;
        //internal object biCodMovPersona;

        public string nvNombre { get; set; }
        public string nvApePaterno { get; set; }
        public string nvApeMaterno { get; set; }
        public string dtFechNacimiento { get; set; }

        public string cCodSexo { get; set; }

        public string nvRazonSocial { get; set; }
        public string nvObservacion { get; set; }       
        public int nvNumDocumento { get; set; }
        public int productId { get; set; }
        public int orderId { get; set; }
        public int employeeId { get; set; }        
        public string mode { get; set; }

    }
}
