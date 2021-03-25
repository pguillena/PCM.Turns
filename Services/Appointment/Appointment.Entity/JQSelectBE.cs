using System;
using System.Collections.Generic;
using System.Text;

namespace Appointment.Entity
{
    public class JQSelectBE
    {
        public JQSelectBE()
        {
        }
        public JQSelectBE(string pId, string pValor)
        {
            this.Id = pId;
            this.Valor = pValor;
        }

        public JQSelectBE(int pNivel, string pId, string pValor)
        {
            this.Nivel = pNivel;
            this.Id = pId;
            this.Valor = pValor;
        }

        public int Nivel { get; set; }
        public string Id { get; set; }
        public string Valor { get; set; }
    }
}
