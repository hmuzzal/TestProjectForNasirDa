using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Accounts
{
    public class CreateCurrencyViewModel
    {
        #region

        [Display(Name = "Currency Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Currency Name required")]
        public string CurrencyName { get; set; }

        [Display(Name = "Currency Symbol")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Currency Symbol required")]
        public string CurrencySymbol { get; set; }

        [Display(Name = "Decimal Places")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Decimal Places required")]
        public int DecimalPlaces { get; set; }

        [Display(Name = "Conversion Rate")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Decimal Places required")]
        public double ConversionRate { get; set; }
        #endregion
    }
}