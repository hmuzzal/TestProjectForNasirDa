using HotelBooking.App_Start;
using HotelBooking.DataLayer;
using HotelBooking.DataLayer.Models;
using HotelBooking.DataLayer.Models.Accounts;
using HotelBooking.DataLayer.Models.User;
using HotelBooking.DataLayer.ViewModels.User;
using log4net;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace HotelBooking.Controllers
{

    public class UserController : Controller
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(UserController));
        private static string usertypemessage = "";
        private static string usermessage = "";
        #region User
        [SessionTimeout]

        public ActionResult Index(int? id)
        {
            #region Notifications
            if (usermessage == "Insert")
            {
                ViewBag.message = "Success: Data Created Succesfully";
            }
            else if (usermessage == "Update")
            {
                ViewBag.message = "Success: Data Updated Succesfully";
            }
            else if (usermessage == "Delete")
            {

                ViewBag.message = "Success: Data Deleted Succesfully";
            }
            else if (usermessage == "Active")
            {

                ViewBag.message = "Success: Data Activated Succesfully";
            }
            else
            {
                ViewBag.message = usermessage;
            }

            usermessage = "";
            #endregion

            #region All Users
            var users = HotelBookingDBAccess.AllUsers();

            var userListview = new AllUsersViewModel();
            userListview.Users = users;
            #endregion

            #region Create User
            var newentry = new CreateUserViewModel();

            newentry.AllGenders = new List<SelectListItem>()
                {
                    new SelectListItem() { Text="Male", Value="Male",Selected=true},
                    new SelectListItem() { Text="Female", Value="Female"},
                    new SelectListItem() { Text="I'd prefer not to say", Value="I'd prefer not to say"},
                    new SelectListItem() { Text="Non binary", Value="Non binary"},
                };

            var allusertypes = HotelBookingDBAccess.AllUserTypes();
            if (allusertypes != null)
            {
                newentry.AllUserTypes = allusertypes.Select(x => new SelectListItem
                {
                    Value = x.PkUserTypelId.ToString(),
                    Text = x.UserTypeName
                });
            }



            userListview.newentry = newentry;
            #endregion

            #region Update User
            var updateentry = new CreateUserViewModel();

            updateentry.AllGenders = new List<SelectListItem>()
                {
                    new SelectListItem() { Text="Male", Value="Male",Selected=true},
                    new SelectListItem() { Text="Female", Value="Female"},
                    new SelectListItem() { Text="I'd prefer not to say", Value="I'd prefer not to say"},
                    new SelectListItem() { Text="Non binary", Value="Non binary"},
                };

            if (allusertypes != null)
            {
                updateentry.AllUserTypes = allusertypes.Select(x => new SelectListItem
                {
                    Value = x.PkUserTypelId.ToString(),
                    Text = x.UserTypeName
                });
            }


            if (id != 0 && id != null)
            {
                var userinfo = HotelBookingDBAccess.GetUserById((int)id);

                updateentry.PkUserId = userinfo.PkUserId;

                updateentry.FullName = userinfo.FullName;
                updateentry.GenderID = userinfo.Gender;
                updateentry.Email = userinfo.Email;
                updateentry.Mobile = userinfo.Mobile;
                updateentry.UserTypeID = userinfo.UserTypeID;

            }
            userListview.updateentry = updateentry;
            #endregion

            return View(userListview);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(AllUsersViewModel supp, string Create, string Update, HttpPostedFileBase ProfileImage, HttpPostedFileBase ProfileImageUpdate)
        {
            if (!string.IsNullOrEmpty(Create))
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {
                            var bankaccountinfo = databaseModel.userinfo.Where(a => a.Email == supp.newentry.Email).FirstOrDefault();
                            if (bankaccountinfo == null)
                            {

                                var user = new Users();
                                user.FullName = supp.newentry.FullName;
                                user.UserTypeID = supp.newentry.UserTypeID;

                                if (ProfileImage != null && ProfileImage.ContentLength > 0)
                                {

                                    int i = 1;
                                    string location = "/Resources/UserImage/";
                                    bool exists = Directory.Exists(Server.MapPath("~/Resources/UserImage/"));

                                    if (!exists)
                                        Directory.CreateDirectory(Server.MapPath("~/Resources/UserImage/"));


                                    string ext = Path.GetExtension(ProfileImage.FileName);

                                    var replacednam = ReplaceSpeacialCharacters(ProfileImage.FileName);
                                    string DBPath = location + supp.newentry.FullName + "_" + i + ext;
                                    var path = Path.Combine(Server.MapPath("~" + location), user.UserTypeID + "_" + i + ext);
                                    ProfileImage.SaveAs(path);

                                    user.ProfileImage = DBPath;

                                }
                                else
                                {
                                    user.ProfileImage = "None";
                                }

                                user.Gender = supp.newentry.GenderID;
                                user.Mobile = supp.newentry.Mobile;
                                user.Email = supp.newentry.Email;
                                user.Password = Encryptor(supp.newentry.Password);
                                user.Status = true;
                                user.CreatedAt = DateTime.Now;
                                user.UpdatedAt = DateTime.Now;
                                user.CreatedBy = Session["Email"].ToString();

                                user.DeletedBy = "";

                                databaseModel.userinfo.Add(user);
                                databaseModel.SaveChanges();

                                if (user.PkUserId > 0)
                                {

                                    dbTran.Commit();
                                    usermessage = "Insert";
                                    return RedirectToAction("Index");
                                }
                                else
                                {
                                    dbTran.Rollback();
                                    usermessage = "Failed";
                                    return RedirectToAction("Index");
                                }

                            }
                            else
                            {
                                #region All Users
                                var users = HotelBookingDBAccess.AllUsers();

                                supp.Users = users;
                                #endregion



                                var updateentry = new CreateUserViewModel();

                                supp.newentry.AllGenders = new List<SelectListItem>()
                                {
                                    new SelectListItem() { Text="Male", Value="Male",Selected=true},
                                    new SelectListItem() { Text="Female", Value="Female"},
                                    new SelectListItem() { Text="I'd prefer not to say", Value="I'd prefer not to say"},
                                    new SelectListItem() { Text="Non binary", Value="Non binary"},
                                };

                                updateentry.AllGenders = new List<SelectListItem>()
                                {
                                    new SelectListItem() { Text="Male", Value="Male",Selected=true},
                                    new SelectListItem() { Text="Female", Value="Female"},
                                    new SelectListItem() { Text="I'd prefer not to say", Value="I'd prefer not to say"},
                                    new SelectListItem() { Text="Non binary", Value="Non binary"},
                                };
                                var allusertypes = HotelBookingDBAccess.AllUserTypes();
                                if (allusertypes != null)
                                {
                                    supp.newentry.AllUserTypes = allusertypes.Select(x => new SelectListItem
                                    {
                                        Value = x.PkUserTypelId.ToString(),
                                        Text = x.UserTypeName
                                    });

                                    updateentry.AllUserTypes = allusertypes.Select(x => new SelectListItem
                                    {
                                        Value = x.PkUserTypelId.ToString(),
                                        Text = x.UserTypeName
                                    });
                                }



                                supp.updateentry = updateentry;
                                ViewBag.message = "User Already Exists by this Email or UserName, Please try another";
                                return View(supp);
                            }

                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            usermessage = "Failed";
                            return RedirectToAction("Index");
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
                            var bankaccountinfo = HotelBookingDBAccess.GetUserById(supp.updateentry.PkUserId);
                            if (bankaccountinfo != null)
                            {
                                var newsup = databaseModel.userinfo.Where(m => m.PkUserId == supp.updateentry.PkUserId).FirstOrDefault();
                                if (newsup != null)
                                {

                                    newsup.FullName = supp.updateentry.FullName;
                                    newsup.Email = supp.updateentry.Email;
                                    newsup.Mobile = supp.updateentry.Mobile;
                                    if (supp.updateentry.Password != null)
                                        newsup.Password = Encryptor(supp.updateentry.Password);

                                    newsup.UserTypeID = supp.updateentry.UserTypeID;
                                    newsup.UpdatedAt = System.DateTime.Now;
                                    newsup.UpdatedBy = Session["Email"].ToString();
                                    if (ProfileImageUpdate != null && ProfileImageUpdate.ContentLength > 0)
                                    {

                                        int i = 1;
                                        string location = "/Resources/UserImage/";
                                        bool exists = Directory.Exists(Server.MapPath("~/Resources/UserImage/"));

                                        if (!exists)
                                            Directory.CreateDirectory(Server.MapPath("~/Resources/UserImage/"));


                                        string ext = Path.GetExtension(ProfileImageUpdate.FileName);

                                        var replacednam = ReplaceSpeacialCharacters(ProfileImageUpdate.FileName);
                                        string DBPath = location + supp.updateentry.FullName + "_" + i + ext;
                                        var path = Path.Combine(Server.MapPath("~" + location), newsup.UserTypeID + "_" + i + ext);
                                        ProfileImageUpdate.SaveAs(path);

                                        newsup.ProfileImage = DBPath;


                                    }

                                    databaseModel.SaveChanges();


                                    dbTran.Commit();
                                    usermessage = "Update";
                                    return RedirectToAction("Index", new { id = 0 });
                                }
                            }
                            dbTran.Rollback();
                            usermessage = "Failed";
                            return RedirectToAction("Index", new { id = 0 });
                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            usermessage = "Failed";
                            return RedirectToAction("Index", new { id = 0 });
                        }
                    }
                }

            }
            return View(supp);
        }

        public ActionResult OrganizationRegistration()
        {

            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        #region Default Data

                        #region Configuration Information
                        var adminusertype = new UserTypes
                        {
                            UserTypeName = "Super Admin",
                            CreatedAt = System.DateTime.Now,
                            UpdatedAt = System.DateTime.Now,
                            DeletedBy = "",
                            UpdatedBy = "",
                            CreatedBy = "System"

                        };
                        databaseModel.usertypes.Add(adminusertype);
                        databaseModel.SaveChanges();

                        databaseModel.usertypes.Add(new UserTypes
                        {
                            UserTypeName = "Admin",
                            CreatedAt = System.DateTime.Now,
                            UpdatedAt = System.DateTime.Now,
                            DeletedBy = "",
                            UpdatedBy = "",
                            CreatedBy = "System"

                        });
                        databaseModel.SaveChanges();


                        #endregion
                        HomeController home = new HomeController();

                        #region Assets
                        var assetgroup = new AccountGroups
                        {
                            GroupName = "Assets",
                            GroupParent = null,
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "1.0.0.0",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };

                        databaseModel.accountgroups.Add(assetgroup);
                        databaseModel.SaveChanges();

                        var assetgroupfixed = new AccountGroups
                        {
                            GroupName = "Fixed Assets",
                            GroupParent = assetgroup.PkGroupId,
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "1.1.0.0",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(assetgroupfixed);
                        databaseModel.SaveChanges();


                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Office Equipment",
                            GroupParent = assetgroupfixed.PkGroupId,
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "1.1.1.0",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Land & Building",
                            GroupParent = assetgroupfixed.PkGroupId,
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "1.1.2.0",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Furniture & Fixture",
                            GroupParent = assetgroupfixed.PkGroupId,
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "1.1.3.0",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Others Assets",
                            GroupParent = assetgroupfixed.PkGroupId,
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "1.1.4.0",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        var assetgroupcurrent = new AccountGroups
                        {
                            GroupName = "Current Assets",
                            GroupParent = assetgroup.PkGroupId,
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "1.2.0.0",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(assetgroupcurrent);
                        databaseModel.SaveChanges();

                        var assetgroupcashandcashequivalents = new AccountGroups
                        {
                            GroupName = "Cash and Cash Equivalents",
                            GroupParent = assetgroupcurrent.PkGroupId,
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "1.2.1.0",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(assetgroupcashandcashequivalents);
                        databaseModel.SaveChanges();

                        var cashin = new AccountGroups
                        {
                            GroupName = "Cash In Hand",
                            GroupParent = assetgroupcashandcashequivalents.PkGroupId,
                            GroupIdentifier = "1.2.1.1",
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(cashin);
                        databaseModel.SaveChanges();

                        databaseModel.ledgers.Add(new Ledgers
                        {
                            LedgerName = "Cash Account",
                            LedgerParent = cashin.PkGroupId,
                            AccountType = 1,
                            LedgerCode = "B-00001",
                            Nature = "Dr",

                            OpeningBalance = 0,
                            ClosingBalance = 0,
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        var bankaccount = new AccountGroups
                        {
                            GroupName = "Bank Accounts",
                            GroupParent = assetgroupcashandcashequivalents.PkGroupId,
                            GroupIdentifier = "1.2.1.2",
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(bankaccount);
                        databaseModel.SaveChanges();


                        var mobilebanking = new AccountGroups
                        {
                            GroupName = "Credit Cards",
                            GroupParent = assetgroupcashandcashequivalents.PkGroupId,
                            GroupIdentifier = "1.2.1.3",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(mobilebanking);
                        databaseModel.SaveChanges();


                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Mobile Banking",
                            GroupParent = assetgroupcashandcashequivalents.PkGroupId,
                            GroupIdentifier = "1.2.1.4",
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Agent Banking",
                            GroupParent = assetgroupcashandcashequivalents.PkGroupId,
                            GroupIdentifier = "1.2.1.5",
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Loan & Advance",
                            GroupParent = assetgroupcurrent.PkGroupId,
                            GroupIdentifier = "1.2.2.0",
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        var cashsales = new AccountGroups
                        {
                            GroupName = "Accounts Receivable",
                            GroupParent = assetgroupcurrent.PkGroupId,
                            GroupIdentifier = "1.2.3.0",
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(cashsales);
                        databaseModel.SaveChanges();

                        var stock = new AccountGroups
                        {
                            GroupName = "Stock In Hand",
                            GroupParent = assetgroupcurrent.PkGroupId,
                            GroupIdentifier = "1.2.4.0",
                            GroupType = 1,
                            PostedTo = "Balance Sheet",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(stock);
                        databaseModel.SaveChanges();

                        databaseModel.ledgers.Add(new Ledgers
                        {
                            LedgerName = "Stock Account",
                            LedgerParent = stock.PkGroupId,
                            LedgerCode = "Ac-00002",
                            AccountType = 1,
                            Nature = "Dr",

                            OpeningBalance = 0,
                            ClosingBalance = 0,
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        #endregion
                        #region Liabilities
                        var liabilitiesgroup = new AccountGroups
                        {
                            GroupName = "Liability",
                            GroupParent = null,
                            GroupType = 2,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "2.0.0.0",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(liabilitiesgroup);
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Loans Account",
                            GroupParent = liabilitiesgroup.PkGroupId,
                            GroupIdentifier = "2.1.0.0",
                            GroupType = 2,
                            PostedTo = "Balance Sheet",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();
                        var currliabilitiesgroup = new AccountGroups
                        {
                            GroupName = "Current Liabilities",
                            GroupParent = liabilitiesgroup.PkGroupId,
                            GroupIdentifier = "2.2.0.0",
                            GroupType = 2,
                            PostedTo = "Balance Sheet",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(currliabilitiesgroup);
                        databaseModel.SaveChanges();

                        var cashpurchase = new AccountGroups
                        {
                            GroupName = "Accounts Payable",
                            GroupParent = currliabilitiesgroup.PkGroupId,
                            GroupIdentifier = "2.2.1.0",
                            GroupType = 2,
                            PostedTo = "Balance Sheet",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(cashpurchase);
                        databaseModel.SaveChanges();


                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Duties & Taxes",
                            GroupParent = currliabilitiesgroup.PkGroupId,
                            GroupIdentifier = "2.2.2.0",
                            GroupType = 2,
                            PostedTo = "Balance Sheet",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "VAT Current Account",
                            GroupParent = currliabilitiesgroup.PkGroupId,
                            GroupIdentifier = "2.2.3.0",
                            GroupType = 2,
                            PostedTo = "Balance Sheet",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        var profitloss = new AccountGroups
                        {
                            GroupName = "Profit & Loss Account",
                            GroupParent = liabilitiesgroup.PkGroupId,
                            GroupIdentifier = "2.2.0.0",
                            GroupType = 2,
                            PostedTo = "Balance Sheet",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(profitloss);
                        databaseModel.SaveChanges();

                        databaseModel.ledgers.Add(new Ledgers
                        {
                            LedgerName = "Profit & Loss Account",
                            LedgerParent = profitloss.PkGroupId,
                            LedgerCode = "Ac-00013",
                            AccountType = 2,
                            Nature = "Cr",

                            OpeningBalance = 0,
                            ClosingBalance = 0,
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();
                        #endregion

                        #region Income
                        var incomegroup = new AccountGroups
                        {
                            GroupName = "Income",
                            GroupParent = null,
                            GroupType = 3,
                            PostedTo = "Income Statement",
                            GroupIdentifier = "3.0.0.0",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(incomegroup);
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Direct Income",
                            GroupParent = incomegroup.PkGroupId,
                            GroupIdentifier = "3.1.0.0",
                            GroupType = 3,
                            PostedTo = "Income Statement",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Indirect Income",
                            GroupParent = incomegroup.PkGroupId,
                            GroupIdentifier = "3.2.0.0",
                            GroupType = 3,
                            PostedTo = "Income Statement",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();
                        var salesgroup = new AccountGroups
                        {
                            GroupName = "Sales",
                            GroupParent = incomegroup.PkGroupId,
                            GroupIdentifier = "3.3.0.0",
                            GroupType = 3,
                            PostedTo = "Income Statement",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(salesgroup);
                        databaseModel.SaveChanges();

                        databaseModel.ledgers.Add(new Ledgers
                        {
                            LedgerName = "Sales Account",
                            LedgerParent = salesgroup.PkGroupId,
                            LedgerCode = "Ac-00004",
                            AccountType = 3,
                            Nature = "Cr",

                            OpeningBalance = 0,
                            ClosingBalance = 0,
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        var salesreturn = new AccountGroups
                        {
                            GroupName = "Sales Return",
                            GroupParent = incomegroup.PkGroupId,
                            GroupIdentifier = "3.4.0.0",
                            GroupType = 3,
                            PostedTo = "Income Statement",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(salesreturn);
                        databaseModel.SaveChanges();

                        databaseModel.ledgers.Add(new Ledgers
                        {
                            LedgerName = "Sales Return Account",
                            LedgerParent = salesreturn.PkGroupId,
                            LedgerCode = "Ac-00005",
                            AccountType = 3,
                            Nature = "Cr",

                            OpeningBalance = 0,
                            ClosingBalance = 0,
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        #endregion
                        #region Expense
                        var expensegroup = new AccountGroups
                        {
                            GroupName = "Expense",
                            GroupParent = null,
                            GroupType = 4,
                            PostedTo = "All Reports",
                            GroupIdentifier = "4.0.0.0",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(expensegroup);
                        databaseModel.SaveChanges();


                        var directoverhead = new AccountGroups
                        {
                            GroupName = "Direct Overhead",
                            GroupParent = expensegroup.PkGroupId,
                            GroupIdentifier = "4.1.0.0",
                            GroupType = 4,
                            PostedTo = "Goods Sold Statement",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(directoverhead);
                        databaseModel.SaveChanges();

                        var accountspayablegroup = new AccountGroups
                        {
                            GroupName = "Employee Salary",
                            GroupParent = directoverhead.PkGroupId,
                            GroupIdentifier = "4.1.1.0",
                            GroupType = 4,
                            PostedTo = "Goods Sold Statement",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(accountspayablegroup);
                        databaseModel.SaveChanges();

                        var indirectexpensegroup = new AccountGroups
                        {
                            GroupName = "Indirect Expense",
                            GroupParent = expensegroup.PkGroupId,
                            GroupIdentifier = "4.2.0.0",
                            GroupType = 4,
                            PostedTo = "Goods Sold Statement",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(indirectexpensegroup);
                        databaseModel.SaveChanges();


                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Discount",
                            GroupParent = indirectexpensegroup.PkGroupId,
                            GroupIdentifier = "4.2.1.0",
                            GroupType = 4,
                            PostedTo = "Goods Sold Statement",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Financial Expenses",
                            GroupParent = indirectexpensegroup.PkGroupId,
                            GroupIdentifier = "4.2.2.0",
                            GroupType = 4,
                            PostedTo = "Income Statement",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        var administra = new AccountGroups
                        {
                            GroupName = "Administrative Expenses",
                            GroupParent = indirectexpensegroup.PkGroupId,
                            GroupIdentifier = "4.2.3.0",
                            GroupType = 4,
                            PostedTo = "Income Statement",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(administra);
                        databaseModel.SaveChanges();

                        databaseModel.ledgers.Add(new Ledgers
                        {
                            LedgerName = "Director Allowance",
                            LedgerParent = administra.PkGroupId,
                            LedgerCode = "Ac-00012",
                            AccountType = 4,
                            Nature = "Dr",
                            OpeningBalance = 0,
                            ClosingBalance = 0,
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        databaseModel.accountgroups.Add(new AccountGroups
                        {
                            GroupName = "Selling & Marketing Expenses",
                            GroupParent = indirectexpensegroup.PkGroupId,
                            GroupIdentifier = "4.2.4.0",
                            GroupType = 4,
                            PostedTo = "Income Statement",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();


                        var purchaseacc = new AccountGroups
                        {
                            GroupName = "Purchase",
                            GroupParent = expensegroup.PkGroupId,
                            GroupIdentifier = "4.3.0.0",
                            GroupType = 4,
                            PostedTo = "Goods Sold Statement",
                            Nature = "Dr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(purchaseacc);
                        databaseModel.SaveChanges();

                        databaseModel.ledgers.Add(new Ledgers
                        {
                            LedgerName = "Purchase Account",
                            LedgerParent = purchaseacc.PkGroupId,
                            LedgerCode = "Ac-00006",
                            AccountType = 4,
                            Nature = "Dr",

                            OpeningBalance = 0,
                            ClosingBalance = 0,
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();

                        var purchasereturn = new AccountGroups
                        {
                            GroupName = "Purchase Return",
                            GroupParent = expensegroup.PkGroupId,
                            GroupIdentifier = "4.4.0.0",
                            GroupType = 4,
                            PostedTo = "Goods Sold Statement",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(purchasereturn);
                        databaseModel.SaveChanges();

                        databaseModel.ledgers.Add(new Ledgers
                        {
                            LedgerName = "Purchase Return Account",
                            LedgerParent = purchasereturn.PkGroupId,
                            LedgerCode = "Ac-00007",
                            AccountType = 4,
                            Nature = "Dr",
                            OpeningBalance = 0,
                            ClosingBalance = 0,
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();



                        #endregion

                        #region Oweners Equity

                        var equitygroup = new AccountGroups
                        {
                            GroupName = "Equity and Capital",
                            GroupParent = null,
                            GroupType = 5,
                            PostedTo = "Balance Sheet",
                            GroupIdentifier = "5.0.0.0",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(equitygroup);
                        databaseModel.SaveChanges();

                        var capitalaccountgroup = new AccountGroups
                        {
                            GroupName = "Capital and Reserve",
                            GroupParent = equitygroup.PkGroupId,
                            GroupIdentifier = "5.1.0.0",
                            GroupType = 5,
                            PostedTo = "Balance Sheet",
                            Nature = "Cr",
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        };
                        databaseModel.accountgroups.Add(capitalaccountgroup);
                        databaseModel.SaveChanges();


                        databaseModel.ledgers.Add(new Ledgers
                        {
                            LedgerName = "Capital Account",
                            LedgerParent = capitalaccountgroup.PkGroupId,
                            LedgerCode = "Ac-00011",
                            AccountType = 5,
                            Nature = "Cr",
                            OpeningBalance = 0,
                            ClosingBalance = 0,
                            Status = true,
                            CreatedBy = "System",
                            CreatedAt = System.DateTime.Now.AddHours(11),
                            UpdatedAt = System.DateTime.Now.AddHours(11),
                            DeletedBy = "",
                            UpdatedBy = "",
                        });
                        databaseModel.SaveChanges();
                        #endregion

                        #endregion


                        #region Organization
                        Organizations org = new Organizations();
                        org.OrganisationName = "Taibah";

                        org.OrganizationLogo = "/Resources/Organization/Organization.jpg";

                        org.RegistrationDate = DateTime.Now;
                        org.OrganizationType = "Organization";
                        org.Phone = "+96555349455 - 98984100";
                        org.Mobile = "+96555349455 - 98984100";
                        org.Email = "resv@taibaah.com";
                        org.Address = "Pakistan";
                        org.Currency = "Rupee";
                        org.CurrencySymbol = "Rupee";
                        org.CreatedAt = System.DateTime.Now;
                        org.UpdatedAt = System.DateTime.Now;
                        org.CreatedBy = "System";
                        org.UpdatedBy = "";
                        org.DeletedBy = "";
                        databaseModel.organizationinfo.Add(org);
                        databaseModel.SaveChanges();


                        #endregion
                        var bankaccountinfo = databaseModel.userinfo.Where(a => a.FullName == "Taibah").FirstOrDefault();
                        if (bankaccountinfo == null)
                        {

                            var user = new Users();
                            user.FullName = "Taibah";
                            user.Mobile = "+96555349455 - 98984100";
                            user.Password = Encryptor("11Csesrant2019");
                            user.Email = "resv@taibaah.com";
                            user.UserTypeID = adminusertype.PkUserTypelId;
                            user.UserTokenConfirmation = "";
                            user.ProfileImage = "/Resources/UserImage/UserImage.jpg";
                            user.Gender = "Male";
                            user.CreatedAt = DateTime.Now;
                            user.UpdatedAt = DateTime.Now;
                            user.CreatedBy = "System";
                            user.UpdatedBy = "";
                            user.DeletedBy = "";

                            databaseModel.userinfo.Add(user);
                            databaseModel.SaveChanges();

                            if (user.PkUserId > 0)
                            {
                                dbTran.Commit();
                                Session["Email"] = "resv@taibaah.com";
                                Session["OrganizationLogo"] = org.OrganizationLogo;
                                Session["OrganizationName"] = org.OrganisationName;
                                Session["OrganizationDate"] = org.RegistrationDate;
                                Session["UserImage"] = user.ProfileImage;
                                Session["UserName"] = user.FullName;
                                Session["Role"] = user.usertype.UserTypeName;

                                return RedirectToAction("Login", new { message = "" });


                            }
                        }

                        dbTran.Rollback();
                        //return RedirectToAction("Index", "User");
                    }
                    catch (Exception ex)
                    {
                        dbTran.Rollback();

                        //return RedirectToAction("Index", "User");
                    }
                }
            }


            return RedirectToAction("Login", new { message = "" });
        }

        public ActionResult EmergencyContact()
        {
            return View();
        }
        public ActionResult Login(string message)
        {
            ViewBag.message = message;

            DataLayer.ViewModels.Login.LoginView login = new DataLayer.ViewModels.Login.LoginView();
            login.Email = "resv@taibaah.com";
            login.Password = "11Csesrant2019";

            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {

                if (ModelState.IsValid)
                {
                    var organizationinformation = HotelBookingDBAccess.GetOrganizatonsInformationById();
                    string decrypted = "";
                    string newencrypted = "";

                    var user = databaseModel.userinfo.Include("usertype").Where(a => a.Email == login.Email).FirstOrDefault();
                    if (user == null)
                    {
                        //ModelState.AddModelError("Email", "User name not found!!");
                        ViewBag.message = "You are not registered.";

                        return View();
                    }
                    //var pass = Cryptography.Hash(login.Password);
                    //var pass = Decrypt(login.Password);
                    var pass = Encryptor(login.Password);
                    if (user.Password != pass)
                    {
                        //ModelState.AddModelError("Password", "User name and password not matched!!!");
                        ViewBag.message = "Sorry, Please Contact with the Administrator. ";
                        ViewBag.LoginText = string.Empty;
                        //InvalidLoginAttemps(login.Email);
                        return View();
                    }

                    int timeout = login.RememberMe ? 600 : 60; // 525600 min = 1 year
                    var ticket = new FormsAuthenticationTicket(login.Email, login.RememberMe, timeout);
                    string encrypted = FormsAuthentication.Encrypt(ticket);
                    var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encrypted)
                    {
                        Expires = DateTime.Now.AddMinutes(timeout),
                        HttpOnly = true
                    };
                    //Session.Timeout = 60;
                    Response.Cookies.Add(cookie);

                    ViewBag.LoginText = string.Empty;

                    Session["UserID"] = user.PkUserId;
                    Session["Email"] = login.Email;
                    Session["OrganizationLogo"] = organizationinformation.OrganizationLogo;
                    Session["OrganizationName"] = organizationinformation.OrganisationName;
                    Session["OrganizationDate"] = organizationinformation.CreatedAt;

                    Session["UserImage"] = user.ProfileImage;
                    Session["UserName"] = user.FullName;


                    Session["Role"] = user.usertype.UserTypeName;
                    Session.Timeout = 60;

                    LoginHistory loginhis = new LoginHistory
                    {
                        UserID = user.PkUserId,
                        Email = user.Email,
                        AccessTime = DateTime.Now.AddHours(+16),
                        CLientIPAddress = HttpContext.Request.UserHostAddress,
                        Browser = HttpContext.Request.Browser.Browser,
                        OS = HttpContext.Request.UserAgent,
                        AccessType = "Login"
                    };

                    HotelBookingDBAccess.AddUserLoginHistory(loginhis);

                    return RedirectToAction("Index", "Home");


                }
                else
                {
                    ViewBag.message = "Please, Provide Correct Email and Password.";
                    return View(login);
                }

            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(DataLayer.ViewModels.Login.LoginView login)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {

                if (ModelState.IsValid)
                {
                    var organizationinformation = HotelBookingDBAccess.GetOrganizatonsInformationById();
                    string decrypted = "";
                    string newencrypted = "";

                    var user = databaseModel.userinfo.Include("usertype").Where(a => a.Email == login.Email).FirstOrDefault();
                    if (user == null)
                    {
                        //ModelState.AddModelError("Email", "User name not found!!");
                        ViewBag.message = "You are not registered.";

                        return View();
                    }
                    //var pass = Cryptography.Hash(login.Password);
                    //var pass = Decrypt(login.Password);
                    var pass = Encryptor(login.Password);
                    if (user.Password != pass)
                    {
                        //ModelState.AddModelError("Password", "User name and password not matched!!!");
                        ViewBag.message = "Sorry, Please Contact with the Administrator. ";
                        ViewBag.LoginText = string.Empty;
                        //InvalidLoginAttemps(login.Email);
                        return View();
                    }

                    int timeout = login.RememberMe ? 600 : 60; // 525600 min = 1 year
                    var ticket = new FormsAuthenticationTicket(login.Email, login.RememberMe, timeout);
                    string encrypted = FormsAuthentication.Encrypt(ticket);
                    var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encrypted)
                    {
                        Expires = DateTime.Now.AddMinutes(timeout),
                        HttpOnly = true
                    };
                    //Session.Timeout = 60;
                    Response.Cookies.Add(cookie);

                    ViewBag.LoginText = string.Empty;

                    Session["UserID"] = user.PkUserId;
                    Session["Email"] = login.Email;
                    Session["OrganizationLogo"] = organizationinformation.OrganizationLogo;
                    Session["OrganizationName"] = organizationinformation.OrganisationName;
                    Session["OrganizationDate"] = organizationinformation.CreatedAt;

                    Session["UserImage"] = user.ProfileImage;
                    Session["UserName"] = user.FullName;


                    Session["Role"] = user.usertype.UserTypeName;
                    Session.Timeout = 60;

                    LoginHistory loginhis = new LoginHistory
                    {
                        UserID = user.PkUserId,
                        Email = user.Email,
                        AccessTime = DateTime.Now.AddHours(+16),
                        CLientIPAddress = HttpContext.Request.UserHostAddress,
                        Browser = HttpContext.Request.Browser.Browser,
                        OS = HttpContext.Request.UserAgent,
                        AccessType = "Login"
                    };

                    HotelBookingDBAccess.AddUserLoginHistory(loginhis);

                    return RedirectToAction("Index", "Home");


                }
                else
                {
                    ViewBag.message = "Please, Provide Correct Email and Password.";
                    return View(login);
                }

            }
        }
        [SessionTimeout]
        public ActionResult Logout()
        {



            //Removing ASP.NET_SessionId Cookie
            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Value = string.Empty;
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-10);
            }

            if (Request.Cookies["AuthenticationToken"] != null)
            {
                Response.Cookies["AuthenticationToken"].Value = string.Empty;
                Response.Cookies["AuthenticationToken"].Expires = DateTime.Now.AddMonths(-10);
            }

            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var userinfo = databaseModel.userinfo.Where(a => a.Email == Session["Email"].ToString()).FirstOrDefault();
                    LoginHistory loginhis = new LoginHistory();
                    loginhis.UserID = userinfo.PkUserId;
                    loginhis.Email = Session["Email"].ToString();
                    loginhis.AccessTime = DateTime.Now.AddHours(+16);
                    loginhis.CLientIPAddress = HttpContext.Request.UserHostAddress;
                    loginhis.Browser = HttpContext.Request.Browser.Browser;
                    loginhis.OS = HttpContext.Request.UserAgent;
                    loginhis.AccessType = "LogOut";
                    databaseModel.loginhistory.Add(loginhis);
                    databaseModel.SaveChanges();

                }
                FormsAuthentication.SignOut();

                Session.Abandon();
                Session.Clear();
                Session.Remove("Email");
                Session.RemoveAll();
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                ViewBag.message = "Log Out Failed, Please try Again.";
            }


            return RedirectToAction("Login", "User");
        }


        [SessionTimeout]
        public string GenerateAlphaNumericPwd()
        {
            string numbers = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz!@#$%^&*()-=";
            Random objrandom = new Random();
            string passwordString = "";
            string strrandom = string.Empty;
            for (int i = 0; i < 8; i++)
            {
                int temp = objrandom.Next(0, numbers.Length);
                passwordString = numbers.ToCharArray()[temp].ToString();
                strrandom += passwordString;
            }
            return strrandom;
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

        [SessionTimeout]

        public ActionResult DeleteUser(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var userinfo = HotelBookingDBAccess.GetUserById(id);
                        if (userinfo.Status == true)
                        {
                            var v = databaseModel.userinfo.Where(m => m.PkUserId == id).FirstOrDefault();
                            if (v != null)
                            {
                                databaseModel.userinfo.Remove(v);
                                databaseModel.SaveChanges();

                                dbTran.Commit();
                                usermessage = "Delete";
                                return RedirectToAction("Index", "User");
                            }
                            dbTran.Rollback();
                        }

                        usermessage = "Failed";
                        return RedirectToAction("Index", "User");
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        usermessage = "Failed";
                        return RedirectToAction("Index", "User");
                    }
                }
            }
        }
        [SessionTimeout]
        public ActionResult MyProfile(string message = "")
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {

                var profile = new UserProfileView();
                var email = Session["Email"].ToString();

                var userinfode = databaseModel.userinfo.Include("usertype").Where(a => a.Email == email).FirstOrDefault();

                //userinfode.Password = Decryptor(userinfode.Password);
                profile.userinformations = userinfode;

                ViewBag.message = message == "Insert"
                    ? "Success: Data Created Succesfully"
                    : message == "Update"
                        ? "Success: Data Updated Succesfully"
                        : message == "Delete" ? "Success: Data Deleted Succesfully" : message;

                return View(profile);
            }
        }
        [SessionTimeout]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult MyProfile(UserProfileView viewmodel, HttpPostedFileBase AttachedDocuments)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                var userInput = viewmodel.userinformations;
                var email = Session["Email"].ToString();
                var userDetails = databaseModel.userinfo.Where(a => a.Email == email).FirstOrDefault();

                userDetails.FullName = userInput.FullName;
                userDetails.Email = userInput.Email;
                userDetails.Mobile = userInput.Mobile;
                if (userInput.Password != null && userInput.Password != "" && Decryptor(userInput.Password) != Decryptor(userDetails.Password))
                    userDetails.Password = Encryptor(userInput.Password);

                userDetails.UpdatedAt = DateTime.Now;
                userDetails.UpdatedBy = Session["Email"].ToString();


                if (AttachedDocuments != null && AttachedDocuments.ContentLength > 0)
                {
                    string location = "/Resources/UserImage/";
                    bool exists = Directory.Exists(Server.MapPath("~/Resources/UserImage/"));

                    if (!exists)
                        Directory.CreateDirectory(Server.MapPath("~/Resources/UserImage/"));


                    string ext = Path.GetExtension(AttachedDocuments.FileName);

                    var replacednam = ReplaceSpeacialCharacters(AttachedDocuments.FileName);
                    string DBPath = location + userDetails.PkUserId + "_" + ext;
                    var path = Path.Combine(Server.MapPath("~" + location), userDetails.PkUserId + "_" + ext);
                    AttachedDocuments.SaveAs(path);
                    userDetails.ProfileImage = DBPath;
                }

                databaseModel.SaveChanges();

                Session["UserID"] = userDetails.PkUserId;
                Session["Email"] = userDetails.Email;

                Session["UserImage"] = userDetails.ProfileImage;
                Session["UserName"] = userDetails.FullName;


                ViewBag.success = "User Details Updated Successfully";
                return RedirectToAction("MyProfile", new { message = "Update" });
            }
        }

        public ActionResult LoginHistroy()
        {
            //var loginhistoryActivity = HotelBookingDBAccess.GetallLoginHistoryActivityHistory()
            return Session["Email"] != null ? View() : (ActionResult)RedirectToAction("Login", "User");
        }
        [SessionTimeout]

        public ActionResult ActivityLogs()
        {
            return Session["Email"] != null ? View() : (ActionResult)RedirectToAction("Login", "User");
        }

        private string Encryptor(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        private string Decryptor(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }

        static byte[] Encrypt(string plainText, byte[] Key, byte[] IV)
        {
            byte[] encrypted;
            // Create a new AesManaged.    
            using (AesManaged aes = new AesManaged())
            {
                // Create encryptor    
                ICryptoTransform encryptor = aes.CreateEncryptor(Key, IV);
                // Create MemoryStream    
                using (MemoryStream ms = new MemoryStream())
                {
                    // Create crypto stream using the CryptoStream class. This class is the key to encryption    
                    // and encrypts and decrypts data from any given stream. In this case, we will pass a memory stream    
                    // to encrypt    
                    using (CryptoStream cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
                    {
                        // Create StreamWriter and write data to a stream    
                        using (StreamWriter sw = new StreamWriter(cs))
                            sw.Write(plainText);
                        encrypted = ms.ToArray();
                    }
                }
            }
            // Return encrypted data    
            return encrypted;
        }
        static string Decrypt(byte[] cipherText, byte[] Key, byte[] IV)
        {
            string plaintext = null;
            // Create AesManaged    
            using (AesManaged aes = new AesManaged())
            {
                // Create a decryptor    
                ICryptoTransform decryptor = aes.CreateDecryptor(Key, IV);
                // Create the streams used for decryption.    
                using (MemoryStream ms = new MemoryStream(cipherText))
                {
                    // Create crypto stream    
                    using (CryptoStream cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                    {
                        // Read crypto stream    
                        using (StreamReader reader = new StreamReader(cs))
                            plaintext = reader.ReadToEnd();
                    }
                }
            }
            return plaintext;
        }
        #endregion

        #region UserRole
        [SessionTimeout]

        public ActionResult AllUserType(int? id, string message = null)
        {
            var allusertypes = HotelBookingDBAccess.AllUserTypes();

            UserTypes newentry = new UserTypes();

            if (id != 0 && id != null)
            {
                var usertypeinfo = allusertypes.Where(a => a.PkUserTypelId == id).SingleOrDefault();
                newentry.UserTypeName = usertypeinfo.UserTypeName;
                newentry.PkUserTypelId = usertypeinfo.PkUserTypelId;
            }

            var viewmodel = new UserTypesViewModel
            {
                allusertypes = allusertypes,
                updateusertype = newentry
            };
            if (message != null)
                usertypemessage = message;

            if (usertypemessage == "Insert")
            {
                ViewBag.message = "Success: Data Created Succesfully";
            }
            else if (usertypemessage == "Update")
            {

                ViewBag.message = "Success: Data Updated Succesfully";
            }
            else if (usertypemessage == "Delete")
            {
                ViewBag.message = "Success: Data Deleted Succesfully";
            }
            else
            {
                ViewBag.message = usermessage;
            }
            usertypemessage = "";
            return View(viewmodel);
        }

        [SessionTimeout]
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult AllUserType(UserTypesViewModel viewmodel, string Create, string Update)
        {
            var allusertypes = HotelBookingDBAccess.AllUserTypes();
            viewmodel.allusertypes = allusertypes;

            if (!string.IsNullOrEmpty(Create))
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {
                            var classexistincy = HotelBookingDBAccess.IsUserTypesExist(viewmodel.addusertype.UserTypeName);

                            if (classexistincy != null)
                            {
                                ViewBag.message = "Error: User Type already exist";
                                return View(viewmodel);
                            }

                            var classes = new UserTypes
                            {
                                UserTypeName = viewmodel.addusertype.UserTypeName,
                                DeletedBy = "",
                                CreatedAt = DateTime.Now.AddHours(16),
                                UpdatedAt = DateTime.Now.AddHours(16),
                                CreatedBy = Session["Email"].ToString(),
                                UpdatedBy = Session["Email"].ToString()
                            };
                            databaseModel.usertypes.Add(classes);
                            databaseModel.SaveChanges();

                            dbTran.Commit();
                            usertypemessage = "Insert";
                            return RedirectToAction("AllUserType");

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
            else if (!string.IsNullOrEmpty(Update))
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                    {
                        try
                        {
                            var classexistincy = HotelBookingDBAccess.GetUserTypeById(viewmodel.updateusertype.PkUserTypelId);
                            var v = databaseModel.usertypes.Where(m => m.PkUserTypelId == viewmodel.updateusertype.PkUserTypelId).FirstOrDefault();
                            if (v != null)
                            {
                                v.UserTypeName = viewmodel.updateusertype.UserTypeName;
                                v.UpdatedAt = DateTime.Now;
                                v.UpdatedBy = Session["Email"].ToString();
                                databaseModel.SaveChanges();
                                dbTran.Commit();
                                usertypemessage = "Update";
                                return RedirectToAction("AllUserType", new { id = 0 });
                            }
                            dbTran.Rollback();
                            usertypemessage = "Failed";


                        }
                        catch (Exception ex)
                        {
                            Log.Fatal("log4net Fatal Level", ex);
                            dbTran.Rollback();
                            usertypemessage = "Failed";
                            return RedirectToAction("AllUserType");
                        }
                    }

                }
            }

            return View(viewmodel);
        }

        [SessionTimeout]

        public ActionResult DeleteUserType(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var usertype = HotelBookingDBAccess.GetUserTypeById(id);

                        if (usertype != null)
                        {
                            var v = databaseModel.usertypes.Where(m => m.PkUserTypelId == id).FirstOrDefault();
                            if (v != null)
                            {
                                v.DeletedBy = Session["Email"].ToString();
                                databaseModel.SaveChanges();
                                dbTran.Commit();
                                usertypemessage = "Deleted";
                                return RedirectToAction("AllUserType");
                            }

                        }
                        usertypemessage = "Failed";
                        dbTran.Rollback();
                        return RedirectToAction("AllUserType");
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        usertypemessage = "Failed";
                        dbTran.Rollback();
                        return RedirectToAction("AllUserType");
                    }
                }
            }
        }
        #endregion
        [SessionTimeout]

        public ActionResult InactiveUsers()
        {
            #region All Users
            var users = HotelBookingDBAccess.AllInActivesUsers();

            var userListview = new AllUsersViewModel();
            userListview.Users = users;
            #endregion
            return View(userListview);
        }

        [SessionTimeout]

        public ActionResult ActiveUser(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var userinfo = HotelBookingDBAccess.GetUserById(id);
                        if (userinfo.DeletedBy != "")
                        {
                            var v = databaseModel.userinfo.Where(m => m.PkUserId == id).FirstOrDefault();
                            if (v != null)
                            {
                                v.DeletedBy = "";
                                databaseModel.SaveChanges();
                                dbTran.Commit();

                                dbTran.Commit();
                                usermessage = "Active";
                                return RedirectToAction("Index", "User");

                            }
                            dbTran.Rollback();
                        }

                        usermessage = "Failed";
                        return RedirectToAction("Index", "User");
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        usermessage = "Failed";
                        return RedirectToAction("Index", "User");
                    }
                }
            }
        }

        [SessionTimeout]

        public ActionResult InActiveAllUserType()
        {
            var allusertypes = HotelBookingDBAccess.InActiveAllUserTypes();

            UserTypes newentry = new UserTypes();

            var viewmodel = new UserTypesViewModel
            {
                allusertypes = allusertypes,
                updateusertype = newentry
            };


            return View(viewmodel);
        }

        [SessionTimeout]

        public ActionResult ActiveUserType(int id)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var usertype = HotelBookingDBAccess.GetUserTypeById(id);

                        if (usertype != null)
                        {
                            var v = databaseModel.usertypes.Where(m => m.PkUserTypelId == id).FirstOrDefault();
                            if (v != null)
                            {
                                v.DeletedBy = "";
                                databaseModel.SaveChanges();
                                dbTran.Commit();
                                usertypemessage = "Active";
                                return RedirectToAction("AllUserType");
                            }

                        }
                        usertypemessage = "Failed";
                        dbTran.Rollback();
                        return RedirectToAction("AllUserType");
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        usertypemessage = "Failed";
                        dbTran.Rollback();
                        return RedirectToAction("AllUserType");
                    }
                }
            }
        }



    }
}