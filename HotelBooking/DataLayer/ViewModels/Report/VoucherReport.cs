using HotelBooking.DataLayer.Models.Accounts;
using HotelBooking.DataLayer.Models.Invoice;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Report
{
    public class VoucherReport
    {

        #region
        public IEnumerable<SelectListItem> AllInvoiceNo { get; set; }
        public string CustomerCode { get; set; }
        public IEnumerable<SelectListItem> AllReportTypes { get; set; }
        public string ReportName { get; set; }
        public int ReportTypeID { get; set; }
        


        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime ReservationDate { get; set; }



        [Display(Name = "Quantity")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Quantity required")]
        public double Quantity { get; set; }

        [Display(Name = "Room Details")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Room Details required")]
        public string Details { get; set; }

        [Display(Name = "Check In")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Check Out")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime Dateto { get; set; }

        [Display(Name = "No Of Nights")]
        public double TotalNights { get; set; }

        [Display(Name = "No Of Pax")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Pax required")]
        public int TotalPax { get; set; }

        [Display(Name = "Selling Price")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Selling Price required")]
        public double SellingPrice { get; set; }

        [Display(Name = "Meal Type")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Selling Price required")]
        public double MealType { get; set; }

        [Display(Name = "Meal Per Pax")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Pax required")]
        public int MealPerPax { get; set; }

        [Display(Name = "Total Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Total Amount required")]
        public double TotalAmount { get; set; }
        #endregion
    }
}