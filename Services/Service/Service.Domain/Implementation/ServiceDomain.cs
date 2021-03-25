using Service.Domain.Interface;
using Service.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using Turns.Transversal;
using Service.Entity;

namespace Service.Domain.Implementation
{
    public class ServiceDomain: IServiceDomain
    {
        ServiceEntity serviceEntity;

        public ServiceDomain()
        {
            serviceEntity = new ServiceEntity();
            serviceEntity.Load();
        }

        public List<ServiceEntity> GetService(int CodeTypeService)
        {
            return null;//serviceEntity.GetService(CodeTypeService);
        }

        public List<ServiceEntity> Search(string strField, string strOrder, int strPagDesde, int strPagHasta,string strServicio, int strIdTipoServicio)
        {            
            try
            {
                return serviceEntity.Search(strField, strOrder, strPagDesde, strPagHasta, strServicio, strIdTipoServicio);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);         
            }
        }

        public List<ServiceEntity> GetRecord(int id)
        {
            return serviceEntity.GetRecord(id);
        }

        public ServiceEntity Save(ServiceEntity oServiceEntity)
        {
            return serviceEntity.Save(oServiceEntity);
        }

        public ServiceEntity Delete(ServiceEntity oServiceEntity)
        {
            return serviceEntity.Delete(oServiceEntity);
        }

        public List<ServiceEntity> Autocomplete()
        {
            return serviceEntity.Autocomplete();
        }

        public List<TypeService> SearchTypeService()
        {
            return serviceEntity.SearchTypeService();
        }

    }
}
