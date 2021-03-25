using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Turns.Web.Models;

namespace Turns.Web.Areas.Administration.Controllers
{
    public class ZoneController : Controller
    {
        private readonly ParameterConf config;
        public ZoneController(IOptions<ParameterConf> conf)
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

        // GET: Zone/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Zone/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Zone/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Zone/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Zone/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: Zone/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Zone/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}