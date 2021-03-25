using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EntidadxServicio.Domain.Interface;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;



namespace EntidadxServicio.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController] 
    [EnableCors("EntidadxServicioPolicy")]
    public class EntidadxServicioController : ControllerBase
    {
        private readonly IEntidadxServicioDomain oIEntidadxServicioDomain;

        public EntidadxServicioController(IEntidadxServicioDomain oIEntidadxServicioDomainIn)
        {
            oIEntidadxServicioDomain = oIEntidadxServicioDomainIn;
        }

        [HttpGet]
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdEntidad,string strIdComboActivo)
        {
            List<Entity.ServicioEntidad> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIEntidadxServicioDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strIdEntidad, strIdComboActivo);
            }
            return new JsonResult(miLista);
        }

        [HttpGet]
        [Route("~/api/ListarCurrentEntityService")]
        public JsonResult ListarCurrentEntityService(int CodeEntity)
        {           
            List < Entity.ServicioEntidad > miLista = null;          
            if (CodeEntity != 0)
            {
                miLista = oIEntidadxServicioDomain.CurrentEntityService(CodeEntity);
            }
            return new JsonResult(miLista);
        }


        [HttpPost]
        [Route("~/api/SaveEntityxServicio")]
        public JsonResult SaveEntityxServicio(Entity.ServicioEntidad oServicioEntidad)
        {
            return new JsonResult(oIEntidadxServicioDomain.Save(oServicioEntidad));     
        }

        [HttpPost]
        [Route("~/api/Delete")]
        public JsonResult Delete(Entity.ServicioEntidad oServicioEntidad)
        {
            return new JsonResult(oIEntidadxServicioDomain.Delete(oServicioEntidad));
        }


        [HttpGet]
        [Route("~/api/ListEntityService")]
        public JsonResult ListEntityService()
        {
            List<Entity.ServicioEntidad> miLista = null;
            miLista = oIEntidadxServicioDomain.ListEntityService();
            return new JsonResult(miLista);
        }

        [HttpGet]
        [Route("~/api/ListFilter")]
        public JsonResult ListFilter(int CodeService,int CodeEntity) {
            List<Entity.ServicioEntidad> miLista = null;
            miLista = oIEntidadxServicioDomain.ListFilter(CodeService, CodeEntity);
            return new JsonResult(miLista);
        }

        [HttpGet]
        [Route("~/api/AutocompleteEntidad")]
        public List<JQSelectBE> AutocompleteEntidad(int pMaxRows, string pName_startsWith)
        {
            List<JQSelectBE> miLista1 = null;
            miLista1 = oIEntidadxServicioDomain.Autocomplete(pMaxRows, pName_startsWith);
            return miLista1;
        }
    }
}