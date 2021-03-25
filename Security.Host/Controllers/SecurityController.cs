using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Security.Domain.Interface;
using Security.Entity;

namespace Security.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("SecurityPolicy")]
    public class SecurityController : ControllerBase
    {
        private readonly ISecurityDomain oISecurityDomain;
     
        public SecurityController(ISecurityDomain oISecurityDomainIn)
        {
            oISecurityDomain = oISecurityDomainIn;
        }




        [HttpGet]
        [Route("~/api/ListarUsuarioLocal")]
        public List<Usuario> ListarUsuarioLocal(int strPagDesde, int strPagHasta, string strField, string strOrder, string Credencial, string Clave)
        {
            var result = oISecurityDomain.ListarUsuarioLocal(strPagDesde, strPagHasta, strField, strOrder, Credencial, Clave);
            return result;
        }

    }
}