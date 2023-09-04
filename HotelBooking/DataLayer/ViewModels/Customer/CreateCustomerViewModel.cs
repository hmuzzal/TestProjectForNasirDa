using System;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.CustomerView
{
    public class CreateCustomerViewModel
    {
        public int PkCustomerId { get; set; }

        [Display(Name = "Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Name required")]
        public string Name { get; set; }

        public string Email { get; set; }

        [Display(Name = "CustomerCode")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "CustomerCode required")]
        public int CustomerCode { get; set; }

        [Display(Name = "Mobile")]
        //[Required(AllowEmptyStrings = false, ErrorMessage = "Mobile required")]
        public string Mobile { get; set; }

        [Display(Name = "PresentAddress")]
        //[Required(AllowEmptyStrings = false, ErrorMessage = "PresentAddress required")]
        public string PresentAddress { get; set; }

        [Display(Name = "PermanentAddress")]
        //[Required(AllowEmptyStrings = false, ErrorMessage = "PermanentAddress required")]
        public string PermanentAddress { get; set; }
       
    }
}
