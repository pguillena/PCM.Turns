using System;
using System.Collections.Generic;
using System.Text;

namespace AttentionCenterxService.Entity
{
    public class ServiceAttentionCenter:Common
    {
        public int CodeServAttenCenter { get; set; }
        public int CodeServiceEntity { get; set; }
        public int CodeAttentionCenter { get; set; }
        public string CentroAtencion { get; set; }
        public string Entidad { get; set; }
        public int CodeEntity { get; set; }
        public string UserName { get; set; }
    }
}
