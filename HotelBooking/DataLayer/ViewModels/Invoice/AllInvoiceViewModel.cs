using HotelBooking.DataLayer.Models.Invoice;

namespace HotelBooking.DataLayer.ViewModels.Invoice
{
    public class AllInvoiceViewModel
    {
        public Invoices singleinvoice { get; set; }
        
        public string Attachment { get; set; }
    }
}
