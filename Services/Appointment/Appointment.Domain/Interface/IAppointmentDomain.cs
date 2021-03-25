using Appointment.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Appointment.Domain.Interface
{
    public interface IAppointmentDomain
    {
        string ReturnAppointmentString();

        List<AppointmentEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,
        string strIdComboActivo, int CodeAttentionCenter, int CodeChannelTypeAttention, int CodeReservationType
        , string AppointmentDateBegin, string AppointmentDateEnd);
        List<AppointmentEntity> GetAllActivity();       
        List<AppointmentEntity> ListarServicexAttentionCenter(AppointmentEntity appointmentEntity);
        List<AppointmentEntity> GetActivityId(AppointmentEntity appointmentEntity);
        List<AppointmentEntity> GetActivityIdDate(AppointmentEntity appointmentEntity);
        List<AppointmentEntity> GetScheduleId(AppointmentEntity appointmentEntity);        
        List<AppointmentEntity> InsertActivity(List<AppointmentEntity> oAppointmentEntity);
        List<AppointmentEntity> InsertScheduleAttentionCenter(List<AppointmentEntity> oAppointmentEntity);
        List<AppointmentEntity> ProgramarCita(AppointmentEntity oAppointmentEntity);
        List<AppointmentEntity> ExportNumberAppointment(AppointmentEntity appointmentEntity);        
        List<AppointmentEntity> GetAttentionCenterId(int CodeEntityService);
        List<AppointmentEntity> GetAllService();
        List<AppointmentEntity> GetAllDocumentType();
        List<AppointmentEntity> GetAllChannelTypeAttention();
        List<AppointmentEntity> GetAllConfigurationType(int PagDesde, int PagHasta, int CodeAttentionCenter, int CodeEntityAttentionCenter, int CodeServiceEntity);
        AppointmentEntity InsertServiceAttentionCenter(AppointmentEntity appointmentEntity);
        AppointmentEntity DeleteServiceAttentionCenter(AppointmentEntity appointmentEntity);

        List<AppointmentEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, string strIdComboActivo, int CodeAttentionCenter, int CodeChannelTypeAttention, string AppointmentDateBegin);

        List<AppointmentEntity> ConsultaCita(int CodeAttentionCenter, string ndoc);


        List<AppointmentEntity> GetEntitybyAttentionCenter(int CodeAttentionCenter);
        List<AppointmentEntity> GetServiceEntitybyCodeEntityComboCitas(int CodeEntity);
      
        List<AppointmentEntity> GetReservationType(int CodeReservationType);
        List<AppointmentEntity> GetRecordServiceAttentionCenter(int CodeReservationType);

    }
}