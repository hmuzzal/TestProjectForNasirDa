using HotelBooking.DataLayer.Models.Accounts;
using HotelBooking.DataLayer.Models.Customers;
using HotelBooking.DataLayer.Models.Hotel;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.Invoice
{
    public class Invoices : EntityBase
    {
        #region
        [Key]
        public int PkInvoiceId { get; set; }

        [Display(Name = "Invoice No")]
        public string InvoiceNo { get; set; }

        public string CustomerCode { get; set; }
        public string CustomerMobile { get; set; }
        public string PaymentType { get; set; }

        [Column(Order = 1)]
        [ForeignKey("debitledger")]
        public int DebitLedgerID { get; set; }
        public virtual Ledgers debitledger { get; set; }

        [Column(Order = 2)]
        [ForeignKey("creditledger")]
        public int CreditLedgerID { get; set; }
        public virtual Ledgers creditledger { get; set; }

        
        

        public string TransactionID { get; set; }

        [Display(Name = "Invoice Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Invoice Date required")]
        public DateTime InvoiceDate { get; set; }

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

        [Display(Name = "Total Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Total Amount required")]
        public double TotalDueAmount { get; set; }

        public string PaymentStatus { get; set; }

        #endregion
    }
}