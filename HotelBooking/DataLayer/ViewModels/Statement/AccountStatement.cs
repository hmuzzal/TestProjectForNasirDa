
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HotelBooking.DataLayer.ViewModels.Statement
{
    public class AccountStatement
    {
        #region
        [Display(Name = "Date From")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime DateFrom { get; set; }

        [Display(Name = "Date to")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime Dateto { get; set; }

        public IEnumerable<SelectListItem> AllLedgers { get; set; }
        public int LedgerID { get; set; }

        
        public string ReportName { get; set; }
        public string CustomerName { get; set; }
        public string CustomerCode { get; set; }
        public string CustomerAddress { get; set; }
        public string CustomerPhone { get; set; }
        public string AccountNumber { get; set; }
        public double OpeningBalance { get; set; }
        public double ClosingBalance { get; set; }
        

        public double TotalDebit { get; set; }
        public double TotalCredit { get; set; }
        public double TotalDue { get; set; }
        public int CustomerID { get; set; }

        #endregion

        public List<AccountStatementDetails> statementdetails { get; set; }
    }
}
