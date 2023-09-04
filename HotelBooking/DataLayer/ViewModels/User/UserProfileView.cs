using HotelBooking.DataLayer.Models.User;
using System.Collections.Generic;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class UserProfileView
    {
        #region
        public Users userinformations { get; set; }
       
        public string AttachedDocuments { get; set; }
        #endregion
    }
}