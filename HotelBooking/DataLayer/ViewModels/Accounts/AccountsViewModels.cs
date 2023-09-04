using HotelBooking.DataLayer.ViewModels.Accounts.AccountLedgers;
using System.Collections.Generic;

namespace HotelBooking.DataLayer.ViewModels.Accounts
{
    public class AccountsViewModels
    {
        #region
        public List<AllAccountViewModel> allaccountsgroups { get; set; }
        public LedgerCreateViewModel addaccountgroups { get; set; }

        #endregion
    }
}