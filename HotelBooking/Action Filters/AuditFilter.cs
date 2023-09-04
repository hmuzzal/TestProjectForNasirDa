using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web;
using HotelBooking.DataLayer;
using HotelBooking.DataLayer.Models;

namespace HotelBooking.Action_Filters
{
    public class UserAuditFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HotelBookingContexts appcontext = new HotelBookingContexts();
            AuditTB objaudit = new AuditTB();
            //Getting Action Name
            string actionName = filterContext.ActionDescriptor.ActionName;
            //Getting Controller Name
            string controllerName = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
            var request = filterContext.HttpContext.Request;
            if (HttpContext.Current.Session["UserID"] == null) // For Checking User is Logged in or Not 
            {
                objaudit.UserID = 0;
            }
            else
            {
                objaudit.UserID = Convert.ToInt32(HttpContext.Current.Session["UserID"]);
                objaudit.Email = HttpContext.Current.Session["Email"].ToString();
            }
            objaudit.UsersAuditID = 0;
            objaudit.SessionID = HttpContext.Current.Session.SessionID; // Application SessionID
                                                                        // User IPAddress
            objaudit.IPAddress = request.ServerVariables["HTTP_X_FORWARDED_FOR"] ?? request.UserHostAddress;
            objaudit.PageAccessed = request.RawUrl;   // URL User Requested
            objaudit.LoggedInAt = System.DateTime.Now;       // Time User Logged In || 
                                                      // And time User Request Method
            if (actionName == "Logout")
            {
                objaudit.LoggedOutAt = System.DateTime.Now;      // Time User Logged OUT
            }
            else
                objaudit.LoggedOutAt = System.DateTime.Now.AddDays(11);

            objaudit.LoginStatus = "Active";
            objaudit.ControllerName = controllerName; // ControllerName
            objaudit.ActionName = actionName;         // ActionName
            try
            {
                appcontext.audittbs.Add(objaudit);
                appcontext.SaveChanges();
            }
            catch
            {

            }
                          // Saving in database using Entity Framework
            base.OnActionExecuting(filterContext);
        }
    }
}
