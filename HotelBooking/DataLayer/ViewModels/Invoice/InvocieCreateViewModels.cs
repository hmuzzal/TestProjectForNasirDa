using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Invoice
{
    public class InvocieCreateViewModels
    {
        #region
        public int PkInvoiceId { get; set; }

        [Display(Name = "Invoice No")]
        public string InvoiceNo { get; set; }

        [Display(Name = "Nationality")]
        public string CustomerNationality { get; set; }
        public string CustomerCode { get; set; }
        public string Name { get; set; }
        public string CustomerMobile { get; set; }

        [Display(Name = "Invoice Date")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Invoice Date required")]
        public DateTime InvoiceDate { get; set; }

        public IEnumerable<SelectListItem> AllPaymentTypes { get; set; }
        public string PaymentTypeID { get; set; }

        public IEnumerable<SelectListItem> AllDebitLedgers { get; set; }
        public int DebitLedgerID { get; set; }


        [Display(Name = "Reference")]
        public string Reference { get; set; }

        [Display(Name = "Discount Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Discount Amount required")]
        public double DiscountAmount { get; set; }


        [Display(Name = "Sub Total Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Sub Total Amount required")]
        public double SubTotalAmount { get; set; }


        [Display(Name = "Total Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Total Amount required")]
        public double TotalAmount { get; set; }


        public List<InvoiceDetailsViewModel> invoice { get; set; }

        //new added property

        [Display(Name = "Quantity")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Quantity required")]
        public int Quantity { get; set; }

        [Display(Name = "HOTEL")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Room Details required")]
        public string HotelName { get; set; }

        [Display(Name = "Room Details")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Room Details required")]
        public string RoomDetails { get; set; }

        [Display(Name = "Price Per Room")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Total Amount required")]
        public double RentPerRoom { get; set; }

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

        public IEnumerable<SelectListItem> AllRoomDetails { get; set; }
        public int PkRoomDetailsId { get; set; }

        public IEnumerable<SelectListItem> allClients { get; set; }
        public int PkCustomerID { get; set; }

        [Display(Name = "Remarks")]
        public string Remarks { get; set; }



        #endregion
    }
}