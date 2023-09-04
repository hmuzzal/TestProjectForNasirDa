using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Accounts
{
    public class CreateTaxViewModel
    {
        #region
        [Display(Name = "Tax Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Tax Name required")]
        public string TaxName { get; set; }

        [Display(Name = "Tax Rate")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Tax Rate required")]
        public double TaxRate { get; set; }
        #endregion
    }
}