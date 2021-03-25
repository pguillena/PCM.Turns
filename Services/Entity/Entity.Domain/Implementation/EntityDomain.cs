using Entity.Domain.Interface;
using Entity.Entity;
using System.Collections.Generic;
using Transversal;


namespace Entity.Domain.Implementation
{
    public class EntityDomain : IEntityDomain
    {
        EntityEntity entityEntity;

        public EntityDomain()
        {
            entityEntity = new EntityEntity();
            entityEntity.Load();
        }

        public List<EntityEntity> GetAll(int strPagDesde, int strPagHasta, string strField, string strOrder,int strIdDescripcion,string strIdComboActivo)
        {
            return entityEntity.GetAll(strPagDesde, strPagHasta, strField, strOrder, strIdDescripcion, strIdComboActivo);
        }

        public List<EntityEntity> GetRecord(int id)
        {
            return entityEntity.GetRecord(id);
        }

        public EntityEntity Insert(EntityEntity oEntityEntity)
        {
            return entityEntity.Insert(oEntityEntity);
        }


        public EntityEntity Delete(EntityEntity bannerEntity)
        {
            return entityEntity.Delete(bannerEntity);
        }

        public List<EntityEntity> Autocomplete() {

            return entityEntity.Autocomplete();
        }

        public List<EntityEntity> AutocompleteEntidadCentroA(int strCodeCentroAttention)
        {

            return entityEntity.AutocompleteCentroA(strCodeCentroAttention);
        }

        public List<EntityEntity> ListaEntityZone(int codZone)
        {

            return entityEntity.ListaEntityZone(codZone);
        }


        public string ReturnEntityString()
        {
            return TurnTransversal.ReturnString(entityEntity.EntityValue);
        }
    }
}
