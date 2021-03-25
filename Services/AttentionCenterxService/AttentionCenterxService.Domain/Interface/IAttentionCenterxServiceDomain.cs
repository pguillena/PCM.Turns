using AttentionCenterxService.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace AttentionCenterxService.Domain.Interface
{
    public interface IAttentionCenterxServiceDomain
    {
        List<ServiceAttentionCenter> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strIdCentroAtencion, string strIdComboActivo);

        List<Entity.Entity> ListCurrentEntity(int CodeAttentionCenter);

        List<AttentionCenterService> ListService(int CodeEntity,int CodeAttentionCenter);

        AttentionCenterService Save(AttentionCenterService oAttentionCenterService);
        AttentionCenterService Delete(AttentionCenterService oAttentionCenterService);
    }
}
