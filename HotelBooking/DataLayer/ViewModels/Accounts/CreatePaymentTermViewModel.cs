using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HotelBooking.DataLayer.ViewModels.Accounts
{
    public class CreatePaymentTermViewModel
    {
        #region
        [Display(Name = "Payment Terms Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Payment Terms Name required")]
        public string PaymentTermsName { get; set; }

        [Display(Name = "Prefix For")]
        public int Days { get; set; }
        #endregion
    }
}