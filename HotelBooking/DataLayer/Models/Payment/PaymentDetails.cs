using HotelBooking.DataLayer.Models.Invoice;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace HotelBooking.DataLayer.Models.Payment
{
    public class PaymentDetails : EntityBase
    {
        #region
        [Key]
        public int PkPaymentDetailsId { get; set; }

        [Column(Order = 1)]
        [ForeignKey("payments")]
        public int PaymentsID { get; set; }
        public virtual Payments payments { get; set; }

        [Column(Order = 2)]
        [ForeignKey("invoice")]
        public int InvoiceID { get; set; }
        public virtual Invoices invoice { get; set; }


        [Display(Name = "Amount Due")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Amount Due required")]
        public double AmountDue { get; set; }

        [Display(Name = "Amount Received")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Amount Received required")]
        public double AmountPaid { get; set; }

        
        #endregion
    }
}