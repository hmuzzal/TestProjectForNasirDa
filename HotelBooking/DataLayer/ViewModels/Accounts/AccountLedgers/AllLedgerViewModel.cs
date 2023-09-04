using System.Collections.Generic;

namespace HotelBooking.DataLayer.ViewModels.Accounts.AccountLedgers
{
    public class AllLedgerViewModel
    {
        public List<ListofLedgers> allledgers { get; set; }

        public LedgerCreateViewModel createled { get; set; }

        public EditLedgerViewModel updateled { get; set; }

        public CreateCurrencyViewModel createcurrency { get; set; }
    }
}