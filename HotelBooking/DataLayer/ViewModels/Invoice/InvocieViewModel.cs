
using HotelBooking.DataLayer.Models.Invoice;
using HotelBooking.DataLayer.ViewModels.Invoice;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.InvocieView
{
    public class InvocieViewModel
    {
        public string ReportName { get; set; }
        [Display(Name = "Date From")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Date to")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime Dateto { get; set; }

        
       
        [Display(Name = "Customers")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Customers required")]
        public IEnumerable<SelectListItem> AllCustomers { get; set; }
        public int? LedgerID { get; set; }

        public string SearchString { get; set; }

        public List<AllInvoiceViewModel> allinvoices { get; set; }

        public InvocieCreateViewModels invoicecreate { get; set; }
        public InvocieCreateViewModels invoiceupdate { get; set; }
        
       
    }
}