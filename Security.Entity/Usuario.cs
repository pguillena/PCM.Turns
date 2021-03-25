using System;
using System.Collections.Generic;
using System.Text;

namespace Security.Entity
{
    public class Usuario : Common
    {
        public int IdPersona { get; set; }

        public string Credencial { get; set; }

        public string Clave { get; set; }

        public string Abreviado { get; set; }

        public string PcUsuario { get; set; }

        public int Estado { get; set; }

        public DateTime FechaRegistro { get; set; }

        public DateTime FechaModificacion { get; set; }

        public string UsuarioRegistro { get; set; }

        public string UsuarioModificacion { get; set; }

        public string PcRegistro { get; set; }

        public string PcModificacion { get; set; }

        public string IpRegistro { get; set; }

        public string IpModificacion { get; set; }

        #region UsuarioLocal

        public int IdEmpresa { get; set; }
        public int IdLocal { get; set; }
        public int IdPerfil { get; set; }
        public int IdRol { get; set; }

        #endregion

        #region Empresa

        public string RazonSocial { get; set; }
        #endregion


        #region Local
        public string Local { get; set; }
        #endregion
    }
}
