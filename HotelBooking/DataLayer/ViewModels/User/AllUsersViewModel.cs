
using HotelBooking.DataLayer.Models.User;
using HotelBooking.DataLayer.ViewModels.Accounts;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.User
{
    public class AllUsersViewModel
    {
        public List<Users> Users { get; set; }

        public CreateUserViewModel newentry { get; set; }

        public CreateUserViewModel updateentry { get; set; }

        public string ProfileImage { get; set; }

        [Display(Name = "ProfileImage")]
        public string ProfileImageUpdate { get; set; }
    }
}