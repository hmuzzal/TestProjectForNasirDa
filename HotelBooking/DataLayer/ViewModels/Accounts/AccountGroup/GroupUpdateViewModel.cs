using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Accounts.AccountGroup
{
    public class GroupUpdateViewModel
    {
        #region
        public int PkGroupId { get; set; }

        [Display(Name = "GroupName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "GroupName required")]
        public string GroupName { get; set; }

        [Display(Name = "GroupParent")]
        public IEnumerable<SelectListItem> AllGroupParent { get; set; }
        public int? GroupParent { get; set; }

        public bool Status { get; set; }

        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime CreatedAt { get; set; }
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime UpdatedAt { get; set; }

        public string DeletedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string CreatedBy { get; set; }
        #endregion
    }
}