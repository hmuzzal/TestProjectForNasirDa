using log4net;
using HotelBooking.App_Start;
using HotelBooking.DataLayer;
using HotelBooking.DataLayer.Models.Accounts;

using System;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using HotelBooking.DataLayer.ViewModels.Item;


namespace HotelBooking.Controllers
{
    [SessionTimeout]
    public class ConfigurationController : Controller
    {
        private static string CurrencyCreatemessage = "";
        private static readonly ILog Log = LogManager.GetLogger(typeof(ConfigurationController));
        // GET: Configuration
        
        public ActionResult Index()
        {
            return View();
        }
      
        #region Items

        
        public ActionResult AllItems(int? id)
        {
            if (CurrencyCreatemessage == "Insert")
            {
                ViewBag.message = "Success: Data Created Succesfully";
            }
            else if (CurrencyCreatemessage == "Update")
            {

                ViewBag.message = "Success: Data Updated Succesfully";
            }
            else if (CurrencyCreatemessage == "Delete")
            {

                ViewBag.message = "Success: Data Deleted Succesfully";
            }
            else
            {
                ViewBag.message = CurrencyCreatemessage;
            }
            CurrencyCreatemessage = "";

            ItemViewModel currency = new ItemViewModel();

            var allcurrency = HotelBookingDBAccess.GetallActiveCurrency();
            allcurrency = allcurrency.OrderBy(a => a.ProfileName).ToList();
            currency.allcurrencies = allcurrency;

            CreateItemViewModel newentry = new CreateItemViewModel();
            CreateItemViewModel updatecurrency = new CreateItemViewModel();

            
            currency.createitem = newentry;

            if (id != 0 && id != null)
            {
                
                var currencyinfo = allcurrency.Where(a => a.PkItemId == id).SingleOrDefault();

                updatecurrency.PkItemId = currencyinfo.PkItemId;
                updatecurrency.ProfileName = currencyinfo.ProfileName;
                updatecurrency.ProfileCode = currencyinfo.ProfileCode;
                updatecurrency.BuyingPrice = currencyinfo.BuyingPrice;
                updatecurrency.SellingPrice = currencyinfo.SellingPrice;
                updatecurrency.ProfileNo = currencyinfo.ProfileNo;
                updatecurrency.ProfileWeight = currencyinfo.ProfileWeight;
                
                
            }
            currency.updateitem = updatecurrency;
            return View(currency);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        
        public ActionResult AllItems(ItemViewModel currency, string Search, string Create, string Update)
        {
            var allcurrency = HotelBookingDBAccess.GetallActiveCurrency();

            currency.allcurrencies = allcurrency;

            if (!string.IsNullOrEmpty(Create))
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {
                            
                            var classexistincy = databaseModel.items.Where(a=>a.ProfileName==currency.createitem.ProfileName).FirstOrDefault();

                            if (classexistincy != null)
                            {
                                ViewBag.message = "Error: Item already exist";
                                return View(currency);
                            }

                            Profiles classes = new Profiles();
                            classes.ProfileName = currency.createitem.ProfileName;
                            classes.ProfileCode = currency.createitem.ProfileCode;
                            classes.BuyingPrice = currency.createitem.BuyingPrice;
                            classes.SellingPrice = currency.createitem.SellingPrice;
                            classes.ProfileNo = currency.createitem.ProfileNo;
                            classes.ProfileWeight = currency.createitem.ProfileWeight;
                            
                            classes.Status = true;
                            classes.CreatedAt = DateTime.Now.AddHours(16);
                            classes.UpdatedAt = DateTime.Now.AddHours(16);
                            classes.CreatedBy = Session["Email"].ToString();
                            classes.UpdatedBy = Session["Email"].ToString();
                            databaseModel.items.Add(classes);
                            databaseModel.SaveChanges();

                            if (classes.PkItemId != 0)
                            {
                                dbTran.Commit();
                                CurrencyCreatemessage = "Insert";
                                return RedirectToAction("AllItems");
                            }
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();

                            CurrencyCreatemessage = "Failed";
                            return RedirectToAction("AllItems");
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
                            var classexistincy = HotelBookingDBAccess.GetCurrencyInformationById(currency.updateitem.PkItemId);

                            if (classexistincy != null)
                            {
                                var v = databaseModel.items.Where(m => m.PkItemId == currency.updateitem.PkItemId).FirstOrDefault();
                                if (v != null)
                                {
                                    v.ProfileName = currency.updateitem.ProfileName;
                                    v.BuyingPrice = currency.updateitem.BuyingPrice;
                                    v.ProfileCode = currency.updateitem.ProfileCode;
                                    v.SellingPrice = currency.updateitem.SellingPrice;
                                    v.ProfileNo = currency.updateitem.ProfileNo;
                                    v.ProfileWeight = currency.updateitem.ProfileWeight;
                                    v.UpdatedAt = DateTime.Now;
                                    v.UpdatedBy = Session["Email"].ToString();
                                    databaseModel.SaveChanges();

                                    

                                    dbTran.Commit();
                                    CurrencyCreatemessage = "Update";
                                    return RedirectToAction("AllItems", new { id = 0 });
                                }

                            }
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            CurrencyCreatemessage = "Failed";
                            return RedirectToAction("AllItems", new { id = 0 });
                        }
                    }
                }


            }

            return View(currency);
        }

        
        public ActionResult DeleteItems(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var country = HotelBookingDBAccess.GetCurrencyInformationById(id);

                        if (country.Status == true)
                        {
                            var v = databaseModel.items.Where(a => a.PkItemId == id).FirstOrDefault();
                            if (v != null)
                            {
                                v.Status = false;
                                v.DeletedBy = Session["Email"].ToString();
                                databaseModel.SaveChanges();
                                dbTran.Commit();
                                CurrencyCreatemessage = "Delete";
                                return RedirectToAction("AllItems");
                            }
                        }

                        CurrencyCreatemessage = "Item Not Found";
                        return RedirectToAction("AllItems");
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        CurrencyCreatemessage = "Failed";
                        return RedirectToAction("AllItems", new { message = "Failed" });
                    }
                }
            }
        }

        #endregion

   
    }
}