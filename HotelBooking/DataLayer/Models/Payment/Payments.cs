using HotelBooking.DataLayer.Models.Accounts;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.Payment
{
    public class Payments : EntityBase
    {
        #region
        [Key]
        public int PkPaymentsId { get; set; }

        [Display(Name = "Payment No")]
        public string PaymentNumber { get; set; }

        [Column(Order = 1)]
        [ForeignKey("debitledger")]
        public int DebitLedgerID { get; set; }
        public virtual Ledgers debitledger { get; set; }

        [Column(Order = 2)]
        [ForeignKey("creditledger")]
        public int CreditLedgerID { get; set; }
        public virtual Ledgers creditledger { get; set; }

        public string PaymentMethod { get; set; }

        public string TransactionID { get; set; }

        [Display(Name = "Payment Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Payment Daterequired")]
        public DateTime PaymentDate { get; set; }

        [Display(Name = "Reference")]
        public string Reference { get; set; }

        [Display(Name = "Comment")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Comment required")]
        public string Comment { get; set; }

       
        [Display(Name = "Receive Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Receive Amount required")]
        public double ReceiveAmount { get; set; }

		[Display(Name = "Due Amount")]
		[Required(AllowEmptyStrings = false, ErrorMessage = "Due Amount required")]
		public double DueAmount { get; set; }
		#endregion
	}
}