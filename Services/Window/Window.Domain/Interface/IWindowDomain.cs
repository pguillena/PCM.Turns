using System;
using System.Collections.Generic;
using System.Text;
using Window.Entity;

namespace Window.Domain.Interface
{
    public interface IWindowDomain
    {
        List<Entity.Window> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strCboZona,int strCodeCenterAttention);

        List<Entity.Window> Autocomplete();

        List<Entity.Window> GetRecord(int CodeWindow);

        Entity.Window Save(Entity.Window oWindow);

        Entity.Window Delete(Entity.Window oWindow);
    }
}
