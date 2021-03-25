using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AttentionCenter.Domain.Interface;
using AttentionCenter.Entity;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AttentionCenter.Host.Controllers
{
    [Route("api/[controller]")]    
    [ApiController]
    [EnableCors("AttentionCenterPolicy")]
    public class AttentionCenterController : ControllerBase
    {

        private readonly IAttentionCenterDomain oIAttentionCenterDomain;
        public AttentionCenterController(IAttentionCenterDomain oIAttentionCenterDomainIn)
        {
            oIAttentionCenterDomain = oIAttentionCenterDomainIn;

        }

        [HttpGet]
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strCbxCentroAtencion,string strIdComboActivo)
        {
            List<CenterAttention> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIAttentionCenterDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strCbxCentroAtencion, strIdComboActivo);                
                return new JsonResult(miLista);
            }
            else
            {
                return new JsonResult(miLista); ;
            }  
        }

        [HttpGet]
        [Route("~/api/CurrentRowCenterAttention")]
        public List<CenterAttention> CurrentRowCenterAttention(int codeAttentionCenter)
        {            
            return oIAttentionCenterDomain.GetRecord(codeAttentionCenter);
        }

        // POST: api/AttentionCenter
        [HttpPost]
        [Route("~/api/SaveCenterAttention")]
        public CenterAttention SaveCenterAttention([FromBody]CenterAttention oCenterAttention)
        {
            return oIAttentionCenterDomain.Save(oCenterAttention);
        }

        [HttpPost]
        [Route("~/api/Eliminar")]
        public CenterAttention Eliminar([FromBody]CenterAttention oCenterAttention) {

            return oIAttentionCenterDomain.DeleteOne(oCenterAttention);
        }

        [HttpGet]
        [Route("~/api/AutocompleteCentroAtencion")]
        public JsonResult AutocompleteCentroAtencion() {
            return  new JsonResult(oIAttentionCenterDomain.Autocomplete());
        }

        //[HttpPost]
        //[Route("~/api/Delete")]
        //public CenterAttention Delete(CenterAttention oCenterAttention)
        //{
        //    return oIAttentionCenterDomain.DeleteOne(oCenterAttention);
        //}

        // GET: api/AttentionCenter/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

      

        // PUT: api/AttentionCenter/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
