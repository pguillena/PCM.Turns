using System;
using System.Collections.Generic;
using System.Text;
using Window.Domain.Interface;
using Window.Entity;

namespace Window.Domain.Implementation
{
    public class WindowDomain: IWindowDomain
    {
        WindowEntity windowEntity;
        public WindowDomain()
        {
            windowEntity = new WindowEntity();
            windowEntity.Load();
        }
        public List<Entity.Window> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strCboZona,int strCodeCenterAttention)
        {
            return windowEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder, strCboZona, strCodeCenterAttention);
        }

        public List<Entity.Window> Autocomplete() {
            return windowEntity.Autocomplete();
        }

        public List<Entity.Window> GetRecord(int CodeWindow) {
            return windowEntity.GetRecord(CodeWindow);
        }

        public Entity.Window Save(Entity.Window oWindow) {
            return windowEntity.Save(oWindow);
        }

        public Entity.Window Delete(Entity.Window oWindow) {
            return windowEntity.Delete(oWindow);
        }

    }
}
