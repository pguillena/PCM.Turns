using System;
using System.Collections.Generic;
using System.Text;

namespace EntidadxServicio.Domain.Interface
{
    public interface IEntidadxServicioDomain 
    {
        List<Entity.ServicioEntidad> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdEntidad,string strIdComboActivo);

        Entity.ServicioEntidad Save(Entity.ServicioEntidad oServicioEntidad);

        Entity.ServicioEntidad Delete(Entity.ServicioEntidad oServicioEntidad);        

        List<Entity.ServicioEntidad> CurrentEntityService(int CodeEntity);

        List<Entity.ServicioEntidad> ListEntityService();

        List<Entity.ServicioEntidad> ListFilter(int CodeSevice, int CodeEntity);

        List<JQSelectBE> Autocomplete(int pMaxRows, string pName_startsWith);
    }
}
