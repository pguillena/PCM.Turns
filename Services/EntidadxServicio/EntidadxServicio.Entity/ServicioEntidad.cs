using System;
using System.Collections.Generic;
using System.Text;

namespace EntidadxServicio.Entity
{
    public class ServicioEntidad:Common
    {
        public int CodeServiceEntity { get; set; }
        public int CodeEntity { get; set; }
        public int CodeService { get; set; }
        public string State { get; set; }
        public int[] Lista { get; set; }
        public string Description { get; set; }
        public string Abreviation { get; set; }
        public string NameDescription { get; set; }
        public string NameTypeService { get; set; }
        public int id { get; set; }
        public string UrlLogo { get; set; }
        public string UserName { get; set; }
    }
}
