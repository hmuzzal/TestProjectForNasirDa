using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class UserMobileNumbers
    {
        #region
        public int PkMobileId { get; set; }

        [Display(Name = "MobileNumber")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "MobileNumber required")]
        public string MobileNumber { get; set; }

        public bool PrimaryMobileNumber { get; set; }

        #endregion
    }
}