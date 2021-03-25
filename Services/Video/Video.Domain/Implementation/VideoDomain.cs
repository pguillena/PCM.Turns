using System;
using System.Collections.Generic;
using System.Text;
using Video.Domain.Interface;
using Video.Entity;

namespace Video.Domain.Implementation
{
    public class VideoDomain: IVideoDomain
    {

        VideoEntity videoEntity;

        public VideoDomain()
        {
            videoEntity = new VideoEntity();
            videoEntity.Load();
        }

        public List<Entity.Video> Autocomplete() {
            return videoEntity.Autocomplete();
        }

        public List<Entity.Video> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,string strCboEstado,int strCboVideo) {

            return videoEntity.GetAll(strPagDesde, strPagHasta,  strField, strOrder, strCboEstado, strCboVideo);
        }

        public Entity.Video Delete(Entity.Video oVideo) {
            return videoEntity.Delete(oVideo);
        }

        public Entity.Video Aprobar(Entity.Video oVideo)
        {
            return videoEntity.Aprobar(oVideo);
        }

        public List<Entity.Video> ListarVideoAprobado() {
            return videoEntity.ListarVideoAprobado();
        }
    }
}
