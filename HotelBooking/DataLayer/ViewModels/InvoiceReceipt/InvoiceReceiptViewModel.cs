using System.Collections.Generic;
using HotelBooking.DataLayer.Models.Invoice;
using HotelBooking.DataLayer.Models;

namespace HotelBooking.DataLayer.ViewModels.InvoiceReceipt
{
    public class InvoiceReceiptViewModel
    {
        public string ReportName { get; set; }
        public Invoices Invoice { get; set; }
        public string AmountinWords { get; set; }   
        public Organizations organizationinfo { get; set; }
        public HotelBooking.DataLayer.Models.Customers.Customer customerinfo { get; set; }
        public List<InvoiceDetails> InvoiceDetails { get; set; }

    }
}