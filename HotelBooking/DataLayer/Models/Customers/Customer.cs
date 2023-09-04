using HotelBooking.DataLayer.Models.Accounts;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HotelBooking.DataLayer.Models.Customers
{
    public class Customer :EntityBase
    {
        #region
        [Key]
        public int PkCustomerId { get; set; }


        [Display(Name = "Name")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Name required")]
        public string Name { get; set; }

        [Display(Name = "CustomerCode")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "CustomerCode required")]
        public int CustomerCode { get; set; }

        public string Email { get; set; }


        [Display(Name = "Mobile")]
        //[Required(AllowEmptyStrings = false, ErrorMessage = "Mobile required")]
        public string Mobile { get; set; }

        [Display(Name = "Nationality")]
        public string CustomerNationality { get; set; }


        [Display(Name = "PresentAddress")]
        //[Required(AllowEmptyStrings = false, ErrorMessage = "PresentAddress required")]
        public string PresentAddress { get; set; }

        [Display(Name = "PermanentAddress")]
        //[Required(AllowEmptyStrings = false, ErrorMessage = "PermanentAddress required")]
        public string PermanentAddress { get; set; }

        [Column(Order = 1)]
        [ForeignKey("ledger")]
        public int LedgerID { get; set; }
        public virtual Ledgers ledger { get; set; }


        #endregion
    }
}