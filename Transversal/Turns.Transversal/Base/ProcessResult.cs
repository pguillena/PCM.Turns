
using System;
using System.Collections.Generic;
using System.Text;

namespace Turns.Transversal
{
 public class ProcessResult<T> where T : class
    {
        /// <summary>
        /// Constructor por defecto
        /// </summary>
        public ProcessResult()
        {
            this.IsSuccess = true;

        }
        /// <summary>
        /// Indicador del estado de la operación
        /// </summary>
        public bool IsSuccess { get; set; }
        /// <summary>
        /// Indicador de Mensaje
        /// </summary>
        public string Message { get; set; }
        /// <summary>
        /// Exceción generada en caso de error
        /// </summary>
        public IGenericException Exception { get; set; }
        /// <summary>
        /// Resultado del proceso
        /// </summary>
        public T Result { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public T Details { get; set; }
        public string Fecha { get; set; }
    }
}
