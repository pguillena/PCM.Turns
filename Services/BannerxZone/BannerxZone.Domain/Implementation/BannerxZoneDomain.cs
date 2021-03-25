using BannerxZone.Domain.Interface;
using BannerxZone.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace BannerxZone.Domain.Implementation
{
    public class BannerxZoneDomain: IBannerxZoneDomain
    {
        BannerxZoneEntity bannerxZoneEntity;

        public BannerxZoneDomain()
        {
            bannerxZoneEntity = new BannerxZoneEntity();
            bannerxZoneEntity.Load();
        }

        public List<BannerZone> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdCentroAtencion, string strIdComboActivo)
        {
            return bannerxZoneEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder,strIdCentroAtencion, strIdComboActivo);
        }

        public List<BannerZone> CurrentBannerAttentionCenter(int CodeAttentionCenter)
        {
            return bannerxZoneEntity.CurrentBannerAttentionCenter(CodeAttentionCenter);//, strIdEntidad, strIdComboActivo);
        }
        public BannerZone Save(BannerZone oBannerZone) {
            return bannerxZoneEntity.Save(oBannerZone);
        }

        public List<BannerZone> ListBannerxAttentionCenter(int CodeZone) {
            return bannerxZoneEntity.ListBannerxAttentionCenter(CodeZone);
        }
    }
}
