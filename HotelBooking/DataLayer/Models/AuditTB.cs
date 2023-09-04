using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelBooking.DataLayer.Models
{
    public class AuditTB
    {
        [Key]
        public int UsersAuditID { get; set; }
        public int UserID { get; set; }
        public string Email { get; set; }
        public string SessionID { get; set; }
        public string IPAddress { get; set; }
        public string PageAccessed { get; set; }
        public DateTime LoggedInAt { get; set; }
        public DateTime LoggedOutAt { get; set; }
        public string LoginStatus { get; set; }
        public string ControllerName { get; set; }
        public string ActionName { get; set; }
    }
}
