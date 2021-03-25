using System;
using System.Collections.Generic;
using System.Text;

namespace AttentionCenterxService.Entity
{
    public class AttentionCenterService:Common
    {
        public int CodeServAttenCenter { get; set; }
        public int CodeService { get; set; }
        public int CodeEntity { get; set; }
        public int CodeServiceEntity { get; set; }
        public string description { get; set; }
        public int CodeAttentionCenter { get; set; }
        public int[] Lista { get; set; }
        public string State { get; set; }
        public string Active { get; set; }
    }
}
