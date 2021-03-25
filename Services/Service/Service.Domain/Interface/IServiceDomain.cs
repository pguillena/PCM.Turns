using Service.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Service.Entity;
using Turns.Transversal;

namespace Service.Domain.Interface
{
   public interface IServiceDomain
    {
        List<ServiceEntity> GetService(int strIdTipoServicio);
        //string ReturnEntityString();
        List<ServiceEntity> Search(string strField, string strOrder, int strPagDesde, int strPagHasta, string strServicio, int strIdTipoServicio);

        List<ServiceEntity> GetRecord(int id);

        ServiceEntity Save(ServiceEntity oServiceEntity);

        ServiceEntity Delete(ServiceEntity oServiceEntity);

        List<ServiceEntity> Autocomplete();

        List<TypeService> SearchTypeService();

    }
}
