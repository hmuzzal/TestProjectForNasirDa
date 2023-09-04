using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using HotelBooking.DataLayer.Models.Accounts;

namespace HotelBooking.DataLayer.ViewModels.Item
{
    public class ItemViewModel
    {
        [Display(Name = "Date From")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Date to")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime Dateto { get; set; }

        public string ReportName { get; set; }
        public List<HotelBooking.DataLayer.Models.Accounts.Profiles> allcurrencies { get; set; }
        
        public CreateItemViewModel createitem { get; set; }
        public CreateItemViewModel updateitem { get; set; }
       
    }
}
