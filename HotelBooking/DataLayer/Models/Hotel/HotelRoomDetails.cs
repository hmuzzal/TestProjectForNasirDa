using HotelBooking.DataLayer.Models.Accounts;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.Hotel
{
    public class HotelRoomDetails:EntityBase
    {
        [Key]
        public int PkRoomDetailsId { get; set; }
        [Display(Name = "Code")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Code required")]
        public string RoomCode { get; set; }

        [Display(Name = "Room Details")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Room Details required")]
        public string RoomDetails { get; set; }

        [Display(Name = "Price Per Room")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Total Amount required")]
        public double RentPerRoom { get; set; }
    }
}