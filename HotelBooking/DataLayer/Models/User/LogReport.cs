using System;
using System.ComponentModel.DataAnnotations;

namespace HotelBooking.DataLayer.Models.User
{
    public class LogReport 
    {
        #region
        [Key]
        public int PkLogId { get; set; }

        [Display(Name = "ControllerName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "ControllerName required")]
        public string ControllerName { get; set; }

        [Display(Name = "MethodName")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "MethodName required")]
        public string MethodName { get; set; }

        [Display(Name = "Log")]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Log required")]
        public string Log { get; set; }

        [Display(Name = "Date")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Required(AllowEmptyStrings = false, ErrorMessage = "Date required")]
        public DateTime Date { get; set; }
        #endregion
    }
}