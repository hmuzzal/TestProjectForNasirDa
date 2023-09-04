using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using HotelBooking.DataLayer.Models;
using HotelBooking.DataLayer.Models.User;

namespace HotelBooking.DataLayer.ViewModels.ActivityLog
{
    public class LoginHistoryViewModel
    {
        [Display(Name = "Customers")]
        public IEnumerable<SelectListItem> AllUsers { get; set; }
        public int UserID { get; set; }
        public string UserEmID { get; set; }

        public List<LoginHistory> allloginhistory {  get; set; }
        public List<AuditTB> allactivityhistory {  get; set; }

    }
}