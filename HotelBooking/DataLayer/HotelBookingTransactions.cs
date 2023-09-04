using log4net;
using HotelBooking.Controllers;
using HotelBooking.DataLayer.Models.Accounts;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;

namespace HotelBooking.DataLayer
{
    public class HotelBookingTransactions
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof(HotelBookingTransactions));
        private static List<TransactionHistory> transactionHistories = new List<TransactionHistory>();
        private static List<TransactionHistory> debittransactionHistories = new List<TransactionHistory>();
        private static List<TransactionHistory> credittransactionHistories = new List<TransactionHistory>();
        private static List<TransactionHistory> lasttransactiononthisday = new List<TransactionHistory>();
        private static TransactionHistory lasttransactiononthisdata = new TransactionHistory();
        private static TransactionHistory checkdebittransactiononthisdata = new TransactionHistory();
        private static TransactionHistory lasttransactiononthisdayfind = new TransactionHistory();
        private static TransactionHistory organizedataasorder = new TransactionHistory();
        private static TransactionHistory aftertransactionhistroyfindings = new TransactionHistory();
        private static TransactionHistory transactionhistroyafter = new TransactionHistory();
        private static TransactionHistory lasttransactionbefore = new TransactionHistory();
        private static TransactionHistory lastcredittransactiononthisdata = new TransactionHistory();
        private static TransactionHistory checkcredittransactiononthisdata = new TransactionHistory();

       
        public static bool Changeinvoicenumbers()
        {
            transactionHistories = HotelBookingDBAccess.GetallTransactionHistory();
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {

                var allinvoices = databaseModel.invoice.ToList();
                foreach (var invoice in allinvoices)
                {

                    var info = databaseModel.invoice.Where(a => a.PkInvoiceId == invoice.PkInvoiceId).FirstOrDefault();
                    info.InvoiceNo = "";
                    databaseModel.SaveChanges();

                }
                foreach (var invoice in allinvoices)
                {

                    var info = databaseModel.invoice.Where(a => a.PkInvoiceId == invoice.PkInvoiceId).FirstOrDefault();

                    var currentyear = invoice.InvoiceDate.Year.ToString();
                    var currentmonth = invoice.InvoiceDate.Month.ToString();
                    var currentdate = invoice.InvoiceDate.Day.ToString();
                    var isexists = databaseModel.invoice.Where(a => a.InvoiceNo.Contains("Inv-" + currentdate + currentmonth + currentyear + "-")).OrderByDescending(a => a.PkInvoiceId).FirstOrDefault();

                    if (isexists == null)
                    {
                        var number = "Inv-" + currentdate + currentmonth + currentyear + "-001";
                        info.InvoiceNo = number;
                        databaseModel.SaveChanges();
                        Changetransactionsnumbers(number, invoice.TransactionID);
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
                            finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-001";
                            Changetransactionsnumbers(finalstring, invoice.TransactionID);

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
                                finalstring = "Inv-" + currentdate + currentmonth + currentyear + "-0" + number.ToString();

                            }
                        }
                        info.InvoiceNo = finalstring;
                        databaseModel.SaveChanges();

                        Changetransactionsnumbers(finalstring, invoice.TransactionID);


                    }
                }

                return true;
            }
        }

      
        public static bool Changetransactionsnumbers(string red, string transa)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                var singletra = transactionHistories.Where(a => a.TransactionID == transa).ToList();
                foreach (var item in singletra)
                {
                    var tran = databaseModel.transactionhistory.Where(a => a.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                    tran.TransactionReference = red;
                    databaseModel.SaveChanges();
                }
                return true;
            }
        }
       
    
        public static bool AddTransactionMissedOpeningBalance()
        {
            transactionHistories = HotelBookingDBAccess.GetallTransactionHistory();
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                try
                {
                    var allopeningaccount = databaseModel.ledgers.Where(a => a.LedgerName.Contains("Opening Cash")).FirstOrDefault();

                    var openingtransactionhistory = transactionHistories.Where(a => a.TransactionSource == "Opening Balance").ToList();
                    foreach (var item in openingtransactionhistory)
                    {
                        if (item.TransactionType == "Dr")
                        {
                           
                            if (allopeningaccount != null)
                            {

                                allopeningaccount.OpeningBalance = allopeningaccount.ClosingBalance;
                                allopeningaccount.ClosingBalance = allopeningaccount.ClosingBalance - item.Debit;
                                databaseModel.SaveChanges();

                                TransactionHistory newentrycapital = new TransactionHistory();
                                newentrycapital.TransactionID = item.TransactionID;
                                newentrycapital.TransactionDate = System.DateTime.Now;
                                newentrycapital.TransactionType = "Cr";
                                newentrycapital.AccountID = item.LedgerID;
                                newentrycapital.TransactionReference = "";
                                newentrycapital.Remarks = "Opening Balance " + item.ledgers.LedgerName;
                                newentrycapital.TransactionSource = "Opening Balance " + item.ledgers.LedgerName;
                                newentrycapital.ReferenceID = 0;

                                newentrycapital.Debit = 0;
                                newentrycapital.Credit = item.Debit;

                                newentrycapital.OpeningBalance = allopeningaccount.OpeningBalance;
                                newentrycapital.ClosingBalance = allopeningaccount.ClosingBalance;
                                newentrycapital.LedgerID = allopeningaccount.PkLedgerId;
                                newentrycapital.CreatedAt = System.DateTime.Now;
                                newentrycapital.UpdatedAt = System.DateTime.Now;
                                newentrycapital.CreatedBy = "System";
                                newentrycapital.UpdatedBy = "";

                                databaseModel.transactionhistory.Add(newentrycapital);
                                databaseModel.SaveChanges();

                            }
                        }
                        else
                        {
                          
                            if (allopeningaccount != null)
                            {
                                allopeningaccount.OpeningBalance = allopeningaccount.ClosingBalance;
                                allopeningaccount.ClosingBalance = allopeningaccount.ClosingBalance + item.Credit ;
                                databaseModel.SaveChanges();

                                TransactionHistory newentrycapital = new TransactionHistory();
                                newentrycapital.TransactionID = item.TransactionID;
                                newentrycapital.TransactionDate = System.DateTime.Now;
                                newentrycapital.TransactionType = "Dr";
                                newentrycapital.AccountID = item.LedgerID;
                                newentrycapital.TransactionReference = ""; 
                                newentrycapital.Remarks = "Opening Balance " + item.ledgers.LedgerName;
                                newentrycapital.TransactionSource = "Opening Balance " + item.ledgers.LedgerName;
                                newentrycapital.ReferenceID = 0;

                                newentrycapital.Debit = item.Credit;
                                newentrycapital.Credit = 0;
                                newentrycapital.OpeningBalance = allopeningaccount.OpeningBalance;
                                newentrycapital.ClosingBalance = allopeningaccount.ClosingBalance;
                                newentrycapital.LedgerID = allopeningaccount.PkLedgerId;
                                newentrycapital.CreatedAt = System.DateTime.Now;
                                newentrycapital.UpdatedAt = System.DateTime.Now;
                                newentrycapital.CreatedBy = "System";
                                newentrycapital.UpdatedBy = "";

                                databaseModel.transactionhistory.Add(newentrycapital);
                                databaseModel.SaveChanges();

                            }
                        }
                    }
                    return true;
                }
                catch (Exception ex)
                {

                    return false;
                }
            }
        }
        public static bool CheckLastTransactionDebitUpdate(string TransactionReference, DateTime transactiondate)
        {
            try
            {
                // Finding Same Day transactions
                lasttransactiononthisday = debittransactionHistories.Where(a => a.TransactionDate.Date == transactiondate.Date && a.TransactionSource != "Opening Balance").OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).ToList();
                lasttransactiononthisday = lasttransactiononthisday.Where(a => a.TransactionReference != "").ToList();
                if (lasttransactiononthisday.Count > 0)
                {
                    // Finding Same Type or Same Source transactions
                    lasttransactiononthisdayfind = lasttransactiononthisday.Where(a => a.TransactionReference.Contains(TransactionReference.Substring(0, 2))).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactiononthisdayfind != null)
                    {
                        // Checking Updated Transaction is less or greater
                        if (String.Compare(lasttransactiononthisdayfind.TransactionReference, TransactionReference, comparisonType: StringComparison.OrdinalIgnoreCase) < 0)
                        {
                            lasttransactiononthisdata = lasttransactiononthisdayfind;
                        }
                        else
                        {
                            lasttransactiononthisdata = lasttransactiononthisday.Where(a=> String.Compare(a.TransactionReference, TransactionReference, comparisonType: StringComparison.OrdinalIgnoreCase) < 0).OrderByDescending(a=>a.TransactionDate).ThenByDescending(a=>a.TransactionReference).FirstOrDefault();
                            if (lasttransactiononthisdata == null)
                            {
                                lasttransactionbefore = debittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                                lasttransactiononthisdata = lasttransactionbefore;
                            }
                        }
                    }
                    else
                    {
                        organizedataasorder = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) < 0).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                        if (organizedataasorder != null)
                            lasttransactiononthisdata = organizedataasorder;
                        else
                        {
                            lasttransactiononthisdata = debittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                            if (lasttransactiononthisdata == null)
                            {
                                lasttransactiononthisdata = null;
                            }

                        }
                    }

                    aftertransactionhistroyfindings = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0 || String.Compare(a.TransactionReference, TransactionReference, comparisonType: StringComparison.OrdinalIgnoreCase) > 0).OrderBy(a => a.TransactionReference).FirstOrDefault();
                    if (aftertransactionhistroyfindings != null)
                    {
                        checkdebittransactiononthisdata = aftertransactionhistroyfindings;
                    }
                    else
                    {
                        transactionhistroyafter = debittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                        if (transactionhistroyafter != null)
                        {
                            checkdebittransactiononthisdata = transactionhistroyafter;
                        }
                        else
                            checkdebittransactiononthisdata = null;
                    }
                }
                else
                {
                    lasttransactionbefore = debittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactionbefore != null)
                        lasttransactiononthisdata = lasttransactionbefore;
                    else
                        lasttransactiononthisdata = null;

                    transactionhistroyafter = debittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                    if (transactionhistroyafter != null)
                        checkdebittransactiononthisdata = transactionhistroyafter;
                    else
                        checkdebittransactiononthisdata = null;
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public static bool CheckLastTransactionCreditUpdate(string TransactionReference, DateTime transactiondate)
        {
            try
            {
                lasttransactiononthisday = credittransactionHistories.Where(a => a.TransactionDate.Date == transactiondate.Date && a.TransactionSource != "Opening Balance").OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).ToList();
                lasttransactiononthisday = lasttransactiononthisday.Where(a => a.TransactionReference != "").ToList();
                if (lasttransactiononthisday.Count > 0)
                {
                    lasttransactiononthisdayfind = lasttransactiononthisday.Where(a => a.TransactionReference.Contains(TransactionReference.Substring(0, 2))).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactiononthisdayfind != null)
                    {
                        //Inv - 412023 - 008
                        // Checking Updated Transaction is less or greater
                        if (String.Compare(lastcredittransactiononthisdata.TransactionReference, TransactionReference, comparisonType: StringComparison.OrdinalIgnoreCase) < 0)
                        {
                            lastcredittransactiononthisdata = lasttransactiononthisdayfind;
                        }
                        else
                        {
                            lastcredittransactiononthisdata = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference, TransactionReference, comparisonType: StringComparison.OrdinalIgnoreCase) < 0).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                            if (lastcredittransactiononthisdata == null)
                            {
                                lasttransactionbefore = debittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                                lastcredittransactiononthisdata = lasttransactionbefore;
                            }
                        }
                    }
                    else
                    {
                        organizedataasorder = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) < 0).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                        if (organizedataasorder != null)
                            lastcredittransactiononthisdata = organizedataasorder;
                        else
                        {
                            lastcredittransactiononthisdata = credittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                            if (lastcredittransactiononthisdata == null)
                                lastcredittransactiononthisdata = null;
                        }
                    }

                    aftertransactionhistroyfindings = lasttransactiononthisday.Where(a => (String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0 || String.Compare(a.TransactionReference, TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0)).OrderBy(a => a.TransactionReference).FirstOrDefault();
                    if (aftertransactionhistroyfindings != null)
                    {
                        checkcredittransactiononthisdata = aftertransactionhistroyfindings;
                    }
                    else
                    {
                        transactionhistroyafter = credittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                        if (transactionhistroyafter != null)
                            checkcredittransactiononthisdata = transactionhistroyafter;
                        else
                            checkcredittransactiononthisdata = null;
                    }
                }
                else
                {
                    lasttransactionbefore = credittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactionbefore != null)
                        lastcredittransactiononthisdata = lasttransactionbefore;
                    else
                        lastcredittransactiononthisdata = null;

                    transactionhistroyafter = credittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                    if (transactionhistroyafter != null)
                        checkcredittransactiononthisdata = transactionhistroyafter;
                    else
                        checkcredittransactiononthisdata = null;
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool CheckLastTransactionDebit(string TransactionReference, DateTime transactiondate)
        {
            try
            {
                // Finding Same Day transactions
                lasttransactiononthisday = debittransactionHistories.Where(a => a.TransactionDate.Date == transactiondate.Date && a.TransactionSource != "Opening Balance").OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).ToList();
                lasttransactiononthisday = lasttransactiononthisday.Where(a => a.TransactionReference != "").ToList();
                if (lasttransactiononthisday.Count > 0)
                {
                    // Finding Same Type or Same Source transactions
                    lasttransactiononthisdayfind = lasttransactiononthisday.Where(a => a.TransactionReference.Contains(TransactionReference.Substring(0, 2))).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactiononthisdayfind != null)
                    { 
                        // Checking Updated Transaction is less or greater
                        lasttransactiononthisdata = lasttransactiononthisdayfind;
                    }
                    else
                    {
                        organizedataasorder = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) < 0).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                        if (organizedataasorder != null)
                            lasttransactiononthisdata = organizedataasorder;
                        else
                        {
                            lasttransactiononthisdata = debittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                            if (lasttransactiononthisdata == null)
                            {
                                lasttransactiononthisdata = null;
                            }
                        }
                    }

                    aftertransactionhistroyfindings = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0 || String.Compare(a.TransactionReference, TransactionReference, comparisonType: StringComparison.OrdinalIgnoreCase) > 0).OrderBy(a => a.TransactionReference).FirstOrDefault();
                    if (aftertransactionhistroyfindings != null)
                    {
                        checkdebittransactiononthisdata = aftertransactionhistroyfindings;
                    }
                    else
                    {
                        transactionhistroyafter = debittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                        if (transactionhistroyafter != null)
                        {
                            checkdebittransactiononthisdata = transactionhistroyafter;
                        }
                        else
                            checkdebittransactiononthisdata = null;
                    }
                }
                else
                {
                    lasttransactionbefore = debittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactionbefore != null)
                        lasttransactiononthisdata = lasttransactionbefore;
                    else
                        lasttransactiononthisdata = null;

                    transactionhistroyafter = debittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                    if (transactionhistroyafter != null)
                        checkdebittransactiononthisdata = transactionhistroyafter;
                    else
                        checkdebittransactiononthisdata = null;
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public static bool CheckLastTransactionCredit(string TransactionReference, DateTime transactiondate)
        {
            try
            {
                lasttransactiononthisday = credittransactionHistories.Where(a => a.TransactionDate.Date == transactiondate.Date && a.TransactionSource != "Opening Balance").OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).ToList();
                lasttransactiononthisday = lasttransactiononthisday.Where(a => a.TransactionReference != "").ToList();
                if (lasttransactiononthisday.Count > 0)
                {
                    lasttransactiononthisdayfind = lasttransactiononthisday.Where(a => a.TransactionReference.Contains(TransactionReference.Substring(0, 2))).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactiononthisdayfind != null)
                    {
                        lastcredittransactiononthisdata = lasttransactiononthisdayfind;
                    }
                    else
                    {
                        organizedataasorder = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) < 0).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                        if (organizedataasorder != null)
                            lastcredittransactiononthisdata = organizedataasorder;
                        else
                        {
                            lastcredittransactiononthisdata = credittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                            if (lastcredittransactiononthisdata == null)
                                lastcredittransactiononthisdata = null;
                        }
                    }

                    aftertransactionhistroyfindings = lasttransactiononthisday.Where(a => (String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0 || String.Compare(a.TransactionReference, TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0)).OrderBy(a => a.TransactionReference).FirstOrDefault();
                    if (aftertransactionhistroyfindings != null)
                    {
                        checkcredittransactiononthisdata = aftertransactionhistroyfindings;
                    }
                    else
                    {
                        transactionhistroyafter = credittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                        if (transactionhistroyafter != null)
                            checkcredittransactiononthisdata = transactionhistroyafter;
                        else
                            checkcredittransactiononthisdata = null;
                    }
                }
                else
                {
                    lasttransactionbefore = credittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactionbefore != null)
                        lastcredittransactiononthisdata = lasttransactionbefore;
                    else
                        lastcredittransactiononthisdata = null;

                    transactionhistroyafter = credittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                    if (transactionhistroyafter != null)
                        checkcredittransactiononthisdata = transactionhistroyafter;
                    else
                        checkcredittransactiononthisdata = null;
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool CheckLastTransactionDebitAdd(string TransactionReference, DateTime transactiondate)
        {
            try
            {
                lasttransactiononthisday = debittransactionHistories.Where(a => a.TransactionDate.Date == transactiondate.Date && a.TransactionSource != "Opening Balance").OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).ToList();
                lasttransactiononthisday = lasttransactiononthisday.Where(a => a.TransactionReference != "").ToList();
                if (lasttransactiononthisday.Count > 0)
                {
                    lasttransactiononthisdayfind = lasttransactiononthisday.Where(a => a.TransactionReference.Contains(TransactionReference.Substring(0, 2))).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactiononthisdayfind != null)
                    {
                        lasttransactiononthisdata = lasttransactiononthisdayfind;
                    }
                    else
                    {
                        organizedataasorder = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) < 0).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                        if (organizedataasorder != null)
                            lasttransactiononthisdata = organizedataasorder;
                        else
                        {
                            lasttransactiononthisdata = debittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                            if (lasttransactiononthisdata == null)
                            {
                                lasttransactiononthisdata = null;
                            }
                        }
                    }

                    aftertransactionhistroyfindings = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0).OrderBy(a => a.TransactionReference).FirstOrDefault();
                    if (aftertransactionhistroyfindings != null)
                    {
                        checkdebittransactiononthisdata = aftertransactionhistroyfindings;
                    }
                    else
                    {
                        transactionhistroyafter = debittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                        if (transactionhistroyafter != null)
                        {
                            checkdebittransactiononthisdata = transactionhistroyafter;
                        }
                        else
                            checkdebittransactiononthisdata = null;
                    }
                }
                else
                {
                    lasttransactionbefore = debittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactionbefore != null)
                        lasttransactiononthisdata = lasttransactionbefore;
                    else
                        lasttransactiononthisdata = null;

                    transactionhistroyafter = debittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                    if (transactionhistroyafter != null)
                        checkdebittransactiononthisdata = transactionhistroyafter;
                    else
                        checkdebittransactiononthisdata = null;
                }

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public static bool CheckLastTransactionCreditAdd(string TransactionReference, DateTime transactiondate)
        {
            try
            {
                lasttransactiononthisday = credittransactionHistories.Where(a => a.TransactionDate.Date == transactiondate.Date && a.TransactionSource != "Opening Balance").OrderByDescending(a => a.TransactionID).ThenByDescending(a => a.TransactionReference).ToList();
                lasttransactiononthisday = lasttransactiononthisday.Where(a => a.TransactionReference != "").ToList();
                if (lasttransactiononthisday.Count > 0)
                {
                    lasttransactiononthisdayfind = lasttransactiononthisday.Where(a => a.TransactionReference.Contains(TransactionReference.Substring(0, 2))).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactiononthisdayfind != null)
                    {
                        lastcredittransactiononthisdata = lasttransactiononthisdayfind;
                    }
                    else
                    {
                        organizedataasorder = lasttransactiononthisday.Where(a => String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) < 0).OrderByDescending(a => a.TransactionReference).FirstOrDefault();
                        if (organizedataasorder != null)
                            lastcredittransactiononthisdata = organizedataasorder;
                        else
                        {
                            lastcredittransactiononthisdata = credittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                            if (lastcredittransactiononthisdata == null)
                                lastcredittransactiononthisdata = null;
                        }
                    }

                    aftertransactionhistroyfindings = lasttransactiononthisday.Where(a => (String.Compare(a.TransactionReference.Substring(0, 2), TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0 || String.Compare(a.TransactionReference, TransactionReference.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0)).OrderBy(a => a.TransactionReference).FirstOrDefault();
                    if (aftertransactionhistroyfindings != null)
                    {
                        checkcredittransactiononthisdata = aftertransactionhistroyfindings;
                    }
                    else
                    {
                        transactionhistroyafter = credittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                        if (transactionhistroyafter != null)
                            checkcredittransactiononthisdata = transactionhistroyafter;
                        else
                            checkcredittransactiononthisdata = null;
                    }
                }
                else
                {
                    lasttransactionbefore = credittransactionHistories.Where(a => a.TransactionDate.Date < transactiondate.Date).OrderByDescending(a => a.TransactionDate).ThenByDescending(a => a.TransactionReference).FirstOrDefault();
                    if (lasttransactionbefore != null)
                        lastcredittransactiononthisdata = lasttransactionbefore;
                    else
                        lastcredittransactiononthisdata = null;

                    transactionhistroyafter = credittransactionHistories.Where(a => a.TransactionDate.Date > transactiondate.Date).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).FirstOrDefault();
                    if (transactionhistroyafter != null)
                        checkcredittransactiononthisdata = transactionhistroyafter;
                    else
                        checkcredittransactiononthisdata = null;
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool AddTransactions(int DebitLedgerID, int CreditLedgerID, DateTime transactiondate, double DebitAmount, double CreditAmount, string TransactionID, string TransactionSource, int ReferenceID, string username, string Remarks, string TransactionReference)
        {
            transactionHistories = HotelBookingDBAccess.GetallTransactionHistory();

            using (HotelBookingContexts databaseContext = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseContext.Database.BeginTransaction())
                {
                    try
                    {
                        string debitnature = "";
                        string creditnature = "";
                        bool checkafterdebit = true;

                        var debitledgerinfo = databaseContext.ledgers.Where(a => a.PkLedgerId == DebitLedgerID).FirstOrDefault();

                        debitnature = debitledgerinfo.Nature;
                        var creditledgerinfo = databaseContext.ledgers.Where(a => a.PkLedgerId == CreditLedgerID).FirstOrDefault();
                        creditnature = creditledgerinfo.Nature;
                        #region Debit transaction

                        string debitTransactiontype = "Dr";

                        var debitinforamtion = databaseContext.ledgers.Where(m => m.PkLedgerId == debitledgerinfo.PkLedgerId).FirstOrDefault();
                        if (debitinforamtion != null)
                        {
                            #region Ledger Adjustment
                            debitinforamtion.OpeningBalance = debitledgerinfo.ClosingBalance;
                            debitinforamtion.ClosingBalance = debitTransactiontype == debitnature ? debitinforamtion.OpeningBalance + DebitAmount : debitinforamtion.OpeningBalance - DebitAmount;
                            debitinforamtion.UpdatedAt = DateTime.Now;
                            debitinforamtion.UpdatedBy = username;
                            databaseContext.SaveChanges();

                            #endregion


                            #region Transaction History
                            TransactionHistory newentry = new TransactionHistory();
                            newentry.TransactionID = TransactionID;
                            newentry.TransactionDate = transactiondate;
                            newentry.TransactionType = debitTransactiontype;
                            newentry.TransactionSource = TransactionSource;
                            newentry.TransactionReference = TransactionReference;
                            newentry.AccountID = creditledgerinfo.PkLedgerId;
                            newentry.Remarks = Remarks;
                            newentry.ReferenceID = ReferenceID;
                            newentry.Debit = DebitAmount;
                            newentry.Credit = 0;

                            debittransactionHistories = transactionHistories.Where(a => a.LedgerID == debitinforamtion.PkLedgerId).ToList();


                            var checkdebit = CheckLastTransactionDebitAdd(TransactionReference, transactiondate);
                            if (checkdebit)
                            {
                                if (checkdebittransactiononthisdata == null)
                                {
                                    newentry.OpeningBalance = debitinforamtion.OpeningBalance;
                                    newentry.ClosingBalance = debitinforamtion.ClosingBalance;
                                }
                                else
                                {
                                    if (lasttransactiononthisdata != null)
                                    {
                                        newentry.OpeningBalance = lasttransactiononthisdata.ClosingBalance;
                                        newentry.ClosingBalance = debitTransactiontype == debitnature ? newentry.OpeningBalance + DebitAmount : newentry.OpeningBalance - DebitAmount;
                                    }
                                    else
                                    {
                                        newentry.OpeningBalance = debitinforamtion.AccountOpeningBalance;
                                        newentry.ClosingBalance = debitTransactiontype == debitnature ? newentry.OpeningBalance + DebitAmount : newentry.OpeningBalance - DebitAmount;
                                    }
                                }


                                newentry.LedgerID = debitinforamtion.PkLedgerId;
                                newentry.CreatedAt = System.DateTime.Now;
                                newentry.CreatedBy = username;
                                newentry.UpdatedBy = "";
                                newentry.UpdatedAt = System.DateTime.Now;

                                databaseContext.transactionhistory.Add(newentry);
                                databaseContext.SaveChanges();

                                if (checkdebittransactiononthisdata != null)
                                {
                                    checkafterdebit = AdjustTransactionHistoryAdd(transactiondate, debitinforamtion.PkLedgerId, newentry.ClosingBalance, TransactionReference);
                                }
                            }
                            #endregion

                        }
                        #endregion
                        #region Credit Transaction

                        string creditTransactiontype = "Cr";

                        var crditinfo = databaseContext.ledgers.Where(m => m.PkLedgerId == creditledgerinfo.PkLedgerId).FirstOrDefault();
                        if (crditinfo != null)
                        {
                            #region Ledger Adjustment
                            crditinfo.OpeningBalance = creditledgerinfo.ClosingBalance;
                            crditinfo.ClosingBalance = creditTransactiontype == creditnature ? crditinfo.OpeningBalance + CreditAmount : crditinfo.OpeningBalance - CreditAmount;
                            crditinfo.UpdatedAt = DateTime.Now;
                            crditinfo.UpdatedBy = username;
                            databaseContext.SaveChanges();

                            #endregion


                            #region Transaction History
                            TransactionHistory newentry = new TransactionHistory();
                            newentry.TransactionID = TransactionID;
                            newentry.TransactionDate = transactiondate;
                            newentry.TransactionType = creditTransactiontype;
                            newentry.TransactionSource = TransactionSource;
                            newentry.TransactionReference = TransactionReference;
                            newentry.AccountID = debitledgerinfo.PkLedgerId;
                            newentry.Remarks = Remarks;
                            newentry.ReferenceID = ReferenceID;
                            newentry.Debit = 0;
                            newentry.Credit = CreditAmount;


                            credittransactionHistories = transactionHistories.Where(a => a.LedgerID == crditinfo.PkLedgerId).ToList();


                            var checkcredit = CheckLastTransactionCreditAdd(TransactionReference, transactiondate);
                            if (checkcredit)
                            {
                                if (checkcredittransactiononthisdata == null)
                                {
                                    newentry.OpeningBalance = crditinfo.OpeningBalance;
                                    newentry.ClosingBalance = crditinfo.ClosingBalance;
                                }
                                else
                                {
                                    if (lastcredittransactiononthisdata != null)
                                    {
                                        newentry.OpeningBalance = lastcredittransactiononthisdata.ClosingBalance;
                                        newentry.ClosingBalance = creditTransactiontype == creditnature ? newentry.OpeningBalance + CreditAmount : newentry.OpeningBalance - CreditAmount;
                                    }
                                    else
                                    {
                                        newentry.OpeningBalance = crditinfo.AccountOpeningBalance;
                                        newentry.ClosingBalance = creditTransactiontype == creditnature ? newentry.OpeningBalance + CreditAmount : newentry.OpeningBalance - CreditAmount;
                                    }
                                }

                                newentry.LedgerID = crditinfo.PkLedgerId;
                                newentry.CreatedAt = System.DateTime.Now;
                                newentry.CreatedBy = username;
                                newentry.UpdatedBy = "";
                                newentry.UpdatedAt = System.DateTime.Now;

                                databaseContext.transactionhistory.Add(newentry);
                                databaseContext.SaveChanges();

                                bool checkaftercredit = true;

                                if (checkcredittransactiononthisdata != null)
                                {
                                    checkaftercredit = AdjustTransactionHistoryAdd(transactiondate, crditinfo.PkLedgerId, newentry.ClosingBalance, TransactionReference);
                                }


                                if (checkaftercredit && checkafterdebit)
                                {
                                    dbTran.Commit();
                                    return true;
                                }
                            }
                            #endregion
                        }
                        dbTran.Rollback();
                        return false;
                        #endregion
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        HotelBookingDBAccess.AddLogReport(ex.ToString(), "HotelBookingTransactions", "BankAccountLedgerTransactions");
                        return false;
                    }
                }
            }
        }

        public static bool UpdateTransactions(int DebitTransactionID, int CreditTransactionID, DateTime transactiondate, double DebitAmount, double CreditAmount, string username, string Remarks)
        {
            transactionHistories = HotelBookingDBAccess.GetallTransactionHistoryByTransactionID(DebitTransactionID, CreditTransactionID);
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        #region Debit transaction
                        var debittransaction = databaseModel.transactionhistory.Where(a => a.PkTransactionId == DebitTransactionID).FirstOrDefault();

                        var debitledgerinfo = databaseModel.ledgers.Where(a => a.PkLedgerId == debittransaction.LedgerID).FirstOrDefault();
                        string debitTransactionnature = "Dr";


                        debitTransactionnature = debitledgerinfo.Nature;
                        string debitTransactiontype = "Dr";
                        var debitadjustment = true;
                        var debitinforamtion = databaseModel.ledgers.Where(m => m.PkLedgerId == debitledgerinfo.PkLedgerId).FirstOrDefault();
                        if (debitinforamtion != null)
                        {
                            #region Ledger Adjustment
                            debitinforamtion.OpeningBalance = debitledgerinfo.ClosingBalance;
                            debitinforamtion.ClosingBalance = debitTransactiontype == debitTransactionnature ? debitinforamtion.OpeningBalance + DebitAmount - debittransaction.Debit : debitinforamtion.OpeningBalance - DebitAmount + debittransaction.Debit;
                            //debitinforamtion.ClosingBalance = debitTransactiontype == debitledgerinfo.Nature ? debitinforamtion.OpeningBalance + DebitAmount : debitinforamtion.OpeningBalance - DebitAmount;
                            debitinforamtion.UpdatedAt = DateTime.Now;
                            debitinforamtion.UpdatedBy = username;
                            databaseModel.SaveChanges();

                            #endregion


                            #region Transaction History
                            var debittransactionhistory = databaseModel.transactionhistory.Where(m => m.PkTransactionId == debittransaction.PkTransactionId).FirstOrDefault();
                            if (debittransactionhistory != null)
                            {
                                //debittransactionhistory.TransactionDate = transactiondate;
                                debittransactionhistory.Remarks = Remarks;
                                if (debittransactionhistory.Debit != DebitAmount)
                                {
                                    debittransactionhistory.Debit = DebitAmount;
                                    debittransactionhistory.Credit = 0;

                                    debittransactionHistories = transactionHistories.Where(a => a.LedgerID == debitinforamtion.PkLedgerId && a.PkTransactionId != debittransaction.PkTransactionId).ToList();
                                    var checkdebit = CheckLastTransactionDebit(debittransaction.TransactionReference, transactiondate);

                                    if (checkdebit)
                                    {
                                        debittransactionhistory.ClosingBalance = debitTransactiontype == debitTransactionnature ? debittransactionhistory.OpeningBalance + DebitAmount : debittransactionhistory.OpeningBalance - DebitAmount;
                                        debittransactionhistory.UpdatedBy = username;
                                        debittransactionhistory.UpdatedAt = System.DateTime.Now;
                                        databaseModel.SaveChanges();

                                        if (checkdebittransactiononthisdata != null)
                                        {
                                            debitadjustment = AdjustTransactionHistoryUpdate(transactiondate, DebitTransactionID, debittransaction.LedgerID, debittransactionhistory.ClosingBalance, debittransactionhistory.TransactionReference);
                                        }
                                    }
                                }
                                else
                                {
                                    debittransactionhistory.UpdatedBy = username;
                                    debittransactionhistory.UpdatedAt = System.DateTime.Now;
                                    databaseModel.SaveChanges();
                                    debitadjustment = true;
                                }
                            }


                            #endregion

                        }
                        else
                        {
                            dbTran.Rollback();
                            return false;
                        }
                        #endregion
                        #region Credit Transaction
                        var credittransaction = databaseModel.transactionhistory.Where(a => a.PkTransactionId == CreditTransactionID).FirstOrDefault();
                        var creditledgerinfo = databaseModel.ledgers.Where(a => a.PkLedgerId == credittransaction.LedgerID).FirstOrDefault();

                        string creditTransactiontype = "Cr";
                        string transactionnature = "";


                        transactionnature = creditledgerinfo.Nature;

                        var creditadjustment = true;
                        var crditinfo = databaseModel.ledgers.Where(m => m.PkLedgerId == creditledgerinfo.PkLedgerId).FirstOrDefault();
                        if (crditinfo != null)
                        {
                            #region Ledger Adjustment
                            crditinfo.OpeningBalance = creditledgerinfo.ClosingBalance;
                            crditinfo.ClosingBalance = creditTransactiontype == transactionnature ? crditinfo.OpeningBalance + CreditAmount - credittransaction.Credit : crditinfo.OpeningBalance - CreditAmount + credittransaction.Credit;
                            //crditinfo.ClosingBalance = creditTransactiontype == creditledgerinfo.Nature ? crditinfo.OpeningBalance + CreditAmount : crditinfo.OpeningBalance - CreditAmount;
                            crditinfo.UpdatedAt = DateTime.Now;
                            crditinfo.UpdatedBy = username;
                            databaseModel.SaveChanges();

                            #endregion


                            #region Transaction History
                            var credithistory = databaseModel.transactionhistory.Where(m => m.PkTransactionId == credittransaction.PkTransactionId).FirstOrDefault();
                            if (credithistory != null)
                            {
                                //credithistory.TransactionDate = transactiondate;
                                credithistory.Remarks = Remarks;
                                if (credithistory.Credit != CreditAmount)
                                {
                                    credithistory.Debit = 0;
                                    credithistory.Credit = CreditAmount;

                                    credittransactionHistories = transactionHistories.Where(a => a.LedgerID == crditinfo.PkLedgerId && a.PkTransactionId != credittransaction.PkTransactionId).ToList();
                                    var checkcredit = CheckLastTransactionCredit(credithistory.TransactionReference, transactiondate);

                                    if (checkcredit)
                                    {
                                        credithistory.ClosingBalance = creditTransactiontype == transactionnature ? credithistory.OpeningBalance + CreditAmount : credithistory.OpeningBalance - CreditAmount;
                                        credithistory.LedgerID = crditinfo.PkLedgerId;
                                        credithistory.UpdatedBy = username;
                                        credithistory.UpdatedAt = System.DateTime.Now;
                                        databaseModel.SaveChanges();

                                        if (checkcredittransactiononthisdata != null)
                                        {
                                            creditadjustment = AdjustTransactionHistoryUpdate(transactiondate, credittransaction.PkTransactionId, crditinfo.PkLedgerId, credithistory.ClosingBalance, credithistory.TransactionReference);
                                        }
                                    }
                                }
                                else
                                {
                                    credithistory.UpdatedBy = username;
                                    credithistory.UpdatedAt = System.DateTime.Now;
                                    databaseModel.SaveChanges();
                                    creditadjustment = true;
                                }


                            }


                            #endregion

                            if (debitadjustment == true && creditadjustment == true)
                            {
                                dbTran.Commit();
                                return true;
                            }
                            else
                            {
                                dbTran.Rollback();
                                return false;
                            }
                        }
                        else
                        {
                            dbTran.Rollback();
                            return false;
                        }
                        #endregion
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        HotelBookingDBAccess.AddLogReport(ex.ToString(), "HotelBookingTransactions", "BankAccountLedgerTransactions");
                        return false;
                    }
                }
            }
        }

        public static bool DeleteTransactions(int DebitTransactionID, int CreditTransactionID, string username)
        {
            transactionHistories = HotelBookingDBAccess.GetallTransactionHistoryByTransactionID(DebitTransactionID, CreditTransactionID);
            using (HotelBookingContexts databaseContext = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseContext.Database.BeginTransaction())
                {

                    try
                    {
                        string debitnature = "";
                        string creditnature = "";

                        #region Delete Debit transaction 
                        var debittransaction = databaseContext.transactionhistory.Where(a => a.PkTransactionId == DebitTransactionID).FirstOrDefault();

                        var ledgerinfo = databaseContext.ledgers.Where(a => a.PkLedgerId == debittransaction.LedgerID).FirstOrDefault();

                        debitnature = ledgerinfo.Nature;
                        string Transactiontype = "Dr";
                        var debitadjustmentremove = true;
                        var debitledgers = databaseContext.ledgers.Where(m => m.PkLedgerId == ledgerinfo.PkLedgerId).FirstOrDefault();
                        if (debitledgers != null)
                        {
                            debitledgers.OpeningBalance = ledgerinfo.ClosingBalance;
                            debitledgers.ClosingBalance = Transactiontype == debitnature ? debitledgers.OpeningBalance - debittransaction.Debit : debitledgers.OpeningBalance + debittransaction.Debit;
                            debitledgers.UpdatedAt = DateTime.Now;
                            debitledgers.UpdatedBy = username;
                            databaseContext.SaveChanges();

                            var debittransactionhistory = databaseContext.transactionhistory.Where(m => m.PkTransactionId == debittransaction.PkTransactionId).FirstOrDefault();
                            if (debittransactionhistory != null)
                            {
                                double openingdebitbalance = 0.00;

                                debittransactionHistories = transactionHistories.Where(a => a.LedgerID == debittransaction.LedgerID && a.PkTransactionId != debittransaction.PkTransactionId).ToList();
                                var checkdebit = CheckLastTransactionDebit(debittransaction.TransactionReference, debittransaction.TransactionDate);
                                if (checkdebit)
                                {
                                    openingdebitbalance = debittransactionhistory.OpeningBalance;

                                    databaseContext.transactionhistory.Remove(debittransactionhistory);
                                    databaseContext.SaveChanges();
                                    if (checkdebittransactiononthisdata != null)
                                    {
                                        debitadjustmentremove = AdjustTransactionHistoryUpdate(debittransactionhistory.TransactionDate, DebitTransactionID, debittransaction.LedgerID, openingdebitbalance, debittransaction.TransactionReference);
                                    }
                                }

                            }
                            else
                            {
                                dbTran.Rollback();
                                return false;
                            }

                        }
                        else
                        {
                            dbTran.Rollback();
                            return false;
                        }

                        #endregion
                        #region Delete Credit transaction 
                        var credittransaction = databaseContext.transactionhistory.Where(a => a.PkTransactionId == CreditTransactionID).FirstOrDefault();

                        var creditledgerinfo = databaseContext.ledgers.Where(a => a.PkLedgerId == credittransaction.LedgerID).FirstOrDefault();

                        creditnature = creditledgerinfo.Nature;

                        string creditTransactiontype = "Cr";
                        var creditadjustmentremove = true;
                        var creditledgers = databaseContext.ledgers.Where(m => m.PkLedgerId == creditledgerinfo.PkLedgerId).FirstOrDefault();
                        if (creditledgers != null)
                        {
                            creditledgers.OpeningBalance = creditledgerinfo.ClosingBalance;
                            creditledgers.ClosingBalance = creditTransactiontype == creditnature ? creditledgers.OpeningBalance - credittransaction.Credit : creditledgers.OpeningBalance + credittransaction.Credit;
                            creditledgers.UpdatedAt = DateTime.Now;
                            creditledgers.UpdatedBy = username;
                            databaseContext.SaveChanges();

                            var credittransactionhistory = databaseContext.transactionhistory.Where(m => m.PkTransactionId == credittransaction.PkTransactionId).FirstOrDefault();
                            if (credittransactionhistory != null)
                            {
                                double creditopeingbalance = 0.00;
                                credittransactionHistories = transactionHistories.Where(a => a.LedgerID == credittransaction.LedgerID && a.PkTransactionId != credittransaction.PkTransactionId).ToList();
                                var checkcredit = CheckLastTransactionCredit(credittransactionhistory.TransactionReference, credittransactionhistory.TransactionDate);
                                if (checkcredit)
                                {
                                    creditopeingbalance = credittransactionhistory.OpeningBalance;
                                    databaseContext.transactionhistory.Remove(credittransactionhistory);
                                    databaseContext.SaveChanges();

                                    if (checkcredittransactiononthisdata != null)
                                    {
                                        creditadjustmentremove = AdjustTransactionHistoryUpdate(credittransactionhistory.TransactionDate, credittransactionhistory.PkTransactionId, creditledgers.PkLedgerId, creditopeingbalance, credittransactionhistory.TransactionReference);
                                    }

                                    if (debitadjustmentremove && creditadjustmentremove)
                                    {
                                        dbTran.Commit();
                                        return true;
                                    }
                                }

                            }
                        }
                        dbTran.Rollback();
                        return false;
                        #endregion

                    }
                    catch (DbEntityValidationException ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        HotelBookingDBAccess.AddLogReport(ex.ToString(), "HotelBookingTransactions", "BankAccountLedgerTransactions");
                        return false;
                    }
                }
            }
        }

        public static bool UpdateDebitLedgerTransactions(int PkTransactionID, DateTime transactiondate, int LedgerID, double newamount, string username, string Remarks)
        {
            transactionHistories = HotelBookingDBAccess.GetallTransactionHistoryByLedgerTransactionID(LedgerID, PkTransactionID);
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {

                        var transaction = databaseModel.transactionhistory.Where(a => a.PkTransactionId == PkTransactionID).FirstOrDefault();
                        string debitnature = "";
                        var debitledgerinfo = databaseModel.ledgers.Where(a => a.PkLedgerId == transaction.LedgerID).FirstOrDefault();

                        debitnature = debitledgerinfo.Nature;
                        string debitTransactiontype = "Dr";

                        var debitinforamtion = databaseModel.ledgers.Where(m => m.PkLedgerId == debitledgerinfo.PkLedgerId).FirstOrDefault();
                        if (debitinforamtion != null)
                        {
                            #region Ledger Adjustment
                            debitinforamtion.OpeningBalance = debitledgerinfo.ClosingBalance;
                            debitinforamtion.ClosingBalance = debitTransactiontype == debitnature ? debitinforamtion.OpeningBalance - transaction.Debit : debitinforamtion.OpeningBalance + transaction.Debit;
                            debitinforamtion.UpdatedAt = DateTime.Now;
                            debitinforamtion.UpdatedBy = username;
                            databaseModel.SaveChanges();

                            #endregion
                            double previousledgeropning = 0.00;
                            debittransactionHistories = transactionHistories.Where(a => a.LedgerID == debitinforamtion.PkLedgerId && a.PkTransactionId != PkTransactionID).ToList();
                            var checkdebit = CheckLastTransactionDebit(transaction.TransactionReference, transaction.TransactionDate);

                            if (checkdebit)
                            {
                                //if (lasttransactiononthisdata != null)
                                //{
                                //    previousledgeropning = lasttransactiononthisdata.ClosingBalance;
                                //}
                                //else
                                //{

                                //}
                                previousledgeropning = transaction.OpeningBalance;

                                var preledger = AdjustTransactionHistoryUpdate(transaction.TransactionDate, PkTransactionID, debitledgerinfo.PkLedgerId, previousledgeropning, transaction.TransactionReference);
                                if (preledger)
                                {
                                    var newdebitinforamtion = databaseModel.ledgers.Where(m => m.PkLedgerId == LedgerID).FirstOrDefault();
                                    if (newdebitinforamtion != null)
                                    {
                                        #region Ledger Adjustment
                                        newdebitinforamtion.OpeningBalance = newdebitinforamtion.ClosingBalance;
                                        newdebitinforamtion.ClosingBalance = debitTransactiontype == newdebitinforamtion.Nature ? newdebitinforamtion.OpeningBalance + newamount : newdebitinforamtion.OpeningBalance - newamount;
                                        newdebitinforamtion.UpdatedAt = DateTime.Now;
                                        newdebitinforamtion.UpdatedBy = username;
                                        databaseModel.SaveChanges();

                                        #endregion

                                        #region Transaction History
                                        var debittransactionhistory = databaseModel.transactionhistory.Where(m => m.PkTransactionId == PkTransactionID).FirstOrDefault();
                                        if (debittransactionhistory != null)
                                        {
                                            debittransactionhistory.PkTransactionId = PkTransactionID;
                                            debittransactionhistory.TransactionDate = transactiondate;
                                            //debittransactionhistory.Remarks = Remarks;
                                            debittransactionhistory.Debit = newamount;
                                            debittransactionhistory.Credit = 0;
                                            debittransactionhistory.LedgerID = newdebitinforamtion.PkLedgerId;

                                            debittransactionHistories = transactionHistories.Where(a => a.LedgerID == newdebitinforamtion.PkLedgerId).ToList();

                                            var checkdebit1 = CheckLastTransactionDebitUpdate(debittransactionhistory.TransactionReference, transactiondate);
                                            if (checkdebit1)
                                            {
                                                if (checkdebittransactiononthisdata == null)
                                                {
                                                    debittransactionhistory.OpeningBalance = newdebitinforamtion.OpeningBalance;
                                                    debittransactionhistory.ClosingBalance = newdebitinforamtion.ClosingBalance;
                                                }
                                                else
                                                {
                                                    if (lasttransactiononthisdata != null)
                                                    {
                                                        debittransactionhistory.OpeningBalance = lasttransactiononthisdata.ClosingBalance;
                                                        debittransactionhistory.ClosingBalance = debitTransactiontype == debitnature ? debittransactionhistory.OpeningBalance + newamount : debittransactionhistory.OpeningBalance - newamount;
                                                    }
                                                    else
                                                    {
                                                        debittransactionhistory.OpeningBalance = newdebitinforamtion.AccountOpeningBalance;
                                                        debittransactionhistory.ClosingBalance = debitTransactiontype == debitnature ? debittransactionhistory.OpeningBalance + newamount : debittransactionhistory.OpeningBalance - newamount;
                                                    }

                                                }

                                                debittransactionhistory.UpdatedBy = username;
                                                debittransactionhistory.UpdatedAt = System.DateTime.Now;
                                                databaseModel.SaveChanges();

                                                var credittransaction = databaseModel.transactionhistory.Where(a => a.TransactionID == debittransactionhistory.TransactionID && a.Credit > 0 && a.TransactionType == "Cr").FirstOrDefault();
                                                credittransaction.AccountID= debittransactionhistory.LedgerID;

                                                databaseModel.SaveChanges();

                                                bool debitadjustment = true;
                                                if (checkdebittransactiononthisdata != null)
                                                {
                                                    debitadjustment = AdjustTransactionHistoryUpdate(transactiondate, PkTransactionID, LedgerID, debittransactionhistory.ClosingBalance, debittransactionhistory.TransactionReference);
                                                }

                                                if (debitadjustment)
                                                {
                                                    dbTran.Commit();
                                                    return true;
                                                }
                                            }

                                        }

                                        #endregion
                                    }

                                }
                            }

                        }
                        dbTran.Rollback();
                        return false;
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        HotelBookingDBAccess.AddLogReport(ex.ToString(), "HotelBookingTransactions", "BankAccountLedgerTransactions");
                        return false;
                    }
                }
            }
        }

        public static bool UpdateCreditLedgerTransactions(int PkTransactionID, DateTime transactiondate, int LedgerID, double newamount, string username, string Remarks)
        {
            transactionHistories = HotelBookingDBAccess.GetallTransactionHistoryByLedgerTransactionID(LedgerID, PkTransactionID);
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {

                        var transaction = databaseModel.transactionhistory.Where(a => a.PkTransactionId == PkTransactionID).FirstOrDefault();
                        string creditnature = "";
                        var creditledgerinfo = databaseModel.ledgers.Where(a => a.PkLedgerId == transaction.LedgerID).FirstOrDefault();
                        string creditTransactiontype = "Cr";

                        creditnature = creditledgerinfo.Nature;
                        var creditinforamtion = databaseModel.ledgers.Where(m => m.PkLedgerId == creditledgerinfo.PkLedgerId).FirstOrDefault();
                        if (creditinforamtion != null)
                        {
                            #region Ledger Adjustment
                            creditinforamtion.OpeningBalance = creditledgerinfo.ClosingBalance;
                            creditinforamtion.ClosingBalance = creditTransactiontype == creditnature ? creditinforamtion.OpeningBalance - transaction.Credit : creditinforamtion.OpeningBalance + transaction.Credit;
                            creditinforamtion.UpdatedAt = DateTime.Now;
                            creditinforamtion.UpdatedBy = username;
                            databaseModel.SaveChanges();

                            #endregion
                            double previousledgeropning = 0.00;
                            debittransactionHistories = transactionHistories.Where(a => a.LedgerID == creditinforamtion.PkLedgerId && a.PkTransactionId != PkTransactionID).ToList();
                            var checkdebit = CheckLastTransactionDebit(transaction.TransactionReference, transaction.TransactionDate);

                            if (checkdebit)
                            {
                               
                                previousledgeropning = transaction.OpeningBalance;

                                var preledger = AdjustTransactionHistoryUpdate(transaction.TransactionDate, PkTransactionID, creditledgerinfo.PkLedgerId, previousledgeropning, transaction.TransactionReference);
                                if (preledger)
                                {
                                    var ledgerinfonew = HotelBookingDBAccess.GetLedgersInformationById(LedgerID);
                                    if (ledgerinfonew != null)
                                    {
                                        var newcreditinforamtion = databaseModel.ledgers.Where(m => m.PkLedgerId == ledgerinfonew.PkLedgerId).FirstOrDefault();
                                        if (newcreditinforamtion != null)
                                        {
                                            #region Ledger Adjustment
                                            newcreditinforamtion.OpeningBalance = ledgerinfonew.ClosingBalance;
                                            newcreditinforamtion.ClosingBalance = creditTransactiontype == creditnature ? newcreditinforamtion.OpeningBalance + newamount : newcreditinforamtion.OpeningBalance - newamount;
                                            newcreditinforamtion.UpdatedAt = DateTime.Now;
                                            newcreditinforamtion.UpdatedBy = username;
                                            databaseModel.SaveChanges();

                                            #endregion

                                            #region Transaction History
                                            var credittransactionhistory = databaseModel.transactionhistory.Where(m => m.PkTransactionId == PkTransactionID).FirstOrDefault();
                                            if (credittransactionhistory != null)
                                            {
                                                credittransactionhistory.PkTransactionId = PkTransactionID;
                                                credittransactionhistory.TransactionDate = transactiondate;
                                                //credittransactionhistory.Remarks = Remarks;
                                                credittransactionhistory.Debit = 0;
                                                credittransactionhistory.Credit = newamount;
                                                credittransactionhistory.LedgerID = newcreditinforamtion.PkLedgerId;

                                                debittransactionHistories = transactionHistories.Where(a => a.LedgerID == newcreditinforamtion.PkLedgerId).ToList();
                                                var checkdebit1 = CheckLastTransactionDebitUpdate(credittransactionhistory.TransactionReference, transactiondate);
                                                if (checkdebit1)
                                                {
                                                    if (checkdebittransactiononthisdata == null)
                                                    {
                                                        credittransactionhistory.OpeningBalance = newcreditinforamtion.OpeningBalance;
                                                        credittransactionhistory.ClosingBalance = newcreditinforamtion.ClosingBalance;
                                                    }
                                                    else
                                                    {
                                                        if (lasttransactiononthisdata != null)
                                                        {
                                                            credittransactionhistory.OpeningBalance = lasttransactiononthisdata.ClosingBalance;
                                                            credittransactionhistory.ClosingBalance = creditTransactiontype == creditnature ? credittransactionhistory.OpeningBalance + newamount : credittransactionhistory.OpeningBalance - newamount;
                                                        }
                                                        else
                                                        {
                                                            credittransactionhistory.OpeningBalance = newcreditinforamtion.AccountOpeningBalance;
                                                            credittransactionhistory.ClosingBalance = creditTransactiontype == creditnature ? credittransactionhistory.OpeningBalance + newamount : credittransactionhistory.OpeningBalance - newamount;
                                                        }

                                                    }

                                                    credittransactionhistory.UpdatedBy = username;
                                                    credittransactionhistory.UpdatedAt = System.DateTime.Now;
                                                    databaseModel.SaveChanges();

                                                    var debittransaction = databaseModel.transactionhistory.Where(a => a.TransactionID == credittransactionhistory.TransactionID && a.Debit > 0 && a.TransactionType=="Dr").FirstOrDefault();
                                                    debittransaction.AccountID = credittransactionhistory.LedgerID;

                                                    databaseModel.SaveChanges();

                                                    bool debitadjustment = true;
                                                    if (checkdebittransactiononthisdata != null)
                                                    {
                                                        debitadjustment = AdjustTransactionHistoryUpdate(transactiondate, PkTransactionID, LedgerID, credittransactionhistory.ClosingBalance, credittransactionhistory.TransactionReference);
                                                    }

                                                    if (debitadjustment)
                                                    {
                                                        dbTran.Commit();
                                                        return true;
                                                    }
                                                }

                                            }

                                            #endregion
                                        }
                                    }

                                }
                            }
                        }
                        dbTran.Rollback();
                        return false;
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        HotelBookingDBAccess.AddLogReport(ex.ToString(), "HotelBookingTransactions", "BankAccountLedgerTransactions");
                        return false;
                    }
                }
            }
        }

        public static bool AdjustTransactionHistoryAdd(DateTime trnxdate, int ledgerID, double openingbalance, string referencecode)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        double lastclosing = openingbalance;
                        bool checksameday = true;
                        try
                        {
                            transactionHistories = transactionHistories.Where(a => a.TransactionReference != "").ToList();
                            var findtranslactionsonthisday = transactionHistories.Where(a => a.LedgerID == ledgerID && a.TransactionDate.Date == trnxdate.Date && String.Compare(a.TransactionReference.Substring(0, 2), referencecode.Substring(0, 2), comparisonType: StringComparison.OrdinalIgnoreCase) > 0).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).ToList();

                            if (findtranslactionsonthisday != null && findtranslactionsonthisday.Count() > 0)
                            {
                                double lastopening = openingbalance;
                                string LedgerNature = "";

                                foreach (var item in findtranslactionsonthisday)
                                {
                                    if (item.TransactionSource == "Opening Balance")
                                    {
                                        var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                        if (v != null)
                                        {
                                            v.TransactionDate = trnxdate;
                                            databaseModel.SaveChanges();
                                        }
                                    }
                                    else
                                    {

                                        LedgerNature = item.ledgers.Nature;
                                        var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                        if (v != null)
                                        {
                                            if (item.Debit > 0)
                                            {
                                                v.OpeningBalance = lastopening;
                                                v.ClosingBalance = "Dr" == LedgerNature ? v.OpeningBalance + item.Debit : v.OpeningBalance - item.Debit;

                                            }
                                            else if (item.Credit > 0)
                                            {
                                                v.OpeningBalance = lastopening;
                                                v.ClosingBalance = "Cr" == LedgerNature ? v.OpeningBalance + item.Credit : v.OpeningBalance - item.Credit;

                                            }
                                            databaseModel.SaveChanges();

                                            lastopening = v.ClosingBalance;
                                            lastclosing = lastopening;
                                        }
                                    }
                                }

                            }
                        }
                        catch
                        {
                            checksameday = false;
                        }


                        var findtranslactionsafter = transactionHistories.Where(a => a.LedgerID == ledgerID && a.TransactionDate.Date > trnxdate.Date).ToList();

                        if (findtranslactionsafter != null && findtranslactionsafter.Count() > 0)
                        {
                            double lastopening = lastclosing;
                            string LedgerNature = "";
                            findtranslactionsafter = findtranslactionsafter.OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).ToList();
                            foreach (var item in findtranslactionsafter)
                            {
                                if (item.TransactionSource == "Opening Balance")
                                {
                                    var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                    if (v != null)
                                    {
                                        v.TransactionDate = trnxdate;
                                        databaseModel.SaveChanges();
                                    }
                                }
                                else
                                {

                                    LedgerNature = item.ledgers.Nature;
                                    var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                    if (v != null)
                                    {
                                        if (item.Debit > 0)
                                        {
                                            v.OpeningBalance = lastopening;
                                            v.ClosingBalance = "Dr" == LedgerNature ? v.OpeningBalance + item.Debit : v.OpeningBalance - item.Debit;

                                        }
                                        else if (item.Credit > 0)
                                        {
                                            v.OpeningBalance = lastopening;
                                            v.ClosingBalance = "Cr" == LedgerNature ? v.OpeningBalance + item.Credit : v.OpeningBalance - item.Credit;

                                        }
                                        databaseModel.SaveChanges();

                                        lastopening = v.ClosingBalance;
                                        lastclosing = lastopening;
                                    }
                                }
                            }
                            dbTran.Commit();
                            return true;
                        }
                        else if (checksameday)
                        {
                            dbTran.Commit();
                             return true;
                        }

                        return false;
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        return false;
                    }
                }
            }


        }

        public static bool AdjustTransactionHistoryUpdate(DateTime trnxdate, int transactionid, int ledgerID, double openingbalance, string referencecode)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        bool checklasttrans = true;

                        double lastopening = openingbalance;
                        try
                        {
                            transactionHistories = transactionHistories.Where(a => a.TransactionReference != "").ToList();
                            var findtranslactionsonthisday = transactionHistories.Where(a => a.LedgerID == ledgerID && a.TransactionDate.Date == trnxdate.Date && (String.Compare(a.TransactionReference, referencecode, comparisonType: StringComparison.OrdinalIgnoreCase) > 0)).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).ToList();
                            if (findtranslactionsonthisday != null && findtranslactionsonthisday.Count() > 0)
                            {
                                string LedgerNature = "";

                                foreach (var item in findtranslactionsonthisday)
                                {
                                    if (item.TransactionSource == "Opening Balance")
                                    {
                                        var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                        if (v != null)
                                        {
                                            v.TransactionDate = trnxdate;
                                            databaseModel.SaveChanges();
                                        }
                                    }
                                    else
                                    {

                                        LedgerNature = item.ledgers.Nature;
                                        var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                        if (v != null)
                                        {
                                            if (item.Debit > 0)
                                            {
                                                v.OpeningBalance = lastopening;
                                                v.ClosingBalance = "Dr" == LedgerNature ? v.OpeningBalance + item.Debit : v.OpeningBalance - item.Debit;

                                            }
                                            else if (item.Credit > 0)
                                            {
                                                v.OpeningBalance = lastopening;
                                                v.ClosingBalance = "Cr" == LedgerNature ? v.OpeningBalance + item.Credit : v.OpeningBalance - item.Credit;

                                            }
                                            databaseModel.SaveChanges();
                                            Log.Fatal("Check Transaction: " + v.TransactionReference + ": Opening: " + v.OpeningBalance + " :Closing: " + v.ClosingBalance, null);

                                            lastopening = v.ClosingBalance;
                                        }
                                    }
                                }

                            }

                        }
                        catch
                        {
                            checklasttrans = false;
                        }

                        var findtranslactions = transactionHistories.Where(a => a.LedgerID == ledgerID && a.TransactionDate.Date > trnxdate && a.PkTransactionId != transactionid).OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).ToList();

                        if (findtranslactions != null && findtranslactions.Count() > 0)
                        {

                            string LedgerNature = "";
                            //findtranslactions = findtranslactions.OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).ToList();
                            foreach (var item in findtranslactions)
                            {
                                if (item.TransactionSource == "Opening Balance")
                                {
                                    var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                    if (v != null)
                                    {
                                        v.TransactionDate = trnxdate;
                                        databaseModel.SaveChanges();
                                    }
                                }
                                else
                                {

                                    LedgerNature = item.ledgers.Nature;
                                    var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                    if (v != null)
                                    {
                                        if (item.Debit > 0)
                                        {
                                            v.OpeningBalance = lastopening;
                                            v.ClosingBalance = "Dr" == LedgerNature ? v.OpeningBalance + item.Debit : v.OpeningBalance - item.Debit;

                                        }
                                        else if (item.Credit > 0)
                                        {
                                            v.OpeningBalance = lastopening;
                                            v.ClosingBalance = "Cr" == LedgerNature ? v.OpeningBalance + item.Credit : v.OpeningBalance - item.Credit;

                                        }
                                        Log.Fatal("Check Transaction: " + v.TransactionReference + ": Opening: " + v.OpeningBalance + " :Closing: " + v.ClosingBalance, null);
                                        lastopening = v.ClosingBalance;

                                        databaseModel.SaveChanges();


                                    }
                                }

                            }
                            dbTran.Commit();
                            return true;
                        }
                        else if (checklasttrans == true)
                        {
                            dbTran.Commit();
                            return true;
                        }
                        return false;

                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        return false;
                    }
                }
            }
        }

        public static string RevertTransactionHistory(int ledgerID, double openingbalance, int transactionid)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {

                        var ledgerinfo = databaseModel.ledgers.Where(a => a.PkLedgerId == ledgerID).FirstOrDefault();
                        var ledgernaturess = "";

                        if (ledgerinfo != null)
                        {
                            var findtranslactions = databaseModel.transactionhistory.Where(a => a.LedgerID == ledgerID && a.PkTransactionId != transactionid).ToList();

                            double lastclosing = openingbalance;

                            if (findtranslactions != null && findtranslactions.Count() > 0)
                            {
                                double lastopening = openingbalance;

                                findtranslactions = findtranslactions.OrderBy(a => a.TransactionDate).ThenBy(a => a.TransactionReference).ToList();

                                foreach (var item in findtranslactions)
                                {
                                    var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                    if (v != null)
                                    {

                                        ledgernaturess = ledgerinfo.Nature;
                                        if (item.Debit > 0)
                                        {
                                            v.OpeningBalance = lastopening;
                                            v.ClosingBalance = "Dr" == ledgernaturess ? v.OpeningBalance + item.Debit : v.OpeningBalance - item.Debit;

                                        }
                                        else if (item.Credit > 0)
                                        {
                                            v.OpeningBalance = lastopening;
                                            v.ClosingBalance = "Cr" == ledgernaturess ? v.OpeningBalance + item.Credit : v.OpeningBalance - item.Credit;

                                        }

                                        lastopening = v.ClosingBalance;
                                        lastclosing = lastopening;
                                        databaseModel.SaveChanges();


                                    }

                                }

                            }

                            dbTran.Commit();
                            return lastclosing.ToString();
                        }
                        dbTran.Rollback();
                        return "false";
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        return "false";
                    }
                }
            }
        }

        public static string RevertTransactionHistoryCapitalAccount(int ledgerID)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var findtranslactions = databaseModel.transactionhistory.Where(a => a.LedgerID == ledgerID).ToList();

                        double lastclosing = 0;

                        if (findtranslactions.Count() > 0)
                        {
                            double lastopening = 0;

                            findtranslactions = findtranslactions.OrderBy(a => a.TransactionDate).ToList();

                            foreach (var item in findtranslactions)
                            {
                                var v = databaseModel.transactionhistory.Where(m => m.PkTransactionId == item.PkTransactionId).FirstOrDefault();
                                if (v != null)
                                {
                                    if (item.Debit > 0)
                                    {
                                        v.OpeningBalance = lastopening;
                                        v.ClosingBalance = v.OpeningBalance - item.Debit;

                                    }
                                    else if (item.Credit > 0)
                                    {
                                        v.OpeningBalance = lastopening;
                                        v.ClosingBalance = v.OpeningBalance + item.Credit;

                                    }

                                    lastopening = v.ClosingBalance;
                                    lastclosing = lastopening;
                                    databaseModel.SaveChanges();


                                }

                            }

                        }

                        dbTran.Commit();
                        return lastclosing.ToString();
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        return "false";
                    }
                }
            }
        }

        public static bool OpeningBalanceTransactions(int ledgerid, int capitalid, double openingbalance, double openingbalancecap, double closingbalancecap)
        {
            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        var ledgerinfo = databaseModel.ledgers.Where(a => a.PkLedgerId == ledgerid).FirstOrDefault();
                        HomeController home = new HomeController();
                        var TransactionID = home.GenderateTenDigitUniqueTransactionCode(System.DateTime.Now.ToString());

                        if (ledgerinfo != null)
                        {

                            TransactionHistory newentryop = new TransactionHistory();

                            newentryop.TransactionID = TransactionID;
                            newentryop.TransactionDate = System.DateTime.Now;
                            newentryop.TransactionType = ledgerinfo.Nature;
                            newentryop.AccountID = capitalid;
                            newentryop.TransactionReference = "";
                            newentryop.Remarks = "Opening Balance";
                            newentryop.TransactionSource = "Opening Balance";
                            newentryop.ReferenceID = 0;


                            if (ledgerinfo.Nature == "Dr")
                            {
                                newentryop.Debit = openingbalance;
                                newentryop.Credit = 0;
                            }
                            else
                            {
                                newentryop.Credit = openingbalance;
                                newentryop.Debit = 0;
                            }
                            newentryop.OpeningBalance = 0;
                            newentryop.ClosingBalance = openingbalance;
                            newentryop.LedgerID = ledgerinfo.PkLedgerId;
                            newentryop.CreatedAt = System.DateTime.Now;
                            newentryop.UpdatedAt = System.DateTime.Now;
                            newentryop.CreatedBy = "System";
                            newentryop.UpdatedBy = "";

                            databaseModel.transactionhistory.Add(newentryop);
                            databaseModel.SaveChanges();

                            TransactionHistory newentrycapital = new TransactionHistory();
                            newentrycapital.TransactionID = TransactionID;
                            newentrycapital.TransactionDate = System.DateTime.Now;
                            if (ledgerinfo.Nature == "Dr")
                            {
                                newentrycapital.TransactionType = "Cr";
                            }
                            else
                            {
                                newentrycapital.TransactionType = "Dr";
                            }

                            newentrycapital.AccountID = ledgerinfo.PkLedgerId;
                            newentrycapital.TransactionReference = "";
                            newentrycapital.Remarks = "Opening Balance";
                            newentrycapital.TransactionSource = "Opening Balance";
                            newentrycapital.ReferenceID = 0;

                            if (ledgerinfo.Nature == "Dr")
                            {
                                newentrycapital.Debit = 0;
                                newentrycapital.Credit = openingbalance;
                            }
                            else
                            {
                                newentrycapital.Credit = 0;
                                newentrycapital.Debit = openingbalance;
                            }


                            newentrycapital.OpeningBalance = openingbalancecap;
                            newentrycapital.ClosingBalance = closingbalancecap;
                            newentrycapital.LedgerID = capitalid;

                            newentrycapital.CreatedAt = System.DateTime.Now;
                            newentrycapital.UpdatedAt = System.DateTime.Now;
                            newentrycapital.CreatedBy = "System";
                            newentrycapital.UpdatedBy = "";

                            databaseModel.transactionhistory.Add(newentrycapital);
                            databaseModel.SaveChanges();
                            dbTran.Commit();
                            var led = RevertTransactionHistoryCapitalAccount(capitalid);


                            return true;

                        }


                        return false;
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        return false;

                    }
                }
            }

        }

        public static string UpdateOpeningBalanceTransactions(int ledgerid, int ledgertranid, int capitaltranid, double balance)
        {

            using (HotelBookingContexts databaseModel = new HotelBookingContexts())
            {
                using (DbContextTransaction dbTran = databaseModel.Database.BeginTransaction())
                {
                    try
                    {
                        transactionHistories = databaseModel.transactionhistory.Where(a => a.LedgerID == ledgerid).ToList();
                        var lowetstdate = transactionHistories.Where(a => a.LedgerID == ledgerid).OrderBy(a => a.TransactionDate).FirstOrDefault();
                        var ledgerinfo = databaseModel.transactionhistory.Include("ledgers").Where(a => a.LedgerID == ledgerid && a.TransactionSource == "Opening Balance").FirstOrDefault();

                        if (ledgerinfo != null)
                        {

                            if (ledgerinfo.TransactionType == "Dr")
                            {
                                ledgerinfo.Debit = balance;
                                ledgerinfo.Credit = 0;
                            }
                            else
                            {
                                ledgerinfo.Debit = 0;
                                ledgerinfo.Credit = balance;
                            }
                            ledgerinfo.TransactionDate = lowetstdate.TransactionDate;
                            ledgerinfo.ClosingBalance = balance;

                            ledgerinfo.UpdatedAt = System.DateTime.Now;
                            ledgerinfo.UpdatedBy = "System";
                            databaseModel.SaveChanges();

                            var capitalinfo = databaseModel.transactionhistory.Where(a => a.PkTransactionId == capitaltranid).FirstOrDefault();
                            if (capitalinfo.TransactionType == "Dr")
                            {
                                capitalinfo.Debit = balance;
                                capitalinfo.Credit = 0;
                            }
                            else
                            {
                                capitalinfo.Debit = 0;
                                capitalinfo.Credit = balance;
                            }
                            capitalinfo.UpdatedAt = System.DateTime.Now;
                            capitalinfo.UpdatedBy = "System";
                            databaseModel.SaveChanges();

                            dbTran.Commit();

                            var others = RevertTransactionHistory(ledgerid, balance, ledgerinfo.PkTransactionId);
                            var led = RevertTransactionHistoryCapitalAccount(capitalinfo.LedgerID);

                            if (others != "false" && led != "false")
                            {
                                return others;
                            }
                            else
                            {
                                dbTran.Rollback();
                            }
                        }

                        return "false";
                    }
                    catch (Exception ex)
                    {
                        Log.Fatal("log4net Fatal Level", ex);
                        dbTran.Rollback();
                        return "false";

                    }
                }
            }

        }
    }
}