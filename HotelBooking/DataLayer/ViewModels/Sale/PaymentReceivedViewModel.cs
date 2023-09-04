using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Sale
{
    public class PaymentReceivedViewModel
    {
        #region
        public int PkPaymentsId { get; set; }

        [Display(Name = "Payment Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Payment Daterequired")]
        public DateTime PaymentDate { get; set; }

        [Display(Name = "Payment No")]
        public string PaymentNumber { get; set; }

        public IEnumerable<SelectListItem> AllDebitLedger { get; set; }
        public int DebitLedgerID { get; set; }

        public IEnumerable<SelectListItem> AllPaymentMethods { get; set; }
        public string PaymentMethod { get; set; }


        public IEnumerable<SelectListItem> AllCreditledger { get; set; }
        public int CreditLedgerID { get; set; }

        [Display(Name = "Reference")]
        public string Reference { get; set; }

        [Display(Name = "Comment")]
        public string Comment { get; set; }

        [Display(Name = "Except Customers")]
        public string ExceptCustomers { get; set; }

        [Display(Name = "Receive Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Receive Amount required")]
        public double ReceiveAmount { get; set; }

        public string Attachment { get; set; }

        #endregion
    }
}