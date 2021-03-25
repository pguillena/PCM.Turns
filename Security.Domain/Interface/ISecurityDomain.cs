using Security.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace Security.Domain.Interface
{
    public interface ISecurityDomain
    {
        List<Usuario> ListarUsuarioLocal(int strPagDesde, int strPagHasta, string strField, string strOrder, string Credencial, string Clave);



    }
}
