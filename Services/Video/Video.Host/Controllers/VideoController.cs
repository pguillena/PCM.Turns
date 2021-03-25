using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Video.Domain.Interface;

namespace Video.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("VideoPolicy")]
    public class VideoController : ControllerBase
    {
        private readonly IVideoDomain oIVideoDomain;
      
        public VideoController(IVideoDomain oIVideoDomainIn)
        {
            oIVideoDomain = oIVideoDomainIn;
        }


        [HttpGet]
        public JsonResult GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,string strCboEstado,int strCboVideo)
        {
            List<Entity.Video> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIVideoDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strCboEstado, strCboVideo);
                return new JsonResult(miLista);
            }
            else
            {
                return new JsonResult(miLista); ;
            }
        }

        [HttpGet]
        [Route("~/api/AutocompleteVideo")]
        public JsonResult AutocompleteVideo()
        {
            return new JsonResult(oIVideoDomain.Autocomplete());
        }
        // PUT: api/Banner/5
        [HttpPost]
        [Route("~/api/DeleteVideo")]
        public JsonResult DeleteVideo(Entity.Video oVideo)
        {
            return new JsonResult(oIVideoDomain.Delete(oVideo));
        }

        [HttpPost]
        [Route("~/api/AprobarVideo")]
        public JsonResult AprobarVideo(Entity.Video oVideo)
        {
            return new JsonResult(oIVideoDomain.Aprobar(oVideo));
        }

        [HttpGet]
        [Route("~/api/ListarVideoAprobado")]
        public JsonResult ListarVideoAprobado() {

            return new JsonResult(oIVideoDomain.ListarVideoAprobado());
        }
    }
}