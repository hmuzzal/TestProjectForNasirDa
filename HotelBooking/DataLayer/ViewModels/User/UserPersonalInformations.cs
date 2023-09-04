using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class UserPersonalInformations
    {
        #region
        public int PkUserId { get; set; }

        [Display(Name = "FullName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "FullName required")]
        public string FullName { get; set; }

        
        public string UserRole { get; set; }

        [Display(Name = "ProfileImage")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "ProfileImage required")]
        public string ProfileImage { get; set; }

        
        [Display(Name = "Gender")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Gender required")]
        public IEnumerable<SelectListItem> AllGender { get; set; }
        public string Gender { get; set; }

        
        public string Password { get; set; }

        

        #endregion
    }
}