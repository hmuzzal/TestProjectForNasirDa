
using HotelBooking.DataLayer.Models.Accounts;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.IO.Packaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HotelBooking.DataLayer.Models.Hotel;

namespace HotelBooking.DataLayer.Models.Invoice
{
    public class InvoiceDetails : EntityBase
    {
        #region
        [Key]
        public int PkInvoiceDetailsId { get; set; }

        [Column(Order = 1)]
        [ForeignKey("invoice")]
        public int InvoiceID { get; set; }
        public virtual Invoices invoice { get; set; }

        [Column(Order = 2)]
        [ForeignKey("service")]
        public int ServiceID { get; set; }
        public virtual Profiles service { get; set; }

        [Column(Order = 3)]
        [ForeignKey("hoteldetails")]
        public int HotelRoomDetailsID { get; set; }

        public virtual HotelRoomDetails hoteldetails { get; set; }

        [Display(Name = "Quantity")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Quantity required")]
        public int Quantity { get; set; }

        

        [Display(Name = "Check In")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Check Out")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime Dateto { get; set; }

        [Display(Name = "No Of Nights")]
        public double TotalNights { get; set; }

        [Display(Name = "LEAD PAX")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Pax required")]
        public string LeadPax { get; set; }

        [Display(Name = "No Of Pax")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Pax required")]
        public int TotalPax { get; set; }

        [Display(Name = "Selling Price")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Selling Price required")]
        public double SellingPrice { get; set; }

        [Display(Name = "Meal Type")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Selling Price required")]
        public string MealType { get; set; }

        [Display(Name = "Meal Per Pax")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Pax required")]
        public int MealPerPax { get; set; }

        [Display(Name = "Total Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Total Amount required")]
        public double TotalAmount { get; set; }

        [Display(Name = "Remarks")]
        public string Remarks { get; set; }

        #endregion
    }
}
