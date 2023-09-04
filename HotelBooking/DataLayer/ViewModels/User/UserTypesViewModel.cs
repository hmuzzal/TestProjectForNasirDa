using HotelBooking.DataLayer.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class UserTypesViewModel
    {
        #region
        public List<UserTypes> allusertypes { get; set; }
        public UserTypes addusertype { get; set; }
        public UserTypes updateusertype { get; set; }
        #endregion
    }
}