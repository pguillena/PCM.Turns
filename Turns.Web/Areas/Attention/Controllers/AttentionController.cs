using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Turns.Web.Models;

namespace Turns.Web.Areas.Attention.Controllers
{
    public class AttentionController : Controller
    {
        private readonly ParameterConf config;

        public AttentionController(IOptions<ParameterConf> conf)
        {
            config = conf.Value;
        }
        // GET: Attention
        public ActionResult Index()
        {
            ParameterModel model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }

        // GET: Attention/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Attention/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Attention/Create
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

        // GET: Attention/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Attention/Edit/5
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

        // GET: Attention/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Attention/Delete/5
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