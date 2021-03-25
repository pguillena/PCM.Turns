using System;
using System.Collections.Generic;
using System.Text;
using Banner.Entity;
using Transversal;
using Banner.Domain.Interface;

namespace Banner.Domain.Implementation
{
    public class BannerDomain:IBannerDomain
    {
        BannerEntity bannerEntity;

        public BannerDomain()
        {
            bannerEntity = new BannerEntity();
            bannerEntity.Load();
        }

        public List<BannerEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder)
        {
            return bannerEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder);
        }

        public BannerEntity Delete(BannerEntity oBannerEntity)
        {
            return bannerEntity.Delete(oBannerEntity);
        }

        public string ReturnBannerString()
        {
            return TurnTransversal.ReturnString(bannerEntity.BannerValue);
        }

        public List<BannerEntity> CurrentRowBanner(int CodeBanner)
        {
            return bannerEntity.CurrentRowBanner(CodeBanner); 
        }

        public BannerEntity Save(BannerEntity oBannerEntity) {
            return bannerEntity.Save(oBannerEntity);
        }

        public List<BannerEntity> Autocomplete() {
            return bannerEntity.Autocomplete();
        }
    }
}
