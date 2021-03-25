using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Turns.Web.Models;

namespace Turns.Web.Areas.Administration.Controllers
{
    public class TicketTypeController : Controller
    {
        private readonly ParameterConf config;
        public TicketTypeController(IOptions<ParameterConf> conf)
        {
            config = conf.Value;
        }

        // GET: Window
        public ActionResult Index()
        {
            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }
    }
}