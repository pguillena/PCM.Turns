using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Turns.Web.Areas.Administration.Controllers
{
    public class GenericController : Controller
    {                
        public Usuario CuentaUsuario()
        {             
            return HttpContext.Session.GetObjectFromJson<Usuario>("UserSession");

        }
        public bool SetCuentaUsuario(int PersonId, string Usuario )
        {

            var myComplexObject = new Usuario();
            myComplexObject.PersonaId = PersonId;
            myComplexObject.Nombre = Usuario;
            HttpContext.Session.SetObjectAsJson("UserSession", myComplexObject);
            return true;

        }


    }
    public static class SessionExtensions
    {
        public static void SetObjectAsJson(this ISession session, string key, object value)
        {
            session.SetString(key, JsonConvert.SerializeObject(value));
        }

        public static T GetObjectFromJson<T>(this ISession session, string key)
        {
            var value = session.GetString(key);

            return value == null ? default(T) : JsonConvert.DeserializeObject<T>(value);
        }
    }
    public sealed class Usuario
    {
        public int PersonaId { get; set; }
        public string Nombre { get; set; }
       
    }
}