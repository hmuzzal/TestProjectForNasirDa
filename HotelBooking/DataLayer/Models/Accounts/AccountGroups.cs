using System;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.Models.Accounts
{
    public class AccountGroups :EntityBase
    {
        #region
        [Key]
        public int PkGroupId { get; set; }

        [Display(Name = "GroupName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "GroupName required")]
        public string GroupName { get; set; }

        [Display(Name = "GroupParent")]
        public int? GroupParent { get; set; }

        [Display(Name = "GroupIdentifier")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "GroupIdentifier required")]
        public string GroupIdentifier { get; set; }

        [Display(Name = "Nature")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Nature required")]
        public string Nature { get; set; }

        [Display(Name = "Group Type")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Group Type required")]
        public int GroupType { get; set; }

        [Display(Name = "Posted To")]
        public string PostedTo { get; set; }

        
        #endregion
    }
}