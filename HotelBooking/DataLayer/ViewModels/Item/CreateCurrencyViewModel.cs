using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Item
{
    public class CreateItemViewModel
    {
        public int PkItemId { get; set; }

        [Display(Name = "ItemName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Item Name required")]
        public string ProfileName { get; set; }


        [Display(Name = "ItemName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Item Name required")]
        public string ProfileCode { get; set; }

        [Display(Name = "Amount")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Amount required")]
        public double BuyingPrice { get; set; }

        [Display(Name = "Selling Price")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Selling Price required")]
        public double SellingPrice { get; set; }


        [Display(Name = "ProfileWeight")]
        public string ProfileWeight { get; set; }

        [Display(Name = "ProfileNo")]
        public string ProfileNo { get; set; }
    }
}
