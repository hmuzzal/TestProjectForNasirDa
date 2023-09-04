using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class UserEmails
    {
        #region
        public int PkEmailId { get; set; }

        [Display(Name = "Email")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email required")]
        public string Email { get; set; }

        public bool PrimaryEmailAddress { get; set; }

        #endregion
    }
}