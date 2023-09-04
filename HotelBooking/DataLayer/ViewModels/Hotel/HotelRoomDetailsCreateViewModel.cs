using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HotelBooking.DataLayer.ViewModels.Hotel
{
    public class HotelRoomDetailsCreateViewModel
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