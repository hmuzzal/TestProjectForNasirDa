using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HotelBooking.DataLayer.ViewModels.Invoice;
using HotelBooking.DataLayer.ViewModels.InvocieView;
using HotelBooking.DataLayer;

namespace HotelBooking.Controllers
{
    public class InvoiceController : Controller
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(InvoiceController));
       
        // GET: Invoice
        #region Invoice
        public ActionResult Index(int? id)
        {
            #region Invoice Create
            InvocieViewModel invoice = new InvocieViewModel();
            InvocieCreateViewModels newentry = new InvocieCreateViewModels();
            newentry.InvoiceDate = System.DateTime.Now.AddHours(11);
            var firstDayOfMonth = new DateTime(newentry.InvoiceDate.Year, newentry.InvoiceDate.Month, 1);

            var allinvoices = HotelBookingDBAccess.GetallInvoices(firstDayOfMonth, newentry.InvoiceDate);
            allinvoices = allinvoices.OrderByDescending(a => a.InvoiceDate).ToList();

            List<AllInvoiceViewModel> allpayments = new List<AllInvoiceViewModel>();
            foreach (var item in allinvoices)
            {
                AllInvoiceViewModel singlepayment = new AllInvoiceViewModel();
                singlepayment.singleinvoice = item;
                var findattachments = HotelBookingDBAccess.GetInvoiceAttachmentDetailsInformationById(item.PkInvoiceId);
                if (findattachments != null)
                {
                    singlepayment.Attachment = findattachments.AttachmentLocation;
                }
                else
                {
                    singlepayment.Attachment = null;
                }


                allpayments.Add(singlepayment);
            }
            invoice.allinvoices = allpayments;
           
            
            HomeController home = new HomeController();
            newentry.InvoiceNo = home.GenderateTenDigitUniqueInvoiceNumberByDate(System.DateTime.Now.AddHours(11).ToString());

            invoice.invoicecreate = newentry;
            #endregion
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index()
        {
            return View();
        }
        #endregion

    }
}