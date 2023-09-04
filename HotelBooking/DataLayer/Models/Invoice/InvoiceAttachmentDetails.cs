using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.Invoice
{
    public class InvoiceAttachmentDetails : EntityBase
    {
        #region
        [Key]
        public int PkInvoiceAttachementId { get; set; }

        [Column(Order = 1)]
        [ForeignKey("invoice")]
        public int InvoiceID { get; set; }
        public virtual Invoices invoice { get; set; }

        public int FileNo { get; set; }

        [Display(Name = "Attachment Location")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Attachment Location required")]
        public string AttachmentLocation { get; set; }

        
        #endregion
    }
}