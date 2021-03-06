//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;
//using System.Web.Routing;

//namespace real_estate
//{
//    public class RouteConfig2
//    {
//        public static void RegisterRoutes(RouteCollection routes)
//        {
//            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

//            routes.MapRoute(
//                name: "Default",
//                url: "{controller}/{action}/{id}",
//                defaults: new { action = "Index", id = UrlParameter.Optional }
//            );
//        }
//    }
//}



using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;
using real_estate.ConnectDB;
namespace real_estate
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
             
            config.EnableCors();
            config.MapHttpAttributeRoutes();
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
 

    }
}
