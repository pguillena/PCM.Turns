using System;
using System.Collections.Generic; 
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Turns.Web.Models;

namespace Turns.Web.Areas.Administration.Controllers
{
    public class EntityController : Controller
    {
        private readonly ParameterConf config;
        public EntityController(IOptions<ParameterConf> conf)
        {
            config = conf.Value;
        }      

        // GET: Entity
        public ActionResult Index()
        {
            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }

        // GET: Entity/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Entity/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Entity/Create
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

        // GET: Entity/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Entity/Edit/5
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

        // GET: Entity/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Entity/Delete/5
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