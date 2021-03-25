using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Turns.Web.Models;
using Video.Entity;

namespace Turns.Web.Areas.Administration.Controllers
{
    public class VideoController : Controller
    {
        private readonly ParameterConf config;
        public VideoController(IOptions<ParameterConf> conf)
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


        // GET: Video/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Video/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Video/Create
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

        // GET: Video/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Video/Edit/5
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

        // GET: Video/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Video/Delete/5
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


        [HttpPost]
        public async Task<IActionResult> save_file(IFormFile file, string txtNameVideo)
        {
            ErrorViewModel msg = new ErrorViewModel();
            try
            {
                //if (file == null || file.Length == 0) {                 
                    //    ViewBag.Mensaje = "Archivo no seleccionado";
                    //    return RedirectToAction("Index");
                    //    //return Content("Archivo no seleccionado");
                    //}                    
                    //if (txtNameVideo!=null)
                    //{
                    var extension = Path.GetExtension(file.FileName);

                    //switch (extension)
                    //{
                    //    case ".mp4":
                    //    case ".avi":
                    //    case ".m4v":
                    //    case ".mov":
                    //    case ".wmv":
                    //        break; 
                    //    default:
                    //        msg.Mensaje = "El tipo de archivo no esta permitido (no se permiten archivos tipo .JPG,.PNG,.DOC,.XLS,.PPT,.PDF,.ZIP)";
                    //        return Content(msg.Mensaje); 
                    //}

                    //if (file.Length > 100000000)
                    //{
                    //    return Content("El archivo no debe superar los 100MB");
                    //}
                    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Uploads/Video", txtNameVideo + "" + extension);

                    VideoEntity vidEnt = new VideoEntity();
                    Video.Entity.Video miv = new Video.Entity.Video();
                    miv.VideoName = txtNameVideo + "" + extension;
                    miv.Route = "/Uploads/Video/"+ txtNameVideo + "" + extension;
                    miv.VideoAdress = path;
                    vidEnt.Save(miv);

                    using (var stream = new FileStream(path, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }
                    //return RedirectToAction("Files");
                    //return Json(new { success = txtNameVideo + "" + extension });
                    //VideoEntity vidEnt = new VideoEntity();
                    //Video.Entity.Video miv = new Video.Entity.Video();
                    //miv.VideoName = txtNameVideo + "" + extension;
                    //miv.VideoAdress = path;

                    //vidEnt.Save(miv);
                
                    return RedirectToAction("Index");
                //}
                //else
                //{
                //    return Content("Debe de Ingresar la denominación del Video");
                //}                
            }
            catch(Exception ex)
            {
                return Content("Hubo un problema al guardar el video",ex.ToString()); 
            }  
        }
    }
}