using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entity.Domain.Implementation;
using Entity.Domain.Interface;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Entity.Entity;
using Microsoft.Extensions.Options;

namespace Entity.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    [EnableCors("EntityPolicy")]
    public class EntityController : ControllerBase
    {
        private readonly IEntityDomain oIEntityDomain;
         
        public EntityController(IEntityDomain oIEntityDomainIn)
        {
            oIEntityDomain = oIEntityDomainIn; 
        } 

        [HttpGet]
        public ActionResult<IEnumerable<EntityEntity>> GetAll(int strPagDesde,int strPagHasta,string strField, string strOrder,int strIdDescripcion,string strIdComboActivo)
        {
            List<EntityEntity> miLista=null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                 miLista = oIEntityDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strIdDescripcion, strIdComboActivo);
                return miLista;
            }
            else {                
                 return miLista;
            }
            //return Json(miLista, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [Route("~/api/SaveEntity")]
        public EntityEntity SaveEntity([FromBody]EntityEntity oEntity)
        {
            return oIEntityDomain.Insert(oEntity);
        }               

        [HttpPost]
        [Route("~/api/DeleteEntity")]
        public EntityEntity DeleteEntity([FromBody]EntityEntity oEntity)
        {
            return oIEntityDomain.Delete(oEntity);
        }
        

        //GET: api/Entity
        [HttpGet]
        [Route("~/api/CurrentRowEntity")]
        public ActionResult<IEnumerable<EntityEntity>> CurrentRowEntity(int id)
        {
            var currentRow = oIEntityDomain.GetRecord(id);
            return currentRow;
            //EntityDomain entityDomain = new EntityDomain();
            //string[] sReturnArray = new string[5];
            //for (int iIndex = 0; iIndex < sReturnArray.Length; iIndex++)
            //    sReturnArray[iIndex] = oIEntityDomain.ReturnEntityString() + " - " + iIndex.ToString();
            //return sReturnArray;
        }

        [HttpGet]
        [Route("~/api/AutocompleteEntidad")]
        public List<EntityEntity> AutocompleteEntidad()
        {           
            var miLista = oIEntityDomain.Autocomplete();
            return miLista;
        }

        [HttpGet]
        [Route("~/api/AutocompleteEntidadCentroAtencion")]
        public List<EntityEntity> AutocompleteEntidadCentroAtencion(int strCodeCentroAttention)
        {
            var miLista = oIEntityDomain.AutocompleteEntidadCentroA(strCodeCentroAttention);
            return miLista;
        }

        [HttpGet]
        [Route("~/api/ListaEntityZone")]
        public List<EntityEntity> ListaEntityZoneCA(int codeZone)
        {
            var miLista = oIEntityDomain.ListaEntityZone(codeZone);
            return miLista;
        }


        // GET: api/Entity/5
        [HttpGet("{id}", Name = "Get")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Entity
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Entity/5
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
