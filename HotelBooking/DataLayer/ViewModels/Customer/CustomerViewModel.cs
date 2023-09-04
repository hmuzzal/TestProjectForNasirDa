using System.Collections.Generic;
using HotelBooking.DataLayer.Models.Customers;

namespace HotelBooking.DataLayer.ViewModels.CustomerView
{
    public class CustomerViewModel
    {
        
        
        public List<Customer> allCustomers { get; set; }

        public CreateCustomerViewModel createCustomer { get; set; }
        public CreateCustomerViewModel updateCustomer { get; set; }
       
    }
}
