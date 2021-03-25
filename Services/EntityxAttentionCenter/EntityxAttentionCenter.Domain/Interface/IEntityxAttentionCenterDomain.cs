using EntityxAttentionCenter.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace EntityxAttentionCenter.Domain.Interface
{
    public interface IEntityxAttentionCenterDomain
    {
        List<EntityAttentionCenter> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strCentroAtencion,string strIdComboActivo);

        List<EntityAttentionCenter> CurrentAttentionCenterEntity(int CodeAttentionCenter);
        EntityAttentionCenter Save(EntityAttentionCenter oEntityAttentionCenter);
        EntityAttentionCenter Delete(EntityAttentionCenter oEntityAttentionCenter);
        
    }
}
