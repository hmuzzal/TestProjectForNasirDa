
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class CreateUserViewModel
    {
        #region
        public int PkUserId { get; set; }

        [Display(Name = "FullName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "FullName required")]
        public string FullName { get; set; }

        [Display(Name = "Email")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email required")]
        public string Email { get; set; }

        [Display(Name = "Mobile")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Mobile required")]
        public string Mobile { get; set; }


        [Display(Name = "Password")]
        public string Password { get; set; }

        public IEnumerable<SelectListItem> AllUserTypes { get; set; }
        public int UserTypeID { get; set; }

        [Display(Name = "Gender")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Gender required")]
        public IEnumerable<SelectListItem> AllGenders { get; set; }
        public string GenderID { get; set; }

        
        
        #endregion
    }
}
