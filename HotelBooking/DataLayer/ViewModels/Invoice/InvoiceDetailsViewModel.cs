
using HotelBooking.DataLayer.Models.Invoice;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Invoice
{
    public class InvoiceDetailsViewModel
    {
        #region
        public int PkInvoiceDetailsId { get; set; }

         public string ProfileNo { get; set; }

        public IEnumerable<SelectListItem> AllItems { get; set; }
        public int ServiceID { get; set; }

        public IEnumerable<SelectListItem> AllRoomDetails { get; set; }
        public int PkRoomDetailsId { get; set; }

        [Display(Name = "Check In")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Invoice Date required")]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Check Out")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Invoice Date required")]
        public DateTime Dateto { get; set; }

        [Display(Name = "No Of Nights")]
        public double TotalNights { get; set; }

        [Display(Name = "LEAD PAX")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Pax required")]
        public string LeadPax { get; set; }

        [Display(Name = "No Of Pax")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Pax required")]
        public int TotalPax { get; set; }
        [Display(Name = "Meal Type")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Selling Price required")]
        public string MealType { get; set; }

        [Display(Name = "Meal Per Pax")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Pax required")]
        public int MealPerPax { get; set; }

        [Display(Name = "Remarks")]
        public string Remarks { get; set; }

        [Display(Name = "Quantity")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Quantity required")]
        public double Quantity { get; set; }

        [Display(Name = "Selling Price")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Selling Price required")]
        public double SellingPrice { get; set; }


        [Display(Name = "Total Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Total Amount required")]
        public double TotalAmount { get; set; }

        #endregion
    }
}
