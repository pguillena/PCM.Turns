using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Turns.Web.Areas.Reporte.Controllers
{
    public class MonitoreoController : Controller
    {
        // GET: Monitoreo
        public ActionResult Index()
        {
            return View();
        }

        // GET: Monitoreo/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Monitoreo/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Monitoreo/Create
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

        // GET: Monitoreo/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Monitoreo/Edit/5
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

        // GET: Monitoreo/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Monitoreo/Delete/5
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