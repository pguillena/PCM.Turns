using EntityxAttentionCenter.Domain.Interface;
using EntityxAttentionCenter.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace EntityxAttentionCenter.Domain.Implementation
{
    public class EntityxAttentionCenterDomain : IEntityxAttentionCenterDomain
    {
        EntityxAttentionCenterEntity entityAttentionCenter;

        public EntityxAttentionCenterDomain()
        {
            entityAttentionCenter = new EntityxAttentionCenterEntity();
            entityAttentionCenter.Load();
        }
        public List<EntityAttentionCenter> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strCentroAtencion,string strIdComboActivo)
        {
            return entityAttentionCenter.GetAll(strPagDesde, strPagHasta, strField, strOrder, strCentroAtencion, strIdComboActivo);
        }

        public List<EntityAttentionCenter> CurrentAttentionCenterEntity(int CodeAttentionCenter) {

            return entityAttentionCenter.CurrentAttentionCenterEntity(CodeAttentionCenter);
        }

        public EntityAttentionCenter Save(EntityAttentionCenter oEntityAttentionCenter) {

            return entityAttentionCenter.Save(oEntityAttentionCenter);
        }

        public EntityAttentionCenter Delete(EntityAttentionCenter oEntityAttentionCenter)
        {

            return entityAttentionCenter.Delete(oEntityAttentionCenter);
        }

        
    }
}
