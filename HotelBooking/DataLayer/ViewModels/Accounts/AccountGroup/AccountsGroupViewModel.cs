using System.Collections.Generic;

namespace HotelBooking.DataLayer.ViewModels.Accounts.AccountGroup
{
    public class AccountsGroupViewModel
    {
        #region
        public List<AllAccountGroupViewModel> allaccountsgroups { get; set; }
        public GroupCreateViewModel addaccountgroups { get; set; }
        public GroupUpdateViewModel updateaccountgroups { get; set; }
        #endregion
    }
}