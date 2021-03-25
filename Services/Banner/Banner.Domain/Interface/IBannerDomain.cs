using System;
using System.Collections.Generic;
using System.Text;
using Turns.Transversal;
using Banner.Entity;

namespace Banner.Domain.Interface
{
    public interface IBannerDomain
    {
        string ReturnBannerString();

        List<BannerEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder);

        List<BannerEntity> CurrentRowBanner(int CodeBanner);

        BannerEntity Save(BannerEntity oBannerEntity);

        BannerEntity Delete(BannerEntity oBannerEntity);

        List<BannerEntity> Autocomplete();
    }
}
