
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class UpdateUserViewModel
    {
        #region
        public int PkUserId { get; set; }

        [Display(Name = "UserName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "UserName required")]
        public string UserName { get; set; }

        [Display(Name = "FullName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "FullName required")]
        public string FullName { get; set; }

        [Display(Name = "Nickname")]
        public string NickName { get; set; }

        public IEnumerable<SelectListItem> AllUserTypes { get; set; }
        public int UserTypeID { get; set; }

        [Display(Name = "Gender")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Gender required")]
        public IEnumerable<SelectListItem> AllGenders { get; set; }
        public string GenderID { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Currency required")]
        public IEnumerable<SelectListItem> AllCurrencies { get; set; }
        public int CurrencyID { get; set; }


        public string Email { get; set; }
        public string Password { get; set; }
        #endregion
    }
}
