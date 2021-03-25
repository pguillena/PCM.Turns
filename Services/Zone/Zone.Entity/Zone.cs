using System;
using System.Collections.Generic;
using System.Text;

namespace Zone.Entity
{
    public class Zone:Common
    {
        public int CodeZone { get; set; }
        public string ZoneName  { get; set; }
        public string ZoneDescription { get; set; }
        public string State { get; set; }
        public int CodeAttentionCenter { get; set; }
        public string Description { get; set; }
        public string UserName { get; set; }

        public int[] Lista { get; set; }
    }
}
