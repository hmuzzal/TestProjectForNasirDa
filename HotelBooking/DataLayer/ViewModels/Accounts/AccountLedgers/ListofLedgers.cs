using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Accounts.AccountLedgers
{
    public class ListofLedgers
    {
        #region
        public int PkLedgerId { get; set; }

        [Display(Name = "LedgerName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "LedgerName required")]
        public string LedgerName { get; set; }

        [Display(Name = "LedgerParent")]
        public string LedgerParent { get; set; }

        [Display(Name = "LedgerCode")]
        public string LedgerCode { get; set; }

        [Display(Name = "Nature")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Nature required")]
        public string Nature { get; set; }

        [Display(Name = "OpeningBalance")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "OpeningBalance required")]
        public double OpeningBalance { get; set; }

        [Display(Name = "ClosingBalance")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "ClosingBalance required")]
        public double ClosingBalance { get; set; }

        public bool Status { get; set; }

       
        #endregion
    }
}