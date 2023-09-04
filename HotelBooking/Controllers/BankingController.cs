
using HotelBooking.Controllers;
using HotelBooking.DataLayer;
using HotelBooking.DataLayer.Models.Accounts;
using HotelBooking.DataLayer.Models.Banking;
using HotelBooking.DataLayer.ViewModels.Banking;
using log4net;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace HotelBooking.Controllers
{

    public class BankingController : Controller
    {
        private static string bankmessage = "";
        private static readonly ILog Log = LogManager.GetLogger(typeof(BankingController));
        #region Banking
        // GET: Banking

        public ActionResult Index(int? id)
        {

            if (bankmessage == "Insert")
            {
                ViewBag.message = "Success: Data Created Succesfully";
            }
            else if (bankmessage == "Update")
            {

                ViewBag.message = "Success: Data Updated Succesfully";
            }
            else if (bankmessage == "Delete")
            {

                ViewBag.message = "Success: Data Deleted Succesfully";
            }
            else if (bankmessage == "Active")
            {

                ViewBag.message = "Success: Data Activated Succesfully";
            }
            else
            {
                ViewBag.message = bankmessage;
            }

            bankmessage = "";


            BankAccountsViewModel supp = new BankAccountsViewModel();

            try
            {
                var allbankaccounts = HotelBookingDBAccess.GetallActiveBanks();

                supp.allbankaccount = allbankaccounts;


                CreateBankAccountViewModel createsupp = new CreateBankAccountViewModel();
                HomeController home = new HomeController();
                createsupp.BankAccountCode = home.GenderateFiveDigitUniqueBankCode();

                createsupp.AllAccountType = new List<SelectListItem>()
                {
                   new SelectListItem() { Text="Bank", Value="1",Selected=true},
                   new SelectListItem() {Text="Credit Card", Value="2"},
                   new SelectListItem() {Text="Mobile Banking", Value="3"},
                   new SelectListItem() {Text="Cash In Hand", Value="4"},
                   new SelectListItem() {Text="Agent Banking", Value="5"}
                };


                supp.createbank = createsupp;

                EditBankAccountViewModel updatebanks = new EditBankAccountViewModel();

                updatebanks.AllAccountType = new List<SelectListItem>()
                {
                   new SelectListItem() { Text="Bank", Value="1",Selected=true},
                   new SelectListItem() {Text="Credit Card", Value="2"},
                   new SelectListItem() {Text="Mobile Banking", Value="3"},
                   new SelectListItem() {Text="Cash In Hand", Value="4"},
                   new SelectListItem() {Text="Agent Banking", Value="5"}
                };

                if (id != 0 && id != null)
                {
                    var bankinformation = HotelBookingDBAccess.GetBanksInformationById((int)id);

                    updatebanks.PkBankAccountId = bankinformation.PkBankAccountId;
                    updatebanks.AccountTypeID = bankinformation.AccountType;
                    updatebanks.BankAccountName = bankinformation.BankAccountName;
                    updatebanks.BankAccountCode = bankinformation.AccountCode;

                    updatebanks.AccountNumber = bankinformation.AccountNumber;
                    updatebanks.Bankname = bankinformation.Bankname;
                    updatebanks.Description = bankinformation.Description;
                    
                }

                supp.updatebank = updatebanks;
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Bank Level", ex);
            }

            return View(supp);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(BankAccountsViewModel supp, string Create, string Update)
        {
            if (!string.IsNullOrEmpty(Create))
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {
                            var bankaccountinfo = HotelBookingDBAccess.IsBanksExist(supp.createbank.Bankname, supp.createbank.AccountNumber);
                            if (bankaccountinfo == null)
                            {

                                Ledgers bankledger = new Ledgers();
                                bankledger.LedgerName = supp.createbank.BankAccountName;
                                if (supp.createbank.AccountTypeID == 2)
                                {
                                    var accountspayablegroup = HotelBookingDBAccess.IsAccountGroupsExist("Credit Cards");
                                    bankledger.LedgerParent = accountspayablegroup.PkGroupId;
                                    bankledger.Nature = accountspayablegroup.Nature;
                                }
                                else if (supp.createbank.AccountTypeID == 3)
                                {
                                    var accountspayablegroup = HotelBookingDBAccess.IsAccountGroupsExist("Mobile Banking");
                                    bankledger.LedgerParent = accountspayablegroup.PkGroupId;
                                    bankledger.Nature = accountspayablegroup.Nature;
                                }
                                else if (supp.createbank.AccountTypeID == 5)
                                {
                                    var accountspayablegroup = HotelBookingDBAccess.IsAccountGroupsExist("Agent Banking");
                                    bankledger.LedgerParent = accountspayablegroup.PkGroupId;
                                    bankledger.Nature = accountspayablegroup.Nature;
                                }
                                else if (supp.createbank.AccountTypeID == 4)
                                {
                                    var accountspayablegroup = HotelBookingDBAccess.IsAccountGroupsExist("Cash In Hand");
                                    bankledger.LedgerParent = accountspayablegroup.PkGroupId;
                                    bankledger.Nature = accountspayablegroup.Nature;
                                }
                                else
                                {
                                    var accountspayablegroup = HotelBookingDBAccess.IsAccountGroupsExist("Bank Accounts");
                                    bankledger.LedgerParent = accountspayablegroup.PkGroupId;
                                    bankledger.Nature = accountspayablegroup.Nature;
                                }

                                bankledger.LedgerCode = supp.createbank.BankAccountCode;
                                bankledger.AccountOpeningBalance = 0;
                                bankledger.OpeningBalance = 0;
                                bankledger.ClosingBalance = 0;
                                bankledger.Status = true;
                                bankledger.CreatedAt = System.DateTime.Now.AddHours(11);
                                bankledger.UpdatedAt = System.DateTime.Now.AddHours(11);
                                bankledger.CreatedBy = Session["Email"].ToString();
                                bankledger.UpdatedBy = Session["Email"].ToString();
                                bankledger.DeletedBy = "";
                                databaseModel.ledgers.Add(bankledger);

                                databaseModel.SaveChanges();

                                if (bankledger.PkLedgerId > 0)
                                {

                                    BankAccounts newsup = new BankAccounts();
                                    newsup.BankAccountName = supp.createbank.BankAccountName;
                                    newsup.AccountType = supp.createbank.AccountTypeID;
                                    newsup.AccountCode = supp.createbank.BankAccountCode;
                                    newsup.LedgerID = bankledger.PkLedgerId;
                                    newsup.AccountNumber = supp.createbank.AccountNumber;
                                    newsup.Bankname = supp.createbank.Bankname;
                                    newsup.Description = supp.createbank.Description;
                                    newsup.CreatedAt = System.DateTime.Now.AddHours(11);
                                    newsup.UpdatedAt = System.DateTime.Now.AddHours(11);
                                    newsup.CreatedBy = Session["Email"].ToString();
                                    newsup.UpdatedBy = Session["Email"].ToString();
                                    newsup.DeletedBy = "";
                                    databaseModel.bankaccount.Add(newsup);
                                    databaseModel.SaveChanges();

                                    if (newsup.PkBankAccountId > 0)
                                    {
                                        

                                        dbTran.Commit();

                                        bankmessage = "Insert";
                                        return RedirectToAction("Index", "Banking");



                                    }


                                    dbTran.Rollback();
                                    bankmessage = "Failed";
                                    return RedirectToAction("Index", "Banking");

                                }
                                ModelState.AddModelError("BankAccountName", "Bank Account already exist");
                            }
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            bankmessage = "Failed";
                            return RedirectToAction("Index", "Banking");
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
                            var bankaccountinfo = HotelBookingDBAccess.GetBanksInformationById(supp.updatebank.PkBankAccountId);
                            if (bankaccountinfo != null)
                            {

                                var newsup = databaseModel.bankaccount.Where(m => m.PkBankAccountId == supp.updatebank.PkBankAccountId).FirstOrDefault();
                                if (newsup != null)
                                {
                                    newsup.BankAccountName = supp.updatebank.BankAccountName;
                                    newsup.AccountType = supp.updatebank.AccountTypeID;
                                    newsup.AccountCode = supp.updatebank.BankAccountCode;
                                    newsup.AccountNumber = supp.updatebank.AccountNumber;
                                    newsup.Bankname = supp.updatebank.Bankname;
                                    newsup.Description = supp.updatebank.Description;
                                    newsup.UpdatedAt = System.DateTime.Now.AddHours(11);
                                    newsup.UpdatedBy = Session["Email"].ToString();
                                    databaseModel.SaveChanges();


                                    if (bankaccountinfo.BankAccountName != supp.updatebank.BankAccountName)
                                    {
                                        var v = databaseModel.ledgers.Where(m => m.PkLedgerId == bankaccountinfo.LedgerID).FirstOrDefault();
                                        if (v != null)
                                        {
                                            v.LedgerName = supp.updatebank.BankAccountName;
                                            v.UpdatedAt = DateTime.Now;
                                            v.UpdatedBy = Session["Email"].ToString(); ;
                                            databaseModel.SaveChanges();
                                        }
                                    }

                                    dbTran.Commit();
                                    bankmessage = "Update";
                                    return RedirectToAction("Index", "Banking", new { id = 0 });
                                   
                                }


                            }
                            ViewBag.message = "Bank Account already exist";
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            bankmessage = "Failed";
                            return RedirectToAction("Index", "Banking", new { id = 0 });
                        }
                    }
                }

            }

            var allbankaccounts = HotelBookingDBAccess.GetallActiveBanks();

            supp.allbankaccount = allbankaccounts;

            EditBankAccountViewModel updatebanks = new EditBankAccountViewModel();

            supp.createbank.AllAccountType = new List<SelectListItem>()
                    {
                       new SelectListItem() { Text="School Fund", Value="1",Selected=true},
                   new SelectListItem() {Text="Operations Fund", Value="2"},
                   new SelectListItem() {Text="Infrastructure Fund", Value="3"},
                    new SelectListItem() {Text="Other Sources", Value="4"},
                   new SelectListItem() {Text="Cash In Hand", Value="5"}
                    };

            updatebanks.AllAccountType = new List<SelectListItem>()
                    {
                       new SelectListItem() { Text="School Fund", Value="1",Selected=true},
                   new SelectListItem() {Text="Operations Fund", Value="2"},
                   new SelectListItem() {Text="Infrastructure Fund", Value="3"},
                    new SelectListItem() {Text="Other Sources", Value="4"},
                   new SelectListItem() {Text="Cash In Hand", Value="5"}
                    };



            supp.updatebank = updatebanks;
            return View(supp);
        }

        public ActionResult CheckExport()
        {
            return View();
        }


        public ActionResult DeleteBankAccount(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {

                        var bankinfo = HotelBookingDBAccess.GetBanksInformationById(id);
                        var trancount = databaseModel.transactionhistory.Where(a => a.LedgerID == bankinfo.LedgerID).ToList();
                        trancount = trancount.Where(a => a.TransactionSource != "Opening Balance").ToList();
                        var v = databaseModel.bankaccount.Where(a => a.PkBankAccountId == id).FirstOrDefault();

                        if (v != null)
                        {
                            if (trancount.Count == 0)
                            {
                                var deleteopening = databaseModel.transactionhistory.Where(a => a.LedgerID == v.LedgerID).FirstOrDefault();
                                if (deleteopening != null)
                                {
                                    databaseModel.transactionhistory.Remove(deleteopening);
                                }
                                databaseModel.bankaccount.Remove(v);
                                databaseModel.SaveChanges();

                                var ledgers = databaseModel.ledgers.Where(m => m.PkLedgerId == bankinfo.LedgerID).FirstOrDefault();
                                if (ledgers != null)
                                {
                                    databaseModel.ledgers.Remove(ledgers);
                                    databaseModel.SaveChanges();

                                    dbTran.Commit();
                                    bankmessage = "Delete";
                                    return RedirectToAction("Index", "Banking");
                                }
                                dbTran.Rollback();

                            }
                            else
                            {
                                v.Status = false;
                                databaseModel.SaveChanges();

                                var ledgers = databaseModel.ledgers.Where(m => m.PkLedgerId == bankinfo.LedgerID).FirstOrDefault();
                                if (ledgers != null)
                                {
                                    ledgers.Status = false;
                                    databaseModel.SaveChanges();

                                    dbTran.Commit();
                                    bankmessage = "Delete";
                                    return RedirectToAction("Index", "Customer");
                                }
                                dbTran.Rollback();
                            }
                        }

                        bankmessage = "Failed";
                        return RedirectToAction("Index", "Banking");
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        return RedirectToAction("Index", "Invoice", new { message = "Failed" });
                    }
                }
            }
        }
     
        #endregion
     
      

    }
}