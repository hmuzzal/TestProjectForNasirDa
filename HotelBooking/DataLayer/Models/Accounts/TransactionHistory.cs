using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.Accounts
{
    public class TransactionHistory : EntityBase
    {
        #region
        [Key]
        public int PkTransactionId { get; set; }

        public string TransactionID { get; set; }

        [Display(Name = "Transaction Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime TransactionDate { get; set; }

        [Display(Name = "Transaction Type")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Transaction Type required")]
        public string TransactionType { get; set; }

        [Display(Name = "Debit")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Debit required")]
        public double Debit { get; set; }

        [Display(Name = "Credit")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Credit required")]
        public double Credit { get; set; }

        [Display(Name = "Open Balance")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Open Balance required")]
        public double OpeningBalance { get; set; }

        [Display(Name = "Closing Balance")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Closing Balance required")]
        public double ClosingBalance { get; set; }
        
        public string TransactionSource { get; set; }
        public string TransactionReference { get; set; }
        public int ReferenceID { get; set; }

        [Column(Order = 1)]
        [ForeignKey("ledgers")]
        public int LedgerID { get; set; }
        public virtual Ledgers ledgers { get; set; }

        public string Remarks { get; set; }

        [Column(Order = 2)]
        [ForeignKey("accounts")]
        public int AccountID { get; set; }
        public virtual Ledgers accounts { get; set; }

        
        #endregion
    }
}