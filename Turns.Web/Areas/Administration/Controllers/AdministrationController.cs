using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Turns.Web.Areas.Administration.Controllers
{
    public class AdministrationController : Controller
    {
        // GET: Administration
        public ActionResult Index()
        {
            //Session_login
            //HttpContext.Session.SetString("Test", "Ben Rules!");
            //var hh = HttpContext.Session.GetString("Test");
            return View();
        }
  
        //public string CargaData(int PersonId, string Usuario) {
        //    //var myComplexObject = new MyClass();
        //    //HttpContext.Session.SetObjectAsJson("Test", myComplexObject);
        //    SetCuentaUsuario(PersonId, Usuario);
        //    return "OK";
       //}
    } 
}