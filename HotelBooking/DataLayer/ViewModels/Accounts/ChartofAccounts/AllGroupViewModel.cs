using HotelBooking.DataLayer.Models.Accounts;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Accounts.ChartofAccounts
{
    public class AllGroupViewModel
    {
        #region
        public int PkGroupId { get; set; }

        [Display(Name = "GroupName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "GroupName required")]
        public string GroupName { get; set; }

        [Display(Name = "GroupParent")]
        public int GroupParent { get; set; }

        [Display(Name = "GroupIdentifier")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "GroupIdentifier required")]
        public string GroupIdentifier { get; set; }

        [Display(Name = "Nature")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Nature required")]
        public string Nature { get; set; }

        public bool Status { get; set; }
        public double TotalExpense { get; set; }
        public double TotalDeposit { get; set; }
        public double CurrentBalance { get; set; }
        public List<ChartLedgerViewModel> allledgers { get; set; }
        #endregion
    }
}