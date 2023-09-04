using HotelBooking.DataLayer.Models.Hotel;
using HotelBooking.DataLayer.Models.User;
using HotelBooking.DataLayer.ViewModels.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HotelBooking.DataLayer.ViewModels.Hotel
{
    public class AllRoomsViewModel
    {
        //public List<HotelRoomDetailsList> Rooms { get; set; }
        

        //public HotelRoomDetailsCreateViewModel newentry { get; set; }

        //public UpdateHotelRoomDetailsViewModel updateentry { get; set; }

        public List<HotelRoomDetails> Rooms { get; set; }

        public HotelRoomDetailsCreateViewModel newentry { get; set; }

        public UpdateHotelRoomDetailsViewModel updateentry { get; set; }
    }
}