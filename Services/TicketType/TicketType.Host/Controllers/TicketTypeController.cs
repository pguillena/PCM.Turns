using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TicketType.Domain.Interface;

namespace TicketType.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController] 
    [EnableCors("TicketTypePolicy")]
    public class TicketTypeController : ControllerBase
    {
        private readonly ITicketTypeDomain oITicketTypeDomain;
        public TicketTypeController(ITicketTypeDomain oITicketTypeDomainIn)
        {
            oITicketTypeDomain = oITicketTypeDomainIn;
        }

        [HttpGet]
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strTipoTicket,int strPrioridad)
        {
            List<Entity.TicketType> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oITicketTypeDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strTipoTicket, strPrioridad);

            }
            return new JsonResult(miLista);
        }      

        
        [HttpGet]
        [Route("~/api/CurrentRowTipoTicket")]
        public JsonResult CurrentRowTipoTicket(int CodeTicketType)
        {
            List<Entity.TicketType> miLista = null;
            miLista = oITicketTypeDomain.GetRecord(CodeTicketType);
            return new JsonResult(miLista);
        }
        
        [HttpGet]
        [Route("~/api/AutocompleteTipoTicket")]
        public JsonResult AutocompleteTipoTicket()
        {
            List<Entity.TicketType> miLista = null;
            miLista = oITicketTypeDomain.AutocompleteTipoTicket();
            return new JsonResult(miLista);
        }

        [HttpPost]
        [Route("~/api/SaveTypeTicket")]
        public JsonResult SaveTypeTicket(Entity.TicketType oTicketType)
        {
            return new JsonResult(oITicketTypeDomain.Save(oTicketType));
        }

        [HttpPost]
        [Route("~/api/DeleteTypeTicket")]
        public JsonResult DeleteTypeTicket(Entity.TicketType oTicketType)
        {
            return new JsonResult(oITicketTypeDomain.Delete(oTicketType));
        }
        

    }
}