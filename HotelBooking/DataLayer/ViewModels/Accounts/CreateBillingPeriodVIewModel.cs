
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelBooking.DataLayer.ViewModels.Accounts
{
    public class CreateBillingPeriodVIewModel
    {
        #region
        [Display(Name = "Billing Method Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Billing Method Name required")]
        public string BillingMethodName { get; set; }

        [Display(Name = "Prefix For")]
        public int Days { get; set; }
        #endregion
    }
}
