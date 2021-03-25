using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AttentionCenterxService.Domain.Interface;
using AttentionCenterxService.Entity;

using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AttentionCenterxService.Host.Controllers
{
    [Route("api/[controller]")]    
    [ApiController]
    [EnableCors("AttentionCenterxServicioPolicy")]
    public class AttentionCenterxServiceController : ControllerBase
    {
        private readonly IAttentionCenterxServiceDomain oIAttentionCenterxServiceDomain;

        public AttentionCenterxServiceController(IAttentionCenterxServiceDomain oIAttentionCenterxServiceDomainIn)
        {
            oIAttentionCenterxServiceDomain = oIAttentionCenterxServiceDomainIn;
        }

        [HttpGet]
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strIdCentroAtencion, string strIdComboActivo)
        {
            List<ServiceAttentionCenter> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIAttentionCenterxServiceDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strIdCentroAtencion, strIdComboActivo);

            }
            return new JsonResult(miLista);
        }


        [HttpGet]
        [Route("~/api/ListCurrentEntity")]
        public JsonResult ListCurrentEntity(int CodeAttentionCenter)
        {
            List<Entity.Entity> miLista = null;
            if (CodeAttentionCenter != 0)
            {
                miLista = oIAttentionCenterxServiceDomain.ListCurrentEntity(CodeAttentionCenter);
            }
            return new JsonResult(miLista);
        }

        
        [HttpGet]
        [Route("~/api/ListService")]
        public JsonResult ListService(int CodeEntity,int CodeAttentionCenter)
        {
            List<AttentionCenterService> miLista = null;
            if (CodeEntity != 0 || CodeAttentionCenter!=0)
            {
                miLista = oIAttentionCenterxServiceDomain.ListService(CodeEntity, CodeAttentionCenter);
            }
            return new JsonResult(miLista);
        }


        [HttpPost]
        [Route("~/api/SaveAttentionCenterService")]
        public JsonResult SaveAttentionCenterService(AttentionCenterService oAttentionCenterService)
        {   
            return new JsonResult(oIAttentionCenterxServiceDomain.Save(oAttentionCenterService));
        }

        [HttpPost]
        [Route("~/api/DeleteAttentionCenterService")]
        public JsonResult DeleteAttentionCenterService(AttentionCenterService oAttentionCenterService)
        {
            return new JsonResult(oIAttentionCenterxServiceDomain.Delete(oAttentionCenterService));
        }

    }
}