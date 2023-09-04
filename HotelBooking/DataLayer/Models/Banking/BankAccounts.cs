using HotelBooking.DataLayer.Models.Accounts;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.Banking
{
    public class BankAccounts : EntityBase
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


        [Display(Name = "Description")]
        public string Description { get; set; }

        public int AccountType { get; set; }

        
        #endregion
    }
}