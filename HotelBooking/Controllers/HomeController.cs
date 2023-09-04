using HotelBooking.App_Start;
using HotelBooking.DataLayer;
using HotelBooking.DataLayer.Models.Customers;
using HotelBooking.DataLayer.Models.Hotel;
using HotelBooking.DataLayer.Models.Invoice;
using HotelBooking.DataLayer.Models.Payment;
using HotelBooking.DataLayer.ViewModels.Hotel;
using HotelBooking.DataLayer.ViewModels.InvocieView;
using HotelBooking.DataLayer.ViewModels.Invoice;
using HotelBooking.DataLayer.ViewModels.InvoiceReceipt;
using HotelBooking.DataLayer.ViewModels.Sale;
using log4net;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.Hosting;
using System.Web.Mvc;
using System.Web.UI;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace HotelBooking.Controllers
{

    public class HomeController : Controller
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(HomeController));
        public Dictionary<int, double> TotalSales { get; set; }
        public Dictionary<int, double> TotalExpense { get; set; }
        public Dictionary<int, dynamic> YearlyTopExpense { get; set; }
        public static string domainName = "";
        private static string invoicemessage = "";

        #region Invoice

        public ActionResult Index(int? id)
        {

            var organizationinformation = HotelBookingDBAccess.GetOrganizatonsInformationById();
            if (organizationinformation != null)
            {
                if (Session["Email"] == null)
                {
                    return RedirectToAction("Login", "User");
                }
                else
                {
                    #region Notification

                    if (invoicemessage == "Create")
                    {
                        ViewBag.message = "Success: Invoice created Succesfully...";
                    }
                    else if (invoicemessage == "Exists")
                    {
                        ViewBag.message = "Failed: Data Already Exists, Please check and try again...";
                    }
                    else if (invoicemessage == "Update")
                    {

                        ViewBag.message = "Success: Invoice Updated Succesfully...";
                    }
                    else if (invoicemessage == "Failed")
                    {
                        ViewBag.message = "Failed: Operation Failed, Please check and try again...";
                    }
                    else if (invoicemessage == "Deleted")
                    {
                        ViewBag.message = "Success: Invoice Deleted Succesfully";
                    }
                    else
                    {
                        ViewBag.message = invoicemessage;
                    }

                    invoicemessage = "";

                    #endregion

                    #region Invoice Create

                    InvocieViewModel invoice = new InvocieViewModel();
                    invoice.DateFrom = DateTime.Now.AddMonths(-1);
                    invoice.Dateto = DateTime.Now;

                    #region Filter

                    var allCustomers = HotelBookingDBAccess.GetallCustomer();

                    #endregion

                    if (allCustomers != null)
                    {
                        invoice.AllCustomers = allCustomers.Select(x => new SelectListItem
                        {
                            Value = x.LedgerID.ToString(),
                            Text = x.ledger.LedgerName
                        });


                    }


                    var allinvoices = HotelBookingDBAccess.GetallInvoices().Take(50).ToList();
                    allinvoices = allinvoices.OrderByDescending(a => a.InvoiceDate).ToList();

                    List<AllInvoiceViewModel> allpayments = new List<AllInvoiceViewModel>();

                    foreach (var item in allinvoices)
                    {
                        AllInvoiceViewModel singlepayment = new AllInvoiceViewModel();
                        singlepayment.singleinvoice = item;

                        allpayments.Add(singlepayment);
                    }

                    invoice.allinvoices = allpayments;



                    #endregion

                    return View(invoice);
                }
            }
            else
            {
                return RedirectToAction("OrganizationRegistration", "User");
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Index(InvocieViewModel invoice)
        {
            List<Invoices> allinvoices = new List<Invoices>();

            HomeController home = new HomeController();
            {
                allinvoices = HotelBookingDBAccess.GetallInvoices();
                allinvoices = allinvoices
                    .Where(a => a.InvoiceDate >= invoice.DateFrom && a.InvoiceDate <= invoice.Dateto).ToList();

                allinvoices = allinvoices.OrderByDescending(a => a.InvoiceDate).ToList();

                if (invoice.LedgerID != null)
                {
                    allinvoices = allinvoices.Where(a => a.DebitLedgerID == invoice.LedgerID).ToList();
                }
                else
                {
                    var alldeignations = HotelBookingDBAccess.GetallCustomer();

                    if (invoice.SearchString != null)
                    {
                        alldeignations = alldeignations.Where(a => a.Name.Contains(invoice.SearchString) ||
                                                                   a.Mobile.Contains(invoice.SearchString) ||
                                                                   a.PresentAddress.Contains(invoice.SearchString) ||
                                                                   a.PermanentAddress.Contains(invoice.SearchString))
                            .ToList();
                    }

                    var query = (from pocket in allinvoices
                                 join Customer in alldeignations
                                     on pocket.DebitLedgerID equals Customer.LedgerID
                                 select pocket).ToList();
                    allinvoices = query;
                }

                if (invoice.SearchString != null)
                {
                    allinvoices = allinvoices.Where(a => a.InvoiceNo.Contains(invoice.SearchString) ||
                                                         a.Reference.Contains(invoice.SearchString) ||
                                                         a.debitledger.LedgerName.Contains(invoice.SearchString))
                        .ToList();
                }
            }

            #region Filter

            var allCustomers = HotelBookingDBAccess.GetallCustomer();


            #endregion

            #region

            if (allCustomers != null)
            {
                invoice.AllCustomers = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.LedgerID.ToString(),
                    Text = x.ledger.LedgerName
                });

            }


            List<AllInvoiceViewModel> allpayments = new List<AllInvoiceViewModel>();

            foreach (var item in allinvoices)
            {
                AllInvoiceViewModel singlepayment = new AllInvoiceViewModel();
                singlepayment.singleinvoice = item;

                allpayments.Add(singlepayment);
            }

            invoice.allinvoices = allpayments;


            #endregion


            return View(invoice);
        }

        public static string ConvertNumbertoWords(int number)

        {

            if (number == 0)

            {

                return "ZERO";

            }

            if (number < 0)

            {

                return "minus " + ConvertNumbertoWords(Math.Abs(number));

            }



            string strWords = "";

            if ((number / 1000000) > 0)

            {

                strWords += ConvertNumbertoWords(number / 1000000) + " Million ";

                number %= 1000000;

            }

            if ((number / 1000) > 0)

            {

                strWords += ConvertNumbertoWords(number / 1000) + " Thousand ";

                number %= 1000;

            }

            if ((number / 100) > 0)

            {

                strWords += ConvertNumbertoWords(number / 100) + " Hundred ";

                number %= 100;

            }

            if (number > 0)

            {

                if (strWords != "")

                    strWords += "And ";

                var unitsMap = new[]
                {
                    "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven",
                    "Twelve", "Thirteen", "Fourteen", "Fifteen",

                    "Sixteen", "Sseventeen", "Eighteen", "Nineteen"
                };

                var TensMap = new[]
                    { "Zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };



                if (number < 20)

                    strWords += unitsMap[number];

                else

                {

                    strWords += TensMap[number / 10];

                    if ((number % 10) > 0)

                        strWords += " " + unitsMap[number % 10];

                }

            }

            return strWords;

        }

        public ActionResult CreateInvoice()
        {
            //var reservationNo = GenerateUniqueInvoiceNumber();
            // ViewBag.ReservationID=reservationNo;
            InvocieCreateViewModels newentry = new InvocieCreateViewModels();
            var allCustomers = HotelBookingDBAccess.GetallCustomer();
            if (allCustomers != null)
            {
                newentry.AllDebitLedgers = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.LedgerID.ToString(),
                    Text = x.ledger.LedgerName
                });
            }

            var allClients = HotelBookingDBAccess.GetallClients();
            if (allClients != null)
            {
                newentry.allClients = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.PkCustomerId.ToString(),
                    Text = x.Name
                });
            }

            var allRoomDetaisl = HotelBookingDBAccess.GetallRoomDetails();
            var roomDetails = new HotelRoomDetails()
            {
                PkRoomDetailsId = 0
            };

            allRoomDetaisl.Insert(0, new HotelRoomDetails() { PkRoomDetailsId = 0, RoomDetails = "Select Room" });

            if (allRoomDetaisl != null)
            {
                newentry.AllRoomDetails = allRoomDetaisl.Select(x => new SelectListItem
                {
                    Value = x.PkRoomDetailsId.ToString(),
                    Text = x.RoomDetails
                });
            }

            newentry.InvoiceDate = System.DateTime.Now;
            newentry.DateFrom = System.DateTime.Now;
            newentry.Dateto = System.DateTime.Now;

            HomeController home = new HomeController();
            newentry.InvoiceNo = GenerateUniqueInvoiceNumber();
            ViewBag.InvoiceNo = newentry.InvoiceNo;


            var allservices = HotelBookingDBAccess.GetallActiveCurrency();

            newentry.AllPaymentTypes = new List<SelectListItem>()
            {
                new SelectListItem() { Text = "Cash", Value = "Cash", Selected = true },
                new SelectListItem() { Text = "Credit", Value = "Credit" }

            };
            List<InvoiceDetailsViewModel> catmodel = new List<InvoiceDetailsViewModel>();
            foreach (var user in allservices.Take(16))
            {
                catmodel.Add(new InvoiceDetailsViewModel
                {
                    AllItems = allservices.Select(x => new SelectListItem
                    {
                        Value = x.PkItemId.ToString(),
                        Text = x.ProfileName
                    }),

                    SellingPrice = 0,
                    Quantity = 1,
                    TotalAmount = 0,
                    //DateFrom = System.DateTime.Now,
                    //Dateto = System.DateTime.Now,

                });
            }

            newentry.invoice = catmodel;

            return View(newentry);
        }


        public JsonResult GetRoomDetails(int id)
        {
            return Json(HotelBookingDBAccess.GetRoomDetails(id), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateInvoice(InvocieCreateViewModels newentry)
        {
            newentry.DebitLedgerID = 1;
            newentry.PaymentTypeID = "cash";
            newentry.PkRoomDetailsId = 1;
            HomeController home = new HomeController();
            if (newentry.DebitLedgerID != 0 && newentry.TotalAmount > 0)
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {
                            var sameinvoice = databaseModel.invoice.Where(a => a.InvoiceNo == newentry.InvoiceNo).FirstOrDefault();
                            if (sameinvoice == null)
                            {

                                var TransactionID = home.GenderateTenDigitUniqueTransactionCode(newentry.InvoiceDate.ToString());

                                #region Invoice Creation
                                Invoices createentry = new Invoices();
                                createentry.DebitLedgerID = newentry.DebitLedgerID;
                                var assetgroup = HotelBookingDBAccess.IsAccountGroupsExist("Sales");
                                var salesledger = HotelBookingDBAccess.GetLedgersInformationByParentId(assetgroup.PkGroupId);

                                createentry.PaymentType = newentry.PaymentTypeID;
                                createentry.CreditLedgerID = salesledger.PkLedgerId;
                                createentry.InvoiceDate = newentry.InvoiceDate;
                                createentry.InvoiceNo = newentry.InvoiceNo;
                                createentry.CustomerCode = newentry.CustomerCode;
                                createentry.CustomerMobile = newentry.CustomerMobile;
                                //createentry.HotelRDetailsID=newentry.PkHotelDetailsId;

                                createentry.Reference = newentry.Reference;

                                createentry.DiscountAmount = newentry.DiscountAmount;
                                createentry.SubTotalAmount = newentry.SubTotalAmount;
                                createentry.TotalAmount = newentry.TotalAmount;

                                createentry.TransactionID = TransactionID;

                                createentry.CreatedAt = System.DateTime.Now;
                                createentry.UpdatedAt = System.DateTime.Now;
                                createentry.CreatedBy = Session["Email"].ToString();
                                createentry.UpdatedBy = Session["Email"].ToString();
                                createentry.DeletedBy = "";

                                databaseModel.invoice.Add(createentry);
                                databaseModel.SaveChanges();

                                var quotationid = createentry.PkInvoiceId;

                                if (quotationid > 0)
                                {
                                    List<InvoiceDetails> qlist = new List<InvoiceDetails>();
                                    var allsectedservice = newentry.invoice.Where(a => a.ServiceID != 0).ToList();

                                    for (var item = 0; item < allsectedservice.Count; item++)
                                    {
                                        InvoiceDetails qdetails = new InvoiceDetails();
                                        qdetails.InvoiceID = createentry.PkInvoiceId;
                                        qdetails.ServiceID = allsectedservice[item].ServiceID;

                                        qdetails.SellingPrice = allsectedservice[item].SellingPrice;
                                        qdetails.Quantity = (int)allsectedservice[item].Quantity;

                                        qdetails.TotalAmount = (allsectedservice[item].SellingPrice * allsectedservice[item].Quantity);

                                        qdetails.CreatedAt = System.DateTime.Now;
                                        qdetails.UpdatedAt = System.DateTime.Now;
                                        qdetails.CreatedBy = Session["Email"].ToString();
                                        qdetails.UpdatedBy = Session["Email"].ToString();
                                        qlist.Add(qdetails);


                                    }

                                    if (qlist.Count > 0)
                                    {
                                        databaseModel.invoicedetails.AddRange(qlist);
                                        databaseModel.SaveChanges();

                                        #region Accounts
                                        var transaction = HotelBookingTransactions.AddTransactions(createentry.DebitLedgerID, createentry.CreditLedgerID, createentry.InvoiceDate, createentry.TotalAmount, createentry.TotalAmount, TransactionID, "Invoice", quotationid, Session["Email"].ToString(), "Invoice- " + createentry.TotalAmount + "/" + createentry.Reference + "-" + createentry.Reference, createentry.InvoiceNo);
                                        if (transaction)
                                        {

                                            dbTran.Commit();
                                            invoicemessage = "Create";
                                            return RedirectToAction("CustomerReceipt", "Home", new { id = createentry.PkInvoiceId });
                                        }

                                        #endregion
                                    }

                                }
                                dbTran.Rollback();
                                invoicemessage = "Failed";
                                return RedirectToAction("Index", "Home");
                                #endregion
                            }

                            invoicemessage = "Exists";
                            return RedirectToAction("Index", "Home");

                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            invoicemessage = "Failed";
                            return RedirectToAction("Index", "Home");
                        }
                    }
                }
            }
            return View(newentry);
        }
        public ActionResult UpdateInvoice(int id)
        {
            InvocieCreateViewModels invoiceupdate = new InvocieCreateViewModels();
            var allCustomers = HotelBookingDBAccess.GetallCustomer();
            if (allCustomers != null)
            {
                invoiceupdate.AllDebitLedgers = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.LedgerID.ToString(),
                    Text = x.ledger.LedgerName
                });
            }

            invoiceupdate.AllPaymentTypes = new List<SelectListItem>()
                {
                    new SelectListItem() { Text="Cash", Value="Cash",Selected=true},
                    new SelectListItem() { Text="Credit", Value="Credit"}

                };

            var allservices = HotelBookingDBAccess.GetallActiveCurrency();

            #region Invocie Update
            List<InvoiceDetailsViewModel> catmodelupdate = new List<InvoiceDetailsViewModel>();
            if (id != 0)
            {
                var information = HotelBookingDBAccess.GetInvoicesInformationById((int)id);
                invoiceupdate.PkInvoiceId = information.PkInvoiceId;
                invoiceupdate.InvoiceNo = information.InvoiceNo;
                invoiceupdate.InvoiceDate = information.InvoiceDate;
                invoiceupdate.DebitLedgerID = information.DebitLedgerID;
                invoiceupdate.Reference = information.Reference;
                invoiceupdate.CustomerMobile = information.CustomerMobile;
                invoiceupdate.CustomerCode = information.CustomerCode;
                invoiceupdate.PaymentTypeID = information.PaymentType;

                invoiceupdate.DiscountAmount = information.DiscountAmount;
                invoiceupdate.SubTotalAmount = information.SubTotalAmount;
                invoiceupdate.TotalAmount = information.TotalAmount;


                var invoicedetails = HotelBookingDBAccess.GetallInvoiceDetails((int)id);

                List<InvoiceDetailsViewModel> catmodel = new List<InvoiceDetailsViewModel>();


                foreach (var qdetailinfo in invoicedetails)
                {
                    InvoiceDetailsViewModel single = new InvoiceDetailsViewModel();
                    single.PkInvoiceDetailsId = qdetailinfo.PkInvoiceDetailsId;
                    single.ServiceID = qdetailinfo.ServiceID;
                    single.TotalAmount = qdetailinfo.TotalAmount;
                    single.Quantity = qdetailinfo.Quantity;
                    single.SellingPrice = qdetailinfo.SellingPrice;
                    single.ProfileNo = qdetailinfo.service.ProfileNo;
                    var selectedservice = new List<SelectListItem>();

                    foreach (var item in allservices)
                    {
                        if (qdetailinfo.ServiceID == item.PkItemId)
                        {
                            selectedservice.Add(new SelectListItem() { Text = item.ProfileName, Value = item.PkItemId.ToString(), Selected = true });
                        }
                        else
                        {
                            selectedservice.Add(new SelectListItem() { Text = item.ProfileName, Value = item.PkItemId.ToString() });
                        }
                    }

                    single.AllItems = selectedservice;
                    catmodelupdate.Add(single);
                }

                var addrows = 16 - invoicedetails.Count;

                foreach (var user in allservices.Take(addrows))
                {
                    catmodelupdate.Add(new InvoiceDetailsViewModel
                    {
                        AllItems = allservices.Select(x => new SelectListItem
                        {
                            Value = x.PkItemId.ToString(),
                            Text = x.ProfileName
                        }),

                        SellingPrice = 0,
                        Quantity = 1,
                        TotalAmount = 0,

                    });
                }

                invoiceupdate.invoice = catmodelupdate;
            }

            #endregion
            return View(invoiceupdate);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateInvoice(InvocieCreateViewModels newentry)
        {
            HomeController home = new HomeController();
            if (newentry.DebitLedgerID != 0 && newentry.TotalAmount > 0)
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {

                            var inforamtion = HotelBookingDBAccess.GetInvoicesInformationById(newentry.PkInvoiceId);
                            if (inforamtion != null)
                            {
                                var v = databaseModel.invoice.Where(m => m.PkInvoiceId == newentry.PkInvoiceId).FirstOrDefault();
                                if (v != null)
                                {
                                    #region Invoice Information
                                    v.PkInvoiceId = newentry.PkInvoiceId;
                                    v.DebitLedgerID = newentry.DebitLedgerID;
                                    v.InvoiceDate = newentry.InvoiceDate;
                                    v.Reference = newentry.Reference;
                                    v.CustomerMobile = newentry.CustomerMobile;
                                    v.TotalAmount = newentry.TotalAmount;
                                    v.SubTotalAmount = newentry.SubTotalAmount;
                                    v.DiscountAmount = newentry.DiscountAmount;

                                    v.UpdatedBy = Session["Email"].ToString();
                                    v.UpdatedAt = System.DateTime.Now;

                                    databaseModel.SaveChanges();
                                    #endregion

                                    var allsectedservice = newentry.invoice.Where(a => a.PkInvoiceDetailsId != 0).ToList();

                                    for (var item = 0; item < allsectedservice.Count; item++)
                                    {
                                        if (allsectedservice[item].ServiceID == 0)
                                        {
                                            var detailid = allsectedservice[item].PkInvoiceDetailsId;
                                            var qdetails = databaseModel.invoicedetails.Where(a => a.PkInvoiceDetailsId == detailid).FirstOrDefault();
                                            databaseModel.invoicedetails.Remove(qdetails);
                                            databaseModel.SaveChanges();
                                        }
                                        else
                                        {

                                            var detailid = allsectedservice[item].PkInvoiceDetailsId;
                                            var qdetails = databaseModel.invoicedetails.Where(a => a.PkInvoiceDetailsId == detailid).FirstOrDefault();
                                            if (allsectedservice[item].SellingPrice != qdetails.SellingPrice ||
                                                allsectedservice[item].Quantity != qdetails.Quantity)
                                            {
                                                qdetails.SellingPrice = allsectedservice[item].SellingPrice;
                                                qdetails.Quantity = (int)allsectedservice[item].Quantity;

                                                qdetails.TotalAmount = (allsectedservice[item].SellingPrice * allsectedservice[item].Quantity);

                                                qdetails.CreatedAt = System.DateTime.Now;
                                                qdetails.UpdatedAt = System.DateTime.Now;
                                                qdetails.CreatedBy = Session["Email"].ToString();
                                                qdetails.UpdatedBy = Session["Email"].ToString();

                                                databaseModel.SaveChanges();
                                            }

                                        }


                                    }

                                    bool checkothers = false;


                                    List<InvoiceDetails> qlist = new List<InvoiceDetails>();
                                    var allsectedservicenew = newentry.invoice.Where(a => a.ServiceID != 0 && a.PkInvoiceDetailsId == 0).ToList();

                                    for (var item = 0; item < allsectedservicenew.Count; item++)
                                    {
                                        InvoiceDetails qdetails = new InvoiceDetails();
                                        qdetails.InvoiceID = v.PkInvoiceId;
                                        qdetails.ServiceID = allsectedservicenew[item].ServiceID;

                                        qdetails.SellingPrice = allsectedservicenew[item].SellingPrice;
                                        qdetails.Quantity = (int)allsectedservicenew[item].Quantity;
                                        qdetails.TotalAmount = (allsectedservicenew[item].SellingPrice * allsectedservicenew[item].Quantity);

                                        qdetails.CreatedAt = System.DateTime.Now;
                                        qdetails.UpdatedAt = System.DateTime.Now;
                                        qdetails.CreatedBy = Session["Email"].ToString();
                                        qdetails.UpdatedBy = Session["Email"].ToString();
                                        qlist.Add(qdetails);


                                    }

                                    if (qlist.Count > 0)
                                    {
                                        databaseModel.invoicedetails.AddRange(qlist);
                                        databaseModel.SaveChanges();

                                    }

                                    var transactioninforamtion = databaseModel.transactionhistory.Where(a => a.TransactionID == inforamtion.TransactionID && a.ReferenceID == inforamtion.PkInvoiceId).ToList();

                                    if (transactioninforamtion.Count != 0)
                                    {
                                        var debittransaction = transactioninforamtion.Where(a => a.TransactionType == "Dr").FirstOrDefault();
                                        var credittransaction = transactioninforamtion.Where(a => a.TransactionType == "Cr").FirstOrDefault();



                                        #region Accounts
                                        if ((inforamtion.TotalAmount != newentry.TotalAmount || inforamtion.Reference != newentry.Reference))
                                        {
                                            #region Accounts
                                            var transaction = HotelBookingTransactions.UpdateTransactions(debittransaction.PkTransactionId, credittransaction.PkTransactionId, newentry.InvoiceDate, newentry.TotalAmount, newentry.TotalAmount, Session["Email"].ToString(), "Sale- " + v.TotalAmount + "/" + v.Reference + "-" + v.Reference);

                                            #endregion
                                            if (transaction)
                                            {
                                                checkothers = true;
                                            }

                                        }
                                        if (inforamtion.DebitLedgerID != newentry.DebitLedgerID)
                                        {
                                            #region Accounts Debit Ledger Transactions
                                            var customertran = HotelBookingTransactions.UpdateDebitLedgerTransactions(debittransaction.PkTransactionId, newentry.InvoiceDate, newentry.DebitLedgerID, newentry.TotalAmount, Session["Email"].ToString(), newentry.Reference);

                                            #endregion


                                            if (customertran)
                                            {
                                                #region Accounts Credit Ledger Transactions
                                                var customertran1 = HotelBookingTransactions.UpdateCreditLedgerTransactions(credittransaction.PkTransactionId, newentry.InvoiceDate, inforamtion.CreditLedgerID, newentry.TotalAmount, Session["Email"].ToString(), newentry.Reference);
                                                if (customertran1)
                                                {
                                                    dbTran.Commit();
                                                    invoicemessage = "Update";
                                                    return RedirectToAction("CustomerReceipt", "Home", new { id = v.PkInvoiceId });
                                                }
                                                #endregion
                                            }
                                            checkothers = false;
                                        }

                                        if (checkothers)
                                        {
                                            dbTran.Commit();
                                            invoicemessage = "Update";
                                            return RedirectToAction("CustomerReceipt", "Home", new { id = v.PkInvoiceId });
                                        }
                                        #endregion
                                    }
                                }
                            }
                            dbTran.Rollback();
                            invoicemessage = "Failed";
                            return RedirectToAction("Index", "Invoice", new { id = 0 });
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            invoicemessage = "Failed";
                            return RedirectToAction("Index", "Invoice", new { id = 0 });
                        }
                    }
                }
            }
            return View(newentry);
        }

        public ActionResult DeleteInvoice(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var inforamtion = HotelBookingDBAccess.GetInvoicesInformationById(id);
                        if (inforamtion != null)
                        {
                            var transactioninforamtion = HotelBookingDBAccess.GetTransactionHistory(inforamtion.TransactionID, inforamtion.PkInvoiceId);
                            if (transactioninforamtion.Count != 0)
                            {


                                var debittransaction = transactioninforamtion.Where(a => a.TransactionType == "Dr").FirstOrDefault();
                                var credittransaction = transactioninforamtion.Where(a => a.TransactionType == "Cr").FirstOrDefault();

                                var deletetransaction = HotelBookingTransactions.DeleteTransactions(debittransaction.PkTransactionId, credittransaction.PkTransactionId, Session["Email"].ToString());
                                if (deletetransaction)
                                {
                                    var v = databaseModel.invoice.Where(a => a.PkInvoiceId == id).FirstOrDefault();
                                    if (v != null)
                                    {
                                        try
                                        {

                                            var invoicedetails = databaseModel.invoicedetails.Where(a => a.InvoiceID == id).ToList();
                                            databaseModel.invoicedetails.RemoveRange(invoicedetails);
                                            databaseModel.SaveChanges();


                                        }
                                        catch (Exception ex)
                                        {

                                        }

                                        databaseModel.invoice.Remove(v);
                                        databaseModel.SaveChanges();

                                        dbTran.Commit();
                                        invoicemessage = "Deleted";
                                        return RedirectToAction("Index", "Home");
                                    }
                                    else
                                    {
                                        dbTran.Rollback();
                                        invoicemessage = "Failed";
                                        return RedirectToAction("Index", "Home");
                                    }

                                }
                                else
                                {
                                    dbTran.Rollback();
                                    invoicemessage = "Failed";
                                    return RedirectToAction("Index", "Home");
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            return View();
        }


        public ActionResult CustomerReceipt(int id)
        {
            if (Session["Email"] == null)
            {
                return RedirectToAction("Login", "User");
            }
            else
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    InvoiceReceiptViewModel reportdetails = new InvoiceReceiptViewModel();

                    var organizationinfo = databaseModel.organizationinfo.FirstOrDefault();
                    reportdetails.organizationinfo = organizationinfo;

                    reportdetails.ReportName = "Customer Receipt";
                    var information = databaseModel.invoice.Include("debitledger").Include("creditledger").Where(a => a.PkInvoiceId == id).FirstOrDefault();

                    reportdetails.Invoice = information;
                    reportdetails.AmountinWords = ConvertNumbertoWords((int)information.TotalAmount);

                    var Customerinfo = databaseModel.Customers.Include("ledger").Where(a => a.LedgerID == information.DebitLedgerID).FirstOrDefault();
                    reportdetails.customerinfo = Customerinfo;

                    var invoicedetails = databaseModel.invoicedetails.Include("invoice").Include("service").Where(a => a.InvoiceID == id).ToList();
                    reportdetails.InvoiceDetails = invoicedetails;
                    return View(reportdetails);
                }


            }
        }
        #endregion

        #region PaymentReceived

        public ActionResult PaymentReceived(int? id)
        {
            #region Notifications
            if (invoicemessage == "Insert")
            {
                ViewBag.message = "Success: Operation Successful...";
            }
            else if (invoicemessage == "Exists")
            {
                ViewBag.message = "Failed: Data Already Exists, Please check and try again...";
            }
            else if (invoicemessage == "Update")
            {
                ViewBag.message = "Success: Operation Successful...";
            }
            else if (invoicemessage == "Fail")
            {
                ViewBag.message = "Failed: Email Sending Failed, Please check and try again...";
            }
            else if (invoicemessage == "Deleted")
            {
                ViewBag.message = "Success: Data Deleted Succesfully";
            }
            else
            {
                ViewBag.message = invoicemessage;
            }
            invoicemessage = "";
            #endregion

            #region AllPayments
            AllReceivedPayments allpayment = new AllReceivedPayments();
            var firstDayOfMonth = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            allpayment.DateFrom = DateTime.Now.AddMonths(-1);
            allpayment.Dateto = DateTime.Now;
            #region Filter

            var allCustomers = HotelBookingDBAccess.GetallCustomer();


            #endregion

            var allpaym = HotelBookingDBAccess.GetallPayments().Take(50).ToList();
            allpaym = allpaym.OrderByDescending(a => a.PaymentNumber).ToList();
            List<AllPaymentsViewModel> allpayments = new List<AllPaymentsViewModel>();

            foreach (var item in allpaym)
            {
                AllPaymentsViewModel singlepayment = new AllPaymentsViewModel();
                singlepayment.singlepayments = item;

                allpayments.Add(singlepayment);
            }

            allpayment.allpayments = allpayments;

            #endregion

            #region CreatePayments
            PaymentReceivedViewModel newentry = new PaymentReceivedViewModel();
            PaymentReceivedViewModel bulk = new PaymentReceivedViewModel();
            HomeController home = new HomeController();
            newentry.PaymentNumber = home.GenderateTenDigitUniquePaymentNumberByDate(System.DateTime.Now.AddHours(11).ToString());
            bulk.PaymentNumber = home.GenderateTenDigitUniquePaymentNumberByDate(System.DateTime.Now.AddHours(11).ToString());
            newentry.PaymentDate = System.DateTime.Now.AddHours(11);
            bulk.PaymentDate = System.DateTime.Now.AddHours(11);

            PaymentReceivedViewModel updatepaymentreceived = new PaymentReceivedViewModel();




            var allledgers = HotelBookingDBAccess.GetallLedgers();


            if (allCustomers != null)
            {
                allpayment.AllCustomers = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.LedgerID.ToString(),
                    Text = x.ledger.LedgerName
                });
                newentry.AllCreditledger = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.LedgerID.ToString(),
                    Text = x.ledger.LedgerName
                });

                updatepaymentreceived.AllCreditledger = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.LedgerID.ToString(),
                    Text = x.ledger.LedgerName
                });
            }

            var bankaccouts = allledgers.Where(a => a.LedgerCode.Contains("B")).ToList();
            if (bankaccouts != null)
            {
                newentry.AllDebitLedger = bankaccouts.Select(x => new SelectListItem
                {
                    Value = x.PkLedgerId.ToString(),
                    Text = x.LedgerName
                });

                updatepaymentreceived.AllDebitLedger = bankaccouts.Select(x => new SelectListItem
                {
                    Value = x.PkLedgerId.ToString(),
                    Text = x.LedgerName
                });
            }

            newentry.AllPaymentMethods = new List<SelectListItem>()
                {
                   new SelectListItem() { Text="Bank Transfer", Value="Bank Transfer",Selected=true},
                   new SelectListItem() {Text="Bank Cheque", Value="Bank Cheque"},
                   new SelectListItem() {Text="Cash In Hand", Value="Cash In Hand"},
                   new SelectListItem() {Text="Mobile Banking", Value="Mobile Banking"},
                   new SelectListItem() {Text="Agent Banking", Value="Agent Banking"}
                };

            updatepaymentreceived.AllPaymentMethods = new List<SelectListItem>()
                {
                   new SelectListItem() { Text="Bank Transfer", Value="Bank Transfer",Selected=true},
                   new SelectListItem() {Text="Bank Cheque", Value="Bank Cheque"},
                   new SelectListItem() {Text="Cash In Hand", Value="Cash In Hand"},
                   new SelectListItem() {Text="Mobile Banking", Value="Mobile Banking"},
                   new SelectListItem() {Text="Agent Banking", Value="Agent Banking"}
                };

            allpayment.createpaymentreceived = newentry;
            #endregion

            #region UpdatePayments



            if (id != null && id != 0)
            {
                var information = HotelBookingDBAccess.GetPaymentsInformationById((int)id);
                updatepaymentreceived.PkPaymentsId = information.PkPaymentsId;
                updatepaymentreceived.PaymentNumber = information.PaymentNumber;
                updatepaymentreceived.DebitLedgerID = information.DebitLedgerID;
                updatepaymentreceived.CreditLedgerID = information.CreditLedgerID;
                updatepaymentreceived.PaymentDate = information.PaymentDate;
                updatepaymentreceived.Reference = information.Reference;
                updatepaymentreceived.PaymentMethod = information.PaymentMethod;
                updatepaymentreceived.Comment = information.Comment;
                updatepaymentreceived.ReceiveAmount = information.ReceiveAmount;


            }


            allpayment.updatepaymentreceived = updatepaymentreceived;

            #endregion

            return View(allpayment);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PaymentReceived(AllReceivedPayments allpayment, string Create, string Update)
        {
            List<Payments> allpaym = new List<Payments>();

            HomeController home = new HomeController();
            if (!string.IsNullOrEmpty(Create))
            {
                if (allpayment.createpaymentreceived.DebitLedgerID != 0 && allpayment.createpaymentreceived.CreditLedgerID != 0 && allpayment.createpaymentreceived.ReceiveAmount != 0)
                {
                    using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                    {
                        using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                        {
                            try
                            {
                                var sameinvoice = databaseModel.payments.Where(a => a.PaymentNumber == allpayment.createpaymentreceived.PaymentNumber).FirstOrDefault();
                                if (sameinvoice == null)
                                {

                                    var TransactionID = home.GenderateTenDigitUniqueTransactionCode(allpayment.createpaymentreceived.PaymentDate.ToString());

                                    Payments createentry = new Payments();
                                    createentry.DebitLedgerID = allpayment.createpaymentreceived.DebitLedgerID;
                                    createentry.CreditLedgerID = allpayment.createpaymentreceived.CreditLedgerID;
                                    createentry.PaymentDate = allpayment.createpaymentreceived.PaymentDate;
                                    createentry.PaymentNumber = allpayment.createpaymentreceived.PaymentNumber;
                                    createentry.PaymentMethod = allpayment.createpaymentreceived.PaymentMethod;
                                    createentry.Reference = allpayment.createpaymentreceived.Reference;

                                    if (allpayment.createpaymentreceived.Comment != null)
                                    {
                                        createentry.Comment = allpayment.createpaymentreceived.Comment;
                                    }
                                    else
                                    {

                                    }

                                    createentry.ReceiveAmount = allpayment.createpaymentreceived.ReceiveAmount;
                                    var ledgerinfo = databaseModel.ledgers.Where(a => a.PkLedgerId == allpayment.createpaymentreceived.CreditLedgerID).FirstOrDefault();
                                    if (allpayment.createpaymentreceived.ReceiveAmount > ledgerinfo.ClosingBalance)
                                    {
                                        createentry.DueAmount = allpayment.createpaymentreceived.ReceiveAmount - ledgerinfo.ClosingBalance;
                                        createentry.Comment = "Advance";
                                    }
                                    else if (allpayment.createpaymentreceived.ReceiveAmount < ledgerinfo.ClosingBalance)
                                    {
                                        createentry.DueAmount = ledgerinfo.ClosingBalance - allpayment.createpaymentreceived.ReceiveAmount;

                                    }
                                    else
                                    {
                                        createentry.DueAmount = 0;
                                        createentry.Comment = "Paid";
                                    }

                                    createentry.TransactionID = TransactionID;

                                    createentry.CreatedAt = System.DateTime.Now.AddHours(11);
                                    createentry.UpdatedAt = System.DateTime.Now.AddHours(11);
                                    createentry.CreatedBy = Session["Email"].ToString();
                                    createentry.UpdatedBy = Session["Email"].ToString();
                                    createentry.DeletedBy = "";
                                    databaseModel.payments.Add(createentry);
                                    databaseModel.SaveChanges();

                                    if (createentry.PkPaymentsId > 0)
                                    {
                                        var dueinvoices = databaseModel.invoice.Where(a => a.DebitLedgerID == createentry.CreditLedgerID && (a.PaymentStatus == "Open" || a.PaymentStatus == "Partially Paid")).ToList();
                                        var totalpayment = createentry.ReceiveAmount;

                                        if (dueinvoices.Count > 0)
                                        {
                                            foreach (var due in dueinvoices)
                                            {
                                                var newtotalpayment = totalpayment - due.TotalDueAmount;
                                                if (newtotalpayment >= 0)
                                                {
                                                    PaymentDetails single = new PaymentDetails();
                                                    single.InvoiceID = due.PkInvoiceId;
                                                    single.PaymentsID = createentry.PkPaymentsId;

                                                    single.AmountDue = due.TotalDueAmount;
                                                    single.AmountPaid = due.TotalDueAmount;
                                                    single.CreatedAt = System.DateTime.Now.AddHours(11);
                                                    single.UpdatedAt = System.DateTime.Now.AddHours(11);
                                                    single.CreatedBy = Session["Email"].ToString();
                                                    single.UpdatedBy = Session["Email"].ToString();
                                                    single.DeletedBy = "";

                                                    databaseModel.PaymentDetails.Add(single);
                                                    databaseModel.SaveChanges();

                                                    due.PaymentStatus = "Paid";
                                                    due.TotalDueAmount = 0;
                                                    databaseModel.SaveChanges();
                                                    if (newtotalpayment == 0)
                                                    {
                                                        break;
                                                    }
                                                }
                                                else
                                                {
                                                    PaymentDetails single = new PaymentDetails();
                                                    single.InvoiceID = due.PkInvoiceId;
                                                    single.PaymentsID = createentry.PkPaymentsId;

                                                    single.AmountDue = due.TotalDueAmount;

                                                    due.TotalDueAmount = due.TotalDueAmount - totalpayment;

                                                    single.AmountPaid = totalpayment;
                                                    single.CreatedAt = System.DateTime.Now.AddHours(11);
                                                    single.UpdatedAt = System.DateTime.Now.AddHours(11);
                                                    single.CreatedBy = Session["Email"].ToString();
                                                    single.UpdatedBy = Session["Email"].ToString();
                                                    single.DeletedBy = "";
                                                    databaseModel.PaymentDetails.Add(single);
                                                    databaseModel.SaveChanges();

                                                    due.PaymentStatus = "Partially Paid";
                                                    databaseModel.SaveChanges();
                                                    break;
                                                }
                                                totalpayment = newtotalpayment;
                                            }
                                        }

                                        var bankinformation = HotelBookingDBAccess.GetBanksInformationByLedgerId(createentry.DebitLedgerID);
                                        #region Accounts
                                        var transaction = HotelBookingTransactions.AddTransactions(createentry.DebitLedgerID, createentry.CreditLedgerID, createentry.PaymentDate, createentry.ReceiveAmount, createentry.ReceiveAmount, TransactionID, "Payment Received", createentry.PkPaymentsId, Session["Email"].ToString(), "@" + createentry.Comment + "-" + createentry.Reference, createentry.PaymentNumber);

                                        if (transaction)
                                        {
                                            var v = databaseModel.payments.Where(m => m.PkPaymentsId == createentry.PkPaymentsId).FirstOrDefault();
                                            if (v != null)
                                            {
                                                v.TransactionID = TransactionID;
                                                databaseModel.SaveChanges();

                                                dbTran.Commit();
                                                invoicemessage = "Insert";
                                                return RedirectToAction("PaymentReceived", "Home");
                                            }

                                        }

                                        #endregion
                                    }
                                    dbTran.Rollback();
                                    invoicemessage = "Failed";
                                    return RedirectToAction("PaymentReceived", "Home");
                                }
                                invoicemessage = "Exists";
                                return RedirectToAction("PaymentReceived", "Home");
                            }
                            catch (Exception ex)
                            {
                                Log.Fatal("log4net Fatal Level", ex);
                                dbTran.Rollback();
                                invoicemessage = "Failed";
                                return RedirectToAction("PaymentReceived", "Home");
                            }
                        }
                    }
                }
            }
            else if (!string.IsNullOrEmpty(Update))
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {

                            if (allpayment.updatepaymentreceived.DebitLedgerID != 0 && allpayment.updatepaymentreceived.CreditLedgerID != 0 && allpayment.updatepaymentreceived.ReceiveAmount != 0)
                            {
                                var inforamtion = HotelBookingDBAccess.GetPaymentsInformationById(allpayment.updatepaymentreceived.PkPaymentsId);

                                var createentry = databaseModel.payments.Where(m => m.PkPaymentsId == allpayment.updatepaymentreceived.PkPaymentsId).FirstOrDefault();
                                if (createentry != null)
                                {
                                    createentry.PkPaymentsId = allpayment.updatepaymentreceived.PkPaymentsId;
                                    createentry.DebitLedgerID = allpayment.updatepaymentreceived.DebitLedgerID;
                                    createentry.CreditLedgerID = allpayment.updatepaymentreceived.CreditLedgerID;
                                    createentry.PaymentDate = allpayment.updatepaymentreceived.PaymentDate;
                                    createentry.Reference = allpayment.updatepaymentreceived.Reference;
                                    createentry.Comment = allpayment.updatepaymentreceived.Comment;
                                    createentry.ReceiveAmount = allpayment.updatepaymentreceived.ReceiveAmount;
                                    createentry.PaymentMethod = allpayment.updatepaymentreceived.PaymentMethod;


                                    var ledgerinfo = databaseModel.ledgers.Where(a => a.PkLedgerId == allpayment.updatepaymentreceived.CreditLedgerID).FirstOrDefault();
                                    createentry.DueAmount = inforamtion.ReceiveAmount + ledgerinfo.ClosingBalance - allpayment.updatepaymentreceived.ReceiveAmount;


                                    createentry.UpdatedAt = System.DateTime.Now.AddHours(11);
                                    createentry.UpdatedBy = Session["Email"].ToString();
                                    databaseModel.SaveChanges();
                                    bool checkothers = false;



                                    var transactioninforamtion = HotelBookingDBAccess.GetTransactionHistory(inforamtion.TransactionID, inforamtion.PkPaymentsId);


                                    if ((inforamtion.ReceiveAmount != createentry.ReceiveAmount || inforamtion.Comment != createentry.Comment || inforamtion.Reference != createentry.Reference))
                                    {

                                        var debittransaction = transactioninforamtion.Where(a => a.TransactionType == "Dr").FirstOrDefault();
                                        var credittransaction = transactioninforamtion.Where(a => a.TransactionType == "Cr").FirstOrDefault();

                                        #region Accounts

                                        var transaction = HotelBookingTransactions.UpdateTransactions(debittransaction.PkTransactionId, credittransaction.PkTransactionId, createentry.PaymentDate, createentry.ReceiveAmount, createentry.ReceiveAmount, Session["Email"].ToString(), "@" + createentry.Comment + "-" + createentry.Reference);

                                        if (transaction)
                                        {
                                            checkothers = true;

                                        }

                                        #endregion
                                    }

                                    if (inforamtion.DebitLedgerID != createentry.DebitLedgerID && inforamtion.CreditLedgerID != createentry.CreditLedgerID)
                                    {
                                        var debittransaction = transactioninforamtion.Where(a => a.TransactionType == "Dr").FirstOrDefault();

                                        #region Accounts Debit Ledger Transactions
                                        var transaction = HotelBookingTransactions.UpdateDebitLedgerTransactions(debittransaction.PkTransactionId, createentry.PaymentDate, createentry.DebitLedgerID, createentry.ReceiveAmount, Session["Email"].ToString(), "@" + createentry.Comment + "-" + createentry.Reference);
                                        if (transaction)
                                        {
                                            var credittransaction = transactioninforamtion.Where(a => a.TransactionType == "Cr").FirstOrDefault();

                                            #region Accounts Credit Ledger Transactions
                                            var transaction1 = HotelBookingTransactions.UpdateCreditLedgerTransactions(credittransaction.PkTransactionId, createentry.PaymentDate, createentry.CreditLedgerID, createentry.ReceiveAmount, Session["Email"].ToString(), "@" + createentry.Comment + "-" + createentry.Reference);
                                            if (transaction1)
                                            {
                                                dbTran.Commit();
                                                invoicemessage = "Update";
                                                return RedirectToAction("PaymentReceived", "Home", new { id = 0 });
                                            }
                                            checkothers = false;
                                            #endregion
                                        }

                                        #endregion

                                    }
                                    else if (inforamtion.DebitLedgerID != createentry.DebitLedgerID && inforamtion.CreditLedgerID == createentry.CreditLedgerID)
                                    {

                                        var debittransaction = transactioninforamtion.Where(a => a.TransactionType == "Dr").FirstOrDefault();

                                        #region Accounts Debit Ledger Transactions
                                        var transaction = HotelBookingTransactions.UpdateDebitLedgerTransactions(debittransaction.PkTransactionId, createentry.PaymentDate, createentry.DebitLedgerID, createentry.ReceiveAmount, Session["Email"].ToString(), "@" + createentry.Comment + "-" + createentry.Reference);
                                        if (transaction)
                                        {
                                            dbTran.Commit();
                                            invoicemessage = "Update";
                                            return RedirectToAction("PaymentReceived", "Home", new { id = 0 });
                                        }
                                        checkothers = false;
                                        #endregion

                                    }
                                    else if (inforamtion.DebitLedgerID == createentry.DebitLedgerID && inforamtion.CreditLedgerID != createentry.CreditLedgerID)
                                    {

                                        var credittransaction = transactioninforamtion.Where(a => a.TransactionType == "Cr").FirstOrDefault();

                                        #region Accounts Credit Ledger Transactions
                                        var transaction = HotelBookingTransactions.UpdateCreditLedgerTransactions(credittransaction.PkTransactionId, createentry.PaymentDate, createentry.CreditLedgerID, createentry.ReceiveAmount, Session["Email"].ToString(), "@" + createentry.Comment + "-" + createentry.Reference);
                                        if (transaction)
                                        {
                                            dbTran.Commit();
                                            invoicemessage = "Update";
                                            return RedirectToAction("PaymentReceived", "Home", new { id = 0 });
                                        }
                                        checkothers = false;
                                        #endregion
                                    }

                                    if (checkothers)
                                    {
                                        dbTran.Commit();
                                        invoicemessage = "Update";
                                        return RedirectToAction("PaymentReceived", "Home", new { id = 0 });
                                    }
                                }
                                dbTran.Rollback();
                                invoicemessage = "Failed";
                                return RedirectToAction("PaymentReceived", "Home", new { id = 0 });
                            }
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            invoicemessage = "Failed";
                            return RedirectToAction("PaymentReceived", "Home", new { id = 0 });
                        }
                    }
                }


            }

            else
            {
                allpaym = HotelBookingDBAccess.GetallPayments();
                allpaym = allpaym.Where(a => a.PaymentDate >= allpayment.DateFrom && a.PaymentDate <= allpayment.Dateto).ToList();

                if (allpayment.LedgerID != null)
                {
                    allpaym = allpaym.Where(a => a.CreditLedgerID == allpayment.LedgerID).ToList();
                }
                else
                {
                    var alldeignations = HotelBookingDBAccess.GetallCustomer();




                    if (allpayment.SearchString != null)
                    {
                        alldeignations = alldeignations.Where(a => a.Name.Contains(allpayment.SearchString) ||
                        a.Mobile.Contains(allpayment.SearchString) ||

                        a.PresentAddress.Contains(allpayment.SearchString) ||
                        a.PermanentAddress.Contains(allpayment.SearchString)).ToList();
                    }

                    var query = (from pocket in allpaym
                                 join Customer in alldeignations
                                      on pocket.DebitLedgerID equals Customer.LedgerID
                                 select pocket).ToList();
                    allpaym = query;
                }

                if (allpayment.SearchString != null)
                {
                    allpaym = allpaym.Where(a => a.PaymentNumber.Contains(allpayment.SearchString) ||
                    a.Reference.Contains(allpayment.SearchString) ||
                    a.Comment.Contains(allpayment.SearchString) ||
                    a.creditledger.LedgerName.Contains(allpayment.SearchString)).ToList();
                }
            }
            #region AllPayments

            #region Filter

            var allCustomers = HotelBookingDBAccess.GetallCustomer();


            #endregion


            allpaym = allpaym.OrderByDescending(a => a.PaymentNumber).ToList();
            List<AllPaymentsViewModel> allpayments = new List<AllPaymentsViewModel>();

            foreach (var item in allpaym)
            {
                AllPaymentsViewModel singlepayment = new AllPaymentsViewModel();
                singlepayment.singlepayments = item;

                allpayments.Add(singlepayment);
            }

            allpayment.allpayments = allpayments;

            #endregion

            #region CreatePayments
            PaymentReceivedViewModel newentry = new PaymentReceivedViewModel();
            PaymentReceivedViewModel bulk = new PaymentReceivedViewModel();

            newentry.PaymentNumber = GenderateTenDigitUniquePaymentNumberByDate(System.DateTime.Now.AddHours(11).ToString());
            bulk.PaymentNumber = GenderateTenDigitUniquePaymentNumberByDate(System.DateTime.Now.AddHours(11).ToString());
            newentry.PaymentDate = System.DateTime.Now.AddHours(11);
            bulk.PaymentDate = System.DateTime.Now.AddHours(11);

            PaymentReceivedViewModel updatepaymentreceived = new PaymentReceivedViewModel();




            var allledgers = HotelBookingDBAccess.GetallLedgers();


            if (allCustomers != null)
            {
                allpayment.AllCustomers = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.LedgerID.ToString(),
                    Text = x.ledger.LedgerName
                });
                newentry.AllCreditledger = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.LedgerID.ToString(),
                    Text = x.ledger.LedgerName
                });

                updatepaymentreceived.AllCreditledger = allCustomers.Select(x => new SelectListItem
                {
                    Value = x.LedgerID.ToString(),
                    Text = x.ledger.LedgerName
                });
            }

            var bankaccouts = allledgers.Where(a => a.LedgerCode.Contains("B")).ToList();
            if (bankaccouts != null)
            {
                newentry.AllDebitLedger = bankaccouts.Select(x => new SelectListItem
                {
                    Value = x.PkLedgerId.ToString(),
                    Text = x.LedgerName
                });

                updatepaymentreceived.AllDebitLedger = bankaccouts.Select(x => new SelectListItem
                {
                    Value = x.PkLedgerId.ToString(),
                    Text = x.LedgerName
                });
            }

            newentry.AllPaymentMethods = new List<SelectListItem>()
                {
                   new SelectListItem() { Text="Bank Transfer", Value="Bank Transfer",Selected=true},
                   new SelectListItem() {Text="Bank Cheque", Value="Bank Cheque"},
                   new SelectListItem() {Text="Cash In Hand", Value="Cash In Hand"},
                   new SelectListItem() {Text="Mobile Banking", Value="Mobile Banking"},
                   new SelectListItem() {Text="Agent Banking", Value="Agent Banking"}
                };

            updatepaymentreceived.AllPaymentMethods = new List<SelectListItem>()
                {
                   new SelectListItem() { Text="Bank Transfer", Value="Bank Transfer",Selected=true},
                   new SelectListItem() {Text="Bank Cheque", Value="Bank Cheque"},
                   new SelectListItem() {Text="Cash In Hand", Value="Cash In Hand"},
                   new SelectListItem() {Text="Mobile Banking", Value="Mobile Banking"},
                   new SelectListItem() {Text="Agent Banking", Value="Agent Banking"}
                };

            allpayment.createpaymentreceived = newentry;
            #endregion

            #region UpdatePayments



            if (updatepaymentreceived.PkPaymentsId != 0)
            {
                var information = HotelBookingDBAccess.GetPaymentsInformationById((int)updatepaymentreceived.PkPaymentsId);
                updatepaymentreceived.PkPaymentsId = information.PkPaymentsId;
                updatepaymentreceived.PaymentNumber = information.PaymentNumber;
                updatepaymentreceived.DebitLedgerID = information.DebitLedgerID;
                updatepaymentreceived.CreditLedgerID = information.CreditLedgerID;
                updatepaymentreceived.PaymentMethod = information.PaymentMethod;
                updatepaymentreceived.PaymentDate = information.PaymentDate;
                updatepaymentreceived.Reference = information.Reference;
                updatepaymentreceived.Comment = information.Comment;
                updatepaymentreceived.ReceiveAmount = information.ReceiveAmount;


            }


            allpayment.updatepaymentreceived = updatepaymentreceived;
            #endregion


            return View(allpayment);
        }

        public string GenderateTenDigitUniquePaymentNumberByDate(string cdate)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                DateTime date = DateTime.Parse(cdate);
                var currentyear = date.Year.ToString();
                var currentmonth = date.Month.ToString();
                var currentdate = date.Day.ToString();
                var isexists = databaseModel.payments.Where(a => a.PaymentNumber.Contains("PR-" + currentdate + currentmonth + currentyear + "-")).OrderByDescending(a => a.PkPaymentsId).FirstOrDefault();
                if (isexists == null)
                {
                    var number = "PR-" + currentdate + currentmonth + currentyear + "-001";
                    return number;
                }
                else
                {

                    Char delimiter1 = '-';
                    var finalstring = "";
                    string[] categorysplit = isexists.PaymentNumber.Split(delimiter1);
                    var number = Int32.Parse(categorysplit[2].Trim());
                    var current = currentdate + currentmonth + currentyear;

                    if (Int32.Parse(current) > Int32.Parse(categorysplit[1].Trim().ToString()))
                    {
                        finalstring = "PR-" + currentdate + currentmonth + currentyear + "-001";
                    }
                    else
                    {
                        number = number + 1;
                        int numbernew = number, count = 0;

                        while (numbernew > 0)
                        {
                            numbernew = numbernew / 10;
                            count++;
                        }
                        if (count == 1)
                        {
                            finalstring = "PR-" + currentdate + currentmonth + currentyear + "-00" + number.ToString();

                        }
                        else if (count == 2)
                        {
                            finalstring = "PR-" + currentdate + currentmonth + currentyear + "-0" + number.ToString(); ;

                        }
                        else
                        {
                            finalstring = "PR-" + currentdate + currentmonth + currentyear + "-" + number.ToString();

                        }
                    }

                    return finalstring;
                }

            }
        }

        public ActionResult DeletePaymentReceived(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var inforamtion = HotelBookingDBAccess.GetPaymentsInformationById(id);
                        if (inforamtion != null)
                        {
                            var transactioninforamtion = HotelBookingDBAccess.GetTransactionHistory(inforamtion.TransactionID, inforamtion.PkPaymentsId);
                            if (transactioninforamtion.Count != 0)
                            {
                                var debittransaction = transactioninforamtion.Where(a => a.TransactionType == "Dr").FirstOrDefault();
                                var credittransaction = transactioninforamtion.Where(a => a.TransactionType == "Cr").FirstOrDefault();

                                var deletetransaction = HotelBookingTransactions.DeleteTransactions(debittransaction.PkTransactionId, credittransaction.PkTransactionId, Session["Email"].ToString());
                                if (deletetransaction)
                                {
                                    try
                                    {

                                        var paymentdetails = databaseModel.PaymentDetails.Where(a => a.PaymentsID == id).ToList();
                                        if (paymentdetails.Count > 0)
                                        {
                                            foreach (var payment in paymentdetails)
                                            {
                                                var invoiceinfo = databaseModel.invoice.Where(a => a.PkInvoiceId == payment.InvoiceID).FirstOrDefault();
                                                invoiceinfo.TotalDueAmount += payment.AmountPaid;

                                                if (invoiceinfo.TotalAmount == payment.AmountPaid)
                                                    invoiceinfo.PaymentStatus = "Open";
                                                else if (payment.AmountDue == payment.AmountPaid && (invoiceinfo.TotalAmount - payment.AmountDue == 0))
                                                {
                                                    invoiceinfo.PaymentStatus = "Open";
                                                }
                                                else
                                                    invoiceinfo.PaymentStatus = "Partially Paid";

                                                databaseModel.SaveChanges();
                                            }
                                        }

                                        databaseModel.PaymentDetails.RemoveRange(paymentdetails);
                                        databaseModel.SaveChanges();
                                    }
                                    catch (Exception ex)
                                    {

                                    }
                                    var v = databaseModel.payments.Where(a => a.PkPaymentsId == id).FirstOrDefault();
                                    if (v != null)
                                    {

                                        databaseModel.payments.Remove(v);
                                        databaseModel.SaveChanges();

                                        dbTran.Commit();
                                        invoicemessage = "Deleted";
                                        return RedirectToAction("PaymentReceived", "Invoice");
                                    }
                                }
                            }
                        }
                        dbTran.Rollback();
                        invoicemessage = "Failed";
                        return RedirectToAction("PaymentReceived", "Invoice");

                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        invoicemessage = "Failed";
                        return RedirectToAction("PaymentReceived", "Invoice");
                    }
                }
            }
        }

        //public ActionResult PaymentReceipt(int id)
        //{
        //    if (Session["Email"] == null)
        //    {
        //        return RedirectToAction("Login", "User");
        //    }
        //    else
        //    {
        //        using (HotelBookingContexts databaseModel = new HotelBookingContexts())
        //        {
        //            InvoiceReceiptViewModel reportdetails = new InvoiceReceiptViewModel();

        //            var organizationinfo = databaseModel.organizationinfo.FirstOrDefault();
        //            reportdetails.organizationinfo = organizationinfo;

        //            reportdetails.ReportName = "Receipt";
        //            var information = databaseModel.payments.Include("debitledger").Include("creditledger").Where(a => a.PkPaymentsId == id).FirstOrDefault();

        //            reportdetails.payments = information;

        //            var paymentdetails = databaseModel.PaymentDetails.Include("payments").Include("invoice").Where(a => a.PaymentsID == id).ToList();
        //            reportdetails.PaymentDetails = paymentdetails;

        //            var Customerinfo = databaseModel.Customers.Include("ledger").Where(a => a.LedgerID == information.DebitLedgerID).FirstOrDefault();
        //            reportdetails.customerinfo = Customerinfo;

        //            return View(reportdetails);
        //        }


        //    }
        //}
        #endregion

        [SessionTimeout]
        public JsonResult WhatsAppMessagepdf(string pdfstring, string OrderNo)
        {
            var invoiceinfo = HotelBookingDBAccess.GetInvoicesInformationByOrderId(OrderNo);
            Customer customerinfo = new Customer();



            string body = string.Empty;


            if (OrderNo.Contains("Inv"))
            {
                customerinfo = HotelBookingDBAccess.GetCustomersInformationByLedgerId(invoiceinfo.DebitLedgerID);

            }


            //#region Pdf Genereation
            var pdfstringmodified = pdfstring.Replace("data:application/pdf;filename=generated.pdf;base64,", "");
            byte[] pdfbytes = Convert.FromBase64String(pdfstringmodified);

            var accountSid = "AC41790fa1b4e1c3dc024dd1d6b4b8c803";
            var authToken = "f7f895cc5871e6279fb4b789d6feb863";
            TwilioClient.Init(accountSid, authToken);

            List<Uri> mediaurl = new List<Uri>();

            using (MemoryStream memoryStream = new MemoryStream(pdfbytes))
            {
                var uncPath1 = Server.MapPath("~/Resources/Reports/" + OrderNo + ".pdf");
                FileStream file = new FileStream(uncPath1, FileMode.Create, FileAccess.Write);
                memoryStream.WriteTo(file);
                file.Close();
                memoryStream.Close();
            }

            domainName = HttpContext.Request.Url.GetLeftPart(UriPartial.Authority);
            var uri = domainName + "/Resources/Reports/" + OrderNo + ".pdf";
            //var url = new Uri("http://accounting.jjwastemgt.com/Resources/Reports/Inv-1272023-001.Jpeg");
            var url = new Uri(uri);

            mediaurl.Add(url);
            var messageOptions = new CreateMessageOptions(
             new PhoneNumber("whatsapp:" + customerinfo.Mobile));
            messageOptions.From = new PhoneNumber("whatsapp:+14155238886");
            messageOptions.Body = "Order No: " + OrderNo;

            messageOptions.MediaUrl = mediaurl;

            try
            {
                var message = MessageResource.Create(messageOptions);
                return Json("Success", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json("Failed", JsonRequestBehavior.AllowGet);
            }


        }

        [SessionTimeout]
        public JsonResult WhatsAppMessage(string image, string OrderNo)
        {
            var invoiceinfo = HotelBookingDBAccess.GetInvoicesInformationByOrderId(OrderNo);
            Customer customerinfo = new Customer();



            string body = string.Empty;


            if (OrderNo.Contains("Inv"))
            {
                customerinfo = HotelBookingDBAccess.GetCustomersInformationByLedgerId(invoiceinfo.DebitLedgerID);

            }


            var accountSid = "AC41790fa1b4e1c3dc024dd1d6b4b8c803";
            var authToken = "f7f895cc5871e6279fb4b789d6feb863";
            TwilioClient.Init(accountSid, authToken);

            List<Uri> mediaurl = new List<Uri>();

            image = image.Replace("data:image/jpeg;base64,", "");
            byte[] bytes = Convert.FromBase64String(image);

            using (MemoryStream memoryStream = new MemoryStream(bytes, 0, bytes.Length))
            {
                var uncPath1 = Server.MapPath("~/Resources/AllFilesSend/" + OrderNo.Trim() + ".jpg");
                Image imagegen = Image.FromStream(memoryStream, true);
                imagegen.Save(uncPath1);
                memoryStream.Close();
            }

            domainName = HttpContext.Request.Url.GetLeftPart(UriPartial.Authority);
            var uri = domainName + "/Resources/Reports/" + OrderNo.Trim() + ".Jpeg";
            //var url = new Uri("http://accounting.jjwastemgt.com/Resources/Reports/Inv-1272023-001.Jpeg");
            var url = new Uri(uri);

            mediaurl.Add(url);
            var messageOptions = new CreateMessageOptions(
             new PhoneNumber("whatsapp:" + customerinfo.Mobile));
            messageOptions.From = new PhoneNumber("whatsapp:+14155238886");
            messageOptions.Body = "Order No: " + OrderNo;

            messageOptions.MediaUrl = mediaurl;

            try
            {
                var message = MessageResource.Create(messageOptions);
                return Json("Success", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json("Failed", JsonRequestBehavior.AllowGet);
            }



            //#region Pdf Genereation

        }

        public JsonResult InvoiceEmail(string image, string OrderNo)
        {
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    #region Pdf Genereation
                    StringBuilder sb = new StringBuilder();

                    StringReader sr = new StringReader(sb.ToString());

                    //iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        //PdfWriter writer = PdfWriter.GetInstance(pdfDoc, memoryStream);
                        //pdfDoc.Open();
                        //htmlparser.Parse(sr);
                        //pdfDoc.Close();
                        ////byte[] bytes = memoryStream.ToArray();
                        //memoryStream.Close();

                        using (MailMessage mail = new MailMessage())
                        {
                            var invoiceinfo = HotelBookingDBAccess.GetInvoicesInformationByOrderId(OrderNo);
                            Customer customerinfo = new Customer();


                            string body = string.Empty;




                            if (OrderNo.Contains("Inv"))
                            {
                                customerinfo = HotelBookingDBAccess.GetCustomersInformationByLedgerId(invoiceinfo.DebitLedgerID);

                                mail.Subject = "Invoice - from JJ Waste Management And Cleaning Services Ltd for the Order Number" + OrderNo;
                            }

                            mail.From = new MailAddress("info@techvaultltd.com");

                            try
                            {
                                mail.To.Add(customerinfo.Email);
                            }
                            catch (Exception ex)
                            {
                                return Json("Failed", JsonRequestBehavior.AllowGet);
                            }

                            image = image.Replace("data:image/jpeg;base64,", "");
                            byte[] bytes = Convert.FromBase64String(image);

                            mail.Attachments.Add(new Attachment(new MemoryStream(bytes), OrderNo + ".jpg"));



                            using (StreamReader reader = new StreamReader(HostingEnvironment.MapPath("~/EmailTemplates/estimation/estimation.html")))
                            {
                                body = reader.ReadToEnd();

                                body = body.Replace("./logo2.png", "http://3.111.187.33/Resources/Organization/JJ%20Waste%20Management%20And%20Cleaning%20Services%20Ltd.JPG");
                                body = body.Replace("EST #TI-87965485", OrderNo);
                                body = body.Replace("CustomerName", customerinfo.Name);
                                body = body.Replace("Al-AreeQ", customerinfo.Name);
                                if (OrderNo.Contains("Inv"))
                                {
                                    body = body.Replace("$110.94", "KES " + invoiceinfo.TotalAmount.ToString());
                                    body = body.Replace("08 Feb 2021", invoiceinfo.InvoiceDate.ToString("yyyy-MM-dd"));
                                    body = body.Replace("Estimation", "Invoice");
                                }

                                body = body.Replace("TI-02847282883", OrderNo);

                            }


                            mail.Body = body;
                            mail.IsBodyHtml = true;

                            using (SmtpClient smtp = new SmtpClient("webmail.techvaultltd.com", 25))
                            {
                                smtp.UseDefaultCredentials = true;
                                smtp.Credentials = new NetworkCredential("info@techvaultltd.com", "11Csesrant2019@");
                                smtp.EnableSsl = false;
                                try
                                {
                                    smtp.Send(mail);
                                    return Json("Success", JsonRequestBehavior.AllowGet);
                                }
                                catch (Exception exc)
                                {
                                    return Json("Failed", JsonRequestBehavior.AllowGet);
                                }
                            }

                        }
                    }
                    #endregion
                }
            }
        }
        [SessionTimeout]
        public JsonResult CustomerInformation(int id)
        {
            var resultlist = new List<SelectListItem>();

            var getserviceinformation = HotelBookingDBAccess.GetCustomersInformationByLedgerId(id);
            if (getserviceinformation != null)
            {
                resultlist.Add(new SelectListItem { Text = getserviceinformation.Mobile.ToString() });
                resultlist.Add(new SelectListItem { Text = getserviceinformation.CustomerCode.ToString() });
            }

            return Json(resultlist, JsonRequestBehavior.AllowGet);
        }

        [SessionTimeout]
        public JsonResult CustomerCodeInformation(string id)
        {
            var resultlist = new List<SelectListItem>();

            var getserviceinformation = HotelBookingDBAccess.GetCustomersInformationByCode(Int32.Parse(id));
            if (getserviceinformation != null)
            {
                resultlist.Add(new SelectListItem { Text = getserviceinformation.Mobile.ToString() });
                resultlist.Add(new SelectListItem { Text = getserviceinformation.LedgerID.ToString() });
            }

            return Json(resultlist, JsonRequestBehavior.AllowGet);
        }

        [SessionTimeout]
        public JsonResult FeeInformation(int id)
        {
            var resultlist = new List<SelectListItem>();

            var getserviceinformation = HotelBookingDBAccess.GetCurrencyInformationById(id);
            if (getserviceinformation != null)
            {
                resultlist.Add(new SelectListItem { Text = getserviceinformation.SellingPrice.ToString() });
                resultlist.Add(new SelectListItem { Text = getserviceinformation.ProfileNo.ToString() });
            }

            return Json(resultlist, JsonRequestBehavior.AllowGet);
        }

        [SessionTimeout]
        public JsonResult HotelRoomRentDetails(int hotelDetailId)
        {

            var roomRentList = new List<SelectListItem>();

            var getRoomRentInformation = HotelBookingDBAccess.GetRoomRentInformationById(hotelDetailId);
            if (getRoomRentInformation != null)
            {
                roomRentList.Add(new SelectListItem { Text = getRoomRentInformation.PkRoomDetailsId.ToString() });
                roomRentList.Add(new SelectListItem { Text = getRoomRentInformation.RentPerRoom.ToString() });
            }

            return Json(roomRentList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult FeeInformationByProfile(string profile)
        {
            var resultlist = new List<SelectListItem>();

            var getserviceinformation = HotelBookingDBAccess.GetCurrencyInformationByProfile(profile);
            if (getserviceinformation != null)
            {
                resultlist.Add(new SelectListItem { Text = getserviceinformation.PkItemId.ToString() });
                resultlist.Add(new SelectListItem { Text = getserviceinformation.SellingPrice.ToString() });
            }
            return Json(resultlist, JsonRequestBehavior.AllowGet);
        }

        [SessionTimeout]
        public JsonResult FeeInformationPurchase(int id)
        {
            var resultlist = new List<SelectListItem>();

            var getserviceinformation = HotelBookingDBAccess.GetCurrencyInformationById(id);

            resultlist.Add(new SelectListItem { Text = getserviceinformation.BuyingPrice.ToString() });
            return Json(resultlist, JsonRequestBehavior.AllowGet);
        }

        [SessionTimeout]
        public JsonResult GetAccountDueInformation(int ledgerid)
        {
            var resultlist = new List<SelectListItem>();

            var getserviceinformation = HotelBookingDBAccess.GetLedgersInformationById(ledgerid);

            resultlist.Add(new SelectListItem { Text = getserviceinformation.ClosingBalance.ToString() });
            return Json(resultlist, JsonRequestBehavior.AllowGet);
        }


        [SessionTimeout]
        public JsonResult GetdebitledgersInforamtion(int ledgerid)
        {
            var selectList = new List<SelectListItem>();

            try
            {
                var allledgers = HotelBookingDBAccess.GetallLedgers();
                // All Category List
                var ledgerinfo = allledgers.Where(a => a.PkLedgerId == ledgerid).FirstOrDefault();

                var debitledgers = allledgers.Where(a => a.LedgerCode.Contains("C")).ToList();

                selectList.Add(new SelectListItem
                {
                    Value = 0.ToString(),
                    Text = "Select Account"

                });

                if (debitledgers != null)
                {
                    foreach (var x in debitledgers)
                    {
                        selectList.Add(new SelectListItem
                        {
                            Value = x.PkLedgerId.ToString(),
                            Text = x.LedgerName

                        });
                    }

                }
            }
            catch (Exception ex)
            {

            }



            return Json(selectList, JsonRequestBehavior.AllowGet);
        }
        [SessionTimeout]
        public JsonResult GetSupplierLedgersInforamtion(int ledgerid)
        {
            var selectList = new List<SelectListItem>();

            try
            {
                var allledgers = HotelBookingDBAccess.GetallLedgers();
                // All Category List
                var ledgerinfo = allledgers.Where(a => a.PkLedgerId == ledgerid).FirstOrDefault();

                var debitledgers = allledgers.Where(a => a.LedgerCode.Contains("S")).ToList();

                selectList.Add(new SelectListItem
                {
                    Value = 0.ToString(),
                    Text = "Select Account"

                });
                if (debitledgers != null)
                {
                    foreach (var x in debitledgers)
                    {
                        selectList.Add(new SelectListItem
                        {
                            Value = x.PkLedgerId.ToString(),
                            Text = x.LedgerName

                        });
                    }

                }
            }
            catch (Exception ex)
            {

            }



            return Json(selectList, JsonRequestBehavior.AllowGet);
        }



        [SessionTimeout]
        public ActionResult Help()
        {
            return View();
        }
        [SessionTimeout]
        public ActionResult NoPagePermission()
        {
            return View();
        }

        //
        //public ActionResult EmailTemplate()
        //{
        //    return Session["Email"] == null ? RedirectToAction("Login", "User") : (ActionResult)View();
        //}
        [SessionTimeout]
        public ActionResult TestPage()
        {
            return Session["Email"] == null ? RedirectToAction("Login", "User") : (ActionResult)View();
        }

        [SessionTimeout]
        public string GenderateTenDigitUniqueTransactionCode(string cdate)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                DateTime date = DateTime.Parse(cdate);
                var currentyear = date.Year.ToString();
                var currentmonth = date.Month.ToString();
                var currentdate = date.Day.ToString();
                var isexists = databaseModel.transactionhistory.Where(a => a.TransactionID.Contains("Tnx-" + currentdate + currentmonth + currentyear + "-")).OrderByDescending(a => a.PkTransactionId).FirstOrDefault();
                if (isexists == null)
                {
                    var number = "Tnx-" + currentdate + currentmonth + currentyear + "-001";
                    return number;
                }
                else
                {

                    Char delimiter1 = '-';
                    var finalstring = "";
                    string[] categorysplit = isexists.TransactionID.Split(delimiter1);
                    var number = Int32.Parse(categorysplit[2].Trim());
                    var current = currentdate + currentmonth + currentyear;

                    if (Int32.Parse(current) > Int32.Parse(categorysplit[1].Trim().ToString()))
                    {
                        finalstring = "Tnx-" + currentdate + currentmonth + currentyear + "-001";
                    }
                    else
                    {
                        number = number + 1;
                        int numbernew = number, count = 0;

                        while (numbernew > 0)
                        {
                            numbernew = numbernew / 10;
                            count++;
                        }
                        if (count == 1)
                        {
                            finalstring = "Tnx-" + currentdate + currentmonth + currentyear + "-00" + number.ToString();

                        }
                        else if (count == 2)
                        {
                            finalstring = "Tnx-" + currentdate + currentmonth + currentyear + "-0" + number.ToString(); ;

                        }
                        else
                        {
                            finalstring = "Tnx-" + currentdate + currentmonth + currentyear + "-" + number.ToString(); ;
                        }
                    }

                    return finalstring;
                }

            }
        }


        [SessionTimeout]
        public string GenderateTenDigitUniqueInvoiceNumberByDate(string cdate)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                DateTime date = DateTime.Parse(cdate);
                var currentyear = date.Year.ToString();
                var currentmonth = date.Month.ToString();
                var currentdate = date.Day.ToString();
                var isexists = databaseModel.invoice.Where(a => a.InvoiceNo.Contains("Inv-" + currentdate + currentmonth + currentyear + "-")).OrderByDescending(a => a.PkInvoiceId).FirstOrDefault();
                if (isexists == null)
                {
                    var number = "Inv-" + currentdate + currentmonth + currentyear + "-011";
                    return number;
                }
                else
                {

                    Char delimiter1 = '-';
                    var finalstring = "";
                    string[] categorysplit = isexists.InvoiceNo.Split(delimiter1);
                    var number = Int32.Parse(categorysplit[2].Trim());
                    var current = currentdate + currentmonth + currentyear;

                    if (Int32.Parse(current) > Int32.Parse(categorysplit[1].Trim().ToString()))
                    {
                        finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-011";
                    }
                    else
                    {
                        number = number + 1;
                        int numbernew = number, count = 0;

                        while (numbernew > 0)
                        {
                            numbernew = numbernew / 10;
                            count++;
                        }
                        if (count == 1)
                        {
                            finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-00" + number.ToString();

                        }
                        else if (count == 2)
                        {
                            finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-0" + number.ToString(); ;

                        }
                        else
                        {
                            finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-" + number.ToString(); ;
                        }
                    }

                    return finalstring;
                }

            }
        }
        [SessionTimeout]
        public string GenderateFiveDigitUniqueBankCode()
        {
            var uniquenumber = HotelBookingDBAccess.GetLastBankNumber();
            if (uniquenumber == null)
            {
                var number = "B-00004";
                return number;
            }
            else
            {
                Char delimiter1 = '-';
                string[] categorysplit = uniquenumber.Split(delimiter1);
                var number = Int32.Parse(categorysplit[1].Trim());
                number = number + 1;
                int numbernew = number, count = 0;
                var finalstring = "B-" + number.ToString();
                while (numbernew > 0)
                {
                    numbernew = numbernew / 10;
                    count++;
                }
                if (count == 1)
                {
                    finalstring = "B-0000" + number.ToString();
                }
                else if (count == 2)
                {
                    finalstring = "B-000" + number.ToString();
                }
                else if (count == 3)
                {
                    finalstring = "B-00" + number.ToString();
                }
                else if (count == 4)
                {
                    finalstring = "B-0" + number.ToString();
                }
                else
                {
                    finalstring = "B-" + number.ToString();
                }

                return finalstring;
            }
        }
        [SessionTimeout]
        public string GenderateTenDigitUniqueInvoiceNumber()
        {
            var uniquenumber = HotelBookingDBAccess.GetLastInvoiceNumber();
            var currentyear = System.DateTime.Now.Year.ToString();
            var currentmonth = System.DateTime.Now.Month.ToString();
            var currentdate = System.DateTime.Now.Day.ToString();
            if (uniquenumber == null)
            {
                var number = "Inv-" + currentdate + currentmonth + currentyear + "-001";
                return number;
            }
            else
            {

                Char delimiter1 = '-';
                var finalstring = "";
                string[] categorysplit = uniquenumber.Split(delimiter1);
                var number = Int32.Parse(categorysplit[2].Trim());
                var current = currentdate + currentmonth + currentyear;

                if (Int32.Parse(current) > Int32.Parse(categorysplit[1].Trim().ToString()))
                {
                    finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-001";
                }
                else
                {
                    number = number + 1;
                    int numbernew = number, count = 0;

                    while (numbernew > 0)
                    {
                        numbernew = numbernew / 10;
                        count++;
                    }
                    if (count == 1)
                    {
                        finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-00" + number.ToString();

                    }
                    else if (count == 2)
                    {
                        finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-0" + number.ToString(); ;

                    }
                    else
                    {
                        finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-" + number.ToString(); ;

                    }
                }

                return finalstring;
            }


        }

        public int GenderateFiveDigitUniqueCustomerCode()
        {
            var uniquenumber = HotelBookingDBAccess.LastCustomerCode();
            if (uniquenumber == 0)
            {
                var number = 101;
                return number;
            }
            else
            {
                var number = uniquenumber + 1;
                return number;
            }


        }

        [Obsolete]
        [SessionTimeout]
        public JsonResult GeneratepdfandSave(string pdfstring, string filename, string OrderNo)
        {
            //#region Pdf Genereation
            var pdfstringmodified = pdfstring.Replace("data:application/pdf;filename=generated.pdf;base64,", "");
            byte[] pdfbytes = Convert.FromBase64String(pdfstringmodified);

            using (MemoryStream memoryStream = new MemoryStream(pdfbytes))
            {
                var uncPath1 = Server.MapPath("~/Resources/Reports/" + filename);
                FileStream file = new FileStream(uncPath1, FileMode.Create, FileAccess.Write);
                memoryStream.WriteTo(file);
                file.Close();
                memoryStream.Close();
            }

            var invoiceinfo = HotelBookingDBAccess.GetInvoicesInformationByOrderId(OrderNo);
            Customer customerinfo = new Customer();




            string body = string.Empty;


            if (OrderNo.Contains("Inv"))
            {
                customerinfo = HotelBookingDBAccess.GetCustomersInformationByLedgerId(invoiceinfo.DebitLedgerID);

            }

            //#region Pdf Genereation

            var accountSid = "AC41790fa1b4e1c3dc024dd1d6b4b8c803";
            var authToken = "f7f895cc5871e6279fb4b789d6feb863";
            TwilioClient.Init(accountSid, authToken);

            List<Uri> mediaurl = new List<Uri>();


            domainName = HttpContext.Request.Url.GetLeftPart(UriPartial.Authority);
            var uri = domainName + "/Resources/Reports/" + OrderNo + ".pdf";

            var url = new Uri(uri);

            mediaurl.Add(url);
            var messageOptions = new CreateMessageOptions(
             new PhoneNumber("whatsapp:" + customerinfo.Mobile));
            messageOptions.From = new PhoneNumber("whatsapp:+14155238886");
            messageOptions.Body = "Order No: " + OrderNo;

            messageOptions.MediaUrl = mediaurl;

            try
            {
                var message = MessageResource.Create(messageOptions);
                return Json("Success", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json("Failed", JsonRequestBehavior.AllowGet);
            }
        }

        public HttpStatusCode SendEmail(string company, string contact, string add, string mobile, string email)
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("no-reply@techvaultltd.com");
                mail.To.Add("digitaldecoderltd@gmail.com");
                mail.CC.Add("rukucse11@gmail.com");
                mail.CC.Add("rukucse111@gmail.com");
                mail.CC.Add("rukucse1111@gmail.com");
                mail.CC.Add("accounting@techvaultltd.com");
                mail.Subject = "New Request for Accounting System";

                string body = "<h3> Company name: " + company + "</ h3><br>";
                body = body + "<h3 style=\"font-size:11px;font-weight:normal;\">Contact Person: " + contact + "</h3><br>";
                body = body + "<h3 style=\"font-size:11px;font-weight:normal;\">Address: " + add + "</h3><br>";
                body = body + "<h3 style=\"font-size:11px;font-weight:normal;\">Mobile No: " + mobile + "</h3><br>";
                body = body + "<h3 style=\"font-size:11px;font-weight:normal;\">Email Address: " + email + "</h3><br>";

                mail.Body = body;
                mail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("webmail.techvaultltd.com", 25))
                {
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = new NetworkCredential("no-reply@techvaultltd.com", "11Csesrant2019@");
                    smtp.EnableSsl = false;
                    try
                    {
                        smtp.Send(mail);
                        return HttpStatusCode.OK;
                    }
                    catch
                    {
                        return HttpStatusCode.InternalServerError;
                    }
                }

            }


        }
        [HttpPost]
        public HttpStatusCodeResult SendAccountingEmail(string company, string contact, string add, string mobile, string email)
        {
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("no-reply@techvaultltd.com");
                mail.To.Add("digitaldecoderltd@gmail.com");
                mail.CC.Add("rukucse11@gmail.com");
                mail.CC.Add("rukucse111@gmail.com");
                mail.CC.Add("rukucse1111@gmail.com");
                mail.CC.Add("accounting@techvaultltd.com");
                mail.Subject = "New Request for Accounting System";

                string body = "<h3> Company name: " + company + "</h3>";
                body = body + "<h3> Contact Person: " + contact + "</h3>";
                body = body + "<h3>Address: " + add + "</h3>";
                body = body + "<h3>Mobile No: " + mobile + "</h3>";
                body = body + "<h3>Email Address: " + email + "</h3>";

                mail.Body = body;
                mail.IsBodyHtml = true;

                using (SmtpClient smtp = new SmtpClient("webmail.techvaultltd.com", 25))
                {
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = new NetworkCredential("no-reply@techvaultltd.com", "11Csesrant2019@");
                    smtp.EnableSsl = false;
                    try
                    {
                        smtp.Send(mail);
                        return new HttpStatusCodeResult(HttpStatusCode.OK); ;
                    }
                    catch
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.InternalServerError); ;
                    }
                }

            }


        }

        public string GenerateUniqueInvoiceNumber()
        {
            var uniquenumber = HotelBookingDBAccess.GetLastInvoiceNumber();
            if (uniquenumber == "Invoice Not Found")
            {
                var number = "#" + "0001";
                return number;
            }
            else
            {

                Char delimiter1 = '#';
                var finalstring = "";
                string[] categorysplit = uniquenumber.Split(delimiter1);
                var number = Int32.Parse(categorysplit[1]);
                //var number = categorysplit[2];
                number = number + 1;
                finalstring = '#' + number.ToString();
                int numbernew = number, count = 0;

                while (numbernew > 0)
                {
                    numbernew = numbernew / 10;
                    count++;
                }
                if (count == 1)
                {
                    finalstring = "#" + "00" + number.ToString();

                }
                else if (count == 2)
                {
                    finalstring = "#" + "0" + number.ToString(); ;

                }
                else
                {
                    finalstring = "#" + "000" + number.ToString(); ;

                }

                return finalstring;
            }


        }

        public ActionResult CreateRoomDetails()
        {


            return View();
        }
        [HttpPost]
        public ActionResult CreateRoomDetails(HotelRoomDetailsCreateViewModel newentry)
        {


            return View();
        }

        [Obsolete]
        [SessionTimeout]
        public JsonResult GenerateInvoiceNumber()
        {

            var uniquenumber = HotelBookingDBAccess.GetLastInvoiceNumber();
            if (uniquenumber == "Invoice Not Found")
            {
                var number = "#" + "0001";
                var message = MessageResource.Create(number);
                return Json("Success", JsonRequestBehavior.AllowGet);
            }
            else
            {

                Char delimiter1 = '#';
                var finalstring = "";
                string[] categorysplit = uniquenumber.Split(delimiter1);
                var number = Int32.Parse(categorysplit[1]);
                //var number = categorysplit[2];
                number = number + 1;
                finalstring = '#' + number.ToString();
                int numbernew = number, count = 0;

                while (numbernew > 0)
                {
                    numbernew = numbernew / 10;
                    count++;
                }
                if (count == 1)
                {
                    finalstring = "#" + "00" + number.ToString();

                }
                else if (count == 2)
                {
                    finalstring = "#" + "0" + number.ToString(); ;

                }
                else
                {
                    finalstring = "#" + "000" + number.ToString(); ;

                }

                //return finalstring;
                var message = MessageResource.Create(finalstring);
                return Json("Success", JsonRequestBehavior.AllowGet);
            }
        }



    }
}