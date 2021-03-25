using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Service.Domain.Interface;
using Service.Entities;

namespace Service.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("ServicePolicy")]
    public class ServiceController : ControllerBase
    {
        private readonly IServiceDomain oIServiceDomain;
        
        public ServiceController(IServiceDomain oIServiceDomainIn)
        {
            oIServiceDomain = oIServiceDomainIn;
        }
        // GET: api/Service
        [HttpGet]
        public JsonResult Get(string strField,string strOrder,int strPagDesde,int strPagHasta, string strServicio, int strIdTipoServicio)
        {

            List<ServiceEntity> response = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                response = oIServiceDomain.Search(strField,strOrder,strPagDesde,strPagHasta, strServicio, strIdTipoServicio);        
                return new JsonResult(response);
            }
            else
            {
                return new JsonResult(response); ;
            }
        }
                     
        [HttpGet]
        [Route("~/api/CurrentRowService")]
        public JsonResult CurrentRowService(int id)
        {
            var currentRow = oIServiceDomain.GetRecord(id);
            return new JsonResult(currentRow);            
        }

        [HttpPost]
        [Route("~/api/SaveService")]
        public ServiceEntity SaveService(ServiceEntity oServiceEntity)
        {
            return oIServiceDomain.Save(oServiceEntity);
        }

        [HttpPost]
        [Route("~/api/DeleteService")]
        public ServiceEntity DeleteService([FromBody]ServiceEntity oServiceEntity)
        {         
            return oIServiceDomain.Delete(oServiceEntity);
        }

        [HttpGet]
        [Route("~/api/AutocompleteService")]
        public JsonResult AutocompleteService()
        {            
            return new JsonResult(oIServiceDomain.Autocomplete());
        }

        [HttpGet]
        [Route("~/api/SearchTypeService")]
        public JsonResult SearchTypeService(int id)
        {            
            var response = oIServiceDomain.SearchTypeService();
            return new JsonResult(response);
        }

        // POST: api/Service
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Service/5
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
