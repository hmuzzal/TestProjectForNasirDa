using System;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.Models.User
{
    public class UserTypes : EntityBase
    {
        #region

        [Key]
        public int PkUserTypelId { get; set; }

        [Display(Name = "User Type Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "User Type Name required")]
        public string UserTypeName { get; set; }

        
        #endregion
    }
}