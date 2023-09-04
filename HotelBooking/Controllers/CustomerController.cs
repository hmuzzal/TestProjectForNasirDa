using log4net;
using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using System.Web;
using System.IO;
using HotelBooking.App_Start;
using HotelBooking.DataLayer;
using HotelBooking.DataLayer.Models.Accounts;
using HotelBooking.DataLayer.Models.Customers;
using HotelBooking.DataLayer.ViewModels.Accounts;
using HotelBooking.DataLayer.ViewModels.CustomerView;
using System.Collections.Generic;
using HotelBooking.DataLayer.ViewModels.Statement;

namespace HotelBooking.Controllers
{
    [SessionTimeout]
    public class CustomerController : Controller
    {
        private static string customermesage = "";

        private static readonly ILog Log = LogManager.GetLogger(typeof(CustomerController));

        #region Customers
        
        public ActionResult Index(int? id)
        {

            if (customermesage == "Insert")
            {
                ViewBag.message = "Success: Data Created Succesfully";
            }
            else if (customermesage == "Update")
            {

                ViewBag.message = "Success: Data Updated Succesfully";
            }
            else if (customermesage == "Delete")
            {

                ViewBag.message = "Success: Data Deleted Succesfully";
            }
            else
            {
                ViewBag.message = customermesage;
            }

            customermesage = "";


            CustomerViewModel supp = new CustomerViewModel();

            try
            {


                var alldeignations = HotelBookingDBAccess.GetallCustomer().ToList();
                alldeignations = alldeignations.OrderBy(a=>a.Name).ToList();
                supp.allCustomers = alldeignations;


                CreateCustomerViewModel createsupp = new CreateCustomerViewModel();

                HomeController homeController = new HomeController();
                var customercode = homeController.GenderateFiveDigitUniqueCustomerCode();
                createsupp.CustomerCode = customercode;
                CreateCustomerViewModel updatebanks = new CreateCustomerViewModel();


                
               
                supp.createCustomer = createsupp;


                if (id != 0 && id != null)
                {
                    var vm = HotelBookingDBAccess.GetCustomerInformationById((int)id);

                    updatebanks.PkCustomerId = vm.PkCustomerId;
                    updatebanks.Name = vm.Name;
                    updatebanks.CustomerCode = vm.CustomerCode;
                    updatebanks.Mobile = vm.Mobile;
                    updatebanks.Mobile = vm.Mobile;
                    updatebanks.PresentAddress = vm.PresentAddress;
                    updatebanks.PermanentAddress = vm.PermanentAddress;
                    updatebanks.Email = vm.Email;
                    
                }

                supp.updateCustomer = updatebanks;
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Bank Level", ex);
            }

            return View(supp);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        
        public ActionResult Index(CustomerViewModel supp, string Create, string Update)
        {
            var alldeignations = HotelBookingDBAccess.GetallCustomer();

            if (!string.IsNullOrEmpty(Create))
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {
                            var bankaccountinfo = databaseModel.Customers.Where(a=>a.Name==supp.createCustomer.Name).FirstOrDefault();
                            if (bankaccountinfo == null)
                            {

                                HomeController home = new HomeController();

                                Ledgers debitledger = new Ledgers();
                                debitledger.LedgerName = supp.createCustomer.Name;
                                var accountspayablegroup = HotelBookingDBAccess.IsAccountGroupsExist("Accounts Receivable");
                                debitledger.LedgerParent = accountspayablegroup.PkGroupId;

                                debitledger.LedgerCode =supp.createCustomer.CustomerCode.ToString();
                                debitledger.Nature = accountspayablegroup.Nature;

                                debitledger.AccountOpeningBalance = 0;
                                debitledger.OpeningBalance = 0;
                                debitledger.ClosingBalance = 0;
                                debitledger.Status = true;
                                debitledger.CreatedAt = System.DateTime.Now;
                                debitledger.UpdatedAt = System.DateTime.Now;
                                debitledger.CreatedBy = Session["Email"].ToString();
                                debitledger.UpdatedBy = Session["Email"].ToString();
                                debitledger.DeletedBy = "";
                                databaseModel.ledgers.Add(debitledger);

                                databaseModel.SaveChanges();

                                if (debitledger.PkLedgerId > 0)
                                {

                                    Customer newsup = new Customer();

                                    newsup.Name = supp.createCustomer.Name;
                                    newsup.CustomerCode = supp.createCustomer.CustomerCode;
                                    newsup.Mobile = supp.createCustomer.Mobile;
                                    newsup.Email = supp.createCustomer.Email;
                                    newsup.PresentAddress = supp.createCustomer.PresentAddress;
                                    newsup.PermanentAddress = supp.createCustomer.PermanentAddress;
                                   
                                    newsup.LedgerID = debitledger.PkLedgerId;

                                    newsup.CreatedAt = System.DateTime.Now;
                                    newsup.UpdatedAt = System.DateTime.Now;
                                    newsup.CreatedBy = Session["Email"].ToString();
                                    newsup.UpdatedBy = Session["Email"].ToString();
                                    newsup.DeletedBy = "";
                                    databaseModel.Customers.Add(newsup);
                                    databaseModel.SaveChanges();

                                    if (newsup.PkCustomerId > 0)
                                    {
                                        dbTran.Commit();
                                        return RedirectToAction("Index", "Customer");
                                    }
                                }



                                dbTran.Rollback();
                                customermesage = "Failed";
                                return RedirectToAction("Index", "Customer");

                            }
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            customermesage = "Failed";
                            return RedirectToAction("Index", "Customer");
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
                            var bankaccountinfo = HotelBookingDBAccess.GetCustomerInformationById(supp.updateCustomer.PkCustomerId);
                            if (bankaccountinfo != null)
                            {

                                var newsup = databaseModel.Customers.Where(m => m.PkCustomerId == supp.updateCustomer.PkCustomerId).FirstOrDefault();
                                if (newsup != null)
                                {

                                    newsup.Name = supp.updateCustomer.Name;
                                    newsup.Email = supp.updateCustomer.Email;
                                    newsup.Mobile = supp.updateCustomer.Mobile;
                                    newsup.PresentAddress = supp.updateCustomer.PresentAddress;
                                    
                                    newsup.UpdatedAt = System.DateTime.Now;
                                    newsup.UpdatedBy = Session["Email"].ToString();
                                    databaseModel.SaveChanges();

                                    dbTran.Commit();
                                    customermesage = "Update";
                                    return RedirectToAction("Index", "Customer", new { id = 0 });
                                }


                            }
                            ViewBag.message = "Customer already exist";
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            customermesage = "Failed";
                            return RedirectToAction("Index", "Customer", new { id = 0 });
                        }
                    }
                }

            }
            
            
            supp.allCustomers = alldeignations;


            #region Default Data
            CreateCustomerViewModel createsupp = new CreateCustomerViewModel();

            CreateCustomerViewModel updatebanks = new CreateCustomerViewModel();

            supp.createCustomer = createsupp;
            supp.updateCustomer = updatebanks;

            
            #endregion
            return View(supp);
        }

        public ActionResult DeleteCustomer(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {

                        var bankinfo = databaseModel.Customers.Where(a=>a.PkCustomerId==id).FirstOrDefault();
                        var trancount = databaseModel.transactionhistory.Where(a => a.LedgerID == bankinfo.LedgerID).ToList();

                        if (bankinfo != null)
                        {
                            if (trancount.Count == 1)
                            {
                                var deleteopening = databaseModel.transactionhistory.Where(a => a.LedgerID == bankinfo.LedgerID || a.AccountID == bankinfo.LedgerID).ToList();
                                if (deleteopening != null)
                                {
                                    databaseModel.transactionhistory.RemoveRange(deleteopening);
                                    databaseModel.SaveChanges();
                                }
                                databaseModel.Customers.Remove(bankinfo);
                                databaseModel.SaveChanges();

                                var ledgers = databaseModel.ledgers.Where(m => m.PkLedgerId == bankinfo.LedgerID).FirstOrDefault();
                                if (ledgers != null)
                                {
                                    if(ledgers.AccountOpeningBalance>0)
                                    {
                                        var capitalledgerifo = databaseModel.ledgers.Where(a => a.LedgerName == "Capital Account").FirstOrDefault();

                                        if (capitalledgerifo != null)
                                        {
                                            capitalledgerifo.OpeningBalance = capitalledgerifo.ClosingBalance;
                                            capitalledgerifo.ClosingBalance = capitalledgerifo.ClosingBalance - ledgers.AccountOpeningBalance;
                                            databaseModel.SaveChanges();
                                        }
                                    }
                                    databaseModel.ledgers.Remove(ledgers);
                                    databaseModel.SaveChanges();

                                    dbTran.Commit();
                                    customermesage = "Delete";
                                    return RedirectToAction("Index", "Banking");
                                }
                                dbTran.Rollback();

                            }
                            else
                            {
                                bankinfo.Status = false;
                                databaseModel.SaveChanges();

                                var ledgers = databaseModel.ledgers.Where(m => m.PkLedgerId == bankinfo.LedgerID).FirstOrDefault();
                                if (ledgers != null)
                                {
                                    ledgers.Status = false;
                                    databaseModel.SaveChanges();

                                    dbTran.Commit();
                                    customermesage = "Delete";
                                    return RedirectToAction("Index", "Customer");
                                }
                                dbTran.Rollback();
                            }
                        }

                        customermesage = "Failed";
                        return RedirectToAction("Index", "Customer");
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        return RedirectToAction("Index", "Customer", new { message = "Failed" });
                    }
                }
            }
        }

        public ActionResult ActiveCustomer(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var customerinfo = HotelBookingDBAccess.GetCustomersInformationById(id);
                        if (customerinfo.Status == false)
                        {
                            var v = databaseModel.Customers.Where(a => a.PkCustomerId == id).FirstOrDefault();
                            if (v != null)
                            {
                                v.Status = true;
                                v.DeletedBy = "";
                                databaseModel.SaveChanges();

                                var ledgers = databaseModel.ledgers.Where(m => m.PkLedgerId == customerinfo.LedgerID).FirstOrDefault();
                                if (ledgers != null)
                                {
                                    ledgers.Status = true;
                                    v.UpdatedAt = DateTime.Now;
                                    v.UpdatedBy = Session["Email"].ToString();
                                    databaseModel.SaveChanges();

                                    dbTran.Commit();
                                    customermesage = "Active";
                                    return RedirectToAction("Index", "Customer");
                                }
                            }
                            dbTran.Rollback();
                        }

                        customermesage = "Failed";
                        return RedirectToAction("Index", "Customer");
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        customermesage = "Failed";
                        return RedirectToAction("Index", "Customer");
                    }
                }
            }

        }

        public string ReplaceSpeacialCharacters(string filename)
        {
            var replacednam = filename.Replace("\'", string.Empty);
            replacednam = replacednam.Length > 100 ? replacednam.Substring(0, 100) : replacednam.Substring(0, replacednam.Length);

            replacednam = replacednam.Replace("?", string.Empty);
            replacednam = replacednam.Replace("¥", string.Empty);
            replacednam = replacednam.Replace("/", string.Empty);
            replacednam = replacednam.Replace(":", string.Empty);
            replacednam = replacednam.Replace("“", string.Empty);
            replacednam = replacednam.Replace("?", string.Empty);
            replacednam = replacednam.Replace("<", string.Empty);
            replacednam = replacednam.Replace(">", string.Empty);
            replacednam = replacednam.Replace("|", string.Empty);
            replacednam = replacednam.Replace("\"", string.Empty);
            replacednam = replacednam.Replace("..", ".");
            replacednam = replacednam.Replace("\'", string.Empty);
            replacednam = replacednam.Replace(",", string.Empty);
            replacednam = replacednam.Replace("&", string.Empty);

            return replacednam;
        }

        public ActionResult CustomerStatementSingle(int? id)
        {
            AccountStatement alltransactions = new AccountStatement();
            alltransactions.DateFrom = System.DateTime.Now.AddDays(-7);
            alltransactions.Dateto = System.DateTime.Now.AddDays(1);

            var allledgers = HotelBookingDBAccess.GetallLedgers();


            List<AccountStatementDetails> statementdetails = new List<AccountStatementDetails>();
            if (id != null && id != 0)
            {
                alltransactions.LedgerID = (int)id;
                var customerinformation = HotelBookingDBAccess.GetCustomersInformationByLedgerId((int)id);

                var transactions = HotelBookingDBAccess.GetallTransactionHistory((int)id, alltransactions.DateFrom, alltransactions.Dateto).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).ToList();
                var ledgerinfo = HotelBookingDBAccess.GetLedgersInformationById(alltransactions.LedgerID);
                alltransactions.CustomerName = ledgerinfo.LedgerName;
                alltransactions.CustomerCode = ledgerinfo.LedgerCode;
                alltransactions.CustomerAddress = customerinformation.PermanentAddress;
                alltransactions.CustomerPhone = customerinformation.Mobile;

                try
                {
                    var openingtransaction = transactions.Where(a => a.TransactionSource == "Opening Balance").FirstOrDefault();


                    if (openingtransaction != null)
                    {
                        alltransactions.OpeningBalance = openingtransaction.ClosingBalance;
                        transactions = transactions.Where(a => a.TransactionSource != "Opening Balance").ToList();
                    }
                    else
                    {
                        var topopening = transactions.FirstOrDefault();

                        alltransactions.OpeningBalance = topopening.OpeningBalance;
                    }

                    alltransactions.TotalDebit = transactions.Sum(a => a.Debit);
                    alltransactions.TotalCredit = transactions.Sum(a => a.Credit);
                    alltransactions.TotalDue = alltransactions.OpeningBalance + alltransactions.TotalDebit - alltransactions.TotalCredit;

                    AccountStatementDetails single = new AccountStatementDetails();

                    single.Debit = 0;
                    single.Credit = 0;
                    single.AccountNumber = "";
                    single.Description = "Balance B/F";


                    single.Carieer = "";
                    single.BillNo = "";
                    single.Balance = alltransactions.OpeningBalance;
                    statementdetails.Add(single);

                    var topclosing = transactions.OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                    alltransactions.ClosingBalance = topclosing.ClosingBalance;
                }
                catch (Exception ex)
                {
                    Log.Fatal("log4net Fatal Level", ex);
                    alltransactions.OpeningBalance = ledgerinfo.AccountOpeningBalance;
                    alltransactions.ClosingBalance = ledgerinfo.ClosingBalance;
                }


                foreach (var item in transactions)
                {
                    if (item.Debit != 0 || item.Credit != 0)
                    {
                        AccountStatementDetails single = new AccountStatementDetails();
                        single.TransactionDate = item.TransactionDate;
                        single.Debit = item.Debit;
                        single.Credit = item.Credit;
                        single.AccountNumber = item.accounts.LedgerName;

                        single.Description = item.Remarks;
                        single.Carieer = item.Remarks;
                        single.BillNo = item.TransactionReference;
                        single.Balance = item.ClosingBalance;

                        statementdetails.Add(single);
                    }

                }
                alltransactions.statementdetails = statementdetails;

            }
            else
            {
                alltransactions.CustomerName = "";
                alltransactions.CustomerCode = "";
                alltransactions.CustomerAddress = "";
                alltransactions.CustomerPhone = "";
            }
            return View(alltransactions);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CustomerStatementSingle(AccountStatement alltransactions)
        {
           
            var customerinformation = HotelBookingDBAccess.GetCustomersInformationByLedgerId(alltransactions.LedgerID);
           
            List<AccountStatementDetails> statementdetails = new List<AccountStatementDetails>();
            var transactions = HotelBookingDBAccess.GetallTransactionHistory(alltransactions.LedgerID, alltransactions.DateFrom, alltransactions.Dateto).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).ToList(); ;
            var ledgerinfo = HotelBookingDBAccess.GetLedgersInformationById(alltransactions.LedgerID);
            alltransactions.CustomerName = ledgerinfo.LedgerName;

            try
            {
                var openingtransaction = transactions.Where(a => a.TransactionSource == "Opening Balance").FirstOrDefault();


                if (openingtransaction != null)
                {
                    alltransactions.OpeningBalance = openingtransaction.ClosingBalance;
                    transactions = transactions.Where(a => a.TransactionSource != "Opening Balance").ToList();
                }
                else
                {
                    var topopening = transactions.FirstOrDefault();

                    alltransactions.OpeningBalance = topopening.OpeningBalance;
                }

                alltransactions.TotalDebit = transactions.Sum(a => a.Debit);
                alltransactions.TotalCredit = transactions.Sum(a => a.Credit);
                alltransactions.TotalDue = alltransactions.OpeningBalance + alltransactions.TotalDebit - alltransactions.TotalCredit;


                AccountStatementDetails single = new AccountStatementDetails();

                single.Debit = 0;
                single.Credit = 0;
                single.AccountNumber = "";
                single.Description = "Balance B/F";


                single.Carieer = "";
                single.BillNo = "";
                single.Balance = alltransactions.OpeningBalance;
                statementdetails.Add(single);

                var topclosing = transactions.OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                alltransactions.ClosingBalance = topclosing.ClosingBalance;
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                alltransactions.OpeningBalance = ledgerinfo.AccountOpeningBalance;
                alltransactions.ClosingBalance = ledgerinfo.ClosingBalance;
            }


            
            foreach (var item in transactions)
            {
                if (item.Debit != 0 || item.Credit != 0)
                {
                    AccountStatementDetails single = new AccountStatementDetails();
                    single.TransactionDate = item.TransactionDate;
                    single.Debit = item.Debit;
                    single.Credit = item.Credit;
                    single.AccountNumber = item.accounts.LedgerName;

                    single.Description = item.Remarks;
                    single.Carieer = item.Remarks;
                    single.BillNo = item.TransactionReference;
                    single.Balance = item.ClosingBalance;

                    statementdetails.Add(single);
                }

            }

            alltransactions.statementdetails = statementdetails;
            return View(alltransactions);
        }
        #endregion


    }
}