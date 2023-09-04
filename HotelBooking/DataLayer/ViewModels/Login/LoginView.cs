using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.ViewModels.Login
{
    public class LoginView
    {
        #region
        [Required(AllowEmptyStrings = false, ErrorMessage = "User Name required")]
        public string Email { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Password is required")]
        [DataType(DataType.Password)]
        //[MinLength(5, ErrorMessage = "Password Minimum 5 characters required")]
        public string Password { get; set; }

        public bool RememberMe { get; set; }

        #endregion
    }
}