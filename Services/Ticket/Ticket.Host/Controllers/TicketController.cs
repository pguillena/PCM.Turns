using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Ticket.Domain.Interface;
using Ticket.Entity;

namespace Ticket.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("TicketPolicy")]
    public class TicketController : ControllerBase
    {
        private readonly ITicketDomain oITicketDomain;
     
        public TicketController(ITicketDomain oITicketDomainIn)
        {
            oITicketDomain = oITicketDomainIn;
        }

        [HttpGet]
        [Route("~/api/ListarTicket")]
        public List<Ticket> ListarTicket()
        {
            var miLista = oITicketDomain.ListarTicket();
            return miLista;
        }

        [HttpPost]
        [Route("~/api/SaveTicket")]
        public JsonResult SaveTicket(Ticket oTicket)
        {
            var objTicket = oITicketDomain.SaveTicket(oTicket);
            return new JsonResult(objTicket);
        }


        [HttpGet]
        [Route("~/api/ConsultaCita")]
        public ActionResult<IEnumerable<Ticket>> ConsultaCita(int CodeAttentionCenter, string ndoc)
        {
            List<Ticket> miLista = new List<Ticket>();
            miLista = oITicketDomain.ConsultaCita(CodeAttentionCenter, ndoc);
            //strIdComboActivo.ToString(), CodeAttentionCenter, CodeChannelTypeAttention, CodeReservationType, AppointmentDateBegin, AppointmentDateEnd);
            return miLista;
            //return Json(miLista, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        [Route("~/api/ReportTicket")]
        public List<Ticket> ReportTicket(int CodeTicket)
        {
            List<Ticket> report = null;
            report = oITicketDomain.ReportTicket(CodeTicket);
            return report;
        }

        [HttpPost]
        [Route("~/api/ObtenerTicket")]
        public Ticket ObtenerTicket(Ticket oTicket)
        {       
            var result = oITicketDomain.ObtenerTicket(oTicket);
            return result;          
        }


        [HttpPost]
        [Route("~/api/ListarServiciosTicket")]
        public List<ServiceTicket> ListarServiciosTicket(Ticket oTicket)
        {
            var result = oITicketDomain.ListarServiciosTicket(oTicket);
            return result;
        }

        [HttpPost]
        [Route("~/api/SaveServiciosTicket")]
        public int SaveServiciosTicket(ServiceTicket oTicket)
        {
            var CodeTicket = oITicketDomain.SaveServiciosTicket(oTicket);
            return CodeTicket;
        }

        [HttpGet]
        [Route("~/api/ListarTicketAtendidos")]
        public List<Ticket> ListarTicketAtendidos(string UserName)
        {
            var result = oITicketDomain.ListarTicketAtendidos(UserName);
            return result;
        }

        
        [HttpGet]
        [Route("~/api/ListarTicketGenerados")]
        public List<Ticket> ListarTicketGenerados(int PersonId,int IdPeople,int IdEstado)
        {
            var result = oITicketDomain.ListarTicketGenerados(PersonId, IdPeople, IdEstado);
            return result;
        }



        [HttpPost]
        [Route("~/api/AbandonoTicket")]
        public int AbandonoTicket(Ticket oTicket)
        {
            var result = oITicketDomain.AbandonoTicket(oTicket);
            return result;
        }

        [HttpPost]
        [Route("~/api/TicketPendientexAtender")]
        public int TicketPendientexAtender(Ticket oTicket)
        {
            var result = oITicketDomain.TicketPendientexAtender(oTicket);
            return result;
        }

        [HttpGet]
        [Route("~/api/AutoCompletePeople")]
        public List<Ticket> AutoCompletePeople()
        {
            var result = oITicketDomain.AutoCompletePeople();
            return result;
        }
    }
}