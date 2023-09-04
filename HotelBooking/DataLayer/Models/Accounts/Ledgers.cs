using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.Accounts
{
    public class Ledgers : EntityBase
    {
        #region
        [Key]
        public int PkLedgerId { get; set; }

        [Display(Name = "Account ID")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Account ID required")]
        public int AccountType { get; set; }

        [Display(Name = "LedgerName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "LedgerName required")]
        public string LedgerName { get; set; }

        [Display(Name = "LedgerParent")]
        public int LedgerParent { get; set; }

        [Display(Name = "LedgerCode")]
        public string LedgerCode { get; set; }

        [Display(Name = "Nature")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Nature required")]
        public string Nature { get; set; }

        [Display(Name = "AccountOpeningBalance")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "AccountOpeningBalance required")]
        public double AccountOpeningBalance { get; set; }

        [Display(Name = "OpeningBalance")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "OpeningBalance required")]
        public double OpeningBalance { get; set; }

        [Display(Name = "Closing Balance")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Closing Balance required")]
        public double ClosingBalance { get; set; }

        
        #endregion


    }
}