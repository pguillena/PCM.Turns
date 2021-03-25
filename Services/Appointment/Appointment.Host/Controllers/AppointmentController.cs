using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Appointment.Domain.Interface;
using Appointment.Entity;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Appointment.Host.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("AppointmentPolicy")]
    public class AppointmentController : ControllerBase
    {
        private readonly IAppointmentDomain oIAppointmentDomain;


        public AppointmentController(IAppointmentDomain oIAppointmentDomainIn)
        {
            oIAppointmentDomain = oIAppointmentDomainIn;
        }

        [HttpGet]
        public ActionResult<IEnumerable<AppointmentEntity>>  GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,
        string strIdComboActivo, int CodeAttentionCenter, int CodeChannelTypeAttention, int CodeReservationType
        , string AppointmentDateBegin, string AppointmentDateEnd)
        {
            List<AppointmentEntity> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIAppointmentDomain.GetAll(strPagDesde, strPagHasta,strField,strOrder,
                             strIdComboActivo, CodeAttentionCenter, CodeChannelTypeAttention, CodeReservationType
                            ,  AppointmentDateBegin,  AppointmentDateEnd);
                return miLista;
            }
            else
            {
                return miLista;
            }
            //return Json(miLista, JsonRequestBehavior.AllowGet);
        }

        // GET: api/GetAllActivity*/
        [HttpGet]
        [Route("~/api/GetAllActivity")]
        public ActionResult<IEnumerable<AppointmentEntity>> GetAllActivity()
        {
            var miLista = oIAppointmentDomain.GetAllActivity();
            return miLista;
            //return Json(miLista, JsonRequestBehavior.AllowGet);
        }
               

        [HttpPost]
        [Route("~/api/ListarServicexAttentionCenter")]
        public ActionResult<IEnumerable<AppointmentEntity>> ListarServicexAttentionCenter([FromBody]AppointmentEntity appointmentEntity)
        {
            return oIAppointmentDomain.ListarServicexAttentionCenter(appointmentEntity);
        }

        [HttpPost]
        [Route("~/api/GetActivityId")]
        public ActionResult<IEnumerable<AppointmentEntity>> GetActivityId([FromBody]AppointmentEntity appointmentEntity)
        {
            return oIAppointmentDomain.GetActivityId(appointmentEntity);
        }
        
        [HttpPost]
        [Route("~/api/GetActivityIdDate")]
        public ActionResult<IEnumerable<AppointmentEntity>> GetActivityIdDate([FromBody]AppointmentEntity appointmentEntity)
        {
            return oIAppointmentDomain.GetActivityIdDate(appointmentEntity);
        }

        [HttpPost]
        [Route("~/api/GetScheduleId")]
        public ActionResult<IEnumerable<AppointmentEntity>> GetScheduleId([FromBody]AppointmentEntity appointmentEntity)
        {
            return oIAppointmentDomain.GetScheduleId(appointmentEntity);
        }

        [HttpPost]
        [Route("~/api/InsertActivity")]
        public ActionResult<IEnumerable<AppointmentEntity>> InsertActivity([FromBody] List<AppointmentEntity> oAppointmentEntity)
        {
            return oIAppointmentDomain.InsertActivity(oAppointmentEntity);
        }

        [HttpPost]
        [Route("~/api/ProgramarCita")]
        public ActionResult<IEnumerable<AppointmentEntity>> ProgramarCita([FromBody] AppointmentEntity oAppointmentEntity)
        {
            return oIAppointmentDomain.ProgramarCita(oAppointmentEntity);
        }

        //Grabar Progrmacion de Horario
        [HttpPost]
        [Route("~/api/InsertScheduleAttentionCenter")]
        public ActionResult<IEnumerable<AppointmentEntity>> InsertScheduleAttentionCenter([FromBody] List<AppointmentEntity> oAppointmentEntity)
        {
            return oIAppointmentDomain.InsertScheduleAttentionCenter(oAppointmentEntity);
        }

        [HttpPost]
        [Route("~/api/ExportNumberAppointment")]
        public ActionResult<IEnumerable<AppointmentEntity>> ExportNumberAppointment([FromBody] AppointmentEntity appointmentEntity)
        {
            return oIAppointmentDomain.ExportNumberAppointment(appointmentEntity);
        }
        
        [HttpGet]
        [Route("~/api/GetAttentionCenterId")]
        public ActionResult<IEnumerable<AppointmentEntity>> GetAttentionCenterId(int CodeServiceEntity)
        {
            return oIAppointmentDomain.GetAttentionCenterId(CodeServiceEntity);
        }

        [HttpGet]
        [Route("~/api/GetAllService")]
        public ActionResult<IEnumerable<AppointmentEntity>> GetAllService()
        {
            List<AppointmentEntity> miLista = null;
            miLista = oIAppointmentDomain.GetAllService();
            return miLista;

        }

        [HttpGet]
        [Route("~/api/GetAllDocumentType")]

        //public ActionResult<IEnumerable<EntityEntity>> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strIdDescripcion)
        public ActionResult<IEnumerable<AppointmentEntity>> GetAllDocumentType()
        {
            List<AppointmentEntity> miLista = null;
            miLista = oIAppointmentDomain.GetAllDocumentType();
            return miLista;

        }

        [HttpGet]
        [Route("~/api/GetAllChannelTypeAttention")]

        //public ActionResult<IEnumerable<EntityEntity>> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strIdDescripcion)
        public ActionResult<IEnumerable<AppointmentEntity>> GetAllChannelTypeAttention()
        {
            List<AppointmentEntity> miLista = null;
            miLista = oIAppointmentDomain.GetAllChannelTypeAttention();
            return miLista;

        }

        [HttpGet]
        [Route("~/api/GetAllConfigurationType")]
        public JsonResult GetAllConfigurationType(int PagDesde, int PagHasta, int CodeAttentionCenter, int CodeEntityAttentionCenter, int CodeServiceEntity)
        {
            List<AppointmentEntity> miLista = null;
            if (PagDesde != 0 & PagHasta != 0)
            {
                miLista = oIAppointmentDomain.GetAllConfigurationType(PagDesde, PagHasta, CodeAttentionCenter, CodeEntityAttentionCenter, CodeServiceEntity);
                return new JsonResult(miLista);
            }
            else
            {
                return new JsonResult(miLista);
            }
        }

        [HttpPost]
        [Route("~/api/SaveServiceReservationType")]
        public AppointmentEntity SaveServiceReservationType([FromBody]AppointmentEntity appointmentEntity)
        {
            return oIAppointmentDomain.InsertServiceAttentionCenter(appointmentEntity);
        }

        [HttpPost]
        [Route("~/api/DeleteServiceAttentionCenter")]
        public AppointmentEntity DeleteServiceAttentionCenter([FromBody]AppointmentEntity appointmentEntity)
        {
            return oIAppointmentDomain.DeleteServiceAttentionCenter(appointmentEntity);
        }



      
          [HttpGet]
        public ActionResult<IEnumerable<AppointmentEntity>> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,
              string strIdComboActivo, int CodeAttentionCenter, int CodeChannelTypeAttention, string AppointmentDateBegin)
        {
            List<AppointmentEntity> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIAppointmentDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder, strIdComboActivo, CodeAttentionCenter, CodeChannelTypeAttention, AppointmentDateBegin);
                return miLista;
            }
            else
            {
                return miLista;
            }
            //return Json(miLista, JsonRequestBehavior.AllowGet);
        }

      
         [HttpGet]
        [Route("~/api/Report")]
        public ActionResult<IEnumerable<AppointmentEntity>> Report(int strPagDesde, int strPagHasta, string strField, string strOrder,
            int strIdComboActivo, int CodeAttentionCenter,int CodeServiceEntity, int CodeChannelTypeAttention, int CodeReservationType
            , string AppointmentDateBegin, string AppointmentDateEnd
            )
        {
            List<AppointmentEntity> miLista = null;
            if (strPagDesde != 0 & strPagHasta != 0)
            {
                miLista = oIAppointmentDomain.GetAll(strPagDesde, strPagHasta, strField, strOrder,
             strIdComboActivo.ToString(), CodeAttentionCenter, CodeChannelTypeAttention, CodeReservationType, AppointmentDateBegin, AppointmentDateEnd);
                return miLista;
            }
            else
            {
                return miLista;
            }
            //return Json(miLista, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        [Route("~/api/ConsultaCita")]
        public ActionResult<IEnumerable<AppointmentEntity>> ConsultaCita(int CodeAttentionCenter, string ndoc)
        {
            List<AppointmentEntity> miLista = new List<AppointmentEntity>();
            miLista = oIAppointmentDomain.ConsultaCita(CodeAttentionCenter, ndoc);
             //strIdComboActivo.ToString(), CodeAttentionCenter, CodeChannelTypeAttention, CodeReservationType, AppointmentDateBegin, AppointmentDateEnd);
                return miLista;
            //return Json(miLista, JsonRequestBehavior.AllowGet);
        }



        [HttpGet]
        [Route("~/api/GetEntitybyAttentionCenter")]
        public ActionResult<IEnumerable<AppointmentEntity>> GetEntitybyAttentionCenter(int CodeAttentionCenter)
        {
            return oIAppointmentDomain.GetEntitybyAttentionCenter(CodeAttentionCenter);
        }

        [HttpGet]
        [Route("~/api/GetServiceEntitybyCodeEntityComboCitas")]
        public ActionResult<IEnumerable<AppointmentEntity>> GetServiceEntitybyCodeEntityComboCitas(int CodigoEntity)
        {
            return oIAppointmentDomain.GetServiceEntitybyCodeEntityComboCitas(CodigoEntity);
        }

   

        [HttpGet]
        [Route("~/api/GetReservationType")]
        public JsonResult GetReservationType(int CodeReservationType)
        {
            List<AppointmentEntity> miLista = null;
            miLista = oIAppointmentDomain.GetReservationType(CodeReservationType);
            return new JsonResult(miLista);
        }

        [HttpGet]
        [Route("~/api/GetRecordServiceAttentionCenter")]
        public List<AppointmentEntity> GetRecordServiceAttentionCenter(int CodeServAttenCenter)
        {
            return oIAppointmentDomain.GetRecordServiceAttentionCenter(CodeServAttenCenter);
        }




    }
}
