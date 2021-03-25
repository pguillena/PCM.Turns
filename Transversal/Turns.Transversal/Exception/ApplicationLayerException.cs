
using System;
using System.Collections.Generic;
using System.Text;

namespace Turns.Transversal
{
    public class ApplicationLayerException<T> : GenericException<T>
       where T : class
    {
        public bool IsCustomException { get; set; }
        public ApplicationLayerException(string message, System.Exception e) : base(message, e) { }
        public ApplicationLayerException(System.Exception e) : base(e) { }
        public ApplicationLayerException(string message)
            : base(message)
        {
            this.IsCustomException = true;
        }
    }
}
