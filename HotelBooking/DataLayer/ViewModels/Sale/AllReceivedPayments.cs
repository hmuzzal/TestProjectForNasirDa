using HotelBooking.DataLayer.ViewModels.Sale;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Sale
{
    public class AllReceivedPayments
    {
        #region
        public string SearchString { get; set; }

        [Display(Name = "Date From")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Date to")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime Dateto { get; set; }
        public string ReportName { get; set; }

        
        [Display(Name = "Customers")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Customers required")]
        public IEnumerable<SelectListItem> AllCustomers { get; set; }
        public int? LedgerID { get; set; }

        public List<AllPaymentsViewModel> allpayments { get; set; }

        public PaymentReceivedViewModel createpaymentreceived { get; set; }
        public PaymentReceivedViewModel updatepaymentreceived { get; set; }
       
        public string AttachedDocuments { get; set; }

        public string AttachedDocumentUpdate { get; set; }
        #endregion
    }
}