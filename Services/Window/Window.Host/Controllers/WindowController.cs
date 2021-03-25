using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Window.Domain.Interface;
using Window.Entity;

namespace Window.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("WindowPolicy")] 
    public class WindowController : ControllerBase
    {
        private readonly IWindowDomain oIWindowDomain;

        public WindowController(IWindowDomain oIWindowDomainIn)
        {
            oIWindowDomain = oIWindowDomainIn;
        }

        [HttpGet]
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strCboZona,int strCodeCenterAttention)
        {
            List<Entity.Window> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIWindowDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strCboZona, strCodeCenterAttention);

            }
            return new JsonResult(miLista);
        }

        [HttpGet]
        [Route("~/api/AutocompleteWindow")]
        public JsonResult AutocompleteWindow()
        {
            List<Entity.Window> miLista = null;           
            miLista = oIWindowDomain.Autocomplete();           
            return new JsonResult(miLista);
        }


        [HttpGet]
        [Route("~/api/CurrentRowWindow")]
        public JsonResult CurrentRowWindow(int CodeWindow)
        {
            List<Entity.Window> miLista = null;
            miLista = oIWindowDomain.GetRecord(CodeWindow);
            return new JsonResult(miLista);
        }

        

        [HttpPost]
        [Route("~/api/SaveWindow")]
        public JsonResult SaveWindow(Entity.Window oWindow)
        {            
            return new JsonResult(oIWindowDomain.Save(oWindow));
        }

        [HttpPost]
        [Route("~/api/DeleteWindow")]
        public JsonResult DeleteWindow(Entity.Window oWindow)
        {
            return new JsonResult(oIWindowDomain.Delete(oWindow));
        }
    }
}