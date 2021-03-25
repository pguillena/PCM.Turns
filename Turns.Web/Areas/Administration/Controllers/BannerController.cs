using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using System.Web;
using Turns.Web.Models;
using Microsoft.Extensions.Options;

namespace Turns.Web.Areas.Administration.Controllers
{
    public class BannerController : GenericController
    {
        private readonly ParameterConf config;
        public BannerController(IOptions<ParameterConf> conf)
        {
            config = conf.Value;
        }

        // GET: Window
        public ActionResult Index()
        {


            //ViewBag.Usuario = CuentaUsuario().Nombre;

            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }

    }
}