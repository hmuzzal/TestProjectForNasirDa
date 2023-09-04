using System;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class UsersList
    {
        public int PkUserId { get; set; }


        [Display(Name = "FullName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "FullName required")]
        public string FullName { get; set; }

        [Display(Name = "ProfileImage")]
        public string ProfileImage { get; set; }
       
        [Display(Name = "UserType")]
        public string UserType { get; set; }

        [Display(Name = "Gender")]
        public string Gender { get; set; }

        [Display(Name = "Email")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email required")]
        public string Email { get; set; }

        [Display(Name = "Mobile")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Mobile required")]
        public string Mobile { get; set; }


        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime CreatedAt { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime UpdatedAt { get; set; }

        public string DeletedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string CreatedBy { get; set; }
    }
}