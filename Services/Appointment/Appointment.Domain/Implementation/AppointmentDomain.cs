using Appointment.Domain.Interface;
using Appointment.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using Transversal;


namespace Appointment.Domain.Implementation
{
    public class AppointmentDomain : IAppointmentDomain
    {
        AppointmentEntity AppointmentEntity;

        public AppointmentDomain()
        {
            AppointmentEntity = new AppointmentEntity();
            AppointmentEntity.Load();
        }

        public List<AppointmentEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,
        string strIdComboActivo, int CodeAttentionCenter, int CodeChannelTypeAttention, int CodeReservationType
        , string AppointmentDateBegin, string AppointmentDateEnd)
        {
            return AppointmentEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder, strIdComboActivo, CodeAttentionCenter, CodeChannelTypeAttention, CodeReservationType
            ,AppointmentDateBegin, AppointmentDateEnd);
        }
        public List<AppointmentEntity> GetAllActivity()
        {
            return AppointmentEntity.GetAllActivity();
        }     
        public List<AppointmentEntity> ListarServicexAttentionCenter(AppointmentEntity appointmentEntity)
        {
            return AppointmentEntity.ListarServicexAttentionCenter(appointmentEntity);
        }
        public List<AppointmentEntity> GetActivityId(AppointmentEntity appointmentEntity)
        {
            return AppointmentEntity.GetActivityId(appointmentEntity);
        }
        public List<AppointmentEntity> GetActivityIdDate(AppointmentEntity appointmentEntity)
        {
            return AppointmentEntity.GetActivityIdDate(appointmentEntity);
        }

        
        public List<AppointmentEntity> GetScheduleId(AppointmentEntity appointmentEntity)
        {
            return AppointmentEntity.GetScheduleId(appointmentEntity);
        }

        

        public List<AppointmentEntity> InsertActivity(List<AppointmentEntity> oAppointmentEntity)
        {
            return AppointmentEntity.InsertActivity(oAppointmentEntity);
        }

        public List<AppointmentEntity> InsertScheduleAttentionCenter(List<AppointmentEntity> oAppointmentEntity)
        {
            return AppointmentEntity.InsertScheduleAttentionCenter(oAppointmentEntity);
        }

        public List<AppointmentEntity> ProgramarCita(AppointmentEntity oAppointmentEntity)
        {
            return AppointmentEntity.ProgramarCita(oAppointmentEntity);
        }
        public List<AppointmentEntity> ExportNumberAppointment(AppointmentEntity appointmentEntity)
        {
            return AppointmentEntity.ExportNumberAppointment(appointmentEntity);
        }
        public List<AppointmentEntity> GetAttentionCenterId(int CodeServiceEntity)
        {
            return AppointmentEntity.GetAttentionCenterId(CodeServiceEntity);
        }              

        public List<AppointmentEntity> GetAllService()
        {
            return AppointmentEntity.GetAllService();
        }
        public List<AppointmentEntity> GetAllDocumentType()
        {
            return AppointmentEntity.GetAllDocumentType();
        }
        public List<AppointmentEntity> GetAllChannelTypeAttention()
        {
            return AppointmentEntity.GetAllChannelTypeAttention();
        }

        
        public string ReturnAppointmentString()
        {
            return TurnTransversal.ReturnString(AppointmentEntity.AppointmentValue);
        }

        public List<AppointmentEntity> GetAllConfigurationType(int PagDesde, int PagHasta, int CodeAttentionCenter, int CodeEntityAttentionCenter, int CodeServiceEntity)
        {
            return AppointmentEntity.GetAllConfigurationType(PagDesde, PagHasta, CodeAttentionCenter, CodeEntityAttentionCenter, CodeServiceEntity);
        }

        public AppointmentEntity InsertServiceAttentionCenter(AppointmentEntity appointmentEntity)
        {
            return AppointmentEntity.InsertServiceAttentionCenter(appointmentEntity);
        }

        public AppointmentEntity DeleteServiceAttentionCenter(AppointmentEntity appointmentEntity)
        {
            return AppointmentEntity.DeleteServiceAttentionCenter(appointmentEntity);
        }

        public List<AppointmentEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, string strIdComboActivo, int CodeAttentionCenter, int CodeChannelTypeAttention, string AppointmentDateBegin)
        {
            return AppointmentEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder, strIdComboActivo, CodeAttentionCenter, CodeChannelTypeAttention, AppointmentDateBegin);
        }


        public List<AppointmentEntity> ConsultaCita(int CodeAttentionCenter, string ndoc)
        {
            return AppointmentEntity.ConsultaCita(CodeAttentionCenter,ndoc);
        }


        public List<AppointmentEntity> GetEntitybyAttentionCenter(int CodeAttentionCenter)
        {
            AppointmentEntity appointmentEntity = new AppointmentEntity { CodeAttentionCenter = CodeAttentionCenter };

            return AppointmentEntity.GetEntitybyAttentionCenter(appointmentEntity);
        }

        public List<AppointmentEntity> GetServiceEntitybyCodeEntityComboCitas(int CodeEntity)
        {
            AppointmentEntity appointmentEntity = new AppointmentEntity { CodeEntity = CodeEntity };

            return AppointmentEntity.GetServiceEntitybyCodeEntityComboCitas(appointmentEntity);
        }


        public List<AppointmentEntity> GetReservationType(int CodeReservationType)
        {
            return AppointmentEntity.GetReservationType(CodeReservationType);
        }

        public List<AppointmentEntity> GetRecordServiceAttentionCenter(int CodeServAttenCenter)
        {
            return AppointmentEntity.GetRecordServiceAttentionCenter(CodeServAttenCenter);
        }



    }
}
