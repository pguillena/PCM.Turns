using System;
using System.Collections.Generic;
using System.Text;

namespace BannerxZone.Entity
{
    public class BannerZone:Common
    {
        public int CodeBannerZone { get; set; }
        public int CodeBanner { get; set; }
        public string BannerName { get; set; }
        public int CodeZone { get; set; }
        public string ZoneName { get; set; }
        public int CodeAttentionCenter { get; set; }
        public int[] Lista { get; set; }
        public string Description { get; set; }
        public int Cant_zonas { get; set; }
        public string Active { get; set; }
        public string UserName { get; set; }
    }
}
