using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HotelBooking.DataLayer.ViewModels.Accounts
{
    public class CreateTimeZoneViewModel
    {
        #region
        [Display(Name = "TimeZoneName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "TimeZoneName required")]
        public string TimeZoneName { get; set; }

        [Display(Name = "GMT Standard")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "GMT Standard required")]
        public string GMTStandard { get; set; }
        #endregion
    }
}