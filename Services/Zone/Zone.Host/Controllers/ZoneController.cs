using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Zone.Domain.Interface;
using Zone.Entity;

namespace Zone.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("ZonePolicy")]
    public class ZoneController : ControllerBase
    {
        private readonly IZoneDomain oIZoneDomain;

        public ZoneController(IZoneDomain oIZoneDomainIn)
        {
            oIZoneDomain = oIZoneDomainIn;
        }

        [HttpGet]
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strCbxCentroAtencion, string strtxtZona,int strCodeAttentionCenter,int strComboActivo)
        {
            List<Zone.Entity.Zone> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIZoneDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strCbxCentroAtencion, strtxtZona, strCodeAttentionCenter,strComboActivo);
                return new JsonResult(miLista);
            }
            else
            {
                return new JsonResult(miLista); 
            }
        }


        [HttpPost]
        [Route("~/api/SaveZone")]
        public JsonResult SaveZone(Entity.Zone oZone)
        {
            return new JsonResult(oIZoneDomain.Save(oZone));          
        }

        [HttpGet]
        [Route("~/api/CurrentRowZone")]
        public JsonResult CurrentRowZone(int CodeZone)
        {
            return new JsonResult(oIZoneDomain.GetRecord(CodeZone));           
        }


        [HttpPost]
        [Route("~/api/SaveEntityxZone")]
        public JsonResult SaveAttentionCenterxEntity(Zone.Entity.Zone oEntityZone)
        {
            return new JsonResult(oIZoneDomain.SaveEntityZone(oEntityZone));
        }
        [HttpGet]
        [Route("~/api/AutocompleteZona")]
        public JsonResult AutocompleteZona()
        {
            return new JsonResult(oIZoneDomain.Autocomplete());
        }

        [HttpGet]
        [Route("~/api/ListarZonaCentroAtencion")]
        public JsonResult ListarZonaCentroAtencion(int CodeCentroAttention)
        {
            return new JsonResult(oIZoneDomain.ListarZonaCentroAtencion(CodeCentroAttention));
        }


        [HttpPost]
        [Route("~/api/DeleteZone")]
        public JsonResult DeleteZone(Entity.Zone oZone)
        {
            return new JsonResult(oIZoneDomain.Delete(oZone));
        }

    }
}