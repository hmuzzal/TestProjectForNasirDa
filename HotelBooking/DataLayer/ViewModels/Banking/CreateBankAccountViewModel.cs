using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Banking
{
    public class CreateBankAccountViewModel
    {
        #region
        public IEnumerable<SelectListItem> AllAccountType { get; set; }
        public int AccountTypeID { get; set; }

        [Display(Name = "Bank Account Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Bank Account Name required")]
        public string BankAccountName { get; set; }

        [Display(Name = "Bank Account Code")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Account Code Name required")]
        public string BankAccountCode { get; set; }

        

        [Required(AllowEmptyStrings = false, ErrorMessage = "Bank Account Number required")]
        [Display(Name = "Account Number")]
        public string AccountNumber { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Bank Name required")]
        [Display(Name = "Bankname")]
        public string Bankname { get; set; }

        [Display(Name = "Description")]
        public string Description { get; set; }



        #endregion
    }
}