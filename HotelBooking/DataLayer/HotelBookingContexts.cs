using HotelBooking.DataLayer.Models;
using HotelBooking.DataLayer.Models.Accounts;
using HotelBooking.DataLayer.Models.Invoice;
using HotelBooking.DataLayer.Models.User;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using HotelBooking.DataLayer.Models.Customers;
using HotelBooking.DataLayer.Models.Payment;
using HotelBooking.DataLayer.Models.Banking;
using HotelBooking.DataLayer.Models.Hotel;
using System.Collections.Generic;
using System;

namespace HotelBooking.DataLayer
{
    public class HotelBookingContexts : DbContext
    {
        public HotelBookingContexts()
           : base("name=HotelBookingContexts")
        {
            Database.SetInitializer(new HotelBookingContextsDBInitilizer());
            this.Configuration.LazyLoadingEnabled = false;
            this.Configuration.ProxyCreationEnabled = false;
        }

        #region Organization Module
        public virtual DbSet<Organizations> organizationinfo { get; set; }
        #endregion

        #region User Module
        public virtual DbSet<Users> userinfo { get; set; }
        public virtual DbSet<UserTypes> usertypes { get; set; }
        public virtual DbSet<LoginHistory> loginhistory { get; set; }
        public virtual DbSet<LogReport> logreports { get; set; }
       
        #endregion

       

        #region Accounts
        public virtual DbSet<AccountGroups> accountgroups { get; set; }
        public virtual DbSet<Ledgers> ledgers { get; set; }
        public virtual DbSet<Profiles> items { get; set; }
        public virtual DbSet<TransactionHistory> transactionhistory { get; set; }

        #endregion

        #region Invoice
        public virtual DbSet<Invoices> invoice { get; set; }
        public virtual DbSet<InvoiceDetails> invoicedetails { get; set; }
        public virtual DbSet<InvoiceAttachmentDetails> invoiceattachemnts { get; set; }

        #endregion

        public virtual DbSet<BankAccounts> bankaccount { get; set; }

        //#region HotelDetails
        //public virtual DbSet<HotelDetails> hotelDetails { get; set; }
        //#endregion

        #region Payments
        public virtual DbSet<Payments> payments { get; set; }
        public virtual DbSet<PaymentDetails> PaymentDetails { get; set; }
        #endregion

        #region Organizations
        public virtual DbSet<Customer> Customers { get; set; }

        #endregion
        #region Hotel
        public virtual DbSet<HotelRoomDetails> hotelRoomDetails { get; set; }
        #endregion

        public virtual DbSet<AuditTB> audittbs { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
        }


    }
    public class HotelBookingContextsDBInitilizer : DropCreateDatabaseIfModelChanges<HotelBookingContexts>
    {
        protected override void Seed(HotelBookingContexts context)
        {

        }
    }
}