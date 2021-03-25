using EntidadxServicio.Domain.Interface;
using EntidadxServicio.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace EntidadxServicio.Domain.Implementation
{
    public class EntidadxServicioDomain : IEntidadxServicioDomain
    {
        EntidadxServicioEntity oEntidadxServicioEntity;
        public EntidadxServicioDomain()
        {
            oEntidadxServicioEntity = new EntidadxServicioEntity();
            oEntidadxServicioEntity.Load();
        }

        public List<ServicioEntidad> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdEntidad,string strIdComboActivo) {
            return oEntidadxServicioEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder, strIdEntidad, strIdComboActivo);
        }

        public ServicioEntidad Save(ServicioEntidad oServicioEntidad) {
            return oEntidadxServicioEntity.Save(oServicioEntidad);
        }

        public ServicioEntidad Delete(ServicioEntidad oServicioEntidad)
        {
            return oEntidadxServicioEntity.Delete(oServicioEntidad);
        }
        
        public List<Entity.ServicioEntidad> CurrentEntityService(int CodeEntity) {
            return oEntidadxServicioEntity.CurrentEntityService(CodeEntity);
        }

        public List<ServicioEntidad> ListEntityService() {
            return oEntidadxServicioEntity.ListEntityService();
        }

        public List<Entity.ServicioEntidad> ListFilter(int CodeSevice,int CodeEntity) 
        {
            return oEntidadxServicioEntity.ListFilter(CodeSevice, CodeEntity);
        }

        public List<JQSelectBE> Autocomplete(int pMaxRows, string pName_startsWith) {

            return oEntidadxServicioEntity.Autocomplete(pMaxRows, pName_startsWith);
        }
    }
}

