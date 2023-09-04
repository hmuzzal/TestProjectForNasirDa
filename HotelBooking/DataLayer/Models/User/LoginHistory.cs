using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.User
{
    public class LoginHistory
    {
        #region
        [Key]
        public int PkLoginId { get; set; }

        [Display(Name = "AccessTime")]
        [DataType(DataType.Date)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "AccessTime required")]
        public DateTime AccessTime { get; set; }

        [Column(Order = 1)]
        [ForeignKey("user")]
        public int UserID { get; set; }
        public virtual Users user { get; set; }

        [Display(Name = "Email")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email required")]
        public string Email { get; set; }

        [Display(Name = "CLientIPAddress")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "CLientIPAddress required")]
        public string CLientIPAddress { get; set; }

        [Display(Name = "Browser")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Browser required")]
        public string Browser { get; set; }

        [Display(Name = "OS")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "OS required")]
        public string OS { get; set; }

        [Display(Name = "AccessType")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "AccessType required")]
        public string AccessType { get; set; }
        #endregion
    }
}