using HotelBooking.DataLayer.Models;
using HotelBooking.DataLayer.Models.Accounts;
using HotelBooking.DataLayer.Models.Banking;
using HotelBooking.DataLayer.Models.Customers;
using HotelBooking.DataLayer.Models.Hotel;
using HotelBooking.DataLayer.Models.Invoice;
using HotelBooking.DataLayer.Models.Payment;
using HotelBooking.DataLayer.Models.User;
using log4net;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;

namespace HotelBooking.DataLayer
{
    public class HotelBookingDBAccess
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(HotelBookingDBAccess));

        //-----------DATABASE--------------
        #region

        /// <summary>
        /// Check Database Connection
        /// </summary>
        /// <returns></returns>
        public static bool CheckDatabaseConnection(int currencyid)
        {
            try
            {
                using (HotelBookingContexts context = new HotelBookingContexts())
                {
                    if (context.Database.Exists())
                    {
                        context.Database.Connection.Open();
                        if (context.Database.Connection.State == ConnectionState.Open)
                        {
                            context.Database.Connection.Close();
                            return true;
                        }
                        else return false;
                    }
                    else return false;
                }
            }
            catch (SqlException ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "CheckDatabaseConnection");
                return false;
            }
        }
        #endregion

        //-------------------- Banks -------------------------------------
        #region Banks

        public static string GetLastBankNumber()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.OrderByDescending(a => a.AccountCode).Take(1).SingleOrDefault();
                    return v.AccountCode;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetLastVendorNumber");
                return null;
            }

        }

        public static bool AddBanksBulk(List<BankAccounts> newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.bankaccount.AddRange(newentry);
                    databaseModel.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddBanksBulk");
                return false;
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        /// 

        public static List<BankAccounts> GetallBanks()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.Include("ledger").ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallBanks");
                return null;
            }

        }
        public static List<BankAccounts> GetallActiveBanks()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.Include("ledger").Where(a => a.DeletedBy == "").ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallBanks");
                return null;
            }

        }
        public static List<BankAccounts> GetallInactiveBanks()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.Include("ledger").Where(a => a.DeletedBy != "").ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallBanks");
                return null;
            }

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SalepointName"></param>
        /// <returns></returns>

        public static BankAccounts IsBanksExist(string classname, string accountnumber)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.Where(a => a.Bankname == classname && a.AccountNumber == accountnumber).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsBanksExist");
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="newentry"></param>
        /// <returns></returns>
        public static bool AddBanks(BankAccounts newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.bankaccount.Add(newentry);
                    databaseModel.SaveChanges();


                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddBanks");
                return false;
            }
        }

        public static int AddBanksBulk(BankAccounts newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.bankaccount.Add(newentry);
                    databaseModel.SaveChanges();
                    return newentry.PkBankAccountId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddBanksBulk");
                return 0;
            }
        }

        /// <summary>
        /// CHECK Area already exists or not
        /// </summary>
        /// <param name="areaname"></param>
        /// <returns></returns>
        public static BankAccounts GetBanksInformationById(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.Include("ledger").Where(a => a.PkBankAccountId == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetBanksInformationById");
                return null;
            }
        }
        public static BankAccounts GetBanksInformationByLedgerId(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.Include("ledger").Where(a => a.LedgerID == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "DocumentCleaningERPDBAccess", "GetBanksInformationById");
                return null;
            }
        }

        public static bool UpdateBanks(BankAccounts classs)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.Where(m => m.PkBankAccountId == classs.PkBankAccountId).FirstOrDefault();
                    if (v != null)
                    {
                        v.BankAccountName = classs.BankAccountName;
                        v.AccountType = classs.AccountType;
                        v.AccountCode = classs.AccountCode;
                        v.AccountNumber = classs.AccountNumber;
                        v.Bankname = classs.Bankname;
                        v.Description = classs.Description;
                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = classs.UpdatedBy;
                        databaseModel.SaveChanges();


                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateBanks");
                return false;
            }
        }
        public static bool DeleteBanks(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.Where(a => a.PkBankAccountId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.DeletedBy = username;
                        databaseModel.SaveChanges();
                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteBanks");
                return false;
            }
        }
        public static bool DeleteBanksActive(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.bankaccount.Where(a => a.PkBankAccountId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = username;
                        v.DeletedBy = "";
                        databaseModel.SaveChanges();


                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteBanksActive");
                return false;
            }
        }
        #endregion

        //-------------------- Log Report -------------------------------------

        #region
        public static void AddLogReport(string log, string ControllerName, string MethodName)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    LogReport report = new LogReport();
                    report.Log = log;
                    report.Date = DateTime.Now.AddHours(+16);
                    report.ControllerName = ControllerName;
                    report.MethodName = MethodName;
                    databaseModel.logreports.Add(report);
                    databaseModel.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "Allusers");
            }
        }

        #endregion

        //-------------------- Login History -------------------------------------
        #region
        public static List<LoginHistory> AllLoginHistory()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.loginhistory.Include("user").ToList();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AllLoginHistory");
                return null;
            }
        }

        public static List<AuditTB> AllActivityHistory()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.audittbs.ToList();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AllLoginHistory");
                return null;
            }
        }

        public static LoginHistory GetUserLoginHistoryById(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.loginhistory.Where(a => a.UserID == id).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetUserLoginHistoryById");
                return null;
            }
        }

        public static int AddUserLoginHistory(LoginHistory users)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.loginhistory.Add(users);
                    databaseModel.SaveChanges();
                    return users.PkLoginId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddUserLoginHistory");
                return 0;
            }
        }

        public static bool DeleteUserLoginHistory()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {


                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteUserLoginHistory");
                return false;
            }
        }

        public static void DeleteAllAccessHistory(string username, string ip)
        {
            try
            {
                using (HotelBookingContexts context = new HotelBookingContexts())
                {
                    var all = context.loginhistory.ToList();
                    context.loginhistory.RemoveRange(all);
                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteAllAccessHistory");
            }
        }

        public static bool GetAccessByIdDelete(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.loginhistory.Where(a => a.PkLoginId == id).FirstOrDefault();
                    return v != null;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "AHotelBookingDBAccess", "GetAccessByIdDelete");
                return false;
            }
        }
        public static bool DeleteAccessHistory(int id, string username, string ip)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.loginhistory.Where(a => a.PkLoginId == id).FirstOrDefault();
                    if (v != null)
                    {
                        databaseModel.loginhistory.Remove(v);

                        databaseModel.SaveChanges();
                        //AddDeletionLogReport("Access History Deleted : " + v.PkLogId + v.UserID + v.AccessTime + v.OS, v.Email, ip);
                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteAccessHistory");
                return false;
            }
        }
        #endregion


        //-------------------- Users -------------------------------------
        #region
        public static Users UserDetailsByToken(string token)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Where(a => a.UserTokenConfirmation == token).FirstOrDefault();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                return null;
            }
        }
        public static bool UpdateUserAftertokenConfirmation(int userid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Where(m => m.PkUserId == userid).FirstOrDefault();
                    if (v != null)
                    {

                        v.UserTokenConfirmation = "";
                        databaseModel.SaveChanges();
                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                return false;
            }
        }

        public static List<Users> AllUsers()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Include("usertype").Where(a => a.Status == true).ToList();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "Allusers");
                return null;
            }
        }

        public static List<Users> AllInActivesUsers()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Include("usertype").Where(a => a.DeletedBy != "").ToList();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "Allusers");
                return null;
            }
        }
        public static List<Users> AllUsersExceptAdmin()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Include("usertype").Where(a => a.usertype.UserTypeName != "Admin").ToList();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "Allusers");
                return null;
            }
        }

        public static Users GetUserById(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Include("usertype").Where(a => a.PkUserId == id).FirstOrDefault();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "AHotelBookingDBAccess", "GetUserById");
                return null;
            }
        }

        public static List<Users> GetUsersByUserTypeID(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Where(a => a.UserTypeID == id).ToList();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "AHotelBookingDBAccess", "GetUserById");
                return null;
            }
        }


        public static string GetUserNameById(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Where(a => a.PkUserId == id).FirstOrDefault();
                    return v.FullName;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetUserNameById");
                return null;
            }
        }
        public static string GetUserIDById(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Include("usertype").Where(a => a.PkUserId == id).FirstOrDefault();
                    return v.usertype.UserTypeName;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetUserIDById");
                return null;
            }
        }

        public static bool AddUser(Users users)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.userinfo.Add(users);
                    databaseModel.SaveChanges();


                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "Adduser");
                return false;
            }
        }

        public static bool AddUserFrontEnd(Users users)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.userinfo.Add(users);
                    databaseModel.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddUserFrontEnd");
                return false;
            }
        }
        public static bool UpdateUser(Users classs)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Where(m => m.PkUserId == classs.PkUserId).FirstOrDefault();
                    if (v != null)
                    {

                        v.UserTypeID = classs.UserTypeID;
                        v.UpdatedAt = v.UpdatedAt;
                        v.UpdatedBy = classs.UpdatedBy;

                        databaseModel.SaveChanges();


                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateUser");
                return false;
            }
        }

        public static bool DeleteUser(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.userinfo.Where(m => m.PkUserId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.DeletedBy = username;
                        databaseModel.SaveChanges();
                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteUser");
                return false;
            }
        }


        #endregion
        //-------------------- User Type ---------------------------------
        #region

        public static UserTypes GetUserTypeById(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.usertypes.Where(a => a.PkUserTypelId == id).FirstOrDefault();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetUserTypeById");
                return null;
            }
        }

        public static bool AddUserType(UserTypes userTypes)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.usertypes.Add(userTypes);
                    databaseModel.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddUserType");
                return false;
            }
        }

        public static bool UpdateUserType(UserTypes classs)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.usertypes.Where(m => m.PkUserTypelId == classs.PkUserTypelId).FirstOrDefault();
                    if (v != null)
                    {
                        v.UserTypeName = classs.UserTypeName;
                        v.UpdatedAt = DateTime.Now;
                        v.CreatedAt = v.CreatedAt;
                        databaseModel.SaveChanges();


                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateUserType");
                return false;
            }
        }

        public static bool DeleteUserType(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.usertypes.Where(m => m.PkUserTypelId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.DeletedBy = username;
                        databaseModel.SaveChanges();



                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteUserType");
                return false;
            }
        }
        public static List<UserTypes> AllUserTypes()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.usertypes.Where(a => a.DeletedBy == "").ToList();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AlluserTypes");
                return null;
            }
        }
        public static List<UserTypes> InActiveAllUserTypes()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.usertypes.Where(a => a.DeletedBy != "").ToList();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AlluserTypes");
                return null;
            }
        }

        public static UserTypes IsUserTypesExist(string classname)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.usertypes.Where(a => a.UserTypeName == classname).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsUserTypesExist");
                return null;
            }
        }

        #endregion


        //-------------------- Organization -------------------------------------
        #region Organizations

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static Organizations GetallOrganizations()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.organizationinfo.FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallOrganizations");
                return null;
            }

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SalepointName"></param>
        /// <returns></returns>

        public static Organizations IsOrganizationsExist(string classname)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.organizationinfo.Where(a => a.OrganisationName == classname).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsOrganizationsExist");
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="newentry"></param>
        /// <returns></returns>
        public static bool AddOrganizations(Organizations newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.organizationinfo.Add(newentry);
                    databaseModel.SaveChanges();


                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddOrganizations");
                return false;
            }
        }

        public static int AddOrganizationsBulk(Organizations newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.organizationinfo.Add(newentry);
                    databaseModel.SaveChanges();
                    return newentry.PkOrganizationId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddOrganizationsBulk");
                return 0;
            }
        }

        /// <summary>
        /// CHECK Area already exists or not
        /// </summary>
        /// <param name="areaname"></param>
        /// <returns></returns>
        public static Organizations GetOrganizatonsInformationById()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.organizationinfo.FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetOrganizatonsInformationById");
                return null;
            }
        }
        public static bool UpdateOrganizations(Organizations classs)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.organizationinfo.Where(m => m.PkOrganizationId == classs.PkOrganizationId).FirstOrDefault();
                    if (v != null)
                    {
                        v.OrganisationName = classs.OrganisationName;
                        v.OrganizationLogo = classs.OrganizationLogo;

                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = classs.UpdatedBy;
                        v.DeletedBy = classs.DeletedBy;
                        databaseModel.SaveChanges();


                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateOrganizations");
                return false;
            }
        }
        public static bool DeleteOrganizations(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.organizationinfo.Where(a => a.PkOrganizationId == id).FirstOrDefault();
                    if (v != null)
                    {

                        v.DeletedBy = username;
                        databaseModel.SaveChanges();



                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteOrganizations");
                return false;
            }
        }
        #endregion




        //-------------------- Profiles -------------------------------------
        #region Currency

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<Profiles> GetallActiveCurrency()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.items.Where(a => a.Status == true).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCurrency");
                return null;
            }

        }
        public static List<Profiles> GetallCustomerItem()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.items.Where(a => a.Status == true).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCurrency");
                return null;
            }

        }
        public static List<Profiles> GetallInActiveCurrency()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.items.Where(a => a.Status == false).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCurrency");
                return null;
            }

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SalepointName"></param>
        /// <returns></returns>

        public static Profiles IsCurrencyExist(string classname)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.items.Where(a => a.ProfileName == classname).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsCurrencyExist");
                return null;
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="newentry"></param>
        /// <returns></returns>
        public static bool AddCurrency(Profiles newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.items.Add(newentry);
                    databaseModel.SaveChanges();


                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddCurrency");
                return false;
            }
        }

        public static int AddCurrencyBulk(Profiles newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.items.Add(newentry);
                    databaseModel.SaveChanges();
                    return newentry.PkItemId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddCurrencyBulk");
                return 0;
            }
        }

        /// <summary>
        /// CHECK Area already exists or not
        /// </summary>
        /// <param name="areaname"></param>
        /// <returns></returns>
        public static Profiles GetCurrencyInformationById(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.items.Where(a => a.PkItemId == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetCurrencyInformationById");
                return null;
            }
        }
        public static Profiles GetCurrencyInformationByProfile(string classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.items.Where(a => a.ProfileNo == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetCurrencyInformationById");
                return null;
            }
        }

        public static Profiles GetCurrencyInformationById(string classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.items.Where(a => a.ProfileName == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetCurrencyInformationById");
                return null;
            }
        }


        #endregion

        //--------------------Hotel Information-----------------------------
        #region HotelDetails
        public static HotelRoomDetails GetRoomRentInformationById(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.hotelRoomDetails.Where(a => a.PkRoomDetailsId == id).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetCurrencyInformationById");
                return null;
            }
        }

        public static List<HotelRoomDetails> AllRooms()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.hotelRoomDetails.Where(a => a.Status == true).ToList();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "ABCExchangeDBAccess", "Allusers");
                return null;
            }
        }

        public static HotelRoomDetails GetRoomById(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.hotelRoomDetails.Where(a => a.PkRoomDetailsId == id).FirstOrDefault();
                    return v;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "AABCExchangeDBAccess", "GetUserById");
                return null;
            }
        }
        #endregion


        //-------------------- Customer -------------------------------------
        #region Customer

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<Customer> GetallCustomer()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Include("ledger").ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCurrency");
                return null;
            }

        }
        public static List<Customer> GetallClients()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCurrency");
                return null;
            }

        }

        public static Customer IsCustomerExist(string nid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Where(a => a.Email == nid).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsCurrencyExist");
                return null;
            }
        }


        public static Customer GetCustomerInformationById(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Where(a => a.PkCustomerId == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetCurrencyInformationById");
                return null;
            }
        }

        #endregion

        //-------------------- Hotel -------------------------------------
        #region Customer

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<HotelRoomDetails> GetallRoomDetails()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {

                    return databaseModel.hotelRoomDetails.ToList();
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCurrency");
                return null;
            }

        }
        public static HotelRoomDetails GetRoomDetails(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {

                    return databaseModel.hotelRoomDetails.FirstOrDefault(r => r.PkRoomDetailsId == id);
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCurrency");
                return null;
            }

        }

        #endregion


        //-------------------- Account Groups -------------------------------------
        #region 

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<AccountGroups> GetallAccountGroups()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.accountgroups.Where(a => a.Status == true).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallAccountGroups");
                return null;
            }

        }

        public static List<AccountGroups> GetallBalanceSheetAccountGroups()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.accountgroups.Where(a => a.GroupIdentifier.Contains("1.") || a.GroupIdentifier.Contains("2.")).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallBalanceSheetAccountGroups");
                return null;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SalepointName"></param>
        /// <returns></returns>

        public static AccountGroups IsAccountGroupsExist(string classname)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.accountgroups.Where(a => a.GroupName == classname).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsAccountGroupsExist");
                return null;
            }
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="newentry"></param>
        /// <returns></returns>
        public static bool AddAccountGroups(AccountGroups newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.accountgroups.Add(newentry);
                    databaseModel.SaveChanges();


                    return true;

                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddAccountGroups");
                return false;
            }
        }

        public static int AddAccountGroupsBulk(AccountGroups newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.accountgroups.Add(newentry);
                    databaseModel.SaveChanges();
                    return newentry.PkGroupId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddAccountGroupsBulk");
                return 0;
            }
        }

        /// <summary>
        /// CHECK Area already exists or not
        /// </summary>
        /// <param name="areaname"></param>
        /// <returns></returns>
        public static AccountGroups GetAccountGroupsInformationById(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.accountgroups.Where(a => a.PkGroupId == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetAccountGroupsInformationById");
                return null;
            }
        }

        public static bool UpdateAccountGroups(AccountGroups classs)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.accountgroups.Where(m => m.PkGroupId == classs.PkGroupId).FirstOrDefault();

                    if (v != null)
                    {
                        v.GroupName = classs.GroupName;
                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = classs.UpdatedBy;

                        databaseModel.SaveChanges();

                        return true;

                    }
                    else return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateAccountGroups");
                return false;
            }
        }
        public static bool DeleteAccountGroups(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.accountgroups.Where(a => a.PkGroupId == id).FirstOrDefault();
                    if (v != null)
                    {

                        v.Status = false;
                        v.DeletedBy = username;
                        databaseModel.SaveChanges();


                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteAccountGroups");
                return false;
            }
        }
        public static bool DeleteAccountGroupsActive(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.accountgroups.Where(a => a.PkGroupId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = username;
                        v.DeletedBy = "";
                        v.Status = true;
                        databaseModel.SaveChanges();


                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteAccountGroupsActive");
                return false;
            }
        }
        #endregion

        //-------------------- Ledgers -------------------------------------
        #region Ledgers

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<Ledgers> GetallLedgers()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallLedgers");
                return null;
            }

        }
        public static List<Ledgers> GetallActiveLedgers()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(a => a.Status == true).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallLedgers");
                return null;
            }

        }
        public static List<Ledgers> GetallLedgersByParentID(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(a => a.LedgerParent == id).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallLedgersByParentID");
                return null;
            }

        }

        public static string GetLastLedgerCode()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.OrderByDescending(a => a.PkLedgerId).Where(a => a.LedgerCode.Contains("Ac-")).Take(1).SingleOrDefault();
                    return v.LedgerCode;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetLastLedgerCode");
                return null;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SalepointName"></param>
        /// <returns></returns>

        public static Ledgers IsLedgersExist(string classname)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(a => a.LedgerName == classname).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsLedgersExist");
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="newentry"></param>
        /// <returns></returns>
        public static int AddLedgers(Ledgers newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.ledgers.Add(newentry);

                    databaseModel.SaveChanges();

                    return newentry.PkLedgerId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddLedgers");
                return 0;
            }
        }

        public static int AddLedgersBulk(Ledgers newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.ledgers.Add(newentry);
                    databaseModel.SaveChanges();
                    return newentry.PkLedgerId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddLedgersBulk");
                return 0;
            }
        }

        public static Ledgers GetLedgersInformationById(string classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(a => a.LedgerName == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetLedgersInformationById");
                return null;
            }
        }

        /// <summary>
        /// CHECK Area already exists or not
        /// </summary>
        /// <param name="areaname"></param>
        /// <returns></returns>
        public static Ledgers GetLedgersInformationById(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(a => a.PkLedgerId == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetLedgersInformationById");
                return null;
            }
        }
        public static Ledgers GetLedgersInformationByParentId(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(a => a.LedgerParent == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetLedgersInformationByParentId");
                return null;
            }
        }
        public static bool UpdateLedgersName(Ledgers classs)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(m => m.PkLedgerId == classs.PkLedgerId).FirstOrDefault();
                    if (v != null)
                    {
                        v.LedgerName = classs.LedgerName;
                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = classs.UpdatedBy;
                        databaseModel.SaveChanges();


                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateLedgers");
                return false;
            }
        }

        public static bool UpdateLedgers(Ledgers classs)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(m => m.PkLedgerId == classs.PkLedgerId).FirstOrDefault();
                    if (v != null)
                    {
                        v.LedgerName = classs.LedgerName;
                        v.Nature = classs.Nature;
                        v.LedgerParent = classs.LedgerParent;
                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = classs.UpdatedBy;
                        databaseModel.SaveChanges();


                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateLedgers");
                return false;
            }
        }
        public static bool UpdateLedgersAccounting(Ledgers classs)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(m => m.PkLedgerId == classs.PkLedgerId).FirstOrDefault();
                    if (v != null)
                    {
                        v.OpeningBalance = classs.OpeningBalance;
                        v.ClosingBalance = classs.ClosingBalance;
                        v.PkLedgerId = classs.PkLedgerId;
                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = classs.UpdatedBy;
                        databaseModel.SaveChanges();


                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateLedgersAccounting");
                return false;
            }
        }
        public static bool DeleteLedgers(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(a => a.PkLedgerId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.DeletedBy = username;
                        databaseModel.SaveChanges();


                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteLedgers");
                return false;
            }
        }
        public static bool DeleteLedgersActive(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.ledgers.Where(a => a.PkLedgerId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = username;
                        v.DeletedBy = "";
                        databaseModel.SaveChanges();


                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteLedgersActive");
                return false;
            }
        }
        #endregion

        //-------------------- TransactionHistory -------------------------------------
        #region TransactionHistory
        public static string GetLastTransactionNumber()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.OrderByDescending(a => a.PkTransactionId).Take(1).SingleOrDefault();
                    return v.TransactionID;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetLastTransactionNumber");
                return null;
            }

        }

        public static TransactionHistory GetOpeningBalanceTransactionHistory(int id, string TransactionSource)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.LedgerID == id && a.TransactionSource == TransactionSource).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }
        public static List<TransactionHistory> GetallTransactionHistoryByTransactionID(int did, int cid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var debittransaction = databaseModel.transactionhistory.Where(a => a.PkTransactionId == did).FirstOrDefault();
                    var credittransaction = databaseModel.transactionhistory.Where(a => a.PkTransactionId == cid).FirstOrDefault();

                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.LedgerID == debittransaction.LedgerID || a.LedgerID == credittransaction.LedgerID).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        public static List<TransactionHistory> GetallTransactionHistoryByLedgerTransactionID(int ledgerid, int tranid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var debittransaction = databaseModel.transactionhistory.Where(a => a.PkTransactionId == tranid).FirstOrDefault();


                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.LedgerID == debittransaction.LedgerID || a.LedgerID == ledgerid).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        public static List<TransactionHistory> GetallTransactionHistory(int id, int adjustid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.LedgerID == id && a.PkTransactionId != adjustid).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        public static List<TransactionHistory> GetallTransactionHistory(DateTime start, DateTime end)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.TransactionDate >= start && a.TransactionDate <= end).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        public static List<TransactionHistory> GetTransactionHistory(int id, int adjustid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.LedgerID == id && a.PkTransactionId > adjustid).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        public static List<TransactionHistory> GetTransactionHistory(string trxid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.TransactionID == trxid).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }
        public static List<TransactionHistory> GetTransactionHistory(string tid, int nno)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Where(a => a.TransactionID == tid && a.ReferenceID == nno).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<TransactionHistory> GetallTransactionHistory()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }


        public static TransactionHistory GetTransactionHistory(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.PkTransactionId == id).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetTransactionHistory");
                return null;
            }

        }

        public static List<TransactionHistory> GetallTransactionHistory(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.LedgerID == id).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        public static List<TransactionHistory> GetallTransactionHistory(int id, DateTime startdate, DateTime enddate)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.LedgerID == id && a.TransactionDate >= startdate.Date && a.TransactionDate <= enddate.Date).ToList();
                    //var v = databaseModel.transactionhistory.Include("ledgers").Where(a => a.LedgerID == id).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }
        public static List<TransactionHistory> GetallTransactionHistory(int id, DateTime startdate)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => a.LedgerID == id && a.TransactionDate <= startdate.Date && a.TransactionSource != "Opening Balance").ToList();
                    //var v = databaseModel.transactionhistory.Include("ledgers").Where(a => a.LedgerID == id).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        public static List<TransactionHistory> GetallTransactionHistoryBoth(int id, int linkid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => (a.LedgerID == id || a.LedgerID == linkid)).ToList();
                    //var v = databaseModel.transactionhistory.Include("ledgers").Where(a => a.LedgerID == id).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        public static List<TransactionHistory> GetallTransactionHistoryBoth(int id, int linkid, DateTime startdate, DateTime enddate)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Include("ledgers").Include("accounts").Where(a => (a.LedgerID == id || a.LedgerID == linkid) && a.TransactionDate >= startdate.Date && a.TransactionDate <= enddate.Date).ToList();
                    //var v = databaseModel.transactionhistory.Include("ledgers").Where(a => a.LedgerID == id).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallTransactionHistory");
                return null;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="newentry"></param>
        /// <returns></returns>
        public static int AddTransactionHistory(TransactionHistory newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.transactionhistory.Add(newentry);
                    databaseModel.SaveChanges();

                    return newentry.PkTransactionId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddTransactionHistory");
                return 0;
            }
        }


        public static bool UpdateTransactionHistory(TransactionHistory newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == newentry.PkTransactionId).FirstOrDefault();
                    if (v != null)
                    {
                        v.TransactionDate = newentry.TransactionDate;
                        v.Debit = newentry.Debit;
                        v.Credit = newentry.Credit;
                        v.OpeningBalance = newentry.OpeningBalance;
                        v.ClosingBalance = newentry.ClosingBalance;
                        v.UpdatedAt = newentry.UpdatedAt;
                        v.UpdatedBy = newentry.UpdatedBy;

                        databaseModel.SaveChanges();
                    }


                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateTransactionHistory");
                return false;
            }
        }

        public static bool UpdateTransactionHistoryWithLedger(TransactionHistory newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == newentry.PkTransactionId).FirstOrDefault();
                    if (v != null)
                    {
                        v.TransactionDate = newentry.TransactionDate;
                        v.LedgerID = newentry.LedgerID;
                        v.Debit = newentry.Debit;
                        v.Credit = newentry.Credit;
                        v.OpeningBalance = newentry.OpeningBalance;
                        v.ClosingBalance = newentry.ClosingBalance;
                        v.UpdatedAt = newentry.UpdatedAt;
                        v.UpdatedBy = newentry.UpdatedBy;

                        databaseModel.SaveChanges();
                    }


                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateTransactionHistory");
                return false;
            }
        }

        public static bool UpdateTransactionHistoryAdjustment(TransactionHistory newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == newentry.PkTransactionId).FirstOrDefault();
                    if (v != null)
                    {
                        v.OpeningBalance = newentry.OpeningBalance;
                        v.ClosingBalance = newentry.ClosingBalance;

                        databaseModel.SaveChanges();
                    }


                    return true;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateTransactionHistory");
                return false;
            }
        }

        #endregion

        //-------------------- Payments -------------------------------------
        #region Payments
        public static string GetLastPaymentsNumber()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.OrderByDescending(a => a.PkPaymentsId).Take(1).SingleOrDefault();
                    return v.PaymentNumber;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetLastPaymentsNumber");
                return null;
            }

        }
        public static List<Payments> GetallPaymentsByLedgerID(int ledgerid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Include("bankledger").Include("debitledger").Include("ledger").Where(a => a.DebitLedgerID == ledgerid).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "DocumentCleaningERPDBAccess", "GetallPayments");
                return null;
            }

        }
        public static List<Payments> GetallPayments(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Include("bankledger").Include("debitledger").Where(a => a.CreditLedgerID == id).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingContexts", "GetallPayments");
                return null;
            }

        }
        public static List<Payments> GetallPayments(DateTime start, DateTime end)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Include("creditledger").Include("debitledger").Where(a => a.PaymentDate >= start.Date && a.PaymentDate <= end.Date).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingContexts", "GetallPayments");
                return null;
            }

        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<Payments> GetallPayments()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Include("creditledger").Include("debitledger").ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallPayments");
                return null;
            }

        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="SalepointName"></param>
        /// <returns></returns>

        public static Payments IsPaymentsExist(string classname)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Where(a => a.PaymentNumber == classname).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsPaymentsExist");
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="newentry"></param>
        /// <returns></returns>
        public static int AddPayments(Payments newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.payments.Add(newentry);
                    databaseModel.SaveChanges();

                    return newentry.PkPaymentsId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddPayments");
                return 0;
            }
        }

        public static int AddPaymentsBulk(Payments newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.payments.Add(newentry);
                    databaseModel.SaveChanges();
                    return newentry.PkPaymentsId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddPaymentsBulk");
                return 0;
            }
        }

        public static bool UpdatePaymentsTransaction(int id, string transactionid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Where(m => m.PkPaymentsId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.TransactionID = transactionid;
                        databaseModel.SaveChanges();
                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateBills");
                return false;
            }
        }


        public static bool UpdatePayments(Payments classs)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Where(m => m.PkPaymentsId == classs.PkPaymentsId).FirstOrDefault();
                    if (v != null)
                    {
                        v.PkPaymentsId = classs.PkPaymentsId;
                        v.DebitLedgerID = classs.DebitLedgerID;
                        v.CreditLedgerID = classs.CreditLedgerID;
                        v.PaymentDate = classs.PaymentDate;
                        v.Reference = classs.Reference;
                        //v.CommentBuyer = classs.CommentBuyer;
                        //v.CommentPaid = classs.CommentPaid;
                        v.ReceiveAmount = classs.ReceiveAmount;
                        //v.PaidAmount = classs.PaidAmount;
                        //v.PaidCurrencyID = classs.PaidCurrencyID;
                        //v.ConversionRate = classs.ConversionRate;
                        v.UpdatedBy = classs.UpdatedBy;
                        v.UpdatedAt = classs.UpdatedAt;

                        databaseModel.SaveChanges();


                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdatePayments");
                return false;
            }
        }

        /// <summary>
        /// CHECK Area already exists or not
        /// </summary>
        /// <param name="areaname"></param>
        /// <returns></returns>
        public static Payments GetPaymentsInformationById(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Include("creditledger").Include("debitledger").Where(a => a.PkPaymentsId == classid).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetPaymentsInformationById");
                return null;
            }
        }
        public static Payments GetPaymentsInformationByOrderId(string classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Include("creditledger").Include("debitledger").Where(a => a.PaymentNumber == classid.Trim()).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetPaymentsInformationById");
                return null;
            }
        }
        public static bool DeletePayments(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.payments.Where(a => a.PkPaymentsId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.DeletedBy = username;
                        databaseModel.SaveChanges();


                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeletePayments");
                return false;
            }
        }
        #endregion


        //-------------------- Customers -------------------------------------
        #region Customers


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<Customer> GetallActiveCustomers()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Include("ledger").Where(a => a.Status == true).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCustomers");
                return null;
            }

        }

        public static List<Customer> GetallCustomers()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Include("ledger").Include("supplierledger").ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCustomers");
                return null;
            }

        }

        public static List<Customer> GetallInActiveCustomers()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Include("ledger").Where(a => a.Status == false).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallCustomers");
                return null;
            }

        }

        public static int LastCustomerCode()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.OrderByDescending(a => a.PkCustomerId).FirstOrDefault();
                    return v.CustomerCode;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsCustomersExist");
                return 0;
            }
        }

        public static Customer IsCustomersExist(string classname)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Where(a => a.Name == classname).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsCustomersExist");
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="newentry"></param>
        /// <returns></returns>
        public static int AddCustomers(Customer newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.Customers.Add(newentry);
                    databaseModel.SaveChanges();


                    return newentry.PkCustomerId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddCustomers");
                return 0;
            }
        }

        public static int AddCustomersBulk(Customer newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.Customers.Add(newentry);
                    databaseModel.SaveChanges();
                    return newentry.PkCustomerId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddCustomersBulk");
                return 0;
            }
        }

        /// <summary>
        /// CHECK Area already exists or not
        /// </summary>
        /// <param name="areaname"></param>
        /// <returns></returns>
        public static Customer GetCustomersInformationById(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Include("ledger").Where(a => a.PkCustomerId == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetCustomersInformationById");
                return null;
            }
        }
        public static Customer GetCustomersInformationByLedgerId(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Include("ledger").Where(a => a.LedgerID == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetCustomersInformationById");
                return null;
            }
        }

        public static Customer GetCustomersInformationByCode(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Include("ledger").Where(a => a.CustomerCode == classid).FirstOrDefault();

                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetCustomersInformationById");
                return null;
            }
        }

        public static bool DeleteCustomers(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Where(a => a.PkCustomerId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.Status = false;
                        v.DeletedBy = username;
                        databaseModel.SaveChanges();


                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteCustomers");
                return false;
            }
        }
        public static bool DeleteCustomersActive(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.Customers.Where(a => a.PkCustomerId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.Status = true;
                        v.UpdatedAt = DateTime.Now;
                        v.UpdatedBy = username;
                        v.DeletedBy = "";
                        databaseModel.SaveChanges();


                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteCustomersActive");
                return false;
            }
        }
        #endregion

        //-------------------- Invoices -------------------------------------
        #region Invoices

        public static string GetLastInvoiceNumber()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoice.OrderByDescending(a => a.PkInvoiceId).FirstOrDefault();
                    if (v != null)
                    {
                        return v.InvoiceNo;
                    }
                    else
                    {
                        return "Invoice Not Found";
                    }
                    //return v.PkInvoiceId.ToString() ;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetLastInvoiceNumber");
                return null;
            }

        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<Invoices> GetallInvoices()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoice.Include("debitledger").Include("creditledger").ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallInvoices");
                return null;
            }

        }

        public static List<InvoiceDetails> GetallInvoiceDetails()
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoicedetails.Include("invoice").Include("service").ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallInvoices");
                return null;
            }

        }
        public static List<InvoiceDetails> GetallInvoiceDetails(int id)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoicedetails.Include("invoice").Include("service").Where(a => a.InvoiceID == id).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallInvoices");
                return null;
            }

        }
        public static List<Invoices> GetallInvoices(DateTime startdate, DateTime enddate)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoice.Include("debitledger").Include("creditledger").Where(a => a.InvoiceDate >= startdate && a.InvoiceDate <= enddate).ToList();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetallInvoices");
                return null;
            }

        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SalepointName"></param>
        /// <returns></returns>

        public static Invoices IsInvoicesExist(string classname)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoice.Include("debitledger").Include("creditledger").Where(a => a.InvoiceNo == classname).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "IsInvoicesExist");
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="newentry"></param>
        /// <returns></returns>
        public static int AddInvoices(Invoices newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.invoice.Add(newentry);
                    databaseModel.SaveChanges();


                    return newentry.PkInvoiceId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddInvoices");
                return 0;
            }
        }

        public static int AddInvoicesBulk(Invoices newentry)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    databaseModel.invoice.Add(newentry);
                    databaseModel.SaveChanges();
                    return newentry.PkInvoiceId;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "AddInvoicesBulk");
                return 0;
            }
        }
        public static bool UpdateInvoicesTransaction(int id, string transactionid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoice.Where(m => m.PkInvoiceId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.TransactionID = transactionid;
                        databaseModel.SaveChanges();
                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateBills");
                return false;
            }
        }



        public static bool UpdateInvoicesStatusforSalesReturn(int id, double bal)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoice.Where(m => m.PkInvoiceId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.PkInvoiceId = id;

                        databaseModel.SaveChanges();


                    }

                    return true;

                }

            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "UpdateInvoicesStatus");
                return false;
            }
        }

        /// <summary>
        /// CHECK Area already exists or not
        /// </summary>
        /// <param name="areaname"></param>
        /// <returns></returns>
        public static Invoices GetInvoicesInformationById(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoice.Include("debitledger").Include("creditledger").Where(a => a.PkInvoiceId == classid).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetInvoicesInformationById");
                return null;
            }
        }
        public static Invoices GetInvoicesInformationByOrderId(string classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoice.Include("debitledger").Include("creditledger").Where(a => a.InvoiceNo == classid.Trim()).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "GetInvoicesInformationById");
                return null;
            }
        }
        public static bool DeleteInvoices(int id, string username)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoice.Where(a => a.PkInvoiceId == id).FirstOrDefault();
                    if (v != null)
                    {
                        v.DeletedBy = username;
                        databaseModel.SaveChanges();


                        return true;
                    }

                    return false;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "HotelBookingDBAccess", "DeleteInvoices");
                return false;
            }
        }
        #endregion

        public static InvoiceAttachmentDetails GetInvoiceAttachmentDetailsInformationById(int classid)
        {
            try
            {
                using (HotelBookingContexts databaseModel = new HotelBookingContexts())
                {
                    var v = databaseModel.invoiceattachemnts.Where(a => a.InvoiceID == classid).FirstOrDefault();
                    return v;
                }
            }
            catch (Exception ex)
            {
                Log.Fatal("log4net Fatal Level", ex);
                //AddLogReport(ex.ToString(), "ABCExchangeDBAccess", "GetBillAttachmentDetailsInformationById");
                return null;
            }
        }



    }
}