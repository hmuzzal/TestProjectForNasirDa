using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Accounts.AccountGroup
{
    public class AllAccountGroupViewModel
    {
        #region
        public int PkGroupId { get; set; }

        [Display(Name = "GroupName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "GroupName required")]
        public string GroupName { get; set; }

        [Display(Name = "GroupParent")]
        public string GroupParent { get; set; }

        [Display(Name = "GroupIdentifier")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "GroupIdentifier required")]
        public string GroupIdentifier { get; set; }

        [Display(Name = "Nature")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Nature required")]
        public string Nature { get; set; }

        public bool Status { get; set; }

        #endregion
    }
}