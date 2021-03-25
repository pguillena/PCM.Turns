
using System;
using System.IO;
using System.Net;
using System.Text;
using System.Xml;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Turns.Web.Models;
using System.Data;
using System.Collections.Generic;
using System.Net.Http;
using System.Linq;
using System.Reflection;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using OfficeOpenXml;
using Microsoft.AspNetCore.Hosting;
using OfficeOpenXml.Style;
using System.Drawing;

namespace Turns.Web.Areas.Appointment.Controllers
{
    public class AppointmentController : Controller
    {
        // GET: /<controller>/
        private readonly ParameterConf config;
        private readonly IHostingEnvironment _env;



        public AppointmentController(IOptions<ParameterConf> conf, IHostingEnvironment env)
        {
            config = conf.Value;
            _env = env;
        }

        // GET: Entity

        public IActionResult ReportNumberAppointment()
        {
            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }

        public IActionResult ReportAppointment()
        {
            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }

        public IActionResult ReservationAppointment()//int productId, int orderId, int employeeId, string mode)
        {

            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }


        public IActionResult ReservationPeople()
        {
            return View();
        }

        public IActionResult Appointmentscheduling()
        {
            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }



        public IActionResult ObtenerDatos(GEAppointmentPeople model)
      {
            HttpWebResponse resp = null;
            GEAppointmentPeople oGEAppointmentPeople = new GEAppointmentPeople();

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
                oGEAppointmentPeople.nvObservacion = "El servicio de RENIEC no esta disponible en estos momentos";
                oGEAppointmentPeople.nvRazonSocial = "-1";
                return Json(new { success = oGEAppointmentPeople });
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
                        oGEAppointmentPeople.nvNombre = persona[0].ChildNodes[5].InnerText;
                        oGEAppointmentPeople.nvApePaterno = persona[0].ChildNodes[0].InnerText;
                        oGEAppointmentPeople.nvApeMaterno = persona[0].ChildNodes[1].InnerText;
                        oGEAppointmentPeople.nvRazonSocial = oGEAppointmentPeople.nvApePaterno + " " + oGEAppointmentPeople.nvApeMaterno + " " + oGEAppointmentPeople.nvNombre;
                        oGEAppointmentPeople.nvObservacion = "--RENIEC";

                        oGEAppointmentPeople.cCodSexo = "00000";
                        oGEAppointmentPeople.cCodMaeDocumento = "00001";
                        oGEAppointmentPeople.nvNumDocumento = model.nvNumDocumento;

                        /*guardando persona*/
                        oGEAppointmentPeople.iRegUsuaRegistra = 1;

                    }
                }
            }
            else
            {


            }
            return Json(new { success = oGEAppointmentPeople });
        }


        public IActionResult ExportAppointment(GEAppointmentReport model)
        {
            byte[] fileContents;
            DataTable table = ListaAppointment(model);



            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("Excel Test");
            

                worksheet.Cells[1, 1, 1, 8].Merge = true;
                worksheet.Cells[1, 1].Value = "REPORTE DE CITAS"; ;
                worksheet.Cells[1, 1].Style.Font.Bold = true;
                worksheet.Cells[1, 1].Style.Font.Size = 14;
                worksheet.Cells[1, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                worksheet.Cells[1, 1].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                worksheet.Cells[1, 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells[1, 1].Style.Fill.BackgroundColor.SetColor(Color.White);
                worksheet.Cells[1, 1].Style.Font.Color.SetColor(Color.Black);
                worksheet.Cells[1, 1, 1, 8].Style.Border.BorderAround(ExcelBorderStyle.Medium);
                worksheet.Cells[1, 1].Worksheet.Row(1).Height = 35;

                Color _cssT = default(Color);
                _cssT = Color.FromArgb(191, 191, 191);
                worksheet.Cells["A3"].LoadFromDataTable(table, PrintHeaders: true);
           

                for (var col = 1; col < table.Columns.Count + 1; col++)
                {
                    worksheet.Column(col).AutoFit();
                }
              
                //string filename = Path.Combine(Server.MapPath("~/DocProyectoTemp/"), "test.xlsx");
                string filename = Path.Combine(_env.WebRootPath, "DocCitasTemp", "ReporteCitas.xlsx");
                System.IO.File.Delete(filename);
                FileInfo excelFile = new FileInfo(filename);
                package.SaveAs(excelFile);

                //System.IO.FileInfo file = new System.IO.FileInfo(path);
                //System.IO.StreamWriter sw = System.IO.File.AppendText(file);
                ////var sw = new StreamWriter(path);

                //sw.WriteLine(email);
                //sw.Close();
                //sw.Dispose();

                return Json(new {data="1"});

            }

        }

        public DataTable ListaAppointment(GEAppointmentReport model)
        {
            IEnumerable<GEAppointmentReport> Appointment = null;
            DataTable dt = new DataTable();

            var myContent = JsonConvert.SerializeObject(model);
            var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
            var byteContent = new ByteArrayContent(buffer);
            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

            using (var client = new HttpClient())
            {
                // string Login_URL1 = "https://localhost:44327/api/GetAllChannelTypeAttention";
                //client.BaseAddress = new Uri("https://localhost:44327/api/Appointment/");
                //HTTP GET
                //var responseTask = client.PostAsync("https://localhost:44327/api/ExportNumberAppointment", byteContent);
                var responseTask = client.PostAsync(config.WebApiUrl.AppointmentService + "/ExportNumberAppointment", byteContent);
                // var responseTask = client.PostAsync(Login_URL1, model);
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<IList<GEAppointmentReport>>();
                    readTask.Wait();

                    Appointment = readTask.Result;

                    foreach (object obj in Appointment)
                    {
                        Type t = obj.GetType();
                        PropertyInfo[] pis = t.GetProperties();
                        if (dt.Columns.Count == 0)
                        {
                            foreach (PropertyInfo pi in pis)
                            {
                                object value = pi.GetValue(obj, null);
                                if (value != null && Convert.ToString(value) != "" && Convert.ToString(value) != "0")
                                {
                                    dt.Columns.Add(pi.Name, pi.PropertyType);
                                }                                                            
                              
                            }
                        }
                        DataRow dr = dt.NewRow();
                        foreach (PropertyInfo pi in pis)
                        {
                            object value = pi.GetValue(obj, null);

                            if (value != null && Convert.ToString(value) != "" && Convert.ToString(value) != "0")
                            {
                                dr[pi.Name] = value;
                            }
                        }
                        dt.Rows.Add(dr);
                    }
                    return dt;
                }
                else //web api sent error response 
                {
                    //log response status here..                  
                    dt = null;

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            return dt;
        }



        //configuración de horarios por servicio
        public IActionResult ConfigureScheduleService()
        {
            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }

        
        public IActionResult ConfigureScheduleException()
        {
            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }


        public IActionResult ConfigurationReservationType()
        {
            var model = new ParameterModel();
            model.Parametros = config;
            return View(model);
        }

        public IActionResult ExportTicket(GEAppointmentReport model)
        {
            byte[] fileContents;
            DataTable table = ListaAppointment(model);



            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("Excel Test");


                worksheet.Cells[1, 1, 1, 7].Merge = true;
                worksheet.Cells[1, 1].Value = "REPORTE DE TICKETS DE ATENCIÓN"; ;
                worksheet.Cells[1, 1].Style.Font.Bold = true;
                worksheet.Cells[1, 1].Style.Font.Size = 14;
                worksheet.Cells[1, 1].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                worksheet.Cells[1, 1].Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                worksheet.Cells[1, 1].Style.Fill.PatternType = ExcelFillStyle.Solid;
                worksheet.Cells[1, 1].Style.Fill.BackgroundColor.SetColor(Color.White);
                worksheet.Cells[1, 1].Style.Font.Color.SetColor(Color.Black);
                worksheet.Cells[1, 1, 1, 7].Style.Border.BorderAround(ExcelBorderStyle.Medium);
                worksheet.Cells[1, 1].Worksheet.Row(1).Height = 35;

                Color _cssT = default(Color);
                _cssT = Color.FromArgb(191, 191, 191);
                worksheet.Cells["A3"].LoadFromDataTable(table, PrintHeaders: true);


                for (var col = 1; col < table.Columns.Count + 1; col++)
                {
                    worksheet.Column(col).AutoFit();
                }

                //string filename = Path.Combine(Server.MapPath("~/DocProyectoTemp/"), "test.xlsx");
                string filename = Path.Combine(_env.WebRootPath, "DocCitasTemp", "ReporteTicket.xlsx");
                System.IO.File.Delete(filename);
                FileInfo excelFile = new FileInfo(filename);
                package.SaveAs(excelFile);

                //System.IO.FileInfo file = new System.IO.FileInfo(path);
                //System.IO.StreamWriter sw = System.IO.File.AppendText(file);
                ////var sw = new StreamWriter(path);

                //sw.WriteLine(email);
                //sw.Close();
                //sw.Dispose();

                return Json(new { data = "1" });

            }

        }

        public DataTable ListaTicket(GEAppointmentReport model)
        {
            IEnumerable<GEAppointmentReport> Appointment = null;
            DataTable dt = new DataTable();

            var myContent = JsonConvert.SerializeObject(model);
            var buffer = System.Text.Encoding.UTF8.GetBytes(myContent);
            var byteContent = new ByteArrayContent(buffer);
            byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

            using (var client = new HttpClient())
            {
              
                var responseTask = client.PostAsync(config.WebApiUrl.AppointmentService + "/ExportTicket", byteContent);
              
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<IList<GEAppointmentReport>>();
                    readTask.Wait();

                    Appointment = readTask.Result;

                    foreach (object obj in Appointment)
                    {
                        Type t = obj.GetType();
                        PropertyInfo[] pis = t.GetProperties();
                        if (dt.Columns.Count == 0)
                        {
                            foreach (PropertyInfo pi in pis)
                            {
                                dt.Columns.Add(pi.Name, pi.PropertyType);
                            }
                        }
                        DataRow dr = dt.NewRow();
                        foreach (PropertyInfo pi in pis)
                        {
                            object value = pi.GetValue(obj, null);
                            dr[pi.Name] = value;
                        }
                        dt.Rows.Add(dr);
                    }
                    return dt;
                }
                else //web api sent error response 
                {
                    //log response status here..                  
                    dt = null;

                    ModelState.AddModelError(string.Empty, "Server error. Please contact administrator.");
                }
            }
            return dt;
        }




    }

}
