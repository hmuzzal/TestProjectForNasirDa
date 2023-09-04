using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Accounts.ChartofAccounts
{
    public class ChartofAccountsViewModels
    {
        #region
        [Display(Name = "Date From")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Date to")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime Dateto { get; set; }

        public string ReportName { get; set; }

        public List<AllGroupViewModel> allgroup { get; set; }
        #endregion
    }
}