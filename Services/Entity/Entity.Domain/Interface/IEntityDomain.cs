
using System;
using System.Collections.Generic;
using System.Text;
using Turns.Transversal;
using Entity.Entity;

namespace Entity.Domain.Interface
{
   public interface IEntityDomain
    {
        string ReturnEntityString();
          
        List<EntityEntity> GetAll(int strPagDesde,int strPagHasta, string strField, string strOrder, int strIdDescripcion,string strIdComboActivo);

        List<EntityEntity> Autocomplete();


        List<EntityEntity> AutocompleteEntidadCentroA(int strstrCodeCentroAttention);

        List<EntityEntity> ListaEntityZone(int codeZone);

        List<EntityEntity> GetRecord(int id);

        EntityEntity Insert(EntityEntity entityEntity);


        EntityEntity Delete(EntityEntity entityEntity);

         
    }
}
