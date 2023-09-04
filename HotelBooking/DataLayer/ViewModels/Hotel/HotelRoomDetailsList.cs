using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HotelBooking.DataLayer.ViewModels.Hotel
{
    public class HotelRoomDetailsList
    {
        [Key]
        public int PkRoomDetailsId { get; set; }
        public string RoomCode { get; set; }

        [Display(Name = "Room Details")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Room Details required")]
        public string RoomDetails { get; set; }

        [Display(Name = "Price Per Room")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Total Amount required")]
        public double RentPerRoom { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime CreatedAt { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime UpdatedAt { get; set; }

        public string DeletedBy { get; set; }
        public string UpdatedBy { get; set; }
        public string CreatedBy { get; set; }
    }
}