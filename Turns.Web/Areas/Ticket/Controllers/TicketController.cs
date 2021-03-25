using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Turns.Web.Models;


namespace Turns.Web.Areas.Ticket.Controllers
{
    public class TicketController : Controller
    {
        GEMovPersona oGEMovPersona = new GEMovPersona();
        private readonly ParameterConf config;
        
        public TicketController(IOptions<ParameterConf> conf)
        {
            config = conf.Value;
        }
        // GET: Ticket
        public ActionResult Index()
        {           
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }

        public ActionResult TicketR()
        {
            ParameterModel model2 = new ParameterModel();
            model2.Parametros = config;

            return View(model2);
        }
        public ActionResult TicketM()
        {
            ParameterModel model2 = new ParameterModel();
            model2.Parametros = config;

            return View(model2);
        }

       


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(string gg)
        {
            return View();
        }

        public ActionResult List()
        {
            return View();
        }


        public ActionResult Service(string datos,string nro,int tipoDoc,string direccion,string estadoCivil)
        {
            //oGEMovPersona.nvNombreCompleto = datos;
            //oGEMovPersona.nvNumDocumento = nro;
            //oGEMovPersona.nvTipoDoc = tipoDoc;
            //oGEMovPersona.nvDireccion = direccion;
            //oGEMovPersona.nvEstadoCivil = estadoCivil;

            ViewBag.nvNombreCompleto = datos;
            ViewBag.nvNumDocumento = nro;
            ViewBag.nvTipoDoc = tipoDoc;
            ViewBag.nvDireccion = direccion;
            ViewBag.nvEstadoCivil = estadoCivil;

            ParameterModel model = new ParameterModel();
            model.Parametros = config;
            return View(model);   
            
        }

        public ActionResult ServiceP(string datos, string nro, int tipoDoc, string direccion, string estadoCivil)
        {
            //oGEMovPersona.nvNombreCompleto = datos;
            //oGEMovPersona.nvNumDocumento = nro;
            //oGEMovPersona.nvTipoDoc = tipoDoc;
            //oGEMovPersona.nvDireccion = direccion;
            //oGEMovPersona.nvEstadoCivil = estadoCivil;

            ViewBag.nvNombreCompleto = datos;
            ViewBag.nvNumDocumento = nro;
            ViewBag.nvTipoDoc = tipoDoc;
            ViewBag.nvDireccion = direccion;
            ViewBag.nvEstadoCivil = estadoCivil;

            ParameterModel model = new ParameterModel();
            model.Parametros = config;
            return View(model);

        }
        public ActionResult Ticket(int codeTicket)
        {
            //var report = new ReportModel();
            //report.CodeTicket = codeTicket;
            ViewBag.CodeTicket = codeTicket;
            ParameterModel model2 = new ParameterModel();
            model2.Parametros = config;
            return View(model2);
        }

        public ActionResult ObtenerDatos(GEMovPersona model) {
            HttpWebResponse resp = null;
           
           
            String resource = "https://ws5.pide.gob.pe/Rest/Reniec/Consultar?" + "nuDniConsulta=" + model.nvNumDocumento
                + "&nuDniUsuario=" + "32908159"
                + "&nuRucUsuario=" + "20168999926"
                + "&password=" + "32908159";

            WebRequest req = WebRequest.Create(@resource);
            req.Method = "GET";
            try
            {
                 resp = req.GetResponse() as HttpWebResponse; 
            }
            catch (Exception ex)
            {
                oGEMovPersona.iCondicion = -1;
                oGEMovPersona.nvNombreCompleto = "El servicio de RENIEC no esta disponible en estos momentos";
                return Json(new { success = oGEMovPersona, ex});  
            }
            if (resp.StatusCode == HttpStatusCode.OK)
            {
                using (Stream respStream = resp.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(respStream, Encoding.UTF8);
                    //   string result = reader.ReadToEnd();
                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.Load(reader);
                    XmlNodeList persona = xmlDoc.GetElementsByTagName("datosPersona");
                    if (persona.Count > 0)
                    {
                        oGEMovPersona.nvNombre = persona[0].ChildNodes[5].InnerText;
                        oGEMovPersona.nvApePaterno = persona[0].ChildNodes[0].InnerText;
                        oGEMovPersona.nvApeMaterno = persona[0].ChildNodes[1].InnerText;
                        oGEMovPersona.nvDireccion =persona[0].ChildNodes[2].InnerText;
                        oGEMovPersona.nvEstadoCivil =persona[0].ChildNodes[3].InnerText;  
                        // oGEMovPersona.dtFechNacimiento = DateTime.ParseExact(result[13].ToString(), "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString();
                        //oGEMovPersona.cCodSexo = result[12];
                        oGEMovPersona.nvNombreCompleto = oGEMovPersona.nvApePaterno + " " + oGEMovPersona.nvApeMaterno + ", " + oGEMovPersona.nvNombre;
                        oGEMovPersona.nvObservacion = "--RENIEC";
                        //object sexo = result[12];
                        //if (sexo.ToString().Equals("1"))
                        //    oGEMovPersona.cCodSexo = "00001";
                        //else
                        //    oGEMovPersona.cCodSexo = "00002";
                        oGEMovPersona.cCodSexo = "00000";
                        oGEMovPersona.cCodMaeDocumento = "00001";
                        oGEMovPersona.nvNumDocumento = model.nvNumDocumento;
                        oGEMovPersona.iCondicion = 1;

                        /*guardando persona*/
                        oGEMovPersona.iRegUsuaRegistra = 1;
                        //oGEMovPersona.biCodMovPersona = oIGEMovPersonaService.Insertar(oGEMovPersona);
                    }
                    else {
                        oGEMovPersona.iCondicion = 0;
                        oGEMovPersona.nvNombreCompleto = "No se ha encontrado información para el número de DNI:" + model.nvNumDocumento;
                    }
                }
            }           
            //return Json(new {success = oGEMovPersona },JsonRequestBehavior.AllowGet);
            //return Json(new { success = true, oldval = oldval },JsonRequestBehavior.AllowGet);          
            return Json(new {success = oGEMovPersona });
        }

        // GET: Ticket/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Ticket/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Ticket/Create
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

        // GET: Ticket/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Ticket/Edit/5
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

        // GET: Ticket/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Ticket/Delete/5
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