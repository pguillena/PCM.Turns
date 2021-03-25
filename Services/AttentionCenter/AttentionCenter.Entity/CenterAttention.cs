using System;
using System.Collections.Generic;
using System.Text;

namespace AttentionCenter.Entity
{
    public class CenterAttention:Common
    {
        public int CodeAttentionCenter { get; set; }

        public string Description { get; set; }

        public string CodeGeoLocation { get; set; }
        public string State { get; set; }

        public string UserName { get; set; }
    }
}
