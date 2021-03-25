using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Web;
using Turns.Web.Models;
using Microsoft.Extensions.Options;

namespace Turns.Web.Areas.Security.Controllers
{
    public class AccountController : Controller
    {
        private readonly ParameterConf config;
        public AccountController(IOptions<ParameterConf> conf)
        {
            config = conf.Value;
        }

        //[HttpGet]
        //public ActionResult Login()
        //{
        //    return View();
        //}

        public ActionResult Login()
        {


            //ViewBag.Usuario = CuentaUsuario().Nombre;

            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }

    }
}