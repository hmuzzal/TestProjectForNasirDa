using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.User
{
    public class Users : EntityBase
    {
        #region
        [Key]
        public int PkUserId { get; set; }

        [Display(Name = "FullName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "FullName required")]
        public string FullName { get; set; }

        [Display(Name = "Email")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email required")]
        public string Email { get; set; }

        [Display(Name = "ProfileImage")]
        public string ProfileImage { get; set; }

        [Display(Name = "Gender")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Gender required")]
        public string Gender { get; set; }

        [Display(Name = "Mobile")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Mobile required")]
        public string Mobile { get; set; }

        [Display(Name = "Password")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Password required")]
        public string Password { get; set; }

        [Column(Order = 1)]
        [ForeignKey("usertype")]
        public int UserTypeID { get; set; }
        public virtual UserTypes usertype { get; set; }

        public string UserTokenConfirmation { get; set; }

        
        #endregion
    }
}