using AccountingERP.DataLayer.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AccountingERP.DataLayer.ViewModels.User
{
    public class AllUsersViewModel
    {
        public List<UsersList> Users { get; set; }
    }
}