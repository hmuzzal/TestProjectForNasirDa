using HotelBooking.DataLayer.Models.Payment;

namespace HotelBooking.DataLayer.ViewModels.Sale
{
    public class AllPaymentsViewModel
    {
        #region
        public Payments singlepayments { get; set; }

        public string Attachment { get; set; }

        #endregion
    }
}