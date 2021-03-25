using log4net;


namespace Turns.Transversal
{
    public abstract class GenericException<T> : System.Exception, IGenericException
        where T : class
    {
        /// <summary>
        /// log
        /// </summary>
        private static readonly ILog log = LogManager.GetLogger(typeof(T));

        /// <summary>
        /// GenericException
        /// </summary>
        /// <param name="message"></param>
        /// <param name="e"></param>
        protected GenericException(string message, System.Exception e)
            : base(message, e)
        {

        }

        /// <summary>
        /// Generic Exception
        /// </summary>
        /// <param name="e"></param>
        protected GenericException(System.Exception e)
            : base("Error : " + typeof(T).Name + " , see more detail.(view innerException)", e)
        {

        }

        /// <summary>
        /// Generic Exception
        /// </summary>
        /// <param name="message"></param>
        protected GenericException(string message)
            : base(message)
        {

        }
    }
}
