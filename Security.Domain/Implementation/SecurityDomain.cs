using System;
using System.Collections.Generic;
using System.Text;
using Security.Domain.Interface;
using Security.Entity;

namespace Security.Domain.Implementation
{
    public class SecurityDomain : ISecurityDomain
    {
        SecurityEntity securityEntity;

        public SecurityDomain()
        {
            securityEntity = new SecurityEntity();
            securityEntity.Load();
        }

        public List<Usuario> ListarUsuarioLocal(int strPagDesde, int strPagHasta, string strField, string strOrder, string Credencial, string Clave)
        {
            return securityEntity.ListarUsuarioLocal(strPagDesde, strPagHasta, strField, strOrder, Credencial, Clave);

        }
    }
}
