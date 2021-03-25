
using System;
using System.Collections.Generic;
using System.Text;
using Turns.Transversal;
using AttentionCenter.Entity;


namespace AttentionCenter.Domain.Interface
{
    public interface IAttentionCenterDomain
    {
        string ReturnAttentionCenterString();

        List<CenterAttention> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder, int strCbxCentroAtencion,string strIdComboActivo);

        List<CenterAttention> GetRecord(int codeAttentionCenter);

        CenterAttention DeleteOne(CenterAttention oCenterAttention);

        CenterAttention Save(CenterAttention oCenterAttention);

        List<CenterAttention> Autocomplete();
    }
}
