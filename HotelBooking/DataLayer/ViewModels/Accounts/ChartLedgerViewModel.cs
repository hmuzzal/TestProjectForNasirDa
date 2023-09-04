using HotelBooking.DataLayer.Models.Accounts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HotelBooking.DataLayer.ViewModels.Accounts
{
    public class ChartLedgerViewModel
    {
        public Ledgers ledgerdata { get; set; }
        public double TotalExpense { get; set; }
        public double TotalDeposit { get; set; }

        
    }
}
