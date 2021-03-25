using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Turns.Web.Models
{
    public class GEMovPersona
    {
        internal string cCodMaeDocumento;
        internal int iRegUsuaRegistra;
        //internal object biCodMovPersona;

        public string nvNombre { get; set; }
        public string nvApePaterno { get; set; }
        public string nvApeMaterno { get; set; }
        public string dtFechNacimiento { get; set; }
        public string nvNombreCompleto { get; set; }
        public string cCodSexo { get; set; }

        public string nvRazonSocial { get; set; }
        public string nvObservacion { get; set; }
        public string nvNumDocumento { get; set; }
        public int iCondicion{ get; set; }
        public int nvTipoDoc { get; set; }
        public string nvDireccion { get; set; }
        public string nvEstadoCivil { get; set; }

    }
}
