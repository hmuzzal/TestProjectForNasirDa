using HotelBooking.DataLayer;
using System.Web.Mvc;

namespace HotelBooking.App_Start
{
    public class SessionTimeoutAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var organizationinformation = HotelBookingDBAccess.GetOrganizatonsInformationById();
            //if (organizationinformation != null)
            //{
            //    if (HttpContext.Current.Session["Email"] == null)
            //    {
            //        filterContext.Result = new RedirectResult("~/User/Login");
            //        return;
            //    }
            //}
            //else
            //{
            //    filterContext.Result = new RedirectResult("~/User/OrganizationRegistration");
            //    return;
            //}


            base.OnActionExecuting(filterContext);
        }
    }
}