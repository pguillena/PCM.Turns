using BannerxZone.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace BannerxZone.Domain.Interface
{
    public interface IBannerxZoneDomain
    {
        List<BannerZone> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdCentroAtencion, string strIdComboActivo);
        List<BannerZone> CurrentBannerAttentionCenter(int CodeAttentionCenter);

        List<BannerZone> ListBannerxAttentionCenter(int CodeZone);

        BannerZone Save(BannerZone oBannerZone);
    } 
}
