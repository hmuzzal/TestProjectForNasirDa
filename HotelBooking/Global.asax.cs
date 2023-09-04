using HotelBooking.Action_Filters;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System;
using HotelBooking.DataLayer;

namespace HotelBooking
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            MvcHandler.DisableMvcResponseHeader = true;
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            ModelBinders.Binders.Add(typeof(DateTime?), new MyDateTimeModelBinder());
            log4net.Config.XmlConfigurator.Configure();
            GlobalFilters.Filters.Add(new UserAuditFilter());
        }

        protected void Application_PreSendRequestHeaders()
        {
            Response.Headers.Remove("Server");
            Response.Headers.Remove("X-Aspnet-Version");
        }
        /// <summary>
        /// This method execute when session time expired
        /// </summary>
        protected void Session_End()
        {

            // do somthing here

        }
    }
}
