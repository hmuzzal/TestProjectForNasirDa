using System;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Accounts.AccountLedgers
{
    public class AccountPurchasesReportViewModel
    {
        public string TransactionID { get; set; }

        [Display(Name = "Transaction Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime TransactionDate { get; set; }

        [Display(Name = "Transaction Details")]
        public string TransactionDetails { get; set; }

        [Display(Name = "Transaction Type")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Transaction Type required")]
        public string TransactionType { get; set; }

        [Display(Name = "Debit")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Debit required")]
        public double Debit { get; set; }

        [Display(Name = "Credit")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Credit required")]
        public double Credit { get; set; }

        public string LedgerName { get; set; }
        public int PkLedgerID { get; set; }
    }
}