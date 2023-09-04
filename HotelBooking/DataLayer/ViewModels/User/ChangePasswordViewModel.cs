using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class ChangePasswordViewModel
    {
        [Display(Name = "Old Password")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Old Password required")]
        public string OldPassword { get; set; }

        [Display(Name = "New Password")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "New Password required")]
        public string NewPassword { get; set; }

        [Display(Name = "Confirm New Password")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Confirm New Password required")]
        public string ConfirmNewPassword { get; set; }
    }
}