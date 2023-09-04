using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Accounts.AccountLedgers
{
    public class LedgerCreateViewModel
    {
        #region
        [Display(Name = "LedgerName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Ledger Name required")]
        public string LedgerName { get; set; }

        [Display(Name = "LedgerCode")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Ledger Code required")]
        public string LedgerCode { get; set; }

        [Display(Name = "LedgerParent")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Ledger Parent required")]
        public IEnumerable<SelectListItem> AllLedgerParent { get; set; }
        public int LedgerParent { get; set; }

        [Display(Name = "LedgerNature")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Ledger Nature required")]
        public IEnumerable<SelectListItem> AllNature { get; set; }
        public string LedgerNature { get; set; }

        [Display(Name = "OpeningBalance")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Opening Balance required")]
        public double OpeningBalance { get; set; }

        #endregion
    }
}