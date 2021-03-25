using System;
using System.Collections.Generic;
using System.Text;

namespace Video.Domain.Interface
{
    public interface IVideoDomain
    {
        List<Entity.Video> Autocomplete();

        List<Entity.Video> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,string strCboEstado,int strCboVideo);

        Entity.Video Delete(Entity.Video oVideo);

        Entity.Video Aprobar(Entity.Video oVideo);

        List<Entity.Video> ListarVideoAprobado();

    }
}
