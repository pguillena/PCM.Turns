using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Turns.Web.Models;

namespace Turns.Web.Areas.Display.Controllers
{
    public class DisplayController : Controller
    {
        private readonly ParameterConf config;
        public DisplayController(IOptions<ParameterConf> conf)
        {
            config = conf.Value;
        }
        public ActionResult Index()
        {
            return View();
        }

        // GET: Display
        public ActionResult Display1()
        {

            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }

        public ActionResult Display2()
        {
            return View();
        }


        public ActionResult Display3()
        {
            return View();
        }

        public ActionResult Display4()
        {
            return View();
        }

        public ActionResult Display5()
        {
            return View();
        }
        // GET: Display/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Display/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Display/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction(nameof(Display1));
            }
            catch
            {
                return View();
            }
        }

        // GET: Display/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Display/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction(nameof(Display1));
            }
            catch
            {
                return View();
            }
        }

        // GET: Display/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Display/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction(nameof(Display1));
            }
            catch
            {
                return View();
            }
        }
    }
}