using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BannerxZone.Domain.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BannerxZone.Entity;
using Microsoft.AspNetCore.Cors;

namespace BannerxZone.Host.Controllers
{
    [Route("api/[controller]")]
    
    [ApiController]
    [EnableCors("BannerxZonePolicy")]
    public class BannerxZoneController : ControllerBase
    {
        private readonly IBannerxZoneDomain oIBannerxZoneDomain;

        public BannerxZoneController(IBannerxZoneDomain oIBannerxZoneDomainIn)
        {
            oIBannerxZoneDomain = oIBannerxZoneDomainIn;
        }

        [HttpGet]
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdCentroAtencion, string strIdComboActivo)
        {
            List<BannerZone> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIBannerxZoneDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder,strIdCentroAtencion,strIdComboActivo);
                return new JsonResult(miLista);
            }
            else
            {
                return new JsonResult(miLista); ;
            }
        }


        [HttpGet]
        [Route("~/api/CurrentBannerAttentionCenter")]
        public JsonResult CurrentBannerAttentionCenter(int CodeAttentionCenter)
        {
            List<BannerZone> miLista = null;
            if (CodeAttentionCenter != 0)
            {
                miLista = oIBannerxZoneDomain.CurrentBannerAttentionCenter(CodeAttentionCenter);
                return new JsonResult(miLista);
            }
            else
            {
                return new JsonResult(miLista); ;
            }
        }

        [HttpGet]
        [Route("~/api/ListBannerxAttentionCenter")]
        public JsonResult ListBannerxAttentionCenter(int CodeZone)
        {
            List<BannerZone> miLista = null;
            if (CodeZone!=0)
            {
                miLista = oIBannerxZoneDomain.ListBannerxAttentionCenter(CodeZone);
                return new JsonResult(miLista);
            }
            else
            {
                return new JsonResult(miLista); ;
            }
        }       


        [HttpPost]
        [Route("~/api/SaveBannerxZona")]
        public JsonResult SaveBannerxZona(BannerZone oBannerZone)
        {
            return new JsonResult(oIBannerxZoneDomain.Save(oBannerZone));
        }
    }
}