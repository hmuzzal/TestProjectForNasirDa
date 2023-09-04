using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using HotelBooking.DataLayer.Models.Accounts;

namespace HotelBooking.DataLayer.ViewModels.Banking
{
    public class BankAccountsReport
    {
        #region
        [Key]
        public int PkBankAccountId { get; set; }

        [Required(AllowEmptyStrings = false, ErrorMessage = "Account Code Name required")]
        public string AccountCode { get; set; }

        [Display(Name = "Bank Account Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Bank Account Name required")]
        public string BankAccountName { get; set; }

       
        [Column(Order = 1)]
        [ForeignKey("ledger")]
        public int LedgerID { get; set; }
        public virtual Ledgers ledger { get; set; }

        [Display(Name = "Account Number")]
        public string AccountNumber { get; set; }

        [Display(Name = "Bankname")]
        public string Bankname { get; set; }

        [Display(Name = "Opening Balance")]
        public double CurrentBalance { get; set; }

        [Display(Name = "Opening Balance")]
        public double CurrentBalanceBase { get; set; }
        #endregion
    }
}
