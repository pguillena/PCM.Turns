using AttentionCenterxService.Domain.Interface;
using AttentionCenterxService.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace AttentionCenterxService.Domain.Implementation
{
    public class AttentionCenterxServiceDomain: IAttentionCenterxServiceDomain
    {
        AttentionCenterServiceEntity oAttentionCenterServiceEntity;
        public AttentionCenterxServiceDomain()
        {
            oAttentionCenterServiceEntity = new AttentionCenterServiceEntity();
            oAttentionCenterServiceEntity.Load();
        }
        public List<ServiceAttentionCenter> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strIdCentroAtencion, string strIdComboActivo)
        {
            return oAttentionCenterServiceEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder, strIdCentroAtencion, strIdComboActivo);
        }

        public List<Entity.Entity> ListCurrentEntity(int CodeAttentionCenter)
        {
            return oAttentionCenterServiceEntity.ListCurrentEntity(CodeAttentionCenter);
        }

        public List<AttentionCenterService> ListService(int CodeEntity,int CodeAttentionCenter)
        {
            return oAttentionCenterServiceEntity.ListService(CodeEntity, CodeAttentionCenter);
        }

        public AttentionCenterService Save(AttentionCenterService oAttentionCenterService) {
            return oAttentionCenterServiceEntity.Save(oAttentionCenterService);
        }

        public AttentionCenterService Delete(AttentionCenterService oAttentionCenterService)
        {
            return oAttentionCenterServiceEntity.Delete(oAttentionCenterService);
        }

    }
}
