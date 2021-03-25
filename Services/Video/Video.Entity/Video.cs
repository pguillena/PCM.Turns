using System;
using System.Collections.Generic;
using System.Text;

namespace Video.Entity
{
    public class Video:Common
    {
        public int CodeVideo { get; set; }
        public string VideoName { get; set; }
        public string VideoDescription { get; set; }
        public string VideoAdress { get; set; }
        public string VideoStateName { get; set; }
        public string State { get; set; }
        public int CodeVideoState { get; set; }
        public string Route { get; set; }
        public string UserName { get; set; }

    }
}
