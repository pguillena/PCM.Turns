using AttentionCenter.Domain.Interface;
using System;
using System.Collections.Generic;
using System.Text;
using Transversal;
using AttentionCenter.Entity;

namespace AttentionCenter.Domain.Implementation
{
    public class AttentionCenterDomain: IAttentionCenterDomain
    {
        AttentionCenterEntity AttentionCenterEntity;

        public AttentionCenterDomain()
        {
            AttentionCenterEntity = new AttentionCenterEntity();
            AttentionCenterEntity.Load();
        }
        public List<CenterAttention> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strCbxCentroAtencion,string strIdComboActivo)
        {
            return AttentionCenterEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder, strCbxCentroAtencion, strIdComboActivo);
        }
        public List<CenterAttention> GetRecord(int codeAttentionCenter)
        {
            return AttentionCenterEntity.GetRecord(codeAttentionCenter);
        }

        public CenterAttention Save(CenterAttention oCenterAttention) {
            return AttentionCenterEntity.Save(oCenterAttention);
        }

        public string ReturnAttentionCenterString()
        {
            return TurnTransversal.ReturnString(AttentionCenterEntity.AttentionCenterValue);
        }

        public CenterAttention DeleteOne(CenterAttention oCenterAttention)
        {
            return AttentionCenterEntity.DeleteOne(oCenterAttention);
        }

        public List<CenterAttention> Autocomplete() {
            return AttentionCenterEntity.Autocomplete();
        }
    }
}
