using HotelBooking.DataLayer.Models.Accounts;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Accounts.AccountLedgers
{
    public class PurchaseAccountReport
    {
        public IEnumerable<SelectListItem> AllLedgers { get; set; }
        public int LedgerID { get; set; }

        [Display(Name = "Date From")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Date to")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime Dateto { get; set; }

        public List<TransactionHistory> alltransactions { get; set; }
    }
}