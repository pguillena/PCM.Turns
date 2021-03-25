using System;
using System.Collections.Generic;
using System.Text;
using Zone.Entity;

namespace Zone.Domain.Interface
{
    public interface IZoneDomain
    {
        List<Entity.Zone> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strCbxCentroAtencion, string strtxtZona,int strCodeAttentionCenter,int strComboActivo);

        Entity.Zone Save(Entity.Zone oZone);

        Entity.Zone SaveEntityZone(Entity.Zone oZone);


        List<Entity.Zone> GetRecord(int CodeZone);

        Entity.Zone Delete(Entity.Zone oZone);

        List<Entity.Zone> Autocomplete();

        List<Entity.Zone> ListarZonaCentroAtencion(int CodeCenterAttention);

    }
}
