
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Organization
{
    public class OrganizationCreateViewModel
    {
        #region Organization
        [Display(Name = "OrganizationName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Organisation Name required")]
        public string OrganisationName { get; set; }

        [Display(Name = "Organization Type")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Organization Type required")]
        public IEnumerable<SelectListItem> AllOrganizationType { get; set; }
        public string OrganizationTypeID { get; set; }

        [Display(Name = "OrganizationLogo")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Organization Logo required")]
        public string OrganizationLogo { get; set; }

        [DataType(System.ComponentModel.DataAnnotations.DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime RegistrationDate { get; set; }

        [Display(Name = "Phone")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Phone required")]
        public string Phone { get; set; }

        [Display(Name = "Mobile")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Mobile required")]
        public string Mobile { get; set; }

        [Display(Name = "Email")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email required")]
        public string OrganizationEmail { get; set; }

        [Display(Name = "Address")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Address required")]
        public string Address { get; set; }

        [Display(Name = "Currency")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Currency required")]
        public string Currency { get; set; }

        [Display(Name = "CurrencySymbol")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "CurrencySymbol required")]
        public string CurrencySymbol { get; set; }

        #endregion

        #region User
        
        [Display(Name = "FullName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "FullName required")]
        public string FullName { get; set; }

        [Display(Name = "Email")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email required")]
        public string Email { get; set; }

        [Display(Name = "Password")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Password required")]
        public string Password { get; set; }

        [Display(Name = "ProfileImage")]
        public string ProfileImage { get; set; }

        [Display(Name = "Gender")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Gender required")]
        public IEnumerable<SelectListItem> AllGenders { get; set; }
        public string GenderID { get; set; }
        #endregion
    }
}
