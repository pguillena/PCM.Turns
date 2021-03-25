using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EntityxAttentionCenter.Domain.Interface;
using EntityxAttentionCenter.Entity;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EntityxAttentionCenter.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("EntityxAttentionCenterPolicy")]
    public class EntityxAttentionCenterController : ControllerBase
    {
        private readonly IEntityxAttentionCenterDomain oIEntityxAttentionCenterDomain;

        public EntityxAttentionCenterController(IEntityxAttentionCenterDomain oIEntityxAttentionCenterDomainIn)
        {
            oIEntityxAttentionCenterDomain = oIEntityxAttentionCenterDomainIn;
        }

        [HttpGet] 
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strCentroAtencion,string strIdComboActivo)
        {
            List<EntityAttentionCenter> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIEntityxAttentionCenterDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strCentroAtencion,strIdComboActivo);

            }
            return new JsonResult(miLista);
        }

        [HttpGet]
        [Route("~/api/CurrentAttentionCenterEntity")]
        public JsonResult CurrentAttentionCenterEntity(int CodeAttentionCenter)
        {
            List<EntityAttentionCenter> miLista = null;
            if (CodeAttentionCenter != 0)
            {
                miLista = oIEntityxAttentionCenterDomain.CurrentAttentionCenterEntity(CodeAttentionCenter);
            }
            return new JsonResult(miLista);
        }

        [HttpPost]
        [Route("~/api/SaveAttentionCenterxEntity")]
        public JsonResult SaveAttentionCenterxEntity(EntityAttentionCenter oEntityAttentionCenter)
        {
            return new JsonResult(oIEntityxAttentionCenterDomain.Save(oEntityAttentionCenter));
        }


        [HttpPost]
        [Route("~/api/Delete")]
        public JsonResult Delete(EntityAttentionCenter oEntityAttentionCenter)
        {
            return new JsonResult(oIEntityxAttentionCenterDomain.Delete(oEntityAttentionCenter));
        }
    }
}