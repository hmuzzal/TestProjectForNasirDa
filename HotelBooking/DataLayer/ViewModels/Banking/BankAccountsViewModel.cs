using HotelBooking.DataLayer.Models.Banking;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Banking
{
    public class BankAccountsViewModel
    {
        #region
        public string search { get; set; }

        [Display(Name = "Date From")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Date to")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime Dateto { get; set; }

        public string ReportName { get; set; }
        public List<BankAccounts> allbankaccount { get; set; }
        public List<BankAccountsReport> allbankaccountreport { get; set; }

        public CreateBankAccountViewModel createbank { get; set; }

        public EditBankAccountViewModel updatebank { get; set; }

        #endregion
    }
}