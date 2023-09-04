
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HotelBooking.DataLayer.ViewModels.Statement
{
    public class AccountStatementDetails
    {
        #region

        [Display(Name = "Transaction Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime TransactionDate { get; set; }

        public string AccountNumber { get; set; }
        public string Description { get; set; }
        public string Carieer { get; set; }

        public string BillNo { get; set; }

      
        [Display(Name = "Debit")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Debit required")]
        public double Debit { get; set; }

        [Display(Name = "Credit")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Credit required")]
        public double Credit { get; set; }


        [Display(Name = "Balance")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Balance required")]
        public double Balance { get; set; }

        #endregion
        
    }
}