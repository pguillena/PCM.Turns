using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Banner.Domain.Interface;
using Banner.Entity;
using Microsoft.AspNetCore.Cors;

namespace Banner.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("BannerPolicy")]
    public class BannerController : ControllerBase
    {
        private readonly IBannerDomain oIBannerDomain;

        public BannerController(IBannerDomain oIBannerDomainIn)
        {
            oIBannerDomain = oIBannerDomainIn;
        }


        // GET: api/Appointment*/
        [HttpGet]
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder)
        {
            List<BannerEntity> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIBannerDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder);
                 
            } 
            return new JsonResult(miLista);   
        }            

        // GET: api/Banner/5
        [HttpGet]
        [Route("~/api/CurrentRowBanner")]
        public JsonResult CurrentRowBanner(int CodeBanner)
        {
            var lista = oIBannerDomain.CurrentRowBanner(CodeBanner);
            return new JsonResult(lista);
        }

        // POST: api/Banner
        [HttpPost]
        [Route("~/api/SaveBanner")]
        public JsonResult SaveBanner(BannerEntity oBannerEntity)
        {
            return new JsonResult(oIBannerDomain.Save(oBannerEntity));
        }

        // PUT: api/Banner/5
        [HttpPost]
        [Route("~/api/DeleteBanner")]        
        public JsonResult DeleteBanner(BannerEntity oBannerEntity)
        {
            return new JsonResult(oIBannerDomain.Delete(oBannerEntity));
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }

        [HttpGet]
        [Route("~/api/AutocompleteBanner")]
        public JsonResult AutocompleteBanner()
        {
            return new JsonResult(oIBannerDomain.Autocomplete());
        }
    }
}
