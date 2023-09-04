using HotelBooking.App_Start;
using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HotelBooking.DataLayer.ViewModels.Report;
using HotelBooking.DataLayer;

namespace HotelBooking.Controllers
{
    [SessionTimeout]
    public class ReportController : Controller
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(ReportController));
        // GET: Report
        public ActionResult Index()
        {
            return Session["Email"] == null ? RedirectToAction("Login", "User") : (ActionResult)View();
           // return View();
        }

        #region Sales and Purchase Report
        public ActionResult VoucherBillReport()
        {
            VoucherReport voucherreport = new VoucherReport();
            voucherreport.ReportName = "Voucher Report";
            voucherreport.DateFrom = System.DateTime.Now.AddHours(11).AddDays(-7);
            voucherreport.Dateto = System.DateTime.Now.AddHours(11).AddDays(1);
            

            voucherreport.AllReportTypes = new List<SelectListItem>()
                {
                   new SelectListItem() { Text="Voucher", Value="1"},
                   new SelectListItem() {Text="Bill", Value="2"},
                };
            var allinvoices = HotelBookingDBAccess.GetallInvoices();
            if (allinvoices != null)
            {
                voucherreport.AllInvoiceNo = allinvoices.Select(x => new SelectListItem
                {
                    Value = x.CustomerCode.ToString(),
                    Text = x.InvoiceNo
                });
            }



            return View(voucherreport);
        }
        #endregion
        #region Sales and Purchase Report
        [HttpPost]
        public ActionResult VoucherBillReport(VoucherReport voucherreport)
        {

            int x = 0;


            return View();
        }
        #endregion
    }
}