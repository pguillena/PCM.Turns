using System;
using System.Collections.Generic;
using System.Text;
using Zone.Domain.Interface;
using Zone.Entity;
using Zone.Infraestructure.Implementation;

namespace Zone.Domain.Implementation
{
    public class ZoneDomain: IZoneDomain
    {
        ZoneEntity zoneEntity;
        public ZoneDomain()
        {
            zoneEntity = new ZoneEntity();
            zoneEntity.Load();
        }

        public List<Zone.Entity.Zone> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strCbxCentroAtencion, string strtxtZona,int strCodeAttentionCenter,int strComboActivo)
        {
            return zoneEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder, strCbxCentroAtencion, strtxtZona, strCodeAttentionCenter, strComboActivo);
        }

        public Zone.Entity.Zone Save(Zone.Entity.Zone oZone)
        {
            return zoneEntity.Save(oZone);
        }
        public Zone.Entity.Zone SaveEntityZone(Zone.Entity.Zone oZone)
        {
            return zoneEntity.SaveEntityZone(oZone);
        }
        public List<Entity.Zone> GetRecord(int CodeZone) {
            return zoneEntity.GetRecord(CodeZone);
        }

        public Entity.Zone Delete(Entity.Zone oZone) {
            return zoneEntity.Delete(oZone);
        }

        public List<Entity.Zone> Autocomplete() {
            return zoneEntity.Autocomplete();
        }
        public List<Entity.Zone> ListarZonaCentroAtencion(int CodeCenterAttention)
        {
            return zoneEntity.ListarZonaCentroAtencion(CodeCenterAttention);
        }

    }
}
