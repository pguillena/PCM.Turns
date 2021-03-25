using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Turns.Web.Models
{
    public class ParameterConf
    {
        public WebApiUrlService WebApiUrl { set; get; }
    }

     public class WebApiUrlService
    {
        public string AppointmentService { set; get; }
        public string AttentionService { set; get; }
        public string BannerService { set; get; }
        public string BannerZoneService { set; get; }
        public string EntityService { set; get; }
        public string ServiceService { set; get; }
        public string AttentionCenterService { set; get; }
        public string EntitybyService { set; get; }
        public string TicketTypeService { set; get; }
        public string VideoService { set; get; }
        public string WindowService { set; get; }
        public string ZoneService { set; get; }
        public string EntityAttentionCenterService { get; set; }
        public string ServicexCenterAttentionService { get; set; }
        public string TicketService { get; set; }
        public string SecurityService { get; set; }


    }
}
