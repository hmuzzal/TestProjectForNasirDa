using System;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.Models
{
    public class Organizations : EntityBase
    {
        #region
        [Key]
        public int PkOrganizationId { get; set; }

        [Display(Name = "OrganizationName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Organisation Name required")]
        public string OrganisationName { get; set; }

        [Display(Name = "OrganizationLogo")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Organization Logo required")]
        public string OrganizationLogo { get; set; }

        [Display(Name = "Organization Type")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Organization Type Logo required")]
        public string OrganizationType { get; set; }

        [DataType(DataType.Date)]
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
        public string Email { get; set; }

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
    }

}