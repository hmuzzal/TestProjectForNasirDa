USE [live_abc_exchange_01012023]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/12/2023 4:42:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountGroups]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountGroups](
	[PkGroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](max) NOT NULL,
	[GroupParent] [int] NULL,
	[GroupIdentifier] [nvarchar](max) NOT NULL,
	[Nature] [nvarchar](max) NOT NULL,
	[GroupType] [int] NOT NULL,
	[PostedTo] [nvarchar](max) NULL,
	[GroupHeadType] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AccountGroups] PRIMARY KEY CLUSTERED 
(
	[PkGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[PkAreaId] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Areas] PRIMARY KEY CLUSTERED 
(
	[PkAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditTBs]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditTBs](
	[UsersAuditID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SessionID] [nvarchar](max) NULL,
	[IPAddress] [nvarchar](max) NULL,
	[PageAccessed] [nvarchar](max) NULL,
	[LoggedInAt] [datetime] NOT NULL,
	[LoggedOutAt] [datetime] NOT NULL,
	[LoginStatus] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](max) NULL,
	[ActionName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AuditTBs] PRIMARY KEY CLUSTERED 
(
	[UsersAuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccounts]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccounts](
	[CurrencyID] [int] NOT NULL,
	[LedgerID] [int] NOT NULL,
	[PkBankAccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountCode] [nvarchar](max) NOT NULL,
	[BankAccountName] [nvarchar](max) NOT NULL,
	[AccountNumber] [nvarchar](max) NULL,
	[Bankname] [nvarchar](max) NULL,
	[OpeningBalance] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[AccountType] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.BankAccounts] PRIMARY KEY CLUSTERED 
(
	[PkBankAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankHistories](
	[PkBankHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[LastBalance] [float] NOT NULL,
	[TransactionAmount] [float] NOT NULL,
	[Rate] [float] NOT NULL,
	[ActualAmount] [float] NOT NULL,
	[CurrentBalance] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.BankHistories] PRIMARY KEY CLUSTERED 
(
	[PkBankHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillAttachmentDetails]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillAttachmentDetails](
	[BillID] [int] NOT NULL,
	[PkBillAttachementId] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NOT NULL,
	[AttachmentLocation] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.BillAttachmentDetails] PRIMARY KEY CLUSTERED 
(
	[PkBillAttachementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[CreditLedgerID] [int] NOT NULL,
	[DebitLedgerID] [int] NOT NULL,
	[CreditCurrencyID] [int] NOT NULL,
	[DebitCurrencyID] [int] NOT NULL,
	[PkBillId] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [nvarchar](max) NULL,
	[TransactionID] [nvarchar](max) NULL,
	[BillDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[DebitAmount] [float] NOT NULL,
	[CreditAmount] [float] NOT NULL,
	[ConversionRate] [float] NOT NULL,
	[ReverseRate] [float] NOT NULL,
	[PayementStatus] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Bills] PRIMARY KEY CLUSTERED 
(
	[PkBillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalenderDatas]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalenderDatas](
	[PkTaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](max) NOT NULL,
	[TaskDate] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CalenderDatas] PRIMARY KEY CLUSTERED 
(
	[PkTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashPurchases]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashPurchases](
	[SupplierLedgerID] [int] NOT NULL,
	[DebitLedgerID] [int] NOT NULL,
	[BankLedgerID] [int] NOT NULL,
	[PurchaseCurrencyID] [int] NOT NULL,
	[PaidCurrencyID] [int] NOT NULL,
	[PkCashPurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[CashPurchaseNo] [nvarchar](max) NULL,
	[TransactionID] [nvarchar](max) NULL,
	[PurhaseSaleDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[PurchaseAmount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[ConversionRate] [float] NOT NULL,
	[ReverseRate] [float] NOT NULL,
	[PayementStatus] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CashPurchases] PRIMARY KEY CLUSTERED 
(
	[PkCashPurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashSales]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashSales](
	[DebitLedgerID] [int] NOT NULL,
	[CreditLedgerID] [int] NOT NULL,
	[BankLedgerID] [int] NOT NULL,
	[SaleCurrencyID] [int] NOT NULL,
	[PaidCurrencyID] [int] NOT NULL,
	[PkCashSaleId] [int] IDENTITY(1,1) NOT NULL,
	[CashSaleNo] [nvarchar](max) NULL,
	[TransactionID] [nvarchar](max) NULL,
	[CashSaleDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[SaleAmount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[ConversionRate] [float] NOT NULL,
	[ReverseRate] [float] NOT NULL,
	[PayementStatus] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CashSales] PRIMARY KEY CLUSTERED 
(
	[PkCashSaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChartofAccounts]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChartofAccounts](
	[PkAccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nvarchar](max) NOT NULL,
	[GroupParent] [int] NOT NULL,
	[Nature] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ChartofAccounts] PRIMARY KEY CLUSTERED 
(
	[PkAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[PkCountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Countries] PRIMARY KEY CLUSTERED 
(
	[PkCountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditNotes]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditNotes](
	[DebitLedgerID] [int] NOT NULL,
	[CreditLedgerID] [int] NOT NULL,
	[PaidCurrencyID] [int] NOT NULL,
	[PkCreditNoteId] [int] IDENTITY(1,1) NOT NULL,
	[CreditNoteNo] [nvarchar](max) NULL,
	[TransactionID] [nvarchar](max) NULL,
	[CreditNoteDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CreditNotes] PRIMARY KEY CLUSTERED 
(
	[PkCreditNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[PkCurrencyId] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](max) NOT NULL,
	[DecimalPlaces] [int] NOT NULL,
	[CurrencySymbol] [nvarchar](max) NOT NULL,
	[ConversionRate] [float] NOT NULL,
	[BaseCurrency] [bit] NOT NULL,
	[ExecutionDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Currencies] PRIMARY KEY CLUSTERED 
(
	[PkCurrencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyCodes]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyCodes](
	[PkCurrencyCodeId] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](max) NOT NULL,
	[CurrencySymbol] [nvarchar](max) NOT NULL,
	[DecimalPlaces] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CurrencyCodes] PRIMARY KEY CLUSTERED 
(
	[PkCurrencyCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrencyRateHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyRateHistories](
	[CurrencyID] [int] NOT NULL,
	[PkCurrencyHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](max) NOT NULL,
	[CurrencySymbol] [nvarchar](max) NOT NULL,
	[DecimalPlaces] [int] NOT NULL,
	[ConversionRate] [float] NOT NULL,
	[ExecutionDate] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CurrencyRateHistories] PRIMARY KEY CLUSTERED 
(
	[PkCurrencyHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[LedgerID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[AreaID] [int] NULL,
	[SupplierLedgerID] [int] NULL,
	[CustomerLedgerID1] [int] NULL,
	[CustomerLedgerID2] [int] NULL,
	[PkCustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [nvarchar](max) NOT NULL,
	[CustomerName] [nvarchar](max) NOT NULL,
	[Mobile] [nvarchar](max) NULL,
	[ContactPersons] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Customers] PRIMARY KEY CLUSTERED 
(
	[PkCustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerSuppliers]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSuppliers](
	[LedgerID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[PkBothId] [int] IDENTITY(1,1) NOT NULL,
	[BothCode] [nvarchar](max) NOT NULL,
	[BothName] [nvarchar](max) NOT NULL,
	[Mobile] [nvarchar](max) NULL,
	[ContactPersons] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerSuppliers] PRIMARY KEY CLUSTERED 
(
	[PkBothId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DevicesHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevicesHistories](
	[UserID] [int] NOT NULL,
	[PkDeviceId] [int] IDENTITY(1,1) NOT NULL,
	[Browser] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[OS] [nvarchar](max) NOT NULL,
	[CLientIPAddress_PkIPAddressId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.DevicesHistories] PRIMARY KEY CLUSTERED 
(
	[PkDeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[UserID] [int] NOT NULL,
	[PkEmailId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PrimaryEmailAddress] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Emails] PRIMARY KEY CLUSTERED 
(
	[PkEmailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseAttachmentDetails]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseAttachmentDetails](
	[ExpenseID] [int] NOT NULL,
	[PkExpenseAttachementId] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NOT NULL,
	[AttachmentLocation] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ExpenseAttachmentDetails] PRIMARY KEY CLUSTERED 
(
	[PkExpenseAttachementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseHistories](
	[PkExpenseHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseDate] [datetime] NOT NULL,
	[LastBalance] [float] NOT NULL,
	[ExpenseID] [int] NOT NULL,
	[TransactionAmount] [float] NOT NULL,
	[CurrentBalance] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ExpenseHistories] PRIMARY KEY CLUSTERED 
(
	[PkExpenseHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[DebitAccountID] [int] NOT NULL,
	[CreditAccountID] [int] NOT NULL,
	[ExpenseCurrencyID] [int] NOT NULL,
	[PkExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[ExpenseDate] [datetime] NOT NULL,
	[TransactionID] [nvarchar](max) NULL,
	[ExpenseNo] [nvarchar](max) NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[ExpenseAmount] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Expenses] PRIMARY KEY CLUSTERED 
(
	[PkExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceAttachmentDetails]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceAttachmentDetails](
	[InvoiceID] [int] NOT NULL,
	[PkInvoiceAttachementId] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NOT NULL,
	[AttachmentLocation] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.InvoiceAttachmentDetails] PRIMARY KEY CLUSTERED 
(
	[PkInvoiceAttachementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[DebitLedgerID] [int] NOT NULL,
	[CreditLedgerID] [int] NOT NULL,
	[CreditCurrencyID] [int] NOT NULL,
	[DebitCurrencyID] [int] NOT NULL,
	[PkInvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [nvarchar](max) NULL,
	[TransactionID] [nvarchar](max) NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[CreditAmount] [float] NOT NULL,
	[DebitAmount] [float] NOT NULL,
	[ConversionRate] [float] NOT NULL,
	[ReverseRate] [float] NOT NULL,
	[PayementStatus] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Invoices] PRIMARY KEY CLUSTERED 
(
	[PkInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPAddresses]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPAddresses](
	[PkIPAddressId] [int] IDENTITY(1,1) NOT NULL,
	[IPAddresses] [nvarchar](max) NOT NULL,
	[UserID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.IPAddresses] PRIMARY KEY CLUSTERED 
(
	[PkIPAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ledgers]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ledgers](
	[CurrencyID] [int] NOT NULL,
	[PkLedgerId] [int] IDENTITY(1,1) NOT NULL,
	[LedgerName] [nvarchar](max) NOT NULL,
	[LedgerParent] [int] NOT NULL,
	[LedgerType] [nvarchar](max) NULL,
	[LedgerCode] [nvarchar](max) NULL,
	[Nature] [nvarchar](max) NOT NULL,
	[AccountOpeningBalance] [float] NOT NULL,
	[OpeningBalance] [float] NOT NULL,
	[ClosingBalance] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Ledgers] PRIMARY KEY CLUSTERED 
(
	[PkLedgerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistories](
	[UserID] [int] NOT NULL,
	[PkLoginId] [int] IDENTITY(1,1) NOT NULL,
	[AccessTime] [datetime] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[CLientIPAddress] [nvarchar](max) NOT NULL,
	[Browser] [nvarchar](max) NOT NULL,
	[OS] [nvarchar](max) NOT NULL,
	[AccessType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.LoginHistories] PRIMARY KEY CLUSTERED 
(
	[PkLoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogReports]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogReports](
	[PkLogId] [int] IDENTITY(1,1) NOT NULL,
	[ControllerName] [nvarchar](max) NOT NULL,
	[MethodName] [nvarchar](max) NOT NULL,
	[Log] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.LogReports] PRIMARY KEY CLUSTERED 
(
	[PkLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailConfigurations]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailConfigurations](
	[PkMailConfigurationId] [int] IDENTITY(1,1) NOT NULL,
	[EmailFrom] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[MailProtocol] [nvarchar](max) NOT NULL,
	[MailAddressLink] [nvarchar](max) NOT NULL,
	[MailPortNumber] [nvarchar](max) NOT NULL,
	[MailCC1] [nvarchar](max) NULL,
	[MailCC2] [nvarchar](max) NULL,
	[MailCC3] [nvarchar](max) NULL,
	[MailSubject] [nvarchar](max) NOT NULL,
	[MailType] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.MailConfigurations] PRIMARY KEY CLUSTERED 
(
	[PkMailConfigurationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManualJournalAttachmentDetails]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManualJournalAttachmentDetails](
	[JournalID] [int] NOT NULL,
	[PkmJournalAttachmentsId] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NOT NULL,
	[AttachmentLocation] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ManualJournalAttachmentDetails] PRIMARY KEY CLUSTERED 
(
	[PkmJournalAttachmentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManualJournals]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManualJournals](
	[DebitLedgerID] [int] NOT NULL,
	[CreditLedgerID] [int] NOT NULL,
	[DebitCurrencyID] [int] NOT NULL,
	[CreditCurrencyID] [int] NOT NULL,
	[PkJournalId] [int] IDENTITY(1,1) NOT NULL,
	[JournalNo] [nvarchar](max) NULL,
	[CashBasedJournal] [bit] NOT NULL,
	[TransactionID] [nvarchar](max) NULL,
	[JournalDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[DebitAmount] [float] NOT NULL,
	[CreditAmount] [float] NOT NULL,
	[ConversionRate] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ManualJournals] PRIMARY KEY CLUSTERED 
(
	[PkJournalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobileNumbers]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileNumbers](
	[UserID] [int] NOT NULL,
	[PkMobileId] [int] IDENTITY(1,1) NOT NULL,
	[MobileNumber] [nvarchar](max) NOT NULL,
	[PrimaryMobileNumber] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.MobileNumbers] PRIMARY KEY CLUSTERED 
(
	[PkMobileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[PkModuleId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleName] [nvarchar](max) NOT NULL,
	[ControllerName] [nvarchar](max) NOT NULL,
	[MethodName] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Modules] PRIMARY KEY CLUSTERED 
(
	[PkModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
	[PkOrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[OrganisationName] [nvarchar](max) NOT NULL,
	[OrganisationType] [nvarchar](max) NOT NULL,
	[OrganizationLogo] [nvarchar](max) NOT NULL,
	[LicenseExpired] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Organizations] PRIMARY KEY CLUSTERED 
(
	[PkOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passwords]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passwords](
	[UserID] [int] NOT NULL,
	[PkPasswordId] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Passwords] PRIMARY KEY CLUSTERED 
(
	[PkPasswordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentAttachmentDetails]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentAttachmentDetails](
	[PaymentsID] [int] NOT NULL,
	[PkPaymentAttachmentDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NOT NULL,
	[AttachmentLocation] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PaymentAttachmentDetails] PRIMARY KEY CLUSTERED 
(
	[PkPaymentAttachmentDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[DebitLedgerID] [int] NOT NULL,
	[CreditLedgerID] [int] NOT NULL,
	[ReceiveCurrencyID] [int] NOT NULL,
	[PkPaymentsId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentNumber] [nvarchar](max) NULL,
	[TransactionID] [nvarchar](max) NULL,
	[PaymentDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[ReceiveAmount] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Payments] PRIMARY KEY CLUSTERED 
(
	[PkPaymentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentsMadeAttachmentDetails]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentsMadeAttachmentDetails](
	[PaymentsMadeID] [int] NOT NULL,
	[PkPurchaseInAttachementId] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NOT NULL,
	[AttachmentLocation] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PaymentsMadeAttachmentDetails] PRIMARY KEY CLUSTERED 
(
	[PkPurchaseInAttachementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentsMades]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentsMades](
	[CreditLedgerID] [int] NOT NULL,
	[DebitLedgerID] [int] NOT NULL,
	[PaymentCurrencyID] [int] NOT NULL,
	[PkPaymentsMadeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentsNo] [nvarchar](max) NULL,
	[TransactionID] [nvarchar](max) NULL,
	[PaymentDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[PaymentAmount] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PaymentsMades] PRIMARY KEY CLUSTERED 
(
	[PkPaymentsMadeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PemissionManagers]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PemissionManagers](
	[UserID] [int] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[PkPermissionId] [int] IDENTITY(1,1) NOT NULL,
	[Create] [bit] NOT NULL,
	[Edit] [bit] NOT NULL,
	[Delete] [bit] NOT NULL,
	[View] [bit] NOT NULL,
	[Approve] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PemissionManagers] PRIMARY KEY CLUSTERED 
(
	[PkPermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prefixes]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prefixes](
	[PkPrefixId] [int] IDENTITY(1,1) NOT NULL,
	[PrefixName] [nvarchar](max) NOT NULL,
	[PrefixFor] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Prefixes] PRIMARY KEY CLUSTERED 
(
	[PkPrefixId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfitLossHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfitLossHistories](
	[PkPLHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[PLDate] [datetime] NOT NULL,
	[LastBalance] [float] NOT NULL,
	[TransactionAmount] [float] NOT NULL,
	[CurrentBalance] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ProfitLossHistories] PRIMARY KEY CLUSTERED 
(
	[PkPLHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseHistories](
	[PkPurchaseHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[LastBalance] [float] NOT NULL,
	[TransactionAmount] [float] NOT NULL,
	[CurrentBalance] [float] NOT NULL,
	[PurchaseID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PurchaseHistories] PRIMARY KEY CLUSTERED 
(
	[PkPurchaseHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseReturnHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturnHistories](
	[PkPurchaseReturnHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseReturnDate] [datetime] NOT NULL,
	[LastBalance] [float] NOT NULL,
	[TransactionAmount] [float] NOT NULL,
	[CurrentBalance] [float] NOT NULL,
	[ReturnID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PurchaseReturnHistories] PRIMARY KEY CLUSTERED 
(
	[PkPurchaseReturnHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesHistories](
	[PkSalesHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[SalesDate] [datetime] NOT NULL,
	[LastBalance] [float] NOT NULL,
	[TransactionAmount] [float] NOT NULL,
	[CurrentBalance] [float] NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SalesHistories] PRIMARY KEY CLUSTERED 
(
	[PkSalesHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesReturnHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturnHistories](
	[PkSalesReturnHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[SalesReturnDate] [datetime] NOT NULL,
	[LastBalance] [float] NOT NULL,
	[TransactionAmount] [float] NOT NULL,
	[CurrentBalance] [float] NOT NULL,
	[ReturnID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SalesReturnHistories] PRIMARY KEY CLUSTERED 
(
	[PkSalesReturnHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionHistories]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionHistories](
	[LedgerID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[PkTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionID] [nvarchar](max) NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TransactionType] [nvarchar](max) NOT NULL,
	[Debit] [float] NOT NULL,
	[Credit] [float] NOT NULL,
	[OpeningBalance] [float] NOT NULL,
	[ClosingBalance] [float] NOT NULL,
	[TransactionSource] [nvarchar](max) NULL,
	[TransactionReference] [nvarchar](max) NULL,
	[ReferenceID] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.TransactionHistories] PRIMARY KEY CLUSTERED 
(
	[PkTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserTypeID] [int] NOT NULL,
	[LedgerID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[PkUserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[ProfileImage] [nvarchar](max) NULL,
	[NickName] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NOT NULL,
	[UserTokenConfirmation] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[Countries_PkCountryId] [int] NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[PkUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[PkUserTypelId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UserTypes] PRIMARY KEY CLUSTERED 
(
	[PkUserTypelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorDebitAttachmentDetails]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorDebitAttachmentDetails](
	[DebitNoteID] [int] NOT NULL,
	[PkVDebitAttachmentId] [int] IDENTITY(1,1) NOT NULL,
	[FileNo] [int] NOT NULL,
	[AttachmentLocation] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.VendorDebitAttachmentDetails] PRIMARY KEY CLUSTERED 
(
	[PkVDebitAttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VendorDebits]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VendorDebits](
	[CreditLedgerID] [int] NOT NULL,
	[DebitLedgerID] [int] NOT NULL,
	[ReturnCurrencyID] [int] NOT NULL,
	[PkDebitNoteId] [int] IDENTITY(1,1) NOT NULL,
	[DebitNoteNo] [nvarchar](max) NULL,
	[TransactionID] [nvarchar](max) NULL,
	[DebitNoteDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.VendorDebits] PRIMARY KEY CLUSTERED 
(
	[PkDebitNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 7/12/2023 4:42:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[LedgerID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[CustomerLedgerID] [int] NULL,
	[SupplierLedgerID1] [int] NULL,
	[SupplierLedgerID2] [int] NULL,
	[PkVendorId] [int] IDENTITY(1,1) NOT NULL,
	[VendorCode] [nvarchar](max) NOT NULL,
	[VendorName] [nvarchar](max) NOT NULL,
	[Mobile] [nvarchar](max) NULL,
	[ContactPersons] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[DeletedBy] [nvarchar](max) NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Vendors] PRIMARY KEY CLUSTERED 
(
	[PkVendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202307121039501_InitialCreate', N'ABCExchange.DataLayer.ABCExchangeContexts', 0x1F8B0800000000000400ED7DDB72DC48B2D8BB23FC0F0C3DD98E3DE288FBE233219D1312A5D9D51E526288DA09BF31C06E90C40A0DB4816E8DB80E7F991FFC49FE05D70597BA645D514075B72A2662D444E5ADB2B232B3EEFFEFFFFCDFD7FFFE63539E7DCF9BB6A8AB372F5EBDFCE5C5595EADEA75513DBE79B1DF3DFCCB7F7FF1EFFFF69FFFD3EB0FEBCD8FB3DF7BB83F63388459B56F5E3CED76DB5FCFCFDBD553BEC9DA979B62D5D46DFDB07BB9AA37E7D9BA3EBFF8E5977F3D7FF5EA3C47245E205A6767AFBFECAB5DB1C9C91FE8CFCBBA5AE5DBDD3E2BAFEB755EB6DD7754724BA89E7DCA3679BBCD56F99B176FDF5D7EF8B17ACAAAC7FCE5FB6C975D65CF79F3E2EC6D59644898DBBC7C7871965555BDCB7648D45FFFDEE6B7BBA6AE1E6FB7E843567E7DDEE608EE212BDBBCABC2AF23B86D6D7EB9C0B5391F117B52AB7DBBAB378E045FFDB953CFB988EEA5E41783FA90023F2045EF9E71AD891291FE56AB1A69FF2F4DBDDFB62FCE448EBF5E960D865628FA256DA0971D95E10725F7A73306E94F83B920ABC2FFFDE9EC725FEEF64DFEA6CAF7BB262BFF7476B3BF2F8BD57FE4CF5FEB6F79F5A6DA97252B3D921F95711FD0A79BA6DEE6CDEEF94BFED0D5E9E61BE1FF71FDE2EC9C473F17F1076C199556FB63B5FBF3C58BB34F4894ECBECC0753615474BBAB9BFC2F799537D92E5FDF64BB5DDEA096FEB8CE89B2252104968421FED9B344068ABADB8BB3EBECC7555E3DEE9EDEBC403F5F9CFD56FCC8D7FD974E8CBF5705EA9D0869D7EC73404C0BD63759830415EA6B8147EBF750E0EEB6B4E09F326C38911486999ACC434FE6A66E91A57CAD0354C042DEBFE6D99A9579366EB7A843ECDB9ECDBBBA2EF3AC7256CE6593E37EF4763049E46DF2AFC5C6BDB5FEBE5D07A2F43E2F7344E9DDF3EC3AEC645E8053A7E7E09C5E9F8F41461F7A9000DE11E792A0A188F212938917693077BF40D3632E156730BF386126F985E4175CFCC27E5DECBEBEF34F46297E2C9F8086184D4B64F8F8DEDD2FF0D84BF906CCD5CCCFD0CBF3162B7824339B857EBC79BB5E3788DDEC9C6EB2C71C0D6910AB7C3D3BB3ABFAF1315F7FAC02F8254AEAF37E17865651F12E7C3EDF535768745E96791328521942E20A779E195859FBBA7759F5AD1F3C7B3B3C4C0449FD9225162F2362A4F04B8C04028BE54794E525D2E9F2291253E73839DAE5BE69F26AF53C350A5CE5EBC7E9B1A457C57E731F647AC1ACFC6A097FF3799B5788F2BBACCCAAD5C0EE7D8DBA9E4FEED9AE9A624BE705677794A43DA6CF7CA4A1401A0A104E9FB2EFC523F1DB02CF157544458EACE44B5E1290F6A9D8D2C97C2EC6DDB1B0BF35F5E64B5D0A319501B9BBADF70DE975B51EEE6BD63CE63B7B894BE2F2CCD2F6700A4969B15ECA0E0692D03AE5E83DFDF4C9FE9E52BC5C63885A5E89068BBD5496D1F38C13E5DFE7AB6293953765B6CADB699EBCAFC8EDF3E6BE2E23242C75D5AD537E410D313196BECBDA7CEC17D382D3871FF96A8F4DE53D2B976F58490133054C07E74ED3EF000BB91DA178AEBD1B487839F6117729B74E39C671EA9437B88CEB456991B5C2B0E3CD4083F6C35C74EEFA64D0C16350629765DD062396025E0A7884936984F80C8EB8BAB87537028DC32DB14C1A6B490093065A78E4F6D70285E1C67FACD5E1BF6468C59DD9ED84F09FD965082C159CBF3659D566AB6039F955D6EEC2383B46B2B71BECE427D20B30147ABBC21B2F834843637C2055F97A74FBEE5A94E5843518844DFE1773E505B1F7EC981DE6523D12F3FB34FFF637A67B2DB02C8D2C745DECC22C80BCCFEF4391C2BA0EE2F690A9E5382C2E3038A8371B6630B3E4FC18527B18DF478C2120A950032652C550C4824EC27DC931AD3C00A51BE499B1012DB46B210D59D2908570520F594817362D6DE1ECE14E0665D68B400879C90806735DD7A20474AB5B0C1F60714B2AD50AAA59DAD209B9C6EECC4AB112A428AA00A0905684F212D8A8540E0A1454AB521662DA1816917BBBDB65AB27EC4FDFE7BBAC0891244B24E326CD541C1232FCF36781C892A9F4D430FE5B51E6633AEEB9656768D2AB7A9505DA9592E60E53200E1A88EF516F51BA5DC92BDD5170DEFFC250A02356804EDBBE919579B5CE1BEC5CBD1D31DEEFFD92A514CFFF7ECDDA6F7E4EB7C75C6C1A11F18BB3C28739B343F805775904F385D197C62FB3F6E906F5D1A70C53F43D76C610E1FE88B8078A91C2731F944061B1BD500CDF939B0DBCDD6FB765913787371F9855DFC250426D879BEE16C59134C168AD3262EE4126067B62A166F36EB2621D463044284D31A629C634B259706483DCBA665A898DB5772CEC38B8518048231B159CEB4CD8167909C3CC1DC74A845748CE83E9A517609D6BD0D171AA0580A3AA89046AA88D0CEF5B235B4B12E10D35B1B12801D6B5066D9777D9D6408457D48007D3D740809D38DC6F9F7082E53FE93A50187FC51DAC6011FC072A3DF6928314CCF3E4062801871421773E841B9EF42D97C62696B3E7485741D27F4C288D49D298248D49D298C4342621F9886640229683999704147A517E64A25898070134B29A16E8038C9B2823FDA00982D1483D71B8D42222D6828BC090E03C8C467001D047F0D6CA3C384895C8ADD13C58A869C387A7ACD9D50F93AF9819CF7CF304235EBC37E58A9978D7CBC45940545FF47A2417AFA65C23E51A2E6E0F77B5A698326B52570FC5E3BEA1AEFEE54030E2D40911C1F7AA8B1179B18913CA328EC34BFE22F90BC24999D3EDDBBC19F6B342395DDFE3EF384826A78300E49C0E849A94D3912B42A76DFD2224E2B93272DDA8971FEB31977262985F1C0FF61B028FC319FDF95094F9C74DF638FF6CE7A762156A539D2105267B1D97D726B620CCF3302E560C35034A6A85BD00C9939A4DA80DDF29AAA7A83EE9A095EE6E0812F5C09B21F81229880BC5012F08A494E50923F6BB421CCFD9439C86EC9EF10D3F4A71461051A0BE4421D2503C39BFC17F06C8710899B8790E16C1F3543E87BE64C68379A5715BF2F0873FCF43361E7CAA7753667A061ACCCF98F33C83109E533D1CFE62B33D03D7B451C6A4A590B4B0C6D3069723DE4B92225E8A788493FF3D0C4CD852DEC6A08291272C5580C1F754308C54BB2A6010ADCC73EFAC605869F65628A1B4B25BECAF70BEE69D5E8D1AEAAA774C2DFE75EF588A6957BEF714164B8FA25EFB1EFBAEF680D7CEA77099C2A58717C4BB6BA7DEC52A394386687C9F38E9625680C8D29E31D4CA46F2B0531FF608B9B93DEC6318877F1B85F7DA04E053C0950A1D9C9C5BEA80276697F4F9E500EF37F7BF62BA502A81AFEF1CB197739A94679CC70A7BEE715CED757D5F944BCC5255BB6CB5BB4166883AEAECEC967AD1F6B0B6119037D0451A860180FE5E153BCBED915F4DC2BE70133C8D5CD2C8E54C97206488A72239A086774721D86C802900C23F5BEA7CFDAB3E5DE948C3398A50A896CC7B4FC5AAA34067FA5E99841480415939189DC83CE034C92F5C24BFB090FCC256F28B90FB58061EC0242E5FA4166FC60B1F7A169ACB1E6010B5B4412F79E888F6B16D7256DD1392BF44BC68B7DE3D79DEAEDB612E955D637E919E01479C53569DB2EAC93B03528E78DC396298B1C3B4DCAE0F19DA1C4F0252464C197286FC6360A28EF0028859DE1011FE7DFEBD58E5EDD42508B2B195A7152FA05339FC42FA88BB58506FEA3FDA180740C2C52047C69F6FE39C76710E5FCA0E7F7955E0D7146E0615023D9FEF0D7712CAE800F490921F3080FBECBBB7A90085534A8D8B4DA2129849EE8AD1DF144F359089E7A40611FCFC1487BE94AB1A98E611BC86570F4E539D298DF5DFA4F16133E95521E26A288D787E86F0F7F33103EA52FE85303C4ECF72D3149BAC79263510122B5F37939C55725684937BEA469D8E94B2319FA5548D2D9B94A27DF8B1CDAB76C2B9A78E40FF6F4CDF4925F0F49E23F262FE93B20CB2A569D9A34C9DE40B1CD1A22FE976D7AC0539E91488D84F70CEA96BE520479D3A5AE9B4530AB6CB045B7AE628A39D1D8EBA5DC0BA134099000C42C8B11806F33AE86425300F09C8CB02A8C5E5A05CA5CD2915C331A78117000EC82D41A985974143A441E1DEA815D2A2037AA9969368C263B5309D8593A7F4646D0A8829203A386C9D9B96DF991D902467AD8455B96C354208C73D7545B4C37FC9938BEEA4279DC692691CE3C8F62A6B77EFB23263865AD3C62053430633D40E3234A263A240753C440FBEDCFE96B93CB8FD8267F5BD2E561366D33A02FDBF31573CA9049EEB9D23F262AB9D9465BA3648DB11835D1BD4A93BDD19E434F718245E1052A166D2E8046B08B908A5F434D601ECD73C829C208DEA424E731A66E1FA64E24E861EC7754A206940A786743EC364BA924A6025EFC605014C124FB989CA56D5123020B300A3165B040C7D8716CF48A365DDED5920D0B4ED839462B8495921BB3EA049594EA20993B2309D8573F034299BC2770ADF368EB9A01D46E794E579D3014972D04A5895B356234C72DC57F563510539A4C2528AE79D89147E0E79405DCA07BF5DA118DCD25E3DD55F04D869196993A8747E636901A29D138A715CA7B3B9E76D88191CEF633ECAFD95AC139176594A8592AF9421A63AC72FF9B66E76933D232513D52D7A3BC5659F10AC764D5D96D1AE9ACA774FF53A0E6FA4EAE5997ACC0A5B779F6B144FF85735433DCE29538ED7B52459FC3A1A4866D1F321D8D12E6F803759DBFE5137EB087D1DD5197DDAD5AB18F7775E8FE759AE8AEA5BA4EAA3A0F469BFB98F91FD1083BF7C35FB6091F2B95888CF9F17E173BBBFFF47BE8AB0388699074A1ED3844C9A9009B69BE33AABF659F937341CA8B209B3CED7D948E5254F335E82D149E0975630C84B25131DCB05B6775C66EDD3BBACCDD71DCBA9EE62D9ED229DD041F6651CE8D6939F60BBC8A1EECA38D45D2C41B78BA42C21650984D3B45D177CA4D7EEBD30804A33922678BF7D18D43B3B54664030D4A483B3AB460F3CC7EE0C81A1668F861ED2549320FB351C9A8387D7D7C2B23138D849F3DD1CE1707B39D459F5016DEBD84822795E20A520B470F69D3676A40C216508361E7CF38F7EF068F2DEF2168C1157E1C9D5287AAFAEC19BE6E1C9A5CF74CA77E2FD5B1CA988CB2F440CCF3597017729EFCC2A6D796718F03E2EA822E93EAEE4A317BE8F8B7342D28611B954F6BA32C84407BBDE97134E1552FCEE9FA86E150BE0EB567BDCE5DC2AE61867DBC6CFBC652579EEE4B91D9CE3E7E631AB8A7F4EDC0BC45189E7215931FCFCA44861296F49F9B684561CBFC14AB0D05E545002AAFBABFA31C45AA5EB76BF6285EFB8F8F0635B347988ED4FC95527571DCC55F7DBF2264E120C64E2F9E95E043F1FCD622FE59FE36D894C4F0124471371343F780B6924CF9748A378A178D208FE267BC6F3AEE196BF3A822F558463BA4658225F57A9A6B69CEB7CA62B6E69F92B39E3E48C2D9CF1B6EB310A870C77E9BB118BF5D10660C06D9B304278F2609E3BBEA79EE6996378E2604B5D47B9FF75D90DC59DCAD3456FB6555CE5C5F7308F2674B4D2A309296C2F13B68DF771F53E5F791F1708A00AD121EEE3B2115671AB1554AE16D574AB954ED2867664C3EED48115000E482D41A965974183A440D7197EDC7E5A1A8469BC6409C64F87B014D352A29EC2D203D493BBFC3664DA14309B4B39918FBA82E4441DAD9413A59CE8C07222ECF48D799104A40CDA32E45CF911E164C8914418BDD85372A56E96C6325722EC0014450D24487D3D64F0607953F0950029913AA42501A4E3A7ACCD3F56932F3855925A3AD722395E5A1048513445517BAFDE6EC890D1E0D0D553F7141D76EE7A2CADA337A04E73FAF9A668B1A3BDCEAA8C44D7699BB8457A11BD7ADE74A278BA720E7F29FF1D62374AB7177DFA9A003380F4F59A1F5082389506F57253A9FC5EE47F4CA5F176BB6DEAEF934509174AA21C1E24E605BB49A1F7DFF5B08C4F84416407A880739EDCAC6D65A5901A493180594E0235CD2737F943F1C3DB13774F88A3D49BD089E881097F4FEF3BE02E9639138E71F68653DEBFD5F32F1AA75C38E5C24EAEA87E28D0D0AD6D433D612A518CE89FAE263D60CAA12FE6A5AE0EECD9D2F4DEE8E1A46C0BF9297BEFD1CD8605F31D3CBDF83386D3FC874C64312FD2B14EBEC42147EBA776838CAB934F8AEC93BEE4C8374C7E0548F44C1CD5F8FE8913679A9792482DEDABA800C963B9ECDDC01A4BFEEAA8FDD56D56E6C1065F2CB178DE8995C2CF29891496F245846F7241F6C4023DB9997C507C1F143661924946F64701522598CEA2BE2925492949FA091D146361531DD4B07A26D38CE7A1D86DED5EAE4920B0944F5A763B3EC32D880764E8614ACB2F0B923301D3A7C0D793897CDEE615AA73A049F9B26E831163DA6858995FCCCA963B1C31709A1AA842BD71B3C99A6F21DE2D36ECB7A1CE381DA3507B88B4E81D624F53D6457D70A7909C09DC8DF0E37E210D98B46B4807EBBAC3A9D4BCC401F029E58738D450368297219EE1F83DAFD675431F960A76F68021FA52C7205E62F7BB20905F760751592AC523AC3FD5BB74DA20059B146CAC1C36397F86FA9FE2F098CE53DDB1B8A303B74491BCB92D5E28D71EDC954774DDA3E3F3F2D91CFAE2CEFAE48EE20F353BB653EF87798540C40B8AF0746CA0FB8930A974143F85F565C2BAF1283E1BB79447F19540BAE03DF355451C27C5517C158C5EEC69D716E1FE6D3889CF71933114F28B80FA4A48D001D2A5A99952F74FCCA12D11C073403BE02E9519518E97F53AC2343FE58D7F2FCF9BBE0535BF3FAE2B34BCD8DD20F323CFA0CC3D6FBC5E37793B3F9F40C956A867C689C3C81B855486FC66BFDD96C588FC6A12F6851B76CAAD526E75A6CDADBA2EA289F128071A80C4B03E9629223903E0FC3A79D7EB8CF913E6C1834262B2101A613930BF1503ADA86A110DA2798AD4760E84A2BFD2CA26C1CA420A204A6945B869625F38887D6116FBC252EC0BA784F36DDBD6AB8208D955E25D567DEBB7BDDC31D931AF830FD5FA8C4AA180BF1316E071DD5950E42050B25920C15748AC372FFE9BA466338BBEA20C8BCBA1D7F3E45F49E4BB599D5D9195281F6951BE5B543B39952D10AB6D56DA4922A02B72E121C24BD9306EA781A558F23EDFA2064712DB29DE461636D7902519180A19BB4973AFCF19ABD21BDB55B75A38386B9509888090795DF56B99F69625915DDEA454222C6A4B2AF51E8511711DA10B5556AE440C5E813D9510FCCC963A8793E285B033AA2E6F0FE89E784DDB48310E5BE2D8545196FD3C9A4D1004C141CBC2904E2605938E10FBB4822C1BFAB4EAB6725A0437BEEB622A62F25C126870F38AE6B094322CE9AF94FAB5B7A783705A6416DDDA6709D0016D4AA41CCB6329E488E0B014BAB691842C2E1C88BB62D77C2C4C20B8B382968916F65580088BBB2A40B9D69674008E4ADE62745F48AB4B7CD3C3282ACB02768EBA599A821D6072A021073438BD24769687E904B03B7D1BD88842048965799759FBD4DF2171778F8628063FA680876C8E05753135158BC55D9B4190051D9C41EB565686B0227B39AE16DBAC585B24651A9CD96C4E60B37C9E6621CDA2D99A452358C98330A3A76C7C5DBA1FCE8628E1CD678C32ABD806A99428A2512A1BC44AA60EFB308DD32522F338B31BE5414466589858D1196E816319887055E1D751ED0C90C799CD000536710D1016269601C22D60238DB84D29A20D92EB5A6CC72322B0CAEA089CABC949C4A3D89A4A8A858D4CA5E9231A80D02AD84CD981D033D856D4E93BAD1851ACEB88A7F1C64A388C6E218419ACEC2006B53A51161F3CE8147F54C3595A9116FDDFC9E47884194C4E6010D3E4605122991CAC78AB0C0D611E98C9B5D65194819EC9D8DAF8511410234A1405946D23C7412CDBE357DE2CB640F26090491108177312482EEFB1600116F553B05AAD8C27B667A2A21B1C120B14D06862B91E88FB821E07D2A60DFB837031FB160BB5CD0DB6D28305B4968124602F1802FF39AFC58812D8D94C2FDBD4957358B13632F412C44B7FF00EDE06276E58FC7E2B85324181A0C1F4A707145BFD97972FE5863731509895C9525DD44032854FE4021CABFD9A2A04501923AC5336A862B17C42689064C99CD0A0F7A3490BD98A58CDDFC1F033D95BDC593CBD2091ACED9867F2986AD8CEE5295166B2B8F8337A4661969D603136C0F1CCEA75027CC976FD0378E6F1B00E09344119DEC91475EC2218A38538CB9AA345731CC5A8BABF38E32E6BF24C637D0C146C6E14C0CDC658A28051BDC522D924CC9E3605B0B733222CD8640302346AC39DF08E6E2D16FE4A800C6E3551DD914286857D9042C5C7E578F80B3D5ED9581487308361F1F4ED13FE199C93429825937E83DEEDAC8DBF9E49D2525CA3BB7035BA8B998DEEE2908CEEE2708CEE628AD14977712D6D74A6290D1E2EB889459BBF800588614D47B79431486EBB5D17860F6E4BDE5B7467F056F177E8EA956E23C9A1ECCEED6AD28B639FE74B183A93EB817D4C4F66142FFF57CA12651CA06C82A31A0F0CB5B0F47402FCEC66173B8A2A0489E0EE149A3F82A8FA3EFF5EAC8657B4EF2EAF0A44F7E34D7F75AECA16F46890E5F1182E7667E00598DF28BFDE00FDF584D7A06D95836167D5086160BB121EA80F6A44B0EB7F58B889BD4FA3671B198804B1FADD870DD9BFA0B5230606B21F5AEC62372CC185ED0560BD989D007A3C7CFBF88158B4C35686EE5940B5A980E0A0D574904E7603535F3CF0EBE55830EEEBD56D95641244E665D3B85646B630581B190B1DDCC638E2F14C0C1223868541BAB691833EE77628F695D31F16DB4BD428C12D4DE6B0FCF8D92CCCA20368B3F66DC4E9A8441F487772C8575775B53319A11251638A936E1F33F2050C54D505C21AA851243B33EDA885B15263F338D86A341BFD587DAFF128C6FECE61250664953DB08B15AA192CEF1F8DB22CEA1E8DAAB74FFDA23B47A12E863946107A26838B35AFA81563C1DC4FAB6B7B0B8B3CB338D4C2F65E621542702B8B7F41B14994384EEDE8AF29E66B62EBD10C6726A69B5A747F16F7A8844ED1D6B67518CE4CCE380B5A60B23225A2C6E2268D248C7CA1651385A5873547A34876A6D9510B639BC6E6B191A99728DA9B4AF56351592D504990E0AB4A0C90D3D34A12F185971A94022CB6E0A0D4EFC12F3B5C67D53E2BFF86A4AD329777700C78907DF1282E166662B67C3E6729D1A2699D65931CD18815AC519F4239194B87B48059F69C164FFE6CA4593009B46986A319DA0A95B11DE0EAD16635C6F8435E3B81627AC8A31FFE42F571748F2CCEFC067928CE1112269E6F84DAE058C6C95C55E451D5E61FB4C4CE1CD5F846D39C3476B61502305B7DFF98C37ACDF2D95972472EA4299BDBCF46B45EB068265DDF1765FE69BFB9EFAF72525BAF040A1A2A0BE5649732F98587D66A09161B5BAB757CF083EB9BAC6DFFA89BB5C18A7830C882060817EB11C82E6C3930F7C5AC06D6E91158CC33769F966BB420346C3F14D0CD7C20E28B676E5A3116CCD9B4BA3E9A81EC500B9B05330838B875455D30D34911C3B68E78C16CA84393AFF2E2BBCDCE4F354A702B93392C3F21621666D1C910B3F66DC4F94291A34F8574B5914720DBDE6C0C36A2C6D418E3A451A7993160A3AA5E10D646CD32D9996A2F6D18533537919554BD4CB13DE575B6CEDDF23C0943E72731B08FAF9499440BCB4A5122C466A5EE8F2EF7233571C9FF4484D9ACEE2072419524B16CEE047242528FCE573BE48530DA6CD627738A9723EA058A9227EA5BC321F21E4AAE486AA4CE2936D8966C0C474FC264AE2152481B3134B924D46B66B0673B01DD124B4C37A07DDB35A54B9649048C66E8F9A6685BF4F7755665387E6CEAF5BED458350C0F9AB000EA64B50A36D0F21A29992DE4EB05B133452AE25423D46BDE46924E8E83B1B5A676B1340C3DBB9D1126111EA6D10A62BF2412E27D1AADE20F7E79E46B93556DB6C25FFADDB6DD49797536A9C1810C4E067731391DB3C5473416C22C38A8B168071B6962DF700054A3346CB952A32C62803DAF43B03F4196B8E62734828D309107D4BF2306754386F6964BC44A0CC8F4586017A3533359DCE68CA22C687246DD1FCDD42157139BA94315C26C561775EAD024492C9B3BE2A943AE1E4DBEDB3795C5CCA1166B36DB93182D3F6F6825CFA2D386564D6123D117821B7DD290A98F3C4B443A5A45DE3CB3B0181DBEC14827CD16DA8A0098AFAE9F8437611BE9EC8C9990C32FA785B3669BD6B3F6B244B4B8266DF120B908A836520F7B8CFA2CB94A8408AEF2489F261F85671F2BB13025163CB84171C463BCD0A01765F18450A5703B13E3DF92896C689606368B61C51D6088FC2358D1D15D77DF0BCE3F4FA27E694D011FD88E44EA313D94429608C6A5D0B98D24E21B32B11E5983ABA27E634D013FABB9C57960CD204B7473737A5E4D34B7659E57FB807076CF08070D3BAABCE91744DE5D7EF8B17ACAAAC71C17E53FF0088D46FBAC42A31242E6D7BFB7F965491739DFBCD8357B796916D3BECD771DD56E69E6B1A9F75B448F16B3EFD3D2F2BF74E592090AD4C86BB63211F2D984BB5F17BBDD3D28042EFAFACE48E23EABBEF5779DCB54DEA1D2B7FD2AA28914330925531A072B062AFD8A914C62E887060A58E8617908ACD2506A524E51961009F4D92C0646CE8601F1BA9F9300A901731726656725EE41CD3ADB41E673D915BF27C5465AEDD31675F0A7ACCD415AEDD3CD506C41ABCD4AD80650D92D2D335179CA9A5DFD302C6003B42884BD7162B0E6B9A81E6A881A292D2C24C347261544BA23A316047674430548A1DB6C61AA0E59FAC0132B506D48E12732E766D9699F57F55ADB6F2FEBB545E377C04FCADE07BE3F6FA44A0759B078FD6B85B64486C7BE94B4C6F7C00C34D7E4CD1D7565C5478D0CE45080A62F3529EC8B79C9C94029C78FBC28A8F42FE5984874B7C20304863BD6ED488C3E106A40F54DF106EA1DA2DAD18B0026ED779757027A1FAE82B423412B9C6FE00AAB2FB43405467C919EDAD8F82B0ACDB49A7C5B37A08488D217526824834D6955570FC5E3BE21B91444EE1A015D0A4026BAFDD5281035FE52114B4A7A23345D97626242AE61A8C8350C8A5E27DC73612488F72B2A4975FB3E0D44EAE631AB8A7F12952B487D6640CC04B7DDBD010A62CC450C46426403B0BE4DD4C708EDA86B68DAD3201BDDD574E8EE70075A565556ED7D37F1C99B6EFFA2AA81A4FDA2268A4DFE50FC80287505067C34387C28765775DBAABD340063A2DAA5A21A9A22842545BA9C6AA62BC019A8938C574D942FB6A16512130232D0DD8D3BC0D41106DA7D67A0FB9DBED8A4B57AFD12AE150303590B32FD0492828C4C819987E0479EFD88E48E1D0E33D0C0C8FA4EB57D839BB152600CF361439D8441BD34FB6226D94F823124D9DA08AA38E77561A1A7FE42B7617515509004A3AE86080AA9A484270FF474E6D603A7FF6EF1C6642BD01A8FBA5185A59EA936222CF298F5EBA3143CBB22DFB60CE90586D4D4054400B543667E746A8149CD6E310C5B8DC1C8507635D1988B8B42963313F1BA59A532B4F7D20215515D48EBAE12D575B3F39A08BB1355AF144B038176AA7A2A6329F390B7235129617528A0F5358291540A02A6830D1A53D0075407358087DED8C9DE3B1C23D436A40255D7488101A98B9F93D66849457356EBE2986EB362AD77413A70CB9AF158E13426D09DDB39F1BCBB1F2ECA93516C2B2A610654A24C3B8A222DFBAA00EE58C9D07D56A0BB5CBFE517B98D5A13C02D6BC76385D39A407776AD9149058B8020C1E9EB2382AB14D442CB86666A0BA9C5906CC180365531245DAE9A592CFB1A59DA054710D6A6467661D14547110222658C85B4D594006B532F1E2584A6048ACB6AAAB5E96E2CA06D8DDA70DD8D25376B77233B0FB4B36902845A7A1E10D2C2B80342A30481CCDCB641D9A94D822B3749AD360087AA2FD7ECFD861275BD070893D03DE0C4BA0F6480DA33DB5FA67B847ED70EE1382C19001E0104D47461081EF408ECAE229D4F00092AD40351F3D1CEB80BC83861A884D554498102AA89D9ADA4D3928AE4BCB90AC3D594C82940EDAA644AE6DC95B45C3EC730B5C8E8D4D076F5B2C8EADC95B5746227EF74D346682DBCA6861A345071E2163D9DF674B4E7D71FDD8D77473748430A630174B560E060950CFB0BB5CA60C900B5CFA01DDB13EAAD371611C84270BD5938E960792BE0CFE8BD32288587B5AA10871244453CC579FD33CCF5C2414D17EE6ABA08AEA68B85D4A409F1028845153421DD4D178B44F29E99C5ECA702D4A22616B39E6EAA5974BA53D8076EE589656073AD241CADA214BBD22D292FE5A807CE66BB12411DAA6561575EEA5AC2BCF85301779757455EED98BDFDB2C20C18EAFAE91121F509471A34BA33D00654289C6F08AD48F28E9C597BF27373BA6A71AFCE85D013F7DEDC3C037F7AC243A90FB6582D360305D59F3961A2A93B4B64E63A778752BA798361631B507D185253091001544A7F6646A71298DAAC1E67E04977E35AE88603B4A80C0B3F59331CB16514D3C9A79FD6D0405BD44A429AAC2799E2DC415E7558EB6E905BA935358EB1A64A548D06B92DE76665AA59002A553492873EFB936556BB5DD5C0EAEA297120D50D27E034FA52139CDBF604CEEAF41206B4AE923AB5F4D0CF12F9E4C0D2622FAC12D6A246163B629D34B4F4BE589EB185FDD8CDF043E06174B3A0F1C8FE6F1057A920358EB1824A548DE2B853B5661DAA59402313B86D7C4EB630A7709519B80CA4AE8E040B1E6EE18E06EB4EB848D4E64DCBF9D3BA5661CE84A2AE9C011352DC78D058A33413DDB91D17C87FB80CC552833DBC6335FB23514175D7139DD5B3099C2D82A301C3BA921681D247774BC74B88BDBDD571E06E750C6C731CCDE54C4E0E40A3F006ED69502D6BADA6A0D3AAEDA0C99615A06C5503FA689BBD5241196B01284DC52460505DD2750F3A5DC924E70DB9C3350C4A9508106AD979404815FC95101A3508A4E65641F7F4B169A80803EA6A01C0C37A812F9AB0A036AB871A581AC640209C454D0C632037B52C3608523FF7AED58D0C6D5129E58BF2FE7A9249CE9D1A985F9457EBCDF6197AA8AE160FD1CB5AB48D6AF66FCE5BB4D4042B94DF3ED718A1E1A174D060D44FA50315DB0057DC58525DA4CF4A2F769B94E5E6D194EF7B4F56D5E2DE4DF1D2B4495F86B7A9D51554BF4E3D5977EAE7A867F67836EF221B14EAF2AAB2520396EF2A2B14EDE8115D9E50B66C5A9F16503CD80BA9DBE66D5FBEA686D77DD96A09D76CE9F46778CC971B538C37BE855755535B2A8A003A5408C3875612A139F3C911DD63A9809EACDF56E56A66F3BA2A533FE80E2E8DDE6C9E539D259E685EF9B4535D699C15B2781534A8E2CA256687D40F54026AB37CCD92AB98F93D4BA65EC3C5691A4D99DFAE9C5F5186D4CEEEF54575AD0CA99DB39616CBEAF48F009A34A57F35505D3DE5BB815374A67C2370AE64CEF6BD3ABD16ED9FBA5355DDEAB13B49B3B6D99BEB9376E626F456B5FE6CB2FEAD35A04EFAF3C9C35D8E46DD2C784059F11498561BEA47C31475019F0DF3D60CF84ED88CBE4C777E5BF7C015287E18252C5979F115268D16B40F368115513DD9E4A917D51B4D0B2A083CDA64F5C490458DC0834DFE0A0A74AAE9F539451F5EB919CA5E9FDFE2AD3159F7E1F5390259E5DBDD3E2BAFEB755EB67DC175B6DD16D5633B62765FCE6EB7D90A9F88F897DB17673F3665D5BE79F1B4DB6D7F3D3F6F09E9F6E5A65835755B3FEC5EAEEACD79B6AECF2F7EF9E55FCF5FBD3ADF501AE72B2EEEBD16A41D38A1941B0DF484527C467E9DFF5634ED0EBF59724F2E43BA5C6F2430E84D1F5E8383927B8ED0B33D721B62247CF16F8F857F534C86E54B2CDC55F69C37C2333F02BD51B3BFA1CAE2C84BEA9D330660C047146E57599935FD134BFDE0FE1BC1C00F3D5DD6E57E53499F45FB54D32228F8274F8BF9EC48EB26C3AF3701D4FA02477A1FF11B51C50339C723D1640BEDE97ECA50B62954B8FFE628DD5772EB862417FD6C4FEBA66E77F9FA6B2D34E8F0D551AABFE6D95A21D958644FF316259CFB9627D67FB3A772D9E419AACE5BC13698CFF6B4FEBE5D43B498CFF6B4DEE7658E90DE3DF3B498CFCE7289B498CFCEFA1269319F655AAFCF059723FAB873C9C909A147F49C767E153E7EEFEC4E0132365E1444533B4F0C2FFBCEFEAB7D03610CD9738E5F53074B1D2C5407EB5FF90BD0C9BA57013DFA990A53D958F82A2882851FB8E5DA8B2B7168FE963E962BD272A3729B93D5069110F3D99E16736A97A5A57CA84B47EB06E5C428254458B9E89EB8127B8A57F5E363BEFE5889FD98FDEE4AEDF37E0793EB0A9CE81515E4FBB802870E8D06034D5D967923BB65B1CCC1CD937502C0D133DF0FC651B04F3A4CF715DCDB9FEE0E438FAE0ED00C9E1CA7854297762448F41543BE2199027B7A8C20B27148850E56DC4D488AEE89FDEED0C7C81C83486BFCEAAC3FBA8F15D4605FE4A6C30A545EE5A8B5CFDBBC42B6F80E15552B819E58E692BAB4ABA6D8E28E2E262F4C81B30EE5B119579012C79438068A07DAF53DD77070A9589DB108056A547518181C9E1403D81277C70A24075C898B81AE8A4D56DE9419791B943752AEC85DCADBE7CD7D5DC272F6654EA9D17794722377856FF2935223AECCC57DB7F9D0B2820B674BEC297EF891AFF6D8ABBE97C4148A92934C4E32909354EF4672F5908AD36E160E5289A9F68F5D122779C7F1BB6B9A287B46F6BB2B356825802F71A528E74DECF7B829B63CAE60BF2FBD38D1E593BAAC5801123BE5BE2CEB5645552C4B3120C5804031008F39FB276DC34C9C28A859CE9B28B1F5D3261D1A3C6DC214DAB721B35756CEC9A44207AF99B53BB09373055E72BEDDD0DBCD1492F6C5F6B4E59CD935537EBBC23B3120C1F812D71806AB502C9BD7C3C59AEA849F6674EEAAF8514A9F4E0AE369BA274200FA65F7D561D085303E093B05FA6F5EDD45CC82842227E319AEF690522BA1CC25B8DDAB880A456E3A94BDD9F8D5C135E40F39CE1945FF307E7619A46F3652C63C7C74D418E46BB802D7768508F225AE149569B854EA58771561A930F604CA971C23E6407C610B5C56109F736C2D50BA2B96A5E43925CF0143B1FCB07198D82C1D5CF08CD51674F4B1FB6D77FB5C0EAE4ACA006ED1487455FD377B2ABFE14B6684BCA0FFE690A80E6ABAAA5799BCF00595274F923C49A8F5AAACCCAB75DEA05A86D85178D9917B0F90B359B5D2A2ABDDC5D7ACFD26FB88FEAB43928E30E439D9F1AB1B2560F83E7C8DD3F98ECA3099279A4318E6F890B39761EAD0354BAA0C1EB0AC2A943A34248329C620B12CEE18B57FE7031E50CAA591C7A959F50D26C997388C10F60D6E08FC3AADEC0FA4C2E31E07F756078D5CC53277AAAA412654EE32822BD6A0BCCC77376A4A3985B23416B6A19A32D894C1D2624DA2405F080F9325DC42B42C530405AE3E3FC048706ED097B8E505180BCA09FAEF71F38139A2F63CF3E0E17381BE15E444802F39EE2C00D7038AA8EC77376AAA882A96A5A86F633129EAA7A87FFC51FF296B76F583E64A38E7D84F294E387E63A4A0CE0394A76FA69CBC9167B23C4FC884BE6720CC96BBE423928FA0C52A1F816DBD7926D76106F00F841A70B0C3C633A8713563032A3E3034180B5CB2098224FB04AE20F5BED4FB02F5BEE17189E95D8F9C5EF7E8760A3C75972347DBA5FED67F7568F216DADB3F7E755864DE97A54C69FCEA90A837F54351E61F37D9A3380BCD953884F16205AC968D5F1D120CB2EA27E416DD3737AD6353822E2CE8BFBB9E3208719037ECE907529BFA5B5EA131E043D16C803D030A90E4DC93730FE8DCE9C5E061BCFB578896A58757E0EABD3C460276077345EE9E07F6F96349EA81A907861ADC90796D7C9D7088B10D21F609BA46D96674A3C3D68C6F06346088C395B9AE04603C6905842B496B20AEFA04D62C84B2E35EB53886158114145250A0C5FADB479E57F53AE80524E44CB54760D0A26B220383A7BE8CA42F751F880193609E1792CC7379C81CD79C24DF917C072D36F88EA76087B2FB0E809794FD0F675B5131FB12E5416D0020D6D4CECFEC9FE6D9ED30C7F5463FEB86FCEE7592307905A5E5E50E54A83A1F4071A0CE3F96B8F42A8A255F41C397B853847A3E5B624F913E82CED3EABF39F5CA1D1AE1DEA066AFAB56EA955C99C3FE04E8065F8FFB7B0F758A9E5C6D2E50EABF1DC2C989DEA67ADC57B0C931C5FEB42FF4B42F520E9B72D8F031AAEB1C0143D5AD82A443C852935087AE77F5EE0938FDDC7D75D8CC8C30E470357E75A32487A9F16B0A51C710A292139CDF09860963915CE93AFF5EACF2709301EF09BDD67F1EC04440ED4329A6EC45C7EF0EDEAFA9FF68C5AD2AC3C7E5FDCBE75B9E04FEDB6DDDDAFE798F4896586C33AA9740BBC9C6A742DC8D5083ABB6BF01493641AEC8BEDD063471FA852B98CB0E527A7EEC9129524FCE37595106EAC51F369E7713A910D5FD9760C87D77F8EC301D8951846948FA69E9BE7AD3149BAC7926DCC1580402245F907C41285FF0639B5741AE76F9402979F90225AAC61B501CC01F8C052E0B1404095A9E600AE26E57EA44117754319F1DB73EF587DAA0BD4F4C99EB36250559A9F0B8372A756A87F62A0945CE3455530C40718A042912848D04E37D96215618FBAE10E0324B7B52C6A0A1BDD2128671EEC48ACE9BEEB64C8EE527732C9DE5877B65424FD0DE9578CC61F2984AE7E1B58929740E1AFAA589908E6DCE572B0EE78588251C54C815111F07156B36BAFA5E17AB10E3D68F9492D734B41255330B4D718039E8B1C061069A22893902F3391DB171D2A4EC7DB982E31EB31EDD8316011FF3480F64A4EBC152EA1F274A67DD583ACC9C42E79043CC29D893320674ED9C020CE31C9C44B7C57C4E730AC9B1FC448EA5AC1F8B2ADCAEA82B4CCE7F3E418FAE761D040F78C8B8FFECD01D576818D27E2D809B0687EF4BAF6D875865BFBC2AB0B3BC01D7C6A5C2E5F78F4DDBF7D5B58EF4BA33FBFD90BA5C936FEB26480C4726FE8510F3EB6D2A5C6D57033B9AEBED7DD5AEA9CB123C212494396CC0CE774FF55AA6C87E7798F6AB1F85E93EFCC1213A49630ED5D0379221621FB2C2376A3DEE1B92598430C86B44F4524BD4C2326D88A84D54C2960D160471F4C8BF35F506F0CAF4B3CB88B26DFFA81B51C4E1AB83F923EEE8D3AE5E894763F912378A5D50B82AAA6F3251AED05152E4783EED37F762F010CBDCA85E5EBE92C9918FAE742E203A4EC7BB28CA9F213A7F76A573BBBFFF47BEDAC9B48602377A72AC1CBFA6E1451A5E840A31FFA8F74D95857867FB3AABF659F9374ACF2FA8E809A8034A87238711A6C0BEF93A2471EA80F9EC600A59FBF42E6BF375872D5884541A7711A313434E8CB882535C1439C4458CA3591838A2C59679163152984D6196161BC26CD83D875CC00CB14AE04A501D91371211E0309A02C8395E890E82F99C560B929FF999FC0CB9CDA02223F340E7DEE8050974B0EFE553F4F89A592282084C0D0DDF1D46D48C10C2A89A2B597AE5A03BF4A6160F04480E23398C600E63BD2FF360AE0213F373120A4C9D7BC028907BE8BFBBB8078C837F8BCE61FC7E5A6B27C93124C7408B158EA16E1EB3AAF827495103B987CF0C491F2761C057BB0A1651761862A9C39A38C16C09A6DC31E5523FCAF24A805CEA4A99D6F6AA7EAC21CA6CA9C3726CB1C2C7233EFCD8164D2E68592C4B8E2A39AA408E6ADB2DC4067252FDBAAE8F83D2E0AA9D538F243B26B624C67275BAA4C74C2B7560B9DCB9033F636661A7466F28D11093A2F6A4749D1CA601757A35A4D329083A9D2A3D05337E4F53A3C9CDFC7C6E26A07399E04C7C9C87DA59F8390770BA912F3AC595FE39F64D746A93F74D7005C7BD1BE14BBECA8BEFE035404291334DD5423F509C02420A088103C226931F0B9B1014AE01720E8101463707078CA70E107DA97B0629E67DECF7B84E779EF0304720FB19C2433F6E015FB4E48A9C69AADFB5948A537848E16186F030CBDC0471CA0127286CE96962C9BE41C2B6F9C74A7BC65B09E61E5D485C52CC51F465699E22F99D9FC9EFE4CDA668DB70CBAE377947EF3AABB247AF0785CC24344E65A80FE049B8B2A55726BA9D22029DF1ABAB7941B6E542E5034A59791AF48B6BF783FA9E0B95DF8BFC0F9E06FDE2E042B7DBA6FE2E9EF5EE3FC67173C7E4029AFCA1F811A2EB83846C3ABC0251D3CD0906D0C587EF2EBB22310EFE2D6E861CBFBB52FBAD9676560E9F53F44ED13B50D745923F1428316C55EF4679F562034DAB0E6DA4A1E9DB57CA6B60B922873E79054C865CC5BEF735DDD51ACA93FCA477B5F623E3807D5F4FD1A6E79B2898E703D4BD5F0670F0011D32E009B892E40FDC752ACDA930DF93773972EFF225DFED1BD52D6C137C8C96AE83A731D031FB1B8E80DAEB4860EEFD8492507B20B63CF92197152AAC37793DBFFF9A7CD091FAA0DBAC543E89EBE17A74E42C3C8E1E5DED68583CD9BF88A50ED3031853F626CCE7E444ECA986BC0B38B991C37323A1F31833515B97E29DC1C8D80AF732217761F015AE26652D296B49EE867137BBD1D6C25DA5CD18B0BFBBB121A27637ECDE39C9CF08857137EB3188B2D3920ABDE8CAE764A542C76D80C0F63FF70D8AD0C644172A9FB779852C0874756299836C65DDAAA88A655EAD715BA321B4BA3DFA622FDA8AFD8F3084C7B64A390230050E0115DC45EA773BE1266BBEB5A254DD47877579F8C162AFA78AD352685A0AA5C58AA0FB7D8D1D66D8AD93BFE7D5BA6EE8FD9701764EBA9153C7E1DF0512723086201CA3D1A77A277926AE206D944CFEE5A7F32F81BDCA442FE2E435C6CE2BB90BAEC8C34F889D9B2B883B121844019EDFE08B221D88399A6345E14E76E2090EF860275BE24A517DAC532C4D5121458550518138E37051C13F20B865900405C81B87EF0EFBB709CE65BD16DC21FBDD951AFE0D51A3DF5DF6DCE38B4CC51DF7F49B8BE7AB506AB9BBC99B165F05273840BECC219F859E5EF378722DDCB85F7903BEDFDDF7FB76576FF24611DBA45207AFBCDF6ECB62C4159EF8018AFD695FE8693B3D0094A2498A26B4F86DDBD6AB820C52A5907289D39FA6C8DBBB7D9B37FDF480317E28D0C46081CF2D41E16A2DF93C80DC5D378F2AEB4B1167281569557224CE8188ED80B538C8E52BF2D7AC79CCA1E710152293835D5260ECBF3A89886203CADF511B9F7D6C3FEDCBF2CD8B87AC6CA52B7A2D74F1FA1CB4187BA37A9F7F2F56C336933BE9854F937599F04533E3E12DEC4DCFC0B915074CC9F404C202E8441334D4C2B5FB5072D078BDFF6E2FAFD9847AA745529AA2CA1B1164F08ADD97E1EFB6FF80CD207BCCAF51D257B623DE2D3EB59D916AB5DB6C45AC7E9DFF56342DBE8C22BBCFDA9C82BC3843B27F2FD6798322E373BBCB37C4065FDEFECFF2B22CC840B307B8CEAAE2216F775FEB6F79F5E6C5C52FAF502C7E5B16598B50F3F2E1C5D98F4D59B5BFAE48A2915555BD23557FF3E269B7DBFE7A7EDE128EEDCB4DB16AEAB67ED8BD5CD59BF36C5D9F235A7F3E7FF5EA3C5F6FCE45F48EAC15955FFEB5A7D2B66BEECD33667CC0AF95FCA5A9F75BC13FBFFE8F5C32BDBE89BFE40F83B5105CC87788F8AF25431B50B144F879F95DD7A5FF92233BC071F226DBEDF20669EFE33A27B2BF38C32E2DBB2FF3C1AD9D6BB9101E3481A75CAAEF19DEF6DAFC974DF6E3BFFA91BBC91A62148CD823995DB3B7A342ABF450E03BC84288F609A5744DC86AD2E564B09256446E6AD495D65F6BA348D62AFB6B9EAD59A92651EC73604A8A2C7B3B5690497E29119C27EEC8EBDC8E9498D477222526F10DA02326F50D408D497E9DA9B1B9AFDEA521267E9E0C63FA39B21E73463F8659847363C9F64FD3F6F728F3FFFACEC7FCC9088DE0CBB322E62EC063CFD80DFA0B30FCA3D26D4EEFE2781FA45985C1CC446A37288B4529192297AF8310BCAA1F1FF335BEC36872E7A2A43EEF7761681515EF83A6752EE1C1990024DFAEC6272DE6EBB0EFB2EA5B97837BA6DF0C059FD8C54EB2327D4A1C7FFCFAB15AE73FDEBCF85F04EDD7B38FFFE36EC4FCD3D9E7060D8D7E3DFBE5EC7FBB9BC23013EBC6BEC79BC45C52DF9C019C72A12B13216238237AB8C4A027D8DD8D1CA0236131AB50BD52DC0B4A493E9475E61E08DEE7EDAA29B674781DC46310D54D1D35A5D4EC2453B3DE5DFA79F9C1D97A0D4F58EC193D5CCF269C377A9FAF8A4D56DE9419CA89A674AA5EB4DBE7CD7D5D86114E7C497B8A2F7A97B5C30DE053BAFE871FF96A3F1E3198D869932B3A4957445327CF7CB3CBBB8E31D564859FD10D5226E19C20A5A79D7376A0136CFA9492B34A676DC8859CBDEE32B190C962485AE2D1A329B4928B3E49178D074DE02AB6CBB480F2E0B54DCE281098D15F4A0723A74E2EB127B9A7F42DE0F0F61472D3B3C4B7ABDD3E2B43C8221E1F9F44CBD381D87786A2144F2A59770384EA95AB087BE01DF3150E7B52CE22EC9B779383439E2406ADD1840C4EC09FAE137F5904F4A913889D85CDE820318B4F6156D185032D21A6F7907041DC36738E25C88A40774224CC34043ED618C2ED926E108452C0C9872F3926954F2774933D93673202AEECA4FCF634F35BE4350C87915D42BCF6891673B4273EDC398E50AC00E143907EC648D21F7FF69F44808E3BA70D29A99F2BFAF96556E6A8E334783BAD5FF7FE9AB5DFFC46B03DE69C4357C422DC441FA6C6A65213972782F587852CA57DEA2FA4F55C236328F8588C78C8CA351E88F8A730EEC3B340BE52B0B8D3A264D7A8FE433E99C23481B2623D41180E7B62FE201AFD9CCBBB0CAB831D8E2201B17CF886C8531F95F66D116238896D320D4BD3B0F4A74F57DB2772B9AC7F0682D17DB28F0309F80733F17D1099076E4CFF40CF639F52C6D11BF9CCD9066673B099462FE0A9A719B88E29C54829464A31C2A41888DEAE7E9876E863C2818F9B658F3B849B1D339FBC5EFC9474EAA2A7D945FBBB513C4701EAEB542CB6EA8FC8732657944BB8CE997AC249F604E0DA26DB5E005F5D647792184BE03ECA19318FF740E201EC91EF1B6E46F7835984F33DBF21F070D46EF01BD26874BBC91EC30CC63E152BBB3542AB5B50C86A6A989A92FE82AF314223AA87A2D9D8ADE6A7A1CBA94503557A205D0EE7E89020222ADF343146E13F27C4298CEEB54D58409FD96562F22965FB393BA9FDE0854CC1E3FBE57D872F0381B48C1160EFC2014DDC730D3BE7E8726074B893F78388A73E7D1F6ADA3D858BD30C179D7721E778FDE2054361DAF5143D85395D53F02B2AE6B85922D8B517A9D39E74A7C5EB96934E09F784269C143E80192BA016C98504BB3927E0727BD8DB698E6D837BF7F4886F4FA5D83E5DF4E79ED12677F33A33A758F6D35540EC5DE838815554129EBD79E5DE16028190D25C4C95E6628A347CDF9A35705036E16E80EC29860B45FD2B554146B1FC1355014886BC6A37A5C6279A1AD32ED17B4FCF33C5F5EE29455AF74CBCD7DB8C5E14B30878872EA296BCA7775F4EBE6F01DF373D76597B4FDDFB59B6BE53F54A94DDD61FBF6D3F931DD728F49CAEABA9FF6843EDDEB0EDCD56C43EDF064A48F5CF9C3946251D3187F6B6B6FEF12D072FC3D7BCE866330BAED254682B1CF8E4818C27C0931C29173FA27864DD9F3E6CFC6FF521B8471644069967ECBD8447A89D8EC5266B9E0945219AF874C1D4894FB313FFD8E655EBBB99A8C3F6DE49D49F55F2DB4A346007D84BE42D89803E49944E9DFE237D89C0549737B6EF9C4E8F7209B26A147E2F51275DA0BD4E07BC95A8AB68DA4DA476592958100B0973B32347CDFB72C7DE45F9FACA503E32DDF298BAFD6977FB49D3863C0DBF291499C6912425C19E2C809D9D7F8A742A6F0DCCD9FDC3CEED4FE9FEF6339DD5F71A4FF47B4E7452EC743C24BDAB30DFBB0A8C91CD39194EB91CEC39954EBE533FA412EE5D84704F35A46BA68E3826FFF42979E738028DC4396ADE23F1DEA53B479601314C4C4923F1D4ED4FB4DB5FD58F4535691C4E281CD9C2EB20F38C5DF9ED0A8D97DAAFC5B857D0DB4A03AEE10A7B64026D8A0CB94F29D4D6A24EFFCF16AFD74ED903844CE94BBEAD9B9D77EFF19BBAEA10673460BCA3B4A9CB32E871817CF754AFC3D1435A0843C863C0646D22D7A8F7922B931EF70D716B9E499544C7CF72403273EF40F9ADA9378176A1646DFB47DDAC031924920D7DDAD5AB500729AFC7DD315745F52DA098C8C97CDA6FEE43395A620797AF82E42A94D645405A7F0E46EB767FFF8F7C1568E20113B48A296928FDD3E6D4D759B5CFCABFD5FBA6CA7C07D01D769A320FF432D661CC521FD4EC3D676433C6FF8E4BA02973FC8AC2BBACCDD71DD929DE33FCF47B27D4A94FBF9FF8FBC6292E9F7E5C0E34D1BD91C8799DE6E93DB173441810278602453DD25477EAFE27D3FDC9616B3A82F69D8121248E6CB27B147AC6DECC2A37D03C0F3D6D04114EA78D52A71EEC6EBDF77E7E91227BCEA20EB8B3F62ACC24DC74F9314CE9A78E7A921DF573F39855C53FA7AC7FB024FC3AAD4861C6AE4B59B58455B8CEC152F55DDA5451A56AB9AA1FCD1335766B73C50A6F2DFFF0635BA0517E9A304FBE41E51BFA253D4FBFD0A31F595ECE8A3DA3230ABB5E9A7AE089F6C0673C8F1268524C45CD2B68535AADCF5B183DE6E48EAAAE4E9A204B4EE0C49CC0B44EEFD5C9D392B5B8F4B7CA8BEF13AEED900884718173BBBC8E8DE534629C13569D8CA7BEC4DB5950BABB43EDB352B8203EE13AF37D0988A5E0F594C8A1F8EB03895F9D3EA73C1F2710081436FA069E3F74B4077B32F727891BFD6029C50DA5AF487163700AA1261CF658CA36FF584D3C71CA392CEF19078A3DD577AAEA94A61C922F38195F906F8A166FDABCCEAAECD1F7F58D9BBCE9C81CD51240B785C099758F37D5C1705A9BD1AB504B9AD2773FAC8BDD147CDACFA650F8BDC8FF9882FF76BB6DEAEF934438B2E7EB6E9AFCA1F8E1D9A109AEDF1AFF883BE768833009B7AE4FE9FD568799F44AC1F2348365533F1428AF6AA7BDB7727335E9CE440E7DCE2E7675583725A64B0E178B31617BAB7DFFEA465CD37A174FC4B38FC944E6EC691DB7D4DF1C1536EDD6D4D46B83F6DA2FF96EDF4CBBCA082435AD074BA416E8C79467EACDD693E9585DA92F1F405FBECDCA898F09B214FC7AAE4861C60E4B58A57E6A490BBE0D3275D4681D3540C495E94CE8B44BC65A8661EAC029D01E5BFF65AC6452FF65B7491CDBF3E7DE0FB485799A4D52DE8CDE2AFC6E168662E857D630A530B3EA6467D5E4A9B5F5541A9FB77955548F61A6FACABA0D458BD1F96D8DC68E66AD3B5A46D86D4A03B56911E44BBEC99A6FE92E7C5DB7F9C9175A7ECFAB75DDD04BAEC26C50FA5D20E67D48E253BDF3D831C0A04E8C595045D286A4D4F54FB0EB7B76F5B1AFA51DED010E42E121E39473503CFE44EFC7B5ED8C6E6FE073B0BBD907094F7D3F3BB5A0B49D5D6D082962A088E19B1712E4A39B3A99708371A08B9409A7BCF18E9402BE4A18AB41E07EBB2D8B91D62B5761240221A5B9982ACDC51469580B9F315E522697F53AD0C411A5877F87A1472F310C14DC2A34A0D9DDE44D8B2FD20A41D2F62DA03423F2B304B9B76D5BAF0AE2213A2EEFB2EA5B37EFDDDEADA8132FA47B173F54EBB32F75C944885EA8DBBC7C78397EBCDE97BB02B9991562FEE6C52BA98E23219631478C2FE009FE3789609761EE8A0CBF7DD3EE9A0C3922394217A856DBAC142B21002A82F910DBA4708E353D10174BDEE75BE46E906C508D6D38B3D158E63B9017120C93465E9F3356A0370E1A2A06BB10D79266B08A8E234767F87642B6D0D7E928CC80F31125915C69090E0D78A8DEC1A56D6EBE75E9D4C2AE61CC8FE358445196C82D9069A9458306E6CBDB03FD7242AE81D6C8CA3148AFCE44378685BCC3A26610C31F38DAC041B883359E3A4CDE209637909EC38A6D0AC9172CEC0B84B59D68ED2FADADDFDDA3AF4A43B06C419311C82BFA224900621623B16FB19B6F1836808118B63328D813E6B12C053FF8D69F6CB9BB4709F032FE8265CB4720AEE054BC07572B2B9B402D11D9877096B1CD8AF59249454CFB889362389BC80D6A92E889066F24DD8F64288765281DF0611A4B8A3787106F0E2169E5CCA3EDD64993791C827988ABD6112D841C0D5B3853253C25BBE8BE9E9251D02A1D51824AAD61C1898E640E071D3FA83DC418AD2C6F14F1D24F7BBB3898410A358C16FD3F19C6211806863C30C36853048918410E62090D5F3BBBE4461BC28FA3D27D3921BF406B646502B1FD016DFE65DCC0B24D1FA1FBDBB7FB4174FA7D8B85DA8A6FADF00D865B4B6EB4EEEBA1B6FD28A25DEBF7F05357C4EC0DA0E7182F11C07BBE1A9412123380CF2233EEBF87E6FDFFF8956FC65F5EBE3C1C6318A5B40C02047EC11830B48481F712564152127C0C6FD98D550C5FDEC2D8EFA71226D84A1D4D9EC85AC692934FC930D46C0F620A8AB18BC527A1A21947A4F90647FB388CA9A84E802FD9AEBF7E7AC1E126C01DA4C9959F92C900F53B8A81697FA0F62E6BF24C69276F7121DB9EF4835336DA7312ECA2FF388B31BC952AA534040C3AD908BACAD87024FCA2B7FA921E62F9E68FE50B1CCCE0701CC0AAFB4113CE572132CE03F40831D24D377BE02F3890F417D72C2E92591C84595CC4368B8586A5C9140E6D4E7BB080F0FBE8925F70368643D93ED7C9DC8B1321AFEC5983D631169E609E3954EEA8F2CDC154968D2431CD24A23371B291C8CEE47DFEBD580D4FB9DC5D5E1588EEC79BFEB623550B8F106CD3325FED8D859780A32716CD62288ACA2A4D65809F682D42E5ACFC09DF3A774661963720BCF0AA5D7BB758233D646BB15F02A52BF0CB1B49FF5277146BF8B0214794E7B602CA86A3D17F3A8556EFEA72F8ADFD03B1688765F58C5EBA337776D173E59B7FF8782AD9C45023ABC8401A8079AC25AE3D90C5F4640ED1CC81BE3F7028D690D31F4BAEA2C7308A38035327BBE880A38F4B3B39E4BB4D3A53511A8853BB5A1888FE9E1335D02C06E4D49437DF3AF030F6E377E7492F422C3BEA5EBB8C717B5ECF9A1F000F1F4FC8C30C95B24F44A23B18C1309699F68A61121132110F7B883CC93558C3E2B7EA252FA1CE4F0FC7492CB8F737F988C3DCF2DB092C67A4052D50CF84BB34A88565E8335235D03C73E32ECD78F3AD7F7C3C88EDF865A4CCFBE751ECE8AA7E2CAAA526C35966BC63E20A4E614A94ABD1C14F8C5E67D53E2BFF56EF9B2A8B72B7372F00474E2C3AA11C44A8DA118D57408301E376F89424B6AD44484FBC0D2572962298C9E2C399D8A672346EE530063890B924A772404EE510463E9CD8F2F867F30F5AA23418EF96B6361FFD90C8043A8B7979B4F5CDB70E3CA499F90D927A41A2991C79E9EFD37E73DF5FD931E72889E3C69B0E5F720AE324BE4A073F50BAC9DAF68FBA59CF6F0503278E0CF3F5145A7FACCE11B4FC33765BCBAED0F44C051BE83F9E4A2632D4E868063683352C38159F8CE13013D2C1169A7C9517DF17DD3714C326E20C6A9DCCE20B6D89E803DA4E687994B2056BE3DBB01616A21F93A88166B120A7B6BCF9D68387B120BF21C820436C2F739DADF3283908660C5A232D38B5F0436A7574F908B18E083949320E98EF21E527C436BAC01323478961237173156B33E9100E255F2182AB93968D54ADA9AD6D6B3E56598C0A72D654C6BEA9BFB128010D6D5A5E4384896676F9A6685BF4F7755665C855DE6DEAF5BE54DBD8352916E746BB6F0E9625B0E58D492A9C6762BE13DBCE7428F454A3116B66C3BBE37C3016D2D41AFB087867F621D848AC9BB4BD0C25EA24EDD726ABDA6C85BFF47BDABA537DB32F20CBAC398A50F1A964C540DD6CB8C73EEF07184BB9CC6683642BAEB6127908F53B6250376430B7EC0210CB98A3C5179C8A7570B53A9AC917CE3A169C7C49C6A1E77B08932F9C6D34F96EDF544BCEBDC4349138732FCE56F285344AF4A917466E79E68538954ABE737E6A4B5B9A8E7EDA450F388B693937F2CD37028CAFED0F675F7E332EA320714D6DC907E73A8E80D99CA2F3399267E74633602F715EE0AED6E5AD215AB6626B0AFC05CE910D62C9EC3559C1618D715BE1EAE625AEFA4F9660B8B839D63DFFB0492C71CD7F320983492C73C7FF0784B37B463828BDADF2A60F57F53AFFAD68DADDFB6C97DD67C0F55718EB36DFF113BD7F69EAFD16351F2D66DF0BE2CB6F574FF9267BF3627D5FA3F6CFEE4B998464370243F20091CC877C06C9A3120BB2FB75B1FBFA0EA2DC9780C469A199FEBBACFAF6B65FAE9099F0C510271EC2C06DCCE3254E6311C4E5729CBF30F1183ABFC4622881380C85160A1B66C8417D0DA52A7551009BBABC2BCA126C16FA1D64408B2C08030367901100A7620C809A2C222BB1FB6870B786AC822B062D8381B061D73EDDEC9BD513F620103BB618663742D8B1EB9EBA077975652A465DB189C953D6ECEA074D2F96204086229089EDF808B0CC702C03598DC50626DD11268941F71D22DE155910EE16E641E25D998A41576C5211FB1EA5AC24B61454130B60E959719CD478575AACF1B004C29E1DF77CA2922B07A5633E02DA18C7F8D40AC0B92F82D9D1527B16E3430C4A5623888E650F65662D5ED52E31160120B61C8C8D4E99E70924864C19C46B28B660D3DF442EF1E80B20067D9989F670D5A94C7D2802E90FA5761C6C02A81A5423817B18ED10D5C6220268B83B18CB7085976C2B4311682A43A91D071B4DAB413512B86B9ABF364ACE31B96230D11C21ACD2D9FAF14BBEAD9B1DCCAC2F5370A2C5662ED7A8EE68C8F5503CEE1B322283340C01417C2138237FFE160480370F00F3E5615C78DA589809C12893BBB509A7EF6591F87250021EC4C8B0DBD20AB0EA4A60265DA181FCE7E631AB8A7F2A4D4C28875809200686CCE1758919530631628A8D4C5447D9009E2A50580415B49D441A09F41CED39D0ADF54A2EB458C70943B8B173D0B30ADE249087C6A57DB9B24C120828860065C1BAC91F8A1F10C3AE006443CA6C34DFD40FC5EEAA6E35A9280003F3E4C16CE25F3FD8D630172140D61C900B63BA57C3CC5E80D309C182DA8842E601D412F0C5106306C29A9FA9DE109092B76B8DA1EDA8920410102481046723817E8789248B1E1C924A8F612F9D411A33775B6E6A465A1E327966E21F9E88BE63B6AB9D31D0C0A4F49D6A679B6253C95035F6A3B4AA316242F3E3045B3BEF7DCE57D1A2FADDF4F3B83F06A8B70433478585E97382A89A1B77AF26D774DD9ABFA985A1AD01BE2247695B32252F5F700BD51B869CC5B0D9A5055A6B70E5605A75354D2C43CDD0C2335752BC5C54594FED2DA447D2A2EC2E737D458FB43DE53DB068E45CAAEAAA809E2CBC84A34C3F061AE6FCC15D21EC42D7DD3D7288EA965781866F7F68F98E7610AE206CE5B759B1D6F7711DF81C3D3D8E1ABA1F2EAA90514E4E1D96DD42003F91AEC16FD2322A41003F6E259071AD856794E0E6A936B7CD60A833BC83604A850D59000C78DC55B60B0020EC5CEE6EA9AAB7E8FFB65517604FA1EAAD8DA1B380C768E864C38C76E2418098A365B98D3E040DDEC7E35B3D754372E5E1DB6FEE8AE13BA177CFDB5C5DB501422F24B71B6A1014DCE8B45005876D62A40AC3D006E88B20A0C64CC5AD6BD44E55BBD296AAEEB8DDCB387BA2849DC101C99BD8A8BA34BBD3A655DE946228404FA1EA16A9861A7A9688BB8C0AE48D82DA80A4859F450DEAFD8E1C11AE3C805AE8A6C1BB8C9C2280F4C002A8C5670F271079E9076D85F9BD955D2DFB8FE1AAA66F6611689EB65DACAAECA1D757861AF3B03338B738D5BE70A8F6C531575B13C0049023AEA4C5049002F4782BDD6FE1B6725D32F09C2E4CDCA6CEA9602C0CAF0A73FB8BA0F3B5FF524AE0F7DFDF5D5E1579B563F6C8CBBA3060A8AB26EDCA277562BE6AD4029F232004C4A2D02A21EF1599F5203F6BE433E28A56697A2C415959B6386C25F9431404497144C2A352DD59886E74D9DD6809D60F860CDFBFC5731DB4C2AA331B13AA4C06953635E6008FB8C239FDA11F786AA0E708690B555E5EC5EFAAA751811A275075204CFD2E00EB8343EE8AEACFEA586D605203CF6123E2F9231A1555678B26575D9DE4C080E13DC26215B6D8D8A4843DEA9636CC3D827047DBCEB2232B6881A6EA6A9C40D58130F5CECFFA2C9FC7B65CE6389F32C39381C2E679D091436A4A5CC1E4CA0A4F61DBF87B13CA1CBE003E2B48F00D270003A964E8C196FA505CF313C04F445485458430609C986D702FC75B6AE3042D43F33ABA4929B60FAB87A9A89A8A3EDA389EE8F550A7FCF237A439C3FBE093A30E78F4986A407BA2D8BDC2C203D74065754F604FAEA8744498E0A94FFFFA54107AC719ACA7F1C1E720DE413C1EDCD55871F47742850DE9B4F949E3E3AAAEFC1AAFAED286B77B0385C4852AAF796F56AD03DB476AFD2B0461EAFDBBF5997B7F3B91DF53D59889E1F1D5A01D843DCCCFA99516845580A56FD03F2F7ABCD5975FC53429C1F08E66607FB1A4320CEF3E1A14E3F26AE4F4AA2A2958B915CBDB253CD4A978CF10D29DCDD387422EC8DD0AD36581E0952FBC7A149762508D4885E195D0D4962A2080FABCD27783ECD24AD03D4807A8C2FAFDBA20AE567DB103210115CFA190523D4EB77DA2ED68D5A17E580CD086E52B644194015D6A4190B597554C5480210BB17B67EB78AB2F3D0F65D281FE3DA94039480455681F40D22BC5FEEDA4E9955451D0271F4E77CDF8AA517F8648FF005050BB81EA1EB69ADCE335DACAAA9FB909E833E6AEB0B9A2475E41F1FD114D4DB54F951C6D95C15DD9564F711C50955F9F53F4E1ED88A1ECF539BD9FAAFB80FE44B9144AB7D118262F5BF2F5F5F91794F2169B9CFEF53E6F8BC791C46B44B3CA49223612ED613E560F75FF7A8620510FD217F753FCC8F5AEB35DF6B6D9150F28BF43C5AB1C0D03AAC71767BF67E59E6CEEBBCFD71FABCFFBDD76BF4355CE37F725E7FCF0D31B3AFEAFCF25995F7FDEE2BFDA1055406216A80AF9E7EADDBE28D783DCBF65A578C45E45025F35FE971C7DA76DB943FFE68FCF03A54F756549A853DFF014C9D77CB32D11B1F673759B7DCF7D644343BBABFC315B3DA3EFDF8B35F67E2A22E686E0D5FEFA7D913D36D9A6ED688CF8E84F64C3EBCD8F7FFBFF85264B0250820500, N'6.1.3-40302')
GO
SET IDENTITY_INSERT [dbo].[AccountGroups] ON 
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'Assets', NULL, N'1.0.0.0', N'Dr', 1, N'Balance Sheet', N'Assets', 1, CAST(N'2023-07-13T03:40:12.543' AS DateTime), CAST(N'2023-07-13T03:40:12.543' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'Fixed Assets', 1, N'1.1.0.0', N'Dr', 1, N'Balance Sheet', N'Fixed Assets', 1, CAST(N'2023-07-13T03:40:12.553' AS DateTime), CAST(N'2023-07-13T03:40:12.553' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, N'Office Equipment', 2, N'1.1.1.0', N'Dr', 1, N'Balance Sheet', N'Office Equipment', 1, CAST(N'2023-07-13T03:40:12.557' AS DateTime), CAST(N'2023-07-13T03:40:12.557' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, N'Land & Building', 2, N'1.1.2.0', N'Dr', 1, N'Balance Sheet', N'Land & Building', 1, CAST(N'2023-07-13T03:40:12.557' AS DateTime), CAST(N'2023-07-13T03:40:12.557' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, N'Furniture & Fixture', 2, N'1.1.3.0', N'Dr', 1, N'Balance Sheet', N'Furniture & Fixture', 1, CAST(N'2023-07-13T03:40:12.557' AS DateTime), CAST(N'2023-07-13T03:40:12.557' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, N'Others Assets', 2, N'1.1.4.0', N'Dr', 1, N'Balance Sheet', N'Others Assets', 1, CAST(N'2023-07-13T03:40:12.557' AS DateTime), CAST(N'2023-07-13T03:40:12.557' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, N'Current Assets', 1, N'1.2.0.0', N'Dr', 1, N'Balance Sheet', N'Current Assets', 1, CAST(N'2023-07-13T03:40:12.557' AS DateTime), CAST(N'2023-07-13T03:40:12.557' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, N'Cash In Hand', 7, N'1.2.1.0', N'Dr', 1, N'Balance Sheet', N'Cash', 1, CAST(N'2023-07-13T03:40:12.557' AS DateTime), CAST(N'2023-07-13T03:40:12.557' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, N'Bank Accounts', 7, N'1.2.2.0', N'Dr', 1, N'Balance Sheet', N'Bank', 1, CAST(N'2023-07-13T03:40:12.603' AS DateTime), CAST(N'2023-07-13T03:40:12.603' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, N'Mobile Banking', 7, N'1.2.3.0', N'Dr', 1, N'Balance Sheet', N'Mobile Bank', 1, CAST(N'2023-07-13T03:40:12.603' AS DateTime), CAST(N'2023-07-13T03:40:12.603' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, N'Loan & Advance', 7, N'1.2.4.0', N'Dr', 1, N'Balance Sheet', N'Loan & Advance', 1, CAST(N'2023-07-13T03:40:12.607' AS DateTime), CAST(N'2023-07-13T03:40:12.607' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, N'Accounts Receivable', 7, N'1.2.5.0', N'Dr', 1, N'Balance Sheet', N'Customer', 1, CAST(N'2023-07-13T03:40:12.607' AS DateTime), CAST(N'2023-07-13T03:40:12.607' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, N'Stock In Hand', 7, N'1.2.6.0', N'Dr', 1, N'Balance Sheet', N'Stock', 1, CAST(N'2023-07-13T03:40:12.607' AS DateTime), CAST(N'2023-07-13T03:40:12.607' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, N'Agent Accounts', 7, N'1.2.7.0', N'Dr', 1, N'Balance Sheet', N'Agent', 1, CAST(N'2023-07-13T03:40:12.607' AS DateTime), CAST(N'2023-07-13T03:40:12.607' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (15, N'Liability', NULL, N'2.0.0.0', N'Cr', 2, N'Balance Sheet', N'Liability', 1, CAST(N'2023-07-13T03:40:12.610' AS DateTime), CAST(N'2023-07-13T03:40:12.610' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (16, N'Capital Account', 15, N'2.1.0.0', N'Cr', 2, N'Balance Sheet', N'Capital', 1, CAST(N'2023-07-13T03:40:12.610' AS DateTime), CAST(N'2023-07-13T03:40:12.610' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (17, N'Loans Account', 15, N'2.2.0.0', N'Cr', 2, N'Balance Sheet', N'Loans', 1, CAST(N'2023-07-13T03:40:12.610' AS DateTime), CAST(N'2023-07-13T03:40:12.610' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (18, N'Current Liabilities', 15, N'2.3.0.0', N'Cr', 2, N'Balance Sheet', N'Liability', 1, CAST(N'2023-07-13T03:40:12.610' AS DateTime), CAST(N'2023-07-13T03:40:12.610' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (19, N'Accounts Payable', 18, N'2.3.1.0', N'Cr', 2, N'Balance Sheet', N'Supplier', 1, CAST(N'2023-07-13T03:40:12.613' AS DateTime), CAST(N'2023-07-13T03:40:12.613' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (20, N'Duties & Taxes', 18, N'2.3.2.0', N'Cr', 2, N'Balance Sheet', N'Taxes', 1, CAST(N'2023-07-13T03:40:12.617' AS DateTime), CAST(N'2023-07-13T03:40:12.617' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (21, N'VAT Current Account', 18, N'2.3.3.0', N'Cr', 2, N'Balance Sheet', N'VAT', 1, CAST(N'2023-07-13T03:40:12.617' AS DateTime), CAST(N'2023-07-13T03:40:12.617' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (22, N'Profit & Loss Account', 15, N'2.4.0.0', N'Cr', 2, N'Balance Sheet', N'Profit & Loss', 1, CAST(N'2023-07-13T03:40:12.617' AS DateTime), CAST(N'2023-07-13T03:40:12.617' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (23, N'Income', NULL, N'3.0.0.0', N'Cr', 3, N'Income Statement', N'Income', 1, CAST(N'2023-07-13T03:40:12.617' AS DateTime), CAST(N'2023-07-13T03:40:12.617' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (24, N'Direct Income', 23, N'3.1.0.0', N'Cr', 3, N'Income Statement', N'Income', 1, CAST(N'2023-07-13T03:40:12.617' AS DateTime), CAST(N'2023-07-13T03:40:12.617' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (25, N'Indirect Income', 23, N'3.2.0.0', N'Cr', 3, N'Income Statement', N'Income', 1, CAST(N'2023-07-13T03:40:12.620' AS DateTime), CAST(N'2023-07-13T03:40:12.620' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (26, N'Sales', 23, N'3.3.0.0', N'Cr', 3, N'Income Statement', N'Sales', 1, CAST(N'2023-07-13T03:40:12.620' AS DateTime), CAST(N'2023-07-13T03:40:12.620' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (27, N'Sales Return', 23, N'3.4.0.0', N'Dr', 3, N'Income Statement', N'Sales Return', 1, CAST(N'2023-07-13T03:40:12.620' AS DateTime), CAST(N'2023-07-13T03:40:12.620' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, N'Expense', NULL, N'4.0.0.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-07-13T03:40:12.620' AS DateTime), CAST(N'2023-07-13T03:40:12.620' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (29, N'Direct Overhead', 28, N'4.1.0.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-07-13T03:40:12.620' AS DateTime), CAST(N'2023-07-13T03:40:12.620' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (30, N'Employee Salary', 29, N'4.1.1.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-07-13T03:40:12.620' AS DateTime), CAST(N'2023-07-13T03:40:12.620' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (31, N'Indirect Expense', 28, N'4.2.0.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-07-13T03:40:12.620' AS DateTime), CAST(N'2023-07-13T03:40:12.620' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (32, N'Discount', 31, N'4.2.1.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-07-13T03:40:12.623' AS DateTime), CAST(N'2023-07-13T03:40:12.623' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (33, N'Financial Expenses', 31, N'4.2.2.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-07-13T03:40:12.623' AS DateTime), CAST(N'2023-07-13T03:40:12.623' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (34, N'Administrative Expenses', 31, N'4.2.3.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-07-13T03:40:12.623' AS DateTime), CAST(N'2023-07-13T03:40:12.623' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (35, N'Selling & Marketing Expenses', 31, N'4.2.4.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-07-13T03:40:12.623' AS DateTime), CAST(N'2023-07-13T03:40:12.623' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (36, N'Sponsor Expense', 31, N'4.2.5.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-07-13T03:40:12.623' AS DateTime), CAST(N'2023-07-13T03:40:12.623' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (37, N'Purchase', 28, N'4.3.0.0', N'Dr', 4, N'Goods Sold Statement', N'Purchase', 1, CAST(N'2023-07-13T03:40:12.623' AS DateTime), CAST(N'2023-07-13T03:40:12.623' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (38, N'Purchase Return', 28, N'4.4.0.0', N'Cr', 4, N'Goods Sold Statement', N'Purchase Return', 1, CAST(N'2023-07-13T03:40:12.623' AS DateTime), CAST(N'2023-07-13T03:40:12.623' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (39, N'Employee Bonus', 29, N'4.1.2.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-01-15T07:43:05.083' AS DateTime), CAST(N'2023-01-15T07:43:05.083' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (40, N'Capital AC (SGR)', 16, N'2.1.1.0', N'Cr', 2, N'Balance Sheet', N'Capital', 1, CAST(N'2023-01-16T11:38:14.257' AS DateTime), CAST(N'2023-01-16T11:38:14.257' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (41, N'Entertainment', 29, N'4.1.3.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-01-30T11:30:42.793' AS DateTime), CAST(N'2023-01-30T11:30:42.793' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (42, N'Convence', 29, N'4.1.4.0', N'Dr', 4, N'All Reports', N'Expense', 1, CAST(N'2023-01-30T11:31:03.763' AS DateTime), CAST(N'2023-01-30T11:31:03.763' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[AccountGroups] ([PkGroupId], [GroupName], [GroupParent], [GroupIdentifier], [Nature], [GroupType], [PostedTo], [GroupHeadType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (43, N'Other Income', 6, N'1.1.4.1', N'Dr', 1, N'Balance Sheet', N'Others Assets', 1, CAST(N'2023-04-12T11:08:58.363' AS DateTime), CAST(N'2023-04-12T11:08:58.363' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[AccountGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[Areas] ON 
GO
INSERT [dbo].[Areas] ([PkAreaId], [AreaName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'Dhaka', 1, CAST(N'2023-07-13T03:40:12.520' AS DateTime), CAST(N'2023-07-13T03:40:12.520' AS DateTime), N'', N'', N'System')
GO
SET IDENTITY_INSERT [dbo].[Areas] OFF
GO
SET IDENTITY_INSERT [dbo].[AuditTBs] ON 
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (1, 0, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/', CAST(N'2023-07-13T03:39:48.617' AS DateTime), CAST(N'2023-07-23T16:39:48.617' AS DateTime), N'Active', N'Home', N'Index')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (2, 0, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/User/OrganizationRegistration', CAST(N'2023-07-13T03:39:50.630' AS DateTime), CAST(N'2023-07-23T16:39:50.630' AS DateTime), N'Active', N'User', N'OrganizationRegistration')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (3, 0, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/User/OrganizationRegistration', CAST(N'2023-07-13T03:40:12.470' AS DateTime), CAST(N'2023-07-23T16:40:12.470' AS DateTime), N'Active', N'User', N'OrganizationRegistration')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (4, 0, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/User/Login', CAST(N'2023-07-13T03:40:42.820' AS DateTime), CAST(N'2023-07-23T16:40:42.820' AS DateTime), N'Active', N'User', N'Login')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (5, 0, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/User/Login', CAST(N'2023-07-13T03:41:07.563' AS DateTime), CAST(N'2023-07-23T16:41:07.563' AS DateTime), N'Active', N'User', N'Login')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (6, 1, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/', CAST(N'2023-07-13T03:41:07.760' AS DateTime), CAST(N'2023-07-23T16:41:07.760' AS DateTime), N'Active', N'Home', N'Index')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (7, 1, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/Home/AllEvents', CAST(N'2023-07-13T03:41:13.863' AS DateTime), CAST(N'2023-07-23T16:41:13.863' AS DateTime), N'Active', N'Home', N'AllEvents')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (8, 1, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/Home/AllMonthSales', CAST(N'2023-07-13T03:41:14.373' AS DateTime), CAST(N'2023-07-23T16:41:14.373' AS DateTime), N'Active', N'Home', N'AllMonthSales')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (9, 1, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/Home/AllMonthPurchase', CAST(N'2023-07-13T03:41:14.447' AS DateTime), CAST(N'2023-07-23T16:41:14.447' AS DateTime), N'Active', N'Home', N'AllMonthPurchase')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (10, 1, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/Report/TrialBalance', CAST(N'2023-07-13T03:41:54.410' AS DateTime), CAST(N'2023-07-23T16:41:54.410' AS DateTime), N'Active', N'Report', N'TrialBalance')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (11, 1, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/Report/ProfitLoss', CAST(N'2023-07-13T03:41:56.667' AS DateTime), CAST(N'2023-07-23T16:41:56.667' AS DateTime), N'Active', N'Report', N'ProfitLoss')
GO
INSERT [dbo].[AuditTBs] ([UsersAuditID], [UserID], [SessionID], [IPAddress], [PageAccessed], [LoggedInAt], [LoggedOutAt], [LoginStatus], [ControllerName], [ActionName]) VALUES (12, 1, N'ufdrrlfsq4vxx1333kgcevsh', N'::1', N'/Report/BalanceSheet', CAST(N'2023-07-13T03:41:58.023' AS DateTime), CAST(N'2023-07-23T16:41:58.023' AS DateTime), N'Active', N'Report', N'BalanceSheet')
GO
SET IDENTITY_INSERT [dbo].[AuditTBs] OFF
GO
SET IDENTITY_INSERT [dbo].[BankAccounts] ON 
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 101, 1, N'B-00001', N'AED ', N'123456', N'OFFSET', -46800, N'Opening Balance', 5, 1, CAST(N'2023-01-06T14:07:45.663' AS DateTime), CAST(N'2023-02-22T10:29:23.527' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 102, 2, N'B-00002', N'Cash-AED (Sarfu)', N'123456', N'Cash In Hand', 5000, N'Opening Balance', 4, 1, CAST(N'2023-01-06T14:08:27.363' AS DateTime), CAST(N'2023-02-16T21:19:54.903' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 103, 3, N'B-00003', N'CBD-Sarfu', N'12', N'Commercial Bank of Dubai', 1184, N'Opening Balance', 1, 1, CAST(N'2023-01-06T14:09:23.453' AS DateTime), CAST(N'2023-01-06T14:09:23.453' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 104, 4, N'B-00004', N'ENBD-Azad', N'1234566', N'Emirates NBD', 28746.16, N'Opening Balance', 1, 1, CAST(N'2023-01-06T14:10:08.513' AS DateTime), CAST(N'2023-01-06T14:10:08.513' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 105, 5, N'B-00005', N'FAB-Sarfu', N'1234566', N'First Abudhabi Bank', 2699, N'Opening Balance', 1, 1, CAST(N'2023-01-06T14:10:42.230' AS DateTime), CAST(N'2023-02-08T22:46:20.857' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 106, 6, N'B-00006', N'Mashreq -Sarfu', N'1234566', N'Mashreq Bank', 22160, N'Opening Balance', 1, 1, CAST(N'2023-01-06T14:11:29.147' AS DateTime), CAST(N'2023-01-06T14:11:29.147' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 107, 7, N'B-00007', N'RAK-Sarfu', N'1234566', N'RAK Bank', 8141.98, N'Opening Balance', 1, 1, CAST(N'2023-01-06T14:12:00.303' AS DateTime), CAST(N'2023-02-05T09:24:26.250' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 108, 8, N'B-00008', N'ADCB-Al Areeq Technical', N'1234566', N'Abu Dhabi Commercial Bank', 5231, N'Opening Balance', 1, 1, CAST(N'2023-01-06T14:12:47.127' AS DateTime), CAST(N'2023-02-16T21:25:21.803' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 109, 9, N'B-00009', N'Cash-BDT (Rashed)', N'1234566', N'Rashed Dhaka', 1587826, N'Opening Balance', 5, 1, CAST(N'2023-01-07T00:59:30.423' AS DateTime), CAST(N'2023-01-28T02:38:32.923' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 110, 10, N'B-00010', N'Brac Bank-Ek Enterprise', N'1234566', N'Brac Bank LTD', 66, NULL, 1, 1, CAST(N'2023-01-07T01:00:06.763' AS DateTime), CAST(N'2023-02-16T21:16:21.393' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 111, 11, N'B-00011', N'Brac Bank-Rashed Alam', N'1234566', N'Brac Bank LTD', 3999, N'Opening Balance', 1, 1, CAST(N'2023-01-07T01:00:45.310' AS DateTime), CAST(N'2023-01-07T01:00:45.310' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 112, 12, N'B-00012', N'City Bank-Ek Enterprise', N'1234566', N'The City Bank LTD', 767078, N'Opening Balance', 1, 1, CAST(N'2023-01-07T01:01:37.273' AS DateTime), CAST(N'2023-02-05T09:17:59.027' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 113, 13, N'B-00013', N'City Bank- Rashed Alam', N'1234566', N'The City Bank LTD', 549795, N'Opening Balance', 1, 1, CAST(N'2023-01-07T01:02:17.787' AS DateTime), CAST(N'2023-01-25T22:23:11.380' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 114, 14, N'B-00014', N'DBBL- Ek Enterprise', N'1234566', N'Dutch Bangla Bank LTD', 23748, N'Opening Balance', 1, 1, CAST(N'2023-01-07T01:03:01.207' AS DateTime), CAST(N'2023-01-25T22:22:24.257' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 115, 15, N'B-00015', N'IBBL- Rashed Alam', N'1234566', N'Islami Bank Bangladesh LTD', 4924, N'Opening Balance', 1, 1, CAST(N'2023-01-07T01:03:42.640' AS DateTime), CAST(N'2023-01-07T01:03:42.640' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 116, 16, N'B-00016', N'IBBL-Sarfuddin', N'1234566', N'Islami Bank Bangladesh LTD', 7710, N'Opening Balance', 1, 1, CAST(N'2023-01-07T01:04:21.200' AS DateTime), CAST(N'2023-01-07T01:04:21.200' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 117, 17, N'B-00017', N'Pubali Bank-Ek Enterprise', N'1111111', N'Pubali Bank LTD', 92555, N'Opening Balance', 1, 1, CAST(N'2023-01-07T01:06:41.783' AS DateTime), CAST(N'2023-01-07T01:06:41.783' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 118, 18, N'B-00018', N'BDT (Bangladeshi Taka)', N'1233', N'Offset', -534600, N'Opening Balance', 5, 1, CAST(N'2023-01-07T01:47:19.287' AS DateTime), CAST(N'2023-02-23T16:18:18.670' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 119, 19, N'B-00019', N'CAD', N'1234566', N'Candadian Dollar', 0, N'Opening Balance', 5, 1, CAST(N'2023-01-08T00:08:53.243' AS DateTime), CAST(N'2023-02-16T21:18:24.817' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 120, 20, N'B-00020', N'PKR', N'018xxxxx', N'Offset', 0, N'Opening Balance', 5, 1, CAST(N'2023-01-11T11:45:18.927' AS DateTime), CAST(N'2023-01-24T15:23:33.510' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, 121, 21, N'B-00021', N'INR', N'018xxxxx', N'Offset', 0, NULL, 5, 1, CAST(N'2023-01-12T09:26:21.243' AS DateTime), CAST(N'2023-01-12T09:26:21.243' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 122, 22, N'B-00022', N'USD', N'018xxxxx', N'Offset', 0, NULL, 5, 1, CAST(N'2023-01-12T09:26:52.677' AS DateTime), CAST(N'2023-01-12T09:26:52.677' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, 123, 23, N'B-00023', N'LKR', N'LKR', N'Offset', 0, NULL, 5, 1, CAST(N'2023-02-13T00:05:59.453' AS DateTime), CAST(N'2023-02-16T21:26:10.510' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, 124, 24, N'B-00024', N'AUD', N'123456', N'Virtual Account', 0, NULL, 5, 1, CAST(N'2023-02-17T11:51:28.920' AS DateTime), CAST(N'2023-02-17T11:51:28.920' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, 125, 25, N'B-00025', N'MYR', N'*******123456', N'Virtual Account', 0, NULL, 5, 1, CAST(N'2023-03-15T13:06:13.220' AS DateTime), CAST(N'2023-03-15T13:06:13.220' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, 126, 26, N'B-00026', N'Lira', N'123456xxxxxx', N'Virtual Account', 0, NULL, 5, 1, CAST(N'2023-03-22T19:19:04.687' AS DateTime), CAST(N'2023-03-22T19:19:04.687' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, 127, 27, N'B-00027', N'SAR', N'12345678****', N'Virtual Currency', 0, NULL, 5, 1, CAST(N'2023-03-24T17:43:54.320' AS DateTime), CAST(N'2023-03-24T17:43:54.320' AS DateTime), N'System', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 128, 28, N'B-00028', N'City Bank-Sarfu', N'01111', N'City Bank', 0, NULL, 1, 1, CAST(N'2023-05-20T10:16:25.987' AS DateTime), CAST(N'2023-05-20T10:16:25.987' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[BankAccounts] ([CurrencyID], [LedgerID], [PkBankAccountId], [AccountCode], [BankAccountName], [AccountNumber], [Bankname], [OpeningBalance], [Description], [AccountType], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 129, 29, N'B-00029', N'AED Third Party Account ', N'0122222', N'AED Third Party Account ', 0, NULL, 1, 1, CAST(N'2023-06-21T15:04:04.533' AS DateTime), CAST(N'2023-06-21T15:04:04.533' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[BankAccounts] OFF
GO
SET IDENTITY_INSERT [dbo].[BankHistories] ON 
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (1, CAST(N'2023-01-06T14:07:45.663' AS DateTime), 0, -46800, 31, -1450800, -1450800, CAST(N'2023-07-13T03:41:08.930' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (2, CAST(N'2023-01-06T14:08:27.363' AS DateTime), -1450800, 5000, 31, 155000, -1295800, CAST(N'2023-07-13T03:41:08.950' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (3, CAST(N'2023-01-06T14:09:23.453' AS DateTime), -1295800, 1184, 31, 36704, -1259096, CAST(N'2023-07-13T03:41:08.957' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (4, CAST(N'2023-01-06T14:10:08.513' AS DateTime), -1259096, 28746.16, 31, 891130.96, -367965.04000000004, CAST(N'2023-07-13T03:41:08.967' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (5, CAST(N'2023-01-06T14:10:42.230' AS DateTime), -367965.04000000004, 2699, 31, 83669, -284296.04000000004, CAST(N'2023-07-13T03:41:08.977' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (6, CAST(N'2023-01-06T14:11:29.147' AS DateTime), -284296.04000000004, 22160, 31, 686960, 402663.95999999996, CAST(N'2023-07-13T03:41:08.987' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (7, CAST(N'2023-01-06T14:12:00.303' AS DateTime), 402663.95999999996, 8141.98, 31, 252401.37999999998, 655065.34, CAST(N'2023-07-13T03:41:08.993' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (8, CAST(N'2023-01-06T14:12:47.127' AS DateTime), 655065.34, 5231, 31, 162161, 817226.34, CAST(N'2023-07-13T03:41:09.000' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (9, CAST(N'2023-01-07T00:59:30.423' AS DateTime), 817226.34, 1587826, 1, 1587826, 2405052.34, CAST(N'2023-07-13T03:41:09.010' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (10, CAST(N'2023-01-07T01:00:06.763' AS DateTime), 2405052.34, 66, 1, 66, 2405118.34, CAST(N'2023-07-13T03:41:09.020' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (11, CAST(N'2023-01-07T01:00:45.310' AS DateTime), 2405118.34, 3999, 1, 3999, 2409117.34, CAST(N'2023-07-13T03:41:09.030' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (12, CAST(N'2023-01-07T01:01:37.273' AS DateTime), 2409117.34, 767078, 1, 767078, 3176195.34, CAST(N'2023-07-13T03:41:09.043' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (13, CAST(N'2023-01-07T01:02:17.787' AS DateTime), 3176195.34, 549795, 1, 549795, 3725990.34, CAST(N'2023-07-13T03:41:09.053' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (14, CAST(N'2023-01-07T01:03:01.207' AS DateTime), 3725990.34, 23748, 1, 23748, 3749738.34, CAST(N'2023-07-13T03:41:09.063' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (15, CAST(N'2023-01-07T01:03:42.640' AS DateTime), 3749738.34, 4924, 1, 4924, 3754662.34, CAST(N'2023-07-13T03:41:09.077' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (16, CAST(N'2023-01-07T01:04:21.200' AS DateTime), 3754662.34, 7710, 1, 7710, 3762372.34, CAST(N'2023-07-13T03:41:09.083' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (17, CAST(N'2023-01-07T01:06:41.783' AS DateTime), 3762372.34, 92555, 1, 92555, 3854927.34, CAST(N'2023-07-13T03:41:09.097' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (18, CAST(N'2023-01-07T01:47:19.287' AS DateTime), 3854927.34, -534600, 1, -534600, 3320327.34, CAST(N'2023-07-13T03:41:09.110' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (19, CAST(N'2023-01-08T00:08:53.243' AS DateTime), 3320327.34, 0, 85.4, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.123' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (20, CAST(N'2023-01-11T11:45:18.927' AS DateTime), 3320327.34, 0, 0.544, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.140' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (21, CAST(N'2023-01-12T09:26:21.243' AS DateTime), 3320327.34, 0, 1.32, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.150' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (22, CAST(N'2023-01-12T09:26:52.677' AS DateTime), 3320327.34, 0, 110, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.167' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (23, CAST(N'2023-02-13T00:05:59.453' AS DateTime), 3320327.34, 0, 0.31376518218, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.183' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (24, CAST(N'2023-02-17T11:51:28.920' AS DateTime), 3320327.34, 0, 70, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.197' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (25, CAST(N'2023-03-15T13:06:13.220' AS DateTime), 3320327.34, 0, 26.3, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.210' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (26, CAST(N'2023-03-22T19:19:04.687' AS DateTime), 3320327.34, 0, 6, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.220' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (27, CAST(N'2023-03-24T17:43:54.320' AS DateTime), 3320327.34, 0, 29.35, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.233' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (28, CAST(N'2023-05-20T10:16:25.987' AS DateTime), 3320327.34, 0, 1, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.250' AS DateTime))
GO
INSERT [dbo].[BankHistories] ([PkBankHistoryId], [TransactionDate], [LastBalance], [TransactionAmount], [Rate], [ActualAmount], [CurrentBalance], [CreatedAt]) VALUES (29, CAST(N'2023-06-21T15:04:04.533' AS DateTime), 3320327.34, 0, 31, 0, 3320327.34, CAST(N'2023-07-13T03:41:09.267' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[BankHistories] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([PkCountryId], [CountryName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'United Arab Amirats', 1, CAST(N'2023-07-13T03:40:12.533' AS DateTime), CAST(N'2023-07-13T03:40:12.533' AS DateTime), N'', N'', N'System')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[Currencies] ON 
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'BDT', 2, N'BDT', 1, 1, CAST(N'2023-07-12T16:40:12.487' AS DateTime), 1, CAST(N'2023-07-13T03:40:12.487' AS DateTime), CAST(N'2023-07-13T03:40:12.487' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'CAD', 2, N'Can$', 85.4, 0, CAST(N'2023-03-31T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-07T05:56:16.183' AS DateTime), CAST(N'2023-06-20T02:08:44.473' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, N'USD', 2, N'$', 110, 0, CAST(N'2023-03-31T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-07T05:57:15.740' AS DateTime), CAST(N'2023-04-06T10:03:58.540' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, N'AED', 2, N'AED', 31, 0, CAST(N'2023-01-12T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-07T05:59:12.593' AS DateTime), CAST(N'2023-06-20T02:09:42.910' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, N'INR', 2, N'INR', 1.32, 0, CAST(N'2023-03-31T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-09T00:20:47.217' AS DateTime), CAST(N'2023-04-06T10:04:32.070' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, N'PKR', 2, N'PKR', 0.544, 0, CAST(N'2023-03-31T00:00:00.000' AS DateTime), 1, CAST(N'2023-01-12T03:42:24.597' AS DateTime), CAST(N'2023-04-06T10:05:45.690' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, N'LKR', 2, N'LKR', 0.31376518218, 0, CAST(N'2023-01-12T12:30:58.290' AS DateTime), 1, CAST(N'2023-02-13T04:29:22.803' AS DateTime), CAST(N'2023-02-12T12:30:58.290' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, N'AUD', 2, N'AUD', 79.8, 0, CAST(N'2023-01-12T12:30:58.290' AS DateTime), 0, CAST(N'2023-02-17T16:44:27.563' AS DateTime), CAST(N'2023-02-17T16:44:27.563' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, N'AUD (Australian Dollar)', 2, N'AUD', 70, 0, CAST(N'2023-02-17T00:00:00.000' AS DateTime), 1, CAST(N'2023-02-17T16:47:52.703' AS DateTime), CAST(N'2023-04-26T09:25:14.990' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, N'MYR', 2, N'MYR', 26.3, 0, CAST(N'2023-03-14T00:00:00.000' AS DateTime), 1, CAST(N'2023-03-15T18:04:53.553' AS DateTime), CAST(N'2023-03-15T18:04:53.553' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, N'Lira', 2, N'₺', 6, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-03-23T00:17:30.293' AS DateTime), CAST(N'2023-03-23T00:17:30.293' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, N'SAR', 2, N'SR', 29.35, 0, CAST(N'2023-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-03-24T22:25:28.673' AS DateTime), CAST(N'2023-03-24T22:25:28.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, N'EURO', 2, N'€', 3.98, 0, CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, CAST(N'2023-06-18T18:55:40.743' AS DateTime), CAST(N'2023-06-18T18:55:40.743' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Currencies] ([PkCurrencyId], [CurrencyName], [DecimalPlaces], [CurrencySymbol], [ConversionRate], [BaseCurrency], [ExecutionDate], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, N'SGD', 2, N'S$', 85, 0, CAST(N'2023-06-19T00:00:00.000' AS DateTime), 1, CAST(N'2023-06-20T18:05:54.097' AS DateTime), CAST(N'2023-06-20T18:05:54.097' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Currencies] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (130, 4, NULL, NULL, NULL, NULL, 1, N'C-00001', N'Elias Dhaka-AED', NULL, N'Dhaka', NULL, 1, CAST(N'2023-01-12T15:34:30.790' AS DateTime), CAST(N'2023-01-22T11:02:27.317' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (131, 4, NULL, NULL, NULL, NULL, 2, N'C-00002', N'ILYAS Dubai-AED', NULL, NULL, N'Dubai', 1, CAST(N'2023-01-12T15:34:36.653' AS DateTime), CAST(N'2023-01-12T15:34:36.653' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (132, 4, NULL, NULL, NULL, NULL, 3, N'C-00003', N'Tareq Bagina AED', NULL, NULL, N'Dubai', 1, CAST(N'2023-01-12T15:34:41.450' AS DateTime), CAST(N'2023-01-12T15:34:41.450' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (133, 4, NULL, NULL, NULL, NULL, 4, N'C-00004', N'Obaiyed Bhai AED', NULL, NULL, N'Ajman', 1, CAST(N'2023-01-12T15:34:47.260' AS DateTime), CAST(N'2023-01-12T15:34:47.260' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (134, 4, NULL, NULL, NULL, NULL, 5, N'C-00005', N'Kabir Sayeed AED', NULL, NULL, N'Etisalat, Dubai', 1, CAST(N'2023-01-12T15:34:52.677' AS DateTime), CAST(N'2023-01-23T11:25:18.163' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (135, 1, NULL, NULL, NULL, NULL, 6, N'C-00006', N'Alamin Gulshan- BDT', NULL, N'Al Amin', NULL, 1, CAST(N'2023-01-12T15:34:57.487' AS DateTime), CAST(N'2023-02-14T21:08:54.713' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (136, 1, NULL, NULL, NULL, NULL, 7, N'C-00007', N'Azad UAE -BDT', NULL, N'Azher Uddin', NULL, 1, CAST(N'2023-01-12T15:35:24.243' AS DateTime), CAST(N'2023-01-12T15:35:24.243' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (137, 1, NULL, NULL, NULL, NULL, 8, N'C-00008', N'Bahar Alain- BDT', NULL, N'Bahar Uddin', NULL, 1, CAST(N'2023-01-12T15:35:29.070' AS DateTime), CAST(N'2023-01-31T19:34:02.373' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (138, 1, NULL, NULL, NULL, NULL, 9, N'C-00009', N'Dayal Alain- BDT', NULL, NULL, N'ALAIN', 1, CAST(N'2023-01-12T15:35:37.577' AS DateTime), CAST(N'2023-01-12T15:35:37.577' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (139, 1, NULL, NULL, NULL, NULL, 10, N'C-00010', N'Jahir Hor Al ANZ- BDT', NULL, NULL, N'Dubai', 1, CAST(N'2023-01-12T15:35:52.103' AS DateTime), CAST(N'2023-01-12T15:35:52.103' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (140, 1, NULL, NULL, NULL, NULL, 11, N'C-00011', N'Mainuddin- Brother', NULL, NULL, N'Raipur', 1, CAST(N'2023-01-12T15:35:56.930' AS DateTime), CAST(N'2023-01-12T15:35:56.930' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (141, 1, NULL, NULL, NULL, NULL, 12, N'C-00012', N'Masud Dubai- BDT', NULL, NULL, N'Dubai', 1, CAST(N'2023-01-12T15:36:02.077' AS DateTime), CAST(N'2023-01-12T15:36:02.077' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (142, 1, NULL, NULL, NULL, NULL, 13, N'C-00013', N'Melon Ajman- BDT', NULL, NULL, N'Ajman', 1, CAST(N'2023-01-12T15:36:06.907' AS DateTime), CAST(N'2023-01-31T20:19:07.557' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (143, 1, NULL, NULL, NULL, NULL, 14, N'C-00014', N'Mohan-BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:11.753' AS DateTime), CAST(N'2023-01-20T10:23:11.913' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (144, 1, NULL, NULL, NULL, NULL, 15, N'C-00015', N'Sajid Emirates- BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:16.600' AS DateTime), CAST(N'2023-01-12T15:36:16.600' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (145, 1, NULL, NULL, NULL, NULL, 16, N'C-00016', N'abc-1', NULL, NULL, NULL, 0, CAST(N'2023-01-12T15:36:21.440' AS DateTime), CAST(N'2023-03-01T03:08:46.917' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (146, 1, NULL, NULL, NULL, NULL, 17, N'C-00017', N'Shamim Dhaka -BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:26.300' AS DateTime), CAST(N'2023-01-12T15:36:26.300' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (147, 1, NULL, NULL, NULL, NULL, 18, N'C-00018', N'Emran STD EXCH- BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:31.147' AS DateTime), CAST(N'2023-02-17T20:48:34.080' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (148, 1, NULL, NULL, NULL, NULL, 19, N'C-00019', N'Sumon Badar Zayed- BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:35.993' AS DateTime), CAST(N'2023-02-17T11:33:27.367' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (149, 1, NULL, NULL, NULL, NULL, 20, N'C-00020', N'Tareq Bagina BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:40.857' AS DateTime), CAST(N'2023-01-12T15:36:40.857' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (150, 1, NULL, NULL, NULL, NULL, 21, N'C-00021', N'Tareq Panpara- BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:45.717' AS DateTime), CAST(N'2023-01-12T15:36:45.717' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (151, 4, NULL, NULL, NULL, NULL, 22, N'C-00022', N'RP TRDG (AED)', N'0', N'Rafiq', N'Dubai', 1, CAST(N'2023-01-12T15:36:50.577' AS DateTime), CAST(N'2023-02-17T20:52:51.440' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (152, 4, NULL, NULL, NULL, NULL, 23, N'C-00023', N'Mizan-Alain', N'0', N'Mizanur Rahman', N'Alain', 1, CAST(N'2023-01-12T15:37:10.377' AS DateTime), CAST(N'2023-02-23T16:24:18.590' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (153, 4, 1, NULL, NULL, NULL, 24, N'C-00024', N'Mahfuj', N'0', N'Mahfuj', N'Dubai', 1, CAST(N'2023-01-13T01:59:50.260' AS DateTime), CAST(N'2023-01-13T01:59:50.260' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (154, 1, 1, NULL, NULL, NULL, 25, N'C-00025', N'Himel', N'0', N'Himel', N'Dhaka', 1, CAST(N'2023-01-13T03:17:43.637' AS DateTime), CAST(N'2023-01-23T11:13:41.640' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (155, 4, 1, NULL, NULL, NULL, 26, N'C-00026', N'Maksud AJM', N'0', N'Maksud AJM', N'Dhaka', 1, CAST(N'2023-01-13T03:34:23.487' AS DateTime), CAST(N'2023-02-06T21:25:37.973' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (156, 1, 1, NULL, NULL, NULL, 27, N'C-00027', N'Mijan Ref Hasan', N'0', N'Mijan Ref Hasan', N'Dhaka', 1, CAST(N'2023-01-13T03:49:03.697' AS DateTime), CAST(N'2023-02-17T20:51:14.737' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (157, 4, 1, NULL, NULL, NULL, 28, N'C-00028', N'Mohan AED', N'0', N'Mohan AED', N'Dubai', 1, CAST(N'2023-01-13T04:02:49.107' AS DateTime), CAST(N'2023-02-13T09:55:01.817' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (158, 1, 1, NULL, NULL, NULL, 29, N'C-00029', N'Saiful Dhaka', N'0', N'Saiful Dhaka', N'Dhaka', 1, CAST(N'2023-01-16T06:58:09.373' AS DateTime), CAST(N'2023-02-05T09:30:42.143' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (159, 1, 1, NULL, NULL, NULL, 30, N'C-00030', N'inactive2', N'0', N'STD', N'Dhaka', 0, CAST(N'2023-01-16T07:14:07.110' AS DateTime), CAST(N'2023-01-17T00:58:28.840' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (160, 1, 1, NULL, NULL, NULL, 31, N'C-00031', N'Zhillo Canada', N'0', N'Zhillo Canada', N'Dhaka', 1, CAST(N'2023-01-16T23:14:09.340' AS DateTime), CAST(N'2023-01-16T23:14:09.340' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (161, 1, 1, NULL, NULL, NULL, 32, N'C-00032', N'ZAD', N'0', N'ZAD', N'Dhaka', 1, CAST(N'2023-01-16T23:24:07.133' AS DateTime), CAST(N'2023-02-17T20:49:55.127' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (162, 1, 1, NULL, NULL, NULL, 33, N'C-00033', N'Sarfu BDT', N'0', N'Sarfu BDT', N'Dhaka', 1, CAST(N'2023-01-17T00:02:36.470' AS DateTime), CAST(N'2023-02-16T01:14:39.417' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (163, 4, NULL, NULL, NULL, NULL, 34, N'C-00034', N'Naveed', N'0', N'Naveed', N'Dhaka', 1, CAST(N'2023-01-19T13:11:34.407' AS DateTime), CAST(N'2023-03-02T13:33:22.543' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (164, 1, 1, NULL, NULL, NULL, 35, N'C-00035', N'Rubayet', N'0', N'Rubayet', N'Dhaka', 1, CAST(N'2023-01-25T07:34:19.297' AS DateTime), CAST(N'2023-01-25T07:34:44.840' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (165, 1, 1, NULL, NULL, NULL, 36, N'C-00036', N'BABU Bhai Dhaka', N'01500000', N'Rashed', N'Dhaka', 1, CAST(N'2023-02-16T01:22:12.183' AS DateTime), CAST(N'2023-02-17T13:16:01.500' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (166, 1, 1, NULL, NULL, NULL, 37, N'C-00037', N'ILYAS Dubai-BDT', NULL, NULL, NULL, 1, CAST(N'2023-02-23T20:23:47.157' AS DateTime), CAST(N'2023-02-23T20:24:07.657' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (167, 4, NULL, NULL, NULL, NULL, 38, N'C-00038', N'Mijan Ref Hasan (AED)', NULL, NULL, NULL, 1, CAST(N'2023-02-23T23:51:33.403' AS DateTime), CAST(N'2023-02-23T23:51:33.403' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (168, 1, 1, NULL, NULL, NULL, 39, N'C-00039', N'Prince', N'0', N'Prince', N'Dhaka', 1, CAST(N'2023-02-26T00:05:23.143' AS DateTime), CAST(N'2023-02-26T00:05:23.143' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (169, 1, NULL, NULL, NULL, NULL, 40, N'C-00040', N'Cash Customer & Vendor', N'017', NULL, N'dhaka', 1, CAST(N'2023-02-26T13:59:34.150' AS DateTime), CAST(N'2023-02-26T13:59:34.150' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (170, 4, NULL, NULL, NULL, NULL, 41, N'C-00041', N'Ershad Alain(AED)', N'0', NULL, N'Dhaka', 1, CAST(N'2023-02-28T16:37:30.827' AS DateTime), CAST(N'2023-02-28T16:37:30.827' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (171, 4, 1, NULL, NULL, NULL, 42, N'C-00042', N'Khokan Bhai', NULL, NULL, NULL, 1, CAST(N'2023-03-01T19:41:17.823' AS DateTime), CAST(N'2023-03-01T22:54:52.430' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (172, 4, 1, NULL, NULL, NULL, 43, N'C-00043', N'Cash Customer & Vendor (AED)', NULL, NULL, NULL, 1, CAST(N'2023-03-02T00:28:33.660' AS DateTime), CAST(N'2023-03-02T00:28:33.660' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (173, 4, 1, NULL, NULL, NULL, 44, N'C-00044', N'Sumon Badar Zayed (AED)', NULL, NULL, NULL, 1, CAST(N'2023-03-02T12:28:15.760' AS DateTime), CAST(N'2023-03-02T12:28:15.760' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (174, 4, 1, NULL, NULL, NULL, 45, N'C-00045', N'Style Badge', NULL, NULL, NULL, 1, CAST(N'2023-03-02T23:21:51.783' AS DateTime), CAST(N'2023-03-02T23:21:51.783' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (175, 1, 1, NULL, NULL, NULL, 46, N'C-00046', N'Bahar Khawaniz', N'0', N'Bahar Khawaniz', N'Dhaka', 1, CAST(N'2023-04-06T17:50:39.450' AS DateTime), CAST(N'2023-04-12T18:42:34.667' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (176, 4, 1, NULL, NULL, NULL, 47, N'C-00047', N'Rony Ajman', N'050-----', NULL, NULL, 1, CAST(N'2023-04-07T02:11:57.050' AS DateTime), CAST(N'2023-04-07T02:11:57.050' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (177, 4, 1, NULL, NULL, NULL, 48, N'C-00048', N'Melon Alain', N'0', N'Melon Ajman', N'Alain', 1, CAST(N'2023-04-11T22:20:22.890' AS DateTime), CAST(N'2023-04-11T22:20:22.890' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (178, 4, 1, NULL, NULL, NULL, 49, N'C-00049', N'Mitul', N'0', N'Mitul', N'Dhaka', 1, CAST(N'2023-04-20T15:02:32.483' AS DateTime), CAST(N'2023-04-20T15:02:32.483' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (179, 4, 1, NULL, NULL, NULL, 50, N'C-00050', N'Aziz Ref Melon', N'0', N'Aziz Ref Melon', N'Alain', 1, CAST(N'2023-04-26T19:55:15.640' AS DateTime), CAST(N'2023-04-26T19:55:15.640' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (180, 4, 1, NULL, NULL, NULL, 51, N'C-00051', N'Hasan Bhai AED', N'0', N'Hasan Bhai', N'Dhaka', 0, CAST(N'2023-05-24T17:29:52.340' AS DateTime), CAST(N'2023-05-24T17:29:52.340' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (181, 4, 1, NULL, NULL, NULL, 52, N'C-00052', N'Hasan Bhai Pran AED', N'0', N'Hasan', N'Dhaka', 1, CAST(N'2023-05-24T17:33:08.197' AS DateTime), CAST(N'2023-05-24T17:33:08.197' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Customers] ([LedgerID], [CurrencyID], [AreaID], [SupplierLedgerID], [CustomerLedgerID1], [CustomerLedgerID2], [PkCustomerId], [CustomerCode], [CustomerName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (182, 1, 1, NULL, NULL, NULL, 53, N'C-00053', N'Himel Dhaka', N'0', N'Himel', N'Dhaka', 1, CAST(N'2023-06-19T19:21:50.073' AS DateTime), CAST(N'2023-06-19T19:21:50.073' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Emails] ON 
GO
INSERT [dbo].[Emails] ([UserID], [PkEmailId], [Email], [PrimaryEmailAddress], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 1, N'm.sarfuddin1981@gmail.com', 1, 1, CAST(N'2023-07-12T16:40:42.763' AS DateTime), CAST(N'2023-07-12T16:40:42.763' AS DateTime), N'', N'', N'System')
GO
SET IDENTITY_INSERT [dbo].[Emails] OFF
GO
SET IDENTITY_INSERT [dbo].[Ledgers] ON 
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 1, N'Opening Cash BDT', 8, N'Cash', N'Ac - 00001', N'Dr', 0, 0, 0, 1, CAST(N'2023-07-13T03:40:12.557' AS DateTime), CAST(N'2023-07-13T03:40:12.557' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 2, N'Cash Sales', 12, N'Customer', N'Ac - 00002', N'Dr', 0, 0, 0, 1, CAST(N'2023-07-13T03:40:12.607' AS DateTime), CAST(N'2023-07-13T03:40:12.607' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 3, N'Stock BDT', 13, N'Stock', N'Ac - 00003', N'Dr', 0, 0, 0, 1, CAST(N'2023-07-13T03:40:12.610' AS DateTime), CAST(N'2023-07-13T03:40:12.610' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 4, N'Capital BDT', 16, N'Capital', N'Ac - 00004', N'Cr', 0, 10271754, 10271754, 1, CAST(N'2023-07-13T03:40:12.610' AS DateTime), CAST(N'2023-07-13T03:40:12.610' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 5, N'Cash Purchase', 19, N'Supplier', N'Ac - 00005', N'Cr', 0, 0, 0, 1, CAST(N'2023-07-13T03:40:12.613' AS DateTime), CAST(N'2023-07-13T03:40:12.613' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 6, N'Profit & Loss Account', 22, N'Profit & Loss', N'Ac - 00006', N'Cr', 0, 0, 0, 1, CAST(N'2023-07-13T03:40:12.617' AS DateTime), CAST(N'2023-07-13T03:40:12.617' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 7, N'Rukunujjaman Miaji', 30, NULL, N'Ac-00006', N'Dr', 0, 0, 0, 1, CAST(N'2023-07-13T03:40:42.757' AS DateTime), CAST(N'2023-07-13T03:40:42.757' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 8, N'Cash Sales CAD', 12, N'Customer', N'Ac-00007', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:56:16.183' AS DateTime), CAST(N'2023-06-20T02:08:44.473' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 9, N'Cash Purchase CAD', 19, N'Supplier', N'Ac-00008', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-07T05:56:16.183' AS DateTime), CAST(N'2023-06-20T02:08:44.473' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 10, N'CAD Cash', 8, N'Cash', N'B-00001', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:56:16.183' AS DateTime), CAST(N'2023-06-20T02:08:44.473' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 11, N'CAD Bank', 9, N'Bank', N'B-00002', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:56:16.183' AS DateTime), CAST(N'2023-06-20T02:08:44.473' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 12, N'CAD Mobile Banking', 10, N'Mobile Bank', N'B-00003', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:56:16.183' AS DateTime), CAST(N'2023-06-20T02:08:44.473' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 13, N'Stock CAD', 13, N'Stock', N'B-00004', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:56:16.183' AS DateTime), CAST(N'2023-06-20T02:08:44.473' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 14, N'Capital CAD', 16, N'Capital', N'Ac-00009', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-07T05:56:16.183' AS DateTime), CAST(N'2023-06-20T02:08:44.473' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 15, N'Cash Sales USD', 12, N'Customer', N'Ac-00010', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:57:15.740' AS DateTime), CAST(N'2023-04-06T10:03:58.540' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 16, N'Cash Purchase USD', 19, N'Supplier', N'Ac-00011', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-07T05:57:15.740' AS DateTime), CAST(N'2023-04-06T10:03:58.540' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 17, N'USD Cash', 8, N'Cash', N'B-00005', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:57:15.740' AS DateTime), CAST(N'2023-04-06T10:03:58.540' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 18, N'USD Bank', 9, N'Bank', N'B-00006', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:57:15.740' AS DateTime), CAST(N'2023-04-06T10:03:58.540' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 19, N'USD Mobile Banking', 10, N'Mobile Bank', N'B-00007', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:57:15.740' AS DateTime), CAST(N'2023-04-06T10:03:58.540' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 20, N'Stock USD', 13, N'Stock', N'B-00008', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:57:15.740' AS DateTime), CAST(N'2023-04-06T10:03:58.540' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 21, N'Capital USD', 16, N'Capital', N'Ac-00012', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-07T05:57:15.740' AS DateTime), CAST(N'2023-04-06T10:03:58.540' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 22, N'Cash Sales AED', 12, N'Customer', N'Ac-00013', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:59:12.593' AS DateTime), CAST(N'2023-06-20T02:09:42.910' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 23, N'Cash Purchase AED', 19, N'Supplier', N'Ac-00014', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-07T05:59:12.593' AS DateTime), CAST(N'2023-06-20T02:09:42.910' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 24, N'AED Cash', 8, N'Cash', N'B-00009', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:59:12.593' AS DateTime), CAST(N'2023-06-20T02:09:42.910' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 25, N'AED Bank', 9, N'Bank', N'B-00010', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:59:12.593' AS DateTime), CAST(N'2023-06-20T02:09:42.910' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 26, N'AED Mobile Banking', 10, N'Mobile Bank', N'B-00011', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:59:12.593' AS DateTime), CAST(N'2023-06-20T02:09:42.910' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 27, N'Stock AED', 13, N'Stock', N'B-00012', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-07T05:59:12.593' AS DateTime), CAST(N'2023-06-20T02:09:42.910' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 28, N'Capital AED', 16, N'Capital', N'Ac-00015', N'Cr', 0, -331331.11, -331331.11, 1, CAST(N'2023-01-07T05:59:12.593' AS DateTime), CAST(N'2023-06-20T02:09:42.910' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, 29, N'Cash Sales INR', 12, N'Customer', N'Ac-00016', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-09T00:20:47.217' AS DateTime), CAST(N'2023-04-06T10:04:32.070' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, 30, N'Cash Purchase INR', 19, N'Supplier', N'Ac-00017', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-09T00:20:47.217' AS DateTime), CAST(N'2023-04-06T10:04:32.070' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, 31, N'INR Cash', 8, N'Cash', N'B-00013', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-09T00:20:47.217' AS DateTime), CAST(N'2023-04-06T10:04:32.070' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, 32, N'INR Bank', 9, N'Bank', N'B-00014', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-09T00:20:47.217' AS DateTime), CAST(N'2023-04-06T10:04:32.070' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, 33, N'INR Mobile Banking', 10, N'Mobile Bank', N'B-00015', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-09T00:20:47.217' AS DateTime), CAST(N'2023-04-06T10:04:32.070' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, 34, N'Stock INR', 13, N'Stock', N'B-00016', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-09T00:20:47.217' AS DateTime), CAST(N'2023-04-06T10:04:32.070' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, 35, N'Capital INR', 16, N'Capital', N'Ac-00018', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-09T00:20:47.217' AS DateTime), CAST(N'2023-04-06T10:04:32.070' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 36, N'Cash Sales PKR', 12, N'Customer', N'Ac-00019', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-12T03:42:24.597' AS DateTime), CAST(N'2023-04-06T10:05:45.690' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 37, N'Cash Purchase PKR', 19, N'Supplier', N'Ac-00020', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T03:42:24.597' AS DateTime), CAST(N'2023-04-06T10:05:45.690' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 38, N'PKR Cash', 8, N'Cash', N'B-00017', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-12T03:42:24.597' AS DateTime), CAST(N'2023-04-06T10:05:45.690' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 39, N'PKR Bank', 9, N'Bank', N'B-00018', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-12T03:42:24.597' AS DateTime), CAST(N'2023-04-06T10:05:45.690' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 40, N'PKR Mobile Banking', 10, N'Mobile Bank', N'B-00019', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-12T03:42:24.597' AS DateTime), CAST(N'2023-04-06T10:05:45.690' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 41, N'Stock PKR', 13, N'Stock', N'B-00020', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-12T03:42:24.597' AS DateTime), CAST(N'2023-04-06T10:05:45.690' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 42, N'Capital PKR', 16, N'Capital', N'Ac-00021', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T03:42:24.597' AS DateTime), CAST(N'2023-04-06T10:05:45.690' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, 43, N'Cash Sales LKR', 12, N'Customer', N'Ac-00022', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-13T04:29:22.803' AS DateTime), CAST(N'2023-02-12T12:30:58.290' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, 44, N'Cash Purchase LKR', 19, N'Supplier', N'Ac-00023', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-13T04:29:22.803' AS DateTime), CAST(N'2023-02-12T12:30:58.290' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, 45, N'LKR Cash', 8, N'Cash', N'B-00021', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-13T04:29:22.803' AS DateTime), CAST(N'2023-02-12T12:30:58.290' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, 46, N'LKR Bank', 9, N'Bank', N'B-00022', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-13T04:29:22.803' AS DateTime), CAST(N'2023-02-12T12:30:58.290' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, 47, N'LKR Mobile Banking', 10, N'Mobile Bank', N'B-00023', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-13T04:29:22.803' AS DateTime), CAST(N'2023-02-12T12:30:58.290' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, 48, N'Stock LKR', 13, N'Stock', N'B-00024', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-13T04:29:22.803' AS DateTime), CAST(N'2023-02-12T12:30:58.290' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, 49, N'Capital LKR', 16, N'Capital', N'Ac-00024', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-13T04:29:22.803' AS DateTime), CAST(N'2023-02-12T12:30:58.290' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, 50, N'Cash Sales AUD', 12, N'Customer', N'Ac-00025', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:44:27.563' AS DateTime), CAST(N'2023-02-17T16:44:27.563' AS DateTime), N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, 51, N'Cash Purchase AUD', 19, N'Supplier', N'Ac-00026', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-17T16:44:27.563' AS DateTime), CAST(N'2023-02-17T16:44:27.563' AS DateTime), N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, 52, N'AUD Cash', 8, N'Cash', N'B-00025', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:44:27.563' AS DateTime), CAST(N'2023-02-17T16:44:27.563' AS DateTime), N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, 53, N'AUD Bank', 9, N'Bank', N'B-00026', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:44:27.563' AS DateTime), CAST(N'2023-02-17T16:44:27.563' AS DateTime), N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, 54, N'AUD Mobile Banking', 10, N'Mobile Bank', N'B-00027', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:44:27.563' AS DateTime), CAST(N'2023-02-17T16:44:27.563' AS DateTime), N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, 55, N'Stock AUD', 13, N'Stock', N'B-00028', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:44:27.563' AS DateTime), CAST(N'2023-02-17T16:44:27.563' AS DateTime), N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, 56, N'Capital AUD', 16, N'Capital', N'Ac-00027', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-17T16:44:27.563' AS DateTime), CAST(N'2023-02-17T16:44:27.563' AS DateTime), N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, 57, N'Cash Sales AUD (Australian Dollar)', 12, N'Customer', N'Ac-00028', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:47:52.703' AS DateTime), CAST(N'2023-04-26T09:25:14.990' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, 58, N'Cash Purchase AUD (Australian Dollar)', 19, N'Supplier', N'Ac-00029', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-17T16:47:52.703' AS DateTime), CAST(N'2023-04-26T09:25:14.990' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, 59, N'AUD (Australian Dollar) Cash', 8, N'Cash', N'B-00029', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:47:52.703' AS DateTime), CAST(N'2023-04-26T09:25:14.990' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, 60, N'AUD (Australian Dollar) Bank', 9, N'Bank', N'B-00030', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:47:52.703' AS DateTime), CAST(N'2023-04-26T09:25:14.990' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, 61, N'AUD (Australian Dollar) Mobile Banking', 10, N'Mobile Bank', N'B-00031', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:47:52.703' AS DateTime), CAST(N'2023-04-26T09:25:14.990' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, 62, N'Stock AUD (Australian Dollar)', 13, N'Stock', N'B-00032', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-17T16:47:52.703' AS DateTime), CAST(N'2023-04-26T09:25:14.990' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, 63, N'Capital AUD (Australian Dollar)', 16, N'Capital', N'Ac-00030', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-17T16:47:52.703' AS DateTime), CAST(N'2023-04-26T09:25:14.990' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, 64, N'Cash Sales MYR', 12, N'Customer', N'Ac-00031', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-15T18:04:53.553' AS DateTime), CAST(N'2023-03-15T18:04:53.553' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, 65, N'Cash Purchase MYR', 19, N'Supplier', N'Ac-00032', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-15T18:04:53.553' AS DateTime), CAST(N'2023-03-15T18:04:53.553' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, 66, N'MYR Cash', 8, N'Cash', N'B-00033', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-15T18:04:53.553' AS DateTime), CAST(N'2023-03-15T18:04:53.553' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, 67, N'MYR Bank', 9, N'Bank', N'B-00034', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-15T18:04:53.553' AS DateTime), CAST(N'2023-03-15T18:04:53.553' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, 68, N'MYR Mobile Banking', 10, N'Mobile Bank', N'B-00035', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-15T18:04:53.553' AS DateTime), CAST(N'2023-03-15T18:04:53.553' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, 69, N'Stock MYR', 13, N'Stock', N'B-00036', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-15T18:04:53.553' AS DateTime), CAST(N'2023-03-15T18:04:53.553' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, 70, N'Capital MYR', 16, N'Capital', N'Ac-00033', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-15T18:04:53.553' AS DateTime), CAST(N'2023-03-15T18:04:53.553' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, 71, N'Cash Sales Lira', 12, N'Customer', N'Ac-00034', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-23T00:17:30.293' AS DateTime), CAST(N'2023-03-23T00:17:30.293' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, 72, N'Cash Purchase Lira', 19, N'Supplier', N'Ac-00035', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-23T00:17:30.293' AS DateTime), CAST(N'2023-03-23T00:17:30.293' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, 73, N'Lira Cash', 8, N'Cash', N'B-00037', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-23T00:17:30.293' AS DateTime), CAST(N'2023-03-23T00:17:30.293' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, 74, N'Lira Bank', 9, N'Bank', N'B-00038', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-23T00:17:30.293' AS DateTime), CAST(N'2023-03-23T00:17:30.293' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, 75, N'Lira Mobile Banking', 10, N'Mobile Bank', N'B-00039', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-23T00:17:30.293' AS DateTime), CAST(N'2023-03-23T00:17:30.293' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, 76, N'Stock Lira', 13, N'Stock', N'B-00040', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-23T00:17:30.293' AS DateTime), CAST(N'2023-03-23T00:17:30.293' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, 77, N'Capital Lira', 16, N'Capital', N'Ac-00036', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-23T00:17:30.293' AS DateTime), CAST(N'2023-03-23T00:17:30.293' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, 78, N'Cash Sales SAR', 12, N'Customer', N'Ac-00037', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-24T22:25:28.673' AS DateTime), CAST(N'2023-03-24T22:25:28.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, 79, N'Cash Purchase SAR', 19, N'Supplier', N'Ac-00038', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-24T22:25:28.673' AS DateTime), CAST(N'2023-03-24T22:25:28.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, 80, N'SAR Cash', 8, N'Cash', N'B-00041', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-24T22:25:28.673' AS DateTime), CAST(N'2023-03-24T22:25:28.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, 81, N'SAR Bank', 9, N'Bank', N'B-00042', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-24T22:25:28.673' AS DateTime), CAST(N'2023-03-24T22:25:28.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, 82, N'SAR Mobile Banking', 10, N'Mobile Bank', N'B-00043', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-24T22:25:28.673' AS DateTime), CAST(N'2023-03-24T22:25:28.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, 83, N'Stock SAR', 13, N'Stock', N'B-00044', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-24T22:25:28.673' AS DateTime), CAST(N'2023-03-24T22:25:28.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, 84, N'Capital SAR', 16, N'Capital', N'Ac-00039', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-24T22:25:28.673' AS DateTime), CAST(N'2023-03-24T22:25:28.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, 85, N'Cash Sales EURO', 12, N'Customer', N'Ac-00040', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-18T18:55:40.743' AS DateTime), CAST(N'2023-06-18T18:55:40.743' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, 86, N'Cash Purchase EURO', 19, N'Supplier', N'Ac-00041', N'Cr', 0, 0, 0, 1, CAST(N'2023-06-18T18:55:40.743' AS DateTime), CAST(N'2023-06-18T18:55:40.743' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, 87, N'EURO Cash', 8, N'Cash', N'B-00045', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-18T18:55:40.743' AS DateTime), CAST(N'2023-06-18T18:55:40.743' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, 88, N'EURO Bank', 9, N'Bank', N'B-00046', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-18T18:55:40.743' AS DateTime), CAST(N'2023-06-18T18:55:40.743' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, 89, N'EURO Mobile Banking', 10, N'Mobile Bank', N'B-00047', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-18T18:55:40.743' AS DateTime), CAST(N'2023-06-18T18:55:40.743' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, 90, N'Stock EURO', 13, N'Stock', N'B-00048', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-18T18:55:40.743' AS DateTime), CAST(N'2023-06-18T18:55:40.743' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (13, 91, N'Capital EURO', 16, N'Capital', N'Ac-00042', N'Cr', 0, 0, 0, 1, CAST(N'2023-06-18T18:55:40.743' AS DateTime), CAST(N'2023-06-18T18:55:40.743' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, 92, N'Cash Sales SGD', 12, N'Customer', N'Ac-00043', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-20T18:05:54.097' AS DateTime), CAST(N'2023-06-20T18:05:54.097' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, 93, N'Cash Purchase SGD', 19, N'Supplier', N'Ac-00044', N'Cr', 0, 0, 0, 1, CAST(N'2023-06-20T18:05:54.097' AS DateTime), CAST(N'2023-06-20T18:05:54.097' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, 94, N'SGD Cash', 8, N'Cash', N'B-00049', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-20T18:05:54.097' AS DateTime), CAST(N'2023-06-20T18:05:54.097' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, 95, N'SGD Bank', 9, N'Bank', N'B-00050', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-20T18:05:54.097' AS DateTime), CAST(N'2023-06-20T18:05:54.097' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, 96, N'SGD Mobile Banking', 10, N'Mobile Bank', N'B-00051', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-20T18:05:54.097' AS DateTime), CAST(N'2023-06-20T18:05:54.097' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, 97, N'Stock SGD', 13, N'Stock', N'B-00052', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-20T18:05:54.097' AS DateTime), CAST(N'2023-06-20T18:05:54.097' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, 98, N'Capital SGD', 16, N'Capital', N'Ac-00045', N'Cr', 0, 0, 0, 1, CAST(N'2023-06-20T18:05:54.097' AS DateTime), CAST(N'2023-06-20T18:05:54.097' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 101, N'AED ', 14, N'Agent', N'B-00001', N'Dr', -46800, 0, -46800, 0, CAST(N'2023-01-06T14:07:45.663' AS DateTime), CAST(N'2023-01-06T14:07:45.663' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 102, N'Cash-AED (Sarfu)', 8, N'Cash', N'B-00002', N'Dr', 5000, 0, 5000, 1, CAST(N'2023-01-06T14:08:27.363' AS DateTime), CAST(N'2023-01-06T14:08:27.363' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 103, N'CBD-Sarfu', 9, N'Bank', N'B-00003', N'Dr', 1184, 0, 1184, 1, CAST(N'2023-01-06T14:09:23.453' AS DateTime), CAST(N'2023-01-06T14:09:23.453' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 104, N'ENBD-Azad', 9, N'Bank', N'B-00004', N'Dr', 28746.16, 0, 28746.16, 1, CAST(N'2023-01-06T14:10:08.513' AS DateTime), CAST(N'2023-01-06T14:10:08.513' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 105, N'FAB-Sarfu', 9, N'Bank', N'B-00005', N'Dr', 2699, 0, 2699, 1, CAST(N'2023-01-06T14:10:42.230' AS DateTime), CAST(N'2023-01-06T14:10:42.230' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 106, N'Mashreq -Sarfu', 9, N'Bank', N'B-00006', N'Dr', 22160, 0, 22160, 0, CAST(N'2023-01-06T14:11:29.147' AS DateTime), CAST(N'2023-01-06T14:11:29.147' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 107, N'RAK-Sarfu', 9, N'Bank', N'B-00007', N'Dr', 8141.98, 0, 8141.98, 1, CAST(N'2023-01-06T14:12:00.303' AS DateTime), CAST(N'2023-01-06T14:12:00.303' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 108, N'ADCB-Al Areeq Technical', 9, N'Bank', N'B-00008', N'Dr', 5231, 0, 5231, 1, CAST(N'2023-01-06T14:12:47.127' AS DateTime), CAST(N'2023-01-06T14:12:47.127' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 109, N'Cash-BDT (Rashed)', 14, N'Agent', N'B-00009', N'Dr', 1587826, 0, 1587826, 1, CAST(N'2023-01-07T00:59:30.423' AS DateTime), CAST(N'2023-01-07T00:59:30.423' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 110, N'Brac Bank-Ek Enterprise', 9, N'Bank', N'B-00010', N'Dr', 66, 0, 66, 1, CAST(N'2023-01-07T01:00:06.763' AS DateTime), CAST(N'2023-01-07T01:00:06.763' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 111, N'Brac Bank-Rashed Alam', 9, N'Bank', N'B-00011', N'Dr', 3999, 0, 3999, 1, CAST(N'2023-01-07T01:00:45.310' AS DateTime), CAST(N'2023-01-07T01:00:45.310' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 112, N'City Bank-Ek Enterprise', 9, N'Bank', N'B-00012', N'Dr', 767078, 0, 767078, 1, CAST(N'2023-01-07T01:01:37.273' AS DateTime), CAST(N'2023-01-07T01:01:37.273' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 113, N'City Bank- Rashed Alam', 9, N'Bank', N'B-00013', N'Dr', 549795, 0, 549795, 1, CAST(N'2023-01-07T01:02:17.787' AS DateTime), CAST(N'2023-01-07T01:02:17.787' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 114, N'DBBL- Ek Enterprise', 9, N'Bank', N'B-00014', N'Dr', 23748, 0, 23748, 1, CAST(N'2023-01-07T01:03:01.207' AS DateTime), CAST(N'2023-01-07T01:03:01.207' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 115, N'IBBL- Rashed Alam', 9, N'Bank', N'B-00015', N'Dr', 4924, 0, 4924, 1, CAST(N'2023-01-07T01:03:42.640' AS DateTime), CAST(N'2023-01-07T01:03:42.640' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 116, N'IBBL-Sarfuddin', 9, N'Bank', N'B-00016', N'Dr', 7710, 0, 7710, 1, CAST(N'2023-01-07T01:04:21.200' AS DateTime), CAST(N'2023-01-07T01:04:21.200' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 117, N'Pubali Bank-Ek Enterprise', 9, N'Bank', N'B-00017', N'Dr', 92555, 0, 92555, 1, CAST(N'2023-01-07T01:06:41.783' AS DateTime), CAST(N'2023-01-07T01:06:41.783' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 118, N'BDT (Bangladeshi Taka)', 14, N'Agent', N'B-00018', N'Dr', -534600, 0, -534600, 1, CAST(N'2023-01-07T01:47:19.287' AS DateTime), CAST(N'2023-01-07T01:47:19.287' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, 119, N'CAD', 14, N'Agent', N'B-00019', N'Dr', 0, 0, 0, 0, CAST(N'2023-01-08T00:08:53.243' AS DateTime), CAST(N'2023-01-08T00:08:53.243' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 120, N'PKR', 14, N'Agent', N'B-00020', N'Dr', 0, 0, 0, 0, CAST(N'2023-01-11T11:45:18.927' AS DateTime), CAST(N'2023-01-11T11:45:18.927' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, 121, N'INR', 14, N'Agent', N'B-00021', N'Dr', 0, 0, 0, 0, CAST(N'2023-01-12T09:26:21.243' AS DateTime), CAST(N'2023-01-12T09:26:21.243' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, 122, N'USD', 14, N'Agent', N'B-00022', N'Dr', 0, 0, 0, 0, CAST(N'2023-01-12T09:26:52.677' AS DateTime), CAST(N'2023-01-12T09:26:52.677' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, 123, N'LKR', 14, N'Agent', N'B-00023', N'Dr', 0, 0, 0, 0, CAST(N'2023-02-13T00:05:59.453' AS DateTime), CAST(N'2023-02-13T00:05:59.453' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (9, 124, N'AUD', 14, N'Agent', N'B-00024', N'Dr', 0, 0, 0, 0, CAST(N'2023-02-17T11:51:28.920' AS DateTime), CAST(N'2023-02-17T11:51:28.920' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (10, 125, N'MYR', 14, N'Agent', N'B-00025', N'Dr', 0, 0, 0, 0, CAST(N'2023-03-15T13:06:13.220' AS DateTime), CAST(N'2023-03-15T13:06:13.220' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (11, 126, N'Lira', 14, N'Agent', N'B-00026', N'Dr', 0, 0, 0, 0, CAST(N'2023-03-22T19:19:04.687' AS DateTime), CAST(N'2023-03-22T19:19:04.687' AS DateTime), N'System', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (12, 127, N'SAR', 14, N'Agent', N'B-00027', N'Dr', 0, 0, 0, 0, CAST(N'2023-03-24T17:43:54.320' AS DateTime), CAST(N'2023-03-24T17:43:54.320' AS DateTime), N'System', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 128, N'City Bank-Sarfu', 9, N'Bank', N'B-00028', N'Dr', 0, 0, 0, 1, CAST(N'2023-05-20T10:16:25.987' AS DateTime), CAST(N'2023-05-20T10:16:25.987' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 129, N'AED Third Party Account ', 9, N'Bank', N'B-00029', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-21T15:04:04.533' AS DateTime), CAST(N'2023-06-21T15:04:04.533' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 130, N'Elias Dhaka-AED', 12, N'Customer', N'C-00001', N'Dr', 417, 0, 417, 1, CAST(N'2023-01-12T15:34:30.790' AS DateTime), CAST(N'2023-01-12T15:34:30.790' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 131, N'ILYAS Dubai-AED', 12, N'Customer', N'C-00002', N'Dr', 24, 0, 24, 1, CAST(N'2023-01-12T15:34:36.653' AS DateTime), CAST(N'2023-01-12T15:34:36.653' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 132, N'Tareq Bagina AED', 12, N'Customer', N'C-00003', N'Dr', 5843, 0, 5843, 1, CAST(N'2023-01-12T15:34:41.450' AS DateTime), CAST(N'2023-01-12T15:34:41.450' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 133, N'Obaiyed Bhai AED', 12, N'Customer', N'C-00004', N'Dr', 4173, 0, 4173, 1, CAST(N'2023-01-12T15:34:47.260' AS DateTime), CAST(N'2023-01-12T15:34:47.260' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 134, N'Kabir Sayeed AED', 12, N'Customer', N'C-00005', N'Dr', 91, 0, 91, 1, CAST(N'2023-01-12T15:34:52.677' AS DateTime), CAST(N'2023-01-12T15:34:52.677' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 135, N'Alamin Gulshan- BDT', 12, N'Customer', N'C-00006', N'Dr', 1817793, 0, 1817793, 1, CAST(N'2023-01-12T15:34:57.487' AS DateTime), CAST(N'2023-01-12T15:34:57.487' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 136, N'Azad UAE -BDT', 12, N'Customer', N'C-00007', N'Dr', 666542, 0, 666542, 1, CAST(N'2023-01-12T15:35:24.243' AS DateTime), CAST(N'2023-01-12T15:35:24.243' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 137, N'Bahar Alain- BDT', 12, N'Customer', N'C-00008', N'Dr', 255459, 0, 255459, 1, CAST(N'2023-01-12T15:35:29.070' AS DateTime), CAST(N'2023-01-12T15:35:29.070' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 138, N'Dayal Alain- BDT', 12, N'Customer', N'C-00009', N'Dr', 39984, 0, 39984, 1, CAST(N'2023-01-12T15:35:37.577' AS DateTime), CAST(N'2023-01-12T15:35:37.577' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 139, N'Jahir Hor Al ANZ- BDT', 12, N'Customer', N'C-00010', N'Dr', 5256, 0, 5256, 1, CAST(N'2023-01-12T15:35:52.103' AS DateTime), CAST(N'2023-01-12T15:35:52.103' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 140, N'Mainuddin- Brother', 12, N'Customer', N'C-00011', N'Dr', 348693, 0, 348693, 1, CAST(N'2023-01-12T15:35:56.930' AS DateTime), CAST(N'2023-01-12T15:35:56.930' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 141, N'Masud Dubai- BDT', 12, N'Customer', N'C-00012', N'Dr', 106401, 0, 106401, 1, CAST(N'2023-01-12T15:36:02.077' AS DateTime), CAST(N'2023-01-12T15:36:02.077' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 142, N'Melon Ajman- BDT', 12, N'Customer', N'C-00013', N'Dr', 167485, 0, 167485, 1, CAST(N'2023-01-12T15:36:06.907' AS DateTime), CAST(N'2023-01-12T15:36:06.907' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 143, N'Mohan-BDT', 12, N'Customer', N'C-00014', N'Dr', 300318, 0, 300318, 1, CAST(N'2023-01-12T15:36:11.753' AS DateTime), CAST(N'2023-01-12T15:36:11.753' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 144, N'Sajid Emirates- BDT', 12, N'Customer', N'C-00015', N'Dr', 1962, 0, 1962, 1, CAST(N'2023-01-12T15:36:16.600' AS DateTime), CAST(N'2023-01-12T15:36:16.600' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 145, N'abc-1', 12, N'Customer', N'C-00016', N'Dr', 0, 0, 0, 0, CAST(N'2023-01-12T15:36:21.440' AS DateTime), CAST(N'2023-01-12T15:36:21.440' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 146, N'Shamim Dhaka -BDT', 12, N'Customer', N'C-00017', N'Dr', 817076, 0, 817076, 1, CAST(N'2023-01-12T15:36:26.300' AS DateTime), CAST(N'2023-01-12T15:36:26.300' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 147, N'Emran STD EXCH- BDT', 12, N'Customer', N'C-00018', N'Dr', 4808334, 0, 4808334, 1, CAST(N'2023-01-12T15:36:31.147' AS DateTime), CAST(N'2023-01-12T15:36:31.147' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 148, N'Sumon Badar Zayed- BDT', 12, N'Customer', N'C-00019', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:35.993' AS DateTime), CAST(N'2023-01-12T15:36:35.993' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 149, N'Tareq Bagina BDT', 12, N'Customer', N'C-00020', N'Dr', 111596, 0, 111596, 1, CAST(N'2023-01-12T15:36:40.857' AS DateTime), CAST(N'2023-01-12T15:36:40.857' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 150, N'Tareq Panpara- BDT', 12, N'Customer', N'C-00021', N'Dr', 2478, 0, 2478, 1, CAST(N'2023-01-12T15:36:45.717' AS DateTime), CAST(N'2023-01-12T15:36:45.717' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 151, N'RP TRDG (AED)', 12, N'Customer', N'C-00022', N'Dr', -181472, 0, -181472, 1, CAST(N'2023-01-12T15:36:50.577' AS DateTime), CAST(N'2023-01-12T15:36:50.577' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 152, N'Mizan-Alain', 12, N'Customer', N'C-00023', N'Dr', -4232.25, 0, -4232.25, 1, CAST(N'2023-01-12T15:37:10.377' AS DateTime), CAST(N'2023-01-12T15:37:10.377' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 153, N'Mahfuj', 12, N'Customer', N'C-00024', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-13T01:59:50.260' AS DateTime), CAST(N'2023-01-13T01:59:50.260' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 154, N'Himel', 12, N'Customer', N'C-00025', N'Dr', -2000000, 0, -2000000, 1, CAST(N'2023-01-13T03:17:43.637' AS DateTime), CAST(N'2023-01-13T03:17:43.637' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 155, N'Maksud AJM', 12, N'Customer', N'C-00026', N'Dr', -175, 0, -175, 1, CAST(N'2023-01-13T03:34:23.487' AS DateTime), CAST(N'2023-01-13T03:34:23.487' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 156, N'Mijan Ref Hasan', 12, N'Customer', N'C-00027', N'Dr', 2, 0, 2, 1, CAST(N'2023-01-13T03:49:03.697' AS DateTime), CAST(N'2023-01-13T03:49:03.697' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 157, N'Mohan AED', 12, N'Customer', N'C-00028', N'Dr', -94869, 0, -94869, 1, CAST(N'2023-01-13T04:02:49.107' AS DateTime), CAST(N'2023-01-13T04:02:49.107' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 158, N'Saiful Dhaka', 12, N'Customer', N'C-00029', N'Dr', -20294, 0, -20294, 1, CAST(N'2023-01-16T06:58:09.373' AS DateTime), CAST(N'2023-01-16T06:58:09.373' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 159, N'inactive2', 12, N'Customer', N'C-00030', N'Dr', 0, 0, 0, 0, CAST(N'2023-01-16T07:14:07.110' AS DateTime), CAST(N'2023-01-16T07:14:07.110' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 160, N'Zhillo Canada', 12, N'Customer', N'C-00031', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-16T23:14:09.340' AS DateTime), CAST(N'2023-01-16T23:14:09.340' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 161, N'ZAD', 12, N'Customer', N'C-00032', N'Dr', -134664, 0, -134664, 1, CAST(N'2023-01-16T23:24:07.133' AS DateTime), CAST(N'2023-01-16T23:24:07.133' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 162, N'Sarfu BDT', 12, N'Customer', N'C-00033', N'Dr', 1921469, 0, 1921469, 1, CAST(N'2023-01-17T00:02:36.470' AS DateTime), CAST(N'2023-01-17T00:02:36.470' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 163, N'Naveed', 12, N'Customer', N'C-00034', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-19T13:11:34.407' AS DateTime), CAST(N'2023-01-19T13:11:34.407' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 164, N'Rubayet', 12, N'Customer', N'C-00035', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-25T07:34:19.297' AS DateTime), CAST(N'2023-01-25T07:34:19.297' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 165, N'BABU Bhai Dhaka', 12, N'Customer', N'C-00036', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-16T01:22:12.183' AS DateTime), CAST(N'2023-02-16T01:22:12.183' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 166, N'ILYAS Dubai-BDT', 12, N'Customer', N'C-00037', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-23T20:23:47.157' AS DateTime), CAST(N'2023-02-23T20:23:47.157' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 167, N'Mijan Ref Hasan (AED)', 12, N'Customer', N'C-00038', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-23T23:51:33.403' AS DateTime), CAST(N'2023-02-23T23:51:33.403' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 168, N'Prince', 12, N'Customer', N'C-00039', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-26T00:05:23.143' AS DateTime), CAST(N'2023-02-26T00:05:23.143' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 169, N'Cash Customer & Vendor', 12, N'Customer', N'C-00040', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-26T13:59:34.150' AS DateTime), CAST(N'2023-02-26T13:59:34.150' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 170, N'Ershad Alain(AED)', 12, N'Customer', N'C-00041', N'Dr', 0, 0, 0, 1, CAST(N'2023-02-28T16:37:30.827' AS DateTime), CAST(N'2023-02-28T16:37:30.827' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 171, N'Khokan Bhai', 12, N'Customer', N'C-00042', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-01T19:41:17.823' AS DateTime), CAST(N'2023-03-01T19:41:17.823' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 172, N'Cash Customer & Vendor (AED)', 12, N'Customer', N'C-00043', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-02T00:28:33.660' AS DateTime), CAST(N'2023-03-02T00:28:33.660' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 173, N'Sumon Badar Zayed (AED)', 12, N'Customer', N'C-00044', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-02T12:28:15.760' AS DateTime), CAST(N'2023-03-02T12:28:15.760' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 174, N'Style Badge', 12, N'Customer', N'C-00045', N'Dr', 0, 0, 0, 1, CAST(N'2023-03-02T23:21:51.783' AS DateTime), CAST(N'2023-03-02T23:21:51.783' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 175, N'Bahar Khawaniz', 12, N'Customer', N'C-00046', N'Dr', 0, 0, 0, 1, CAST(N'2023-04-06T17:50:39.450' AS DateTime), CAST(N'2023-04-06T17:50:39.450' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 176, N'Rony Ajman', 12, N'Customer', N'C-00047', N'Dr', 0, 0, 0, 1, CAST(N'2023-04-07T02:11:57.050' AS DateTime), CAST(N'2023-04-07T02:11:57.050' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 177, N'Melon Alain', 12, N'Customer', N'C-00048', N'Dr', 0, 0, 0, 1, CAST(N'2023-04-11T22:20:22.890' AS DateTime), CAST(N'2023-04-11T22:20:22.890' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 178, N'Mitul', 12, N'Customer', N'C-00049', N'Dr', 0, 0, 0, 1, CAST(N'2023-04-20T15:02:32.483' AS DateTime), CAST(N'2023-04-20T15:02:32.483' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 179, N'Aziz Ref Melon', 12, N'Customer', N'C-00050', N'Dr', 0, 0, 0, 1, CAST(N'2023-04-26T19:55:15.640' AS DateTime), CAST(N'2023-04-26T19:55:15.640' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 180, N'Hasan Bhai AED', 12, N'Customer', N'C-00051', N'Dr', 0, 0, 0, 0, CAST(N'2023-05-24T17:29:52.340' AS DateTime), CAST(N'2023-05-24T17:29:52.340' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 181, N'Hasan Bhai Pran AED', 12, N'Customer', N'C-00052', N'Dr', 0, 0, 0, 1, CAST(N'2023-05-24T17:33:08.197' AS DateTime), CAST(N'2023-05-24T17:33:08.197' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 182, N'Himel Dhaka', 12, N'Customer', N'C-00053', N'Dr', 0, 0, 0, 1, CAST(N'2023-06-19T19:21:50.073' AS DateTime), CAST(N'2023-06-19T19:21:50.073' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 183, N'Elias Dhaka-AED', 19, N'Supplier', N'S-00001', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:34:33.813' AS DateTime), CAST(N'2023-01-12T15:34:33.813' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 184, N'Tareq Bagina AED', 19, N'Supplier', N'S-00002', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:34:43.587' AS DateTime), CAST(N'2023-01-12T15:34:43.587' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 185, N'Obaiyed Bhai AED', 19, N'Supplier', N'S-00003', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:34:49.703' AS DateTime), CAST(N'2023-01-12T15:34:49.703' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 186, N'Alamin Gulshan- BDT', 19, N'Supplier', N'S-00004', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:35:21.563' AS DateTime), CAST(N'2023-01-12T15:35:21.563' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 187, N'Azad UAE -BDT', 19, N'Supplier', N'S-00005', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:35:26.383' AS DateTime), CAST(N'2023-01-12T15:35:26.383' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 188, N'Bahar Alain- BDT', 19, N'Supplier', N'S-00006', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:35:31.220' AS DateTime), CAST(N'2023-01-12T15:35:31.220' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 189, N'Dayal Alain- BDT', 19, N'Supplier', N'S-00007', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:35:39.720' AS DateTime), CAST(N'2023-01-12T15:35:39.720' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 190, N'ILYAS Dubai-BDT', 19, N'Supplier', N'S-00008', N'Cr', -187449, 0, -187449, 1, CAST(N'2023-01-12T15:35:49.407' AS DateTime), CAST(N'2023-01-12T15:35:49.407' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 191, N'Jahir Hor Al ANZ- BDT', 19, N'Supplier', N'S-00009', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:35:54.250' AS DateTime), CAST(N'2023-01-12T15:35:54.250' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 192, N'Mainuddin- Brother', 19, N'Supplier', N'S-00010', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:35:59.073' AS DateTime), CAST(N'2023-01-12T15:35:59.073' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 193, N'Masud Dubai- BDT', 19, N'Supplier', N'S-00011', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:04.217' AS DateTime), CAST(N'2023-01-12T15:36:04.217' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 194, N'Melon Ajman- BDT', 19, N'Supplier', N'S-00012', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:09.053' AS DateTime), CAST(N'2023-01-12T15:36:09.053' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 195, N'Mohan-BDT', 19, N'Supplier', N'S-00013', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:13.907' AS DateTime), CAST(N'2023-01-12T15:36:13.907' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 196, N'Sajid Emirates- BDT', 19, N'Supplier', N'S-00014', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:18.750' AS DateTime), CAST(N'2023-01-12T15:36:18.750' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 197, N'Sarfu-BDT', 19, N'Supplier', N'S-00015', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:23.593' AS DateTime), CAST(N'2023-01-12T15:36:23.593' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 198, N'Shamim Dhaka -BDT', 19, N'Supplier', N'S-00016', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:28.453' AS DateTime), CAST(N'2023-01-12T15:36:28.453' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 199, N'Emran STD EXCH- BDT', 19, N'Supplier', N'S-00017', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:33.293' AS DateTime), CAST(N'2023-01-12T15:36:33.293' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 200, N'Sumon Badar Zayed- BDT', 19, N'Supplier', N'S-00018', N'Cr', -9286, 0, -9286, 1, CAST(N'2023-01-12T15:36:38.147' AS DateTime), CAST(N'2023-01-12T15:36:38.147' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 201, N'Tareq Bagina BDT', 19, N'Supplier', N'S-00019', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:43.010' AS DateTime), CAST(N'2023-01-12T15:36:43.010' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 202, N'Tareq Panpara- BDT', 19, N'Supplier', N'S-00020', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:47.877' AS DateTime), CAST(N'2023-01-12T15:36:47.877' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 203, N'Rafiq DXB (AED)', 19, N'Supplier', N'S-00021', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:36:56.470' AS DateTime), CAST(N'2023-01-12T15:36:56.470' AS DateTime), N'', N'rukucse11@gmail.com', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 204, N'Mizan-Alain', 19, N'Supplier', N'S-00022', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-12T15:37:54.693' AS DateTime), CAST(N'2023-01-12T15:37:54.693' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 205, N'Mahfuj', 19, N'Supplier', N'S-00023', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-13T01:59:50.273' AS DateTime), CAST(N'2023-01-13T01:59:50.273' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 206, N'Abir Dhaka', 19, N'Supplier', N'S-00024', N'Cr', 16576, 0, 16576, 1, CAST(N'2023-01-13T02:06:14.187' AS DateTime), CAST(N'2023-01-13T02:06:14.187' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 207, N'Bahar Khawaniz', 19, N'Supplier', N'S-00025', N'Cr', 100774, 0, 100774, 1, CAST(N'2023-01-13T02:23:55.387' AS DateTime), CAST(N'2023-01-13T02:23:55.387' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 208, N'Ershad Alain', 19, N'Supplier', N'S-00026', N'Cr', -56802, 0, -56802, 1, CAST(N'2023-01-13T02:47:15.823' AS DateTime), CAST(N'2023-01-13T02:47:15.823' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 209, N'Hasan Bhai Pran', 19, N'Supplier', N'S-00027', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-13T03:01:03.510' AS DateTime), CAST(N'2023-01-13T03:01:03.510' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 210, N'Mahbub Afrz', 19, N'Supplier', N'S-00028', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-13T03:22:52.020' AS DateTime), CAST(N'2023-01-13T03:22:52.020' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 211, N'Mohan AED', 19, N'Supplier', N'S-00029', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-13T04:02:49.107' AS DateTime), CAST(N'2023-01-13T04:02:49.107' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 212, N'Shabahat Canada', 19, N'Supplier', N'S-00030', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-16T02:13:30.780' AS DateTime), CAST(N'2023-01-16T02:13:30.780' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 213, N'Rubayet', 19, N'Supplier', N'S-00031', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-16T03:26:04.303' AS DateTime), CAST(N'2023-01-16T03:26:04.303' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 214, N'Saiful Dhaka', 19, N'Supplier', N'S-00032', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-16T09:47:52.607' AS DateTime), CAST(N'2023-01-16T09:47:52.607' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 215, N'ZAD', 19, N'Supplier', N'S-00033', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-16T23:24:07.167' AS DateTime), CAST(N'2023-01-16T23:24:07.167' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 216, N'Naveed', 19, N'Supplier', N'S-00034', N'Cr', 1, 0, 1, 1, CAST(N'2023-01-19T13:11:34.390' AS DateTime), CAST(N'2023-01-19T13:11:34.390' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 217, N'kabir Saeed', 19, N'Supplier', N'S-00035', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-23T11:22:00.347' AS DateTime), CAST(N'2023-01-23T11:22:00.347' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 218, N'BABU Bhai Dhaka', 19, N'Supplier', N'S-00036', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-16T01:21:13.560' AS DateTime), CAST(N'2023-02-16T01:21:13.560' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 219, N'Mijan Ref Hasan (AED)', 19, N'Supplier', N'S-00037', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-23T23:51:33.390' AS DateTime), CAST(N'2023-02-23T23:51:33.390' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 220, N'Prince', 19, N'Supplier', N'S-00038', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-26T00:05:23.160' AS DateTime), CAST(N'2023-02-26T00:05:23.160' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 221, N'Cash Customer & Vendor', 19, N'Supplier', N'S-00039', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-26T13:59:34.133' AS DateTime), CAST(N'2023-02-26T13:59:34.133' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 222, N'Ershad Alain(AED)', 19, N'Supplier', N'S-00040', N'Cr', 0, 0, 0, 1, CAST(N'2023-02-28T16:37:30.810' AS DateTime), CAST(N'2023-02-28T16:37:30.810' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 223, N'Khokan Bhai', 19, N'Supplier', N'S-00041', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-01T19:41:17.980' AS DateTime), CAST(N'2023-03-01T19:41:17.980' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 224, N'Cash Customer & Vendor (AED)', 19, N'Supplier', N'S-00042', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-02T00:28:33.673' AS DateTime), CAST(N'2023-03-02T00:28:33.673' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 225, N'Sumon Badar Zayed (AED)', 19, N'Supplier', N'S-00043', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-02T12:28:15.773' AS DateTime), CAST(N'2023-03-02T12:28:15.773' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 226, N'Style Badge', 19, N'Supplier', N'S-00044', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-02T23:21:51.800' AS DateTime), CAST(N'2023-03-02T23:21:51.800' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, 227, N'Tahir Bhai Ref Ijaz', 19, N'Supplier', N'S-00045', N'Cr', 0, 0, 0, 1, CAST(N'2023-03-10T08:50:59.010' AS DateTime), CAST(N'2023-03-10T08:50:59.010' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 228, N'Rony Ajman', 19, N'Supplier', N'S-00046', N'Cr', 0, 0, 0, 1, CAST(N'2023-04-07T02:11:57.113' AS DateTime), CAST(N'2023-04-07T02:11:57.113' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 229, N'Melon Alain', 19, N'Supplier', N'S-00047', N'Cr', 0, 0, 0, 1, CAST(N'2023-04-11T22:20:22.953' AS DateTime), CAST(N'2023-04-11T22:20:22.953' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 230, N'Mitul', 19, N'Supplier', N'S-00048', N'Cr', 0, 0, 0, 1, CAST(N'2023-04-20T15:02:32.543' AS DateTime), CAST(N'2023-04-20T15:02:32.543' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 231, N'Aziz Ref Melon', 19, N'Supplier', N'S-00049', N'Cr', 0, 0, 0, 1, CAST(N'2023-04-26T19:55:15.703' AS DateTime), CAST(N'2023-04-26T19:55:15.703' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 232, N'Hasan Bhai Pran AED', 19, N'Supplier', N'S-00050', N'Cr', 0, 0, 0, 1, CAST(N'2023-05-24T17:33:08.207' AS DateTime), CAST(N'2023-05-24T17:33:08.207' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 233, N'Himel Dhaka', 19, N'Supplier', N'S-00051', N'Cr', 0, 0, 0, 1, CAST(N'2023-06-19T19:21:50.133' AS DateTime), CAST(N'2023-06-19T19:21:50.133' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 234, N'Inventory Account', 13, N'Stock', N'Ac-00052', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-06T13:53:33.037' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 235, N'MOHAMMAD SARFUDDIN', 30, N'Expense', N'Ac-00053', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-06T13:54:03.330' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 236, N'Hafiz Capital', 16, N'Capital', N'Ac-00054', N'Cr', 70916, 0, 70916, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-17T07:51:12.200' AS DateTime), N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 237, N'Hafiz Capital BDT', 16, N'Capital', N'Ac-00055', N'Cr', 1600000, 0, 1600000, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-17T07:50:28.457' AS DateTime), N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 238, N'General Income', 23, N'Income', N'Ac-00056', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-03-07T15:09:58.373' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 239, N'Sarfu-Salary', 30, N'Expense', N'Ac-00057', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-06T09:43:53.670' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 240, N'Capital Account', 16, N'Capital', N'Ac-00058', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-23T19:10:47.693' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 241, N'Entertainment', 41, N'Expense', N'Ac-00059', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-05T11:09:37.560' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 242, N'Car Pertrol', 31, N'Expense', N'Ac-00060', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-11T00:05:54.410' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 243, N'Other Exp-City Bank (EK ENTP)', 31, N'Expense', N'Ac-00061', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-17T06:39:46.910' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 244, N'Other Exp-Brac Bank (Rashed)', 31, N'Expense', N'Ac-00062', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-17T06:46:00.840' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 245, N'Bank Charge (BDT)', 29, N'Expense', N'Ac-00063', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-30T04:29:50.713' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 246, N'Suspense A/C (BDT)', 18, N'Liability', N'Ac-00064', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-02-26T08:45:43.100' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 247, N'Riya Salary ', 30, N'Expense', N'Ac-00065', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-04T12:04:35.627' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 248, N'Rashed Salary', 30, N'Expense', N'Ac-00066', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-26T06:52:57.693' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 249, N'Convence', 42, N'Expense', N'Ac-00067', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-04T12:05:20.610' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 250, N'Other Losses', 31, N'Expense', N'Ac-00068', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-26T10:31:16.577' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 251, N'Ria', 29, N'Expense', N'Ac-00069', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-02-12T22:20:56.247' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 252, N'Adjustment_INC (AED)', 25, N'Income', N'Ac-00070', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-02-17T01:55:11.777' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 253, N'Adjustment_INC (BDT)', 25, N'Income', N'Ac-00071', N'Cr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-02-17T01:56:14.823' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 254, N'Profit & Loss A/C_EXP', 31, N'Expense', N'Ac-00072', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-05T18:24:22.573' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 255, N'Discount_Exp', 31, N'Expense', N'Ac-00073', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-04T12:06:16.887' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 256, N'Ria 2', 29, N'Expense', N'Ac-00074', N'Dr', 0, 0, 0, 0, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-03-07T12:06:12.483' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Ledgers] ([CurrencyID], [PkLedgerId], [LedgerName], [LedgerParent], [LedgerType], [LedgerCode], [Nature], [AccountOpeningBalance], [OpeningBalance], [ClosingBalance], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 257, N'Other Income', 6, N'Others Assets', N'Ac-00075', N'Dr', 0, 0, 0, 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-04-12T11:12:22.110' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Ledgers] OFF
GO
SET IDENTITY_INSERT [dbo].[LoginHistories] ON 
GO
INSERT [dbo].[LoginHistories] ([UserID], [PkLoginId], [AccessTime], [Email], [CLientIPAddress], [Browser], [OS], [AccessType]) VALUES (1, 1, CAST(N'2023-07-13T08:41:07.750' AS DateTime), N'Rukunujjaman Miaji', N'::1', N'Chrome', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', N'Login')
GO
SET IDENTITY_INSERT [dbo].[LoginHistories] OFF
GO
SET IDENTITY_INSERT [dbo].[Modules] ON 
GO
INSERT [dbo].[Modules] ([PkModuleId], [ModuleName], [ControllerName], [MethodName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'Sale Voucher', N'Invoice', N'Index', 1, CAST(N'2023-07-13T03:40:12.623' AS DateTime), CAST(N'2023-07-13T03:40:12.623' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Modules] ([PkModuleId], [ModuleName], [ControllerName], [MethodName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'Received Voucher', N'Invoice', N'PaymentReceived', 1, CAST(N'2023-07-13T03:40:12.633' AS DateTime), CAST(N'2023-07-13T03:40:12.633' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Modules] ([PkModuleId], [ModuleName], [ControllerName], [MethodName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, N'Sales Return', N'Invoice', N'AllSalesReturn', 1, CAST(N'2023-07-13T03:40:12.633' AS DateTime), CAST(N'2023-07-13T03:40:12.633' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Modules] ([PkModuleId], [ModuleName], [ControllerName], [MethodName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, N'Purchase Invoice', N'Purchase', N'AllBills', 1, CAST(N'2023-07-13T03:40:12.633' AS DateTime), CAST(N'2023-07-13T03:40:12.633' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Modules] ([PkModuleId], [ModuleName], [ControllerName], [MethodName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (5, N'Payment Voucher', N'Purchase', N'AllPaymentsMade', 1, CAST(N'2023-07-13T03:40:12.637' AS DateTime), CAST(N'2023-07-13T03:40:12.637' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Modules] ([PkModuleId], [ModuleName], [ControllerName], [MethodName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (6, N'Purchase Return', N'Purchase', N'AllPurchaseReturn', 1, CAST(N'2023-07-13T03:40:12.637' AS DateTime), CAST(N'2023-07-13T03:40:12.637' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Modules] ([PkModuleId], [ModuleName], [ControllerName], [MethodName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (7, N'Expenses', N'Purchase', N'Expense', 1, CAST(N'2023-07-13T03:40:12.637' AS DateTime), CAST(N'2023-07-13T03:40:12.637' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[Modules] ([PkModuleId], [ModuleName], [ControllerName], [MethodName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (8, N'Manual Journals', N'Accounts', N'ManualJournals', 1, CAST(N'2023-07-13T03:40:12.637' AS DateTime), CAST(N'2023-07-13T03:40:12.637' AS DateTime), N'', N'', N'System')
GO
SET IDENTITY_INSERT [dbo].[Modules] OFF
GO
SET IDENTITY_INSERT [dbo].[Organizations] ON 
GO
INSERT [dbo].[Organizations] ([PkOrganizationId], [OrganisationName], [OrganisationType], [OrganizationLogo], [LicenseExpired], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'ABC Exch', N'Money Exchange', N'None', N'BpME7qyBDobTl41yYMoytBiS718Gfo4AUtKYPiDqEzE=', 1, CAST(N'2023-01-01T21:00:42.680' AS DateTime), CAST(N'2023-01-01T21:00:42.680' AS DateTime), N'', N'', N'System')
GO
SET IDENTITY_INSERT [dbo].[Organizations] OFF
GO
SET IDENTITY_INSERT [dbo].[Passwords] ON 
GO
INSERT [dbo].[Passwords] ([UserID], [PkPasswordId], [Password], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, 1, N'q0jwKSl4jzxDxye5MkhRjgTMKmHI/E+EjLMSp/2Fubs=', 1, CAST(N'2023-07-12T16:40:42.763' AS DateTime), CAST(N'2023-07-12T16:40:42.763' AS DateTime), N'', N'', N'System')
GO
SET IDENTITY_INSERT [dbo].[Passwords] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionHistories] ON 
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (101, 28, 1, N'Tnx-612023-001', CAST(N'2023-01-06T14:07:45.663' AS DateTime), N'Dr', -46800, 0, 0, -46800, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:07:45.663' AS DateTime), CAST(N'2023-01-06T14:07:45.663' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 101, 2, N'Tnx-612023-001', CAST(N'2023-07-13T03:41:08.920' AS DateTime), N'Cr', 0, -46800, 0, -46800, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:07:45.663' AS DateTime), CAST(N'2023-02-22T10:29:23.527' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (102, 28, 3, N'Tnx-612023-002', CAST(N'2023-01-06T14:08:27.363' AS DateTime), N'Dr', 5000, 0, 0, 5000, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:08:27.363' AS DateTime), CAST(N'2023-01-06T14:08:27.363' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 102, 4, N'Tnx-612023-002', CAST(N'2023-07-13T03:41:08.947' AS DateTime), N'Cr', 0, 5000, -46800, -41800, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:08:27.363' AS DateTime), CAST(N'2023-02-16T21:19:54.903' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (103, 28, 5, N'Tnx-612023-003', CAST(N'2023-01-06T14:09:23.453' AS DateTime), N'Dr', 1184, 0, 0, 1184, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:09:23.453' AS DateTime), CAST(N'2023-01-06T14:09:23.453' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 103, 6, N'Tnx-612023-003', CAST(N'2023-07-13T03:41:08.957' AS DateTime), N'Cr', 0, 1184, -41800, -40616, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:09:23.453' AS DateTime), CAST(N'2023-01-06T14:09:23.453' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (104, 28, 7, N'Tnx-612023-004', CAST(N'2023-01-06T14:10:08.513' AS DateTime), N'Dr', 28746.16, 0, 0, 28746.16, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:10:08.513' AS DateTime), CAST(N'2023-01-06T14:10:08.513' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 104, 8, N'Tnx-612023-004', CAST(N'2023-07-13T03:41:08.967' AS DateTime), N'Cr', 0, 28746.16, -40616, -11869.84, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:10:08.513' AS DateTime), CAST(N'2023-01-06T14:10:08.513' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (105, 28, 9, N'Tnx-612023-005', CAST(N'2023-01-06T14:10:42.230' AS DateTime), N'Dr', 2699, 0, 0, 2699, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:10:42.230' AS DateTime), CAST(N'2023-01-06T14:10:42.230' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 105, 10, N'Tnx-612023-005', CAST(N'2023-07-13T03:41:08.977' AS DateTime), N'Cr', 0, 2699, -11869.84, -9170.84, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:10:42.230' AS DateTime), CAST(N'2023-02-08T22:46:20.857' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (106, 28, 11, N'Tnx-612023-006', CAST(N'2023-01-06T14:11:29.147' AS DateTime), N'Dr', 22160, 0, 0, 22160, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:11:29.147' AS DateTime), CAST(N'2023-01-06T14:11:29.147' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 106, 12, N'Tnx-612023-006', CAST(N'2023-07-13T03:41:08.987' AS DateTime), N'Cr', 0, 22160, -9170.84, 12989.16, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:11:29.147' AS DateTime), CAST(N'2023-01-06T14:11:29.147' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (107, 28, 13, N'Tnx-612023-007', CAST(N'2023-01-06T14:12:00.303' AS DateTime), N'Dr', 8141.98, 0, 0, 8141.98, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:12:00.303' AS DateTime), CAST(N'2023-01-06T14:12:00.303' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 107, 14, N'Tnx-612023-007', CAST(N'2023-07-13T03:41:08.993' AS DateTime), N'Cr', 0, 8141.98, 12989.16, 21131.14, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:12:00.303' AS DateTime), CAST(N'2023-02-05T09:24:26.250' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (108, 28, 15, N'Tnx-612023-008', CAST(N'2023-01-06T14:12:47.127' AS DateTime), N'Dr', 5231, 0, 0, 5231, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:12:47.127' AS DateTime), CAST(N'2023-01-06T14:12:47.127' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 108, 16, N'Tnx-612023-008', CAST(N'2023-07-13T03:41:09.000' AS DateTime), N'Cr', 0, 5231, 21131.14, 26362.14, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T14:12:47.127' AS DateTime), CAST(N'2023-02-16T21:25:21.803' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (109, 4, 17, N'Tnx-712023-001', CAST(N'2023-01-07T00:59:30.423' AS DateTime), N'Dr', 1587826, 0, 0, 1587826, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T00:59:30.423' AS DateTime), CAST(N'2023-01-07T00:59:30.423' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 109, 18, N'Tnx-712023-001', CAST(N'2023-07-13T03:41:09.010' AS DateTime), N'Cr', 0, 1587826, 0, 1587826, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T00:59:30.423' AS DateTime), CAST(N'2023-01-28T02:38:32.923' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (110, 4, 19, N'Tnx-712023-002', CAST(N'2023-01-07T01:00:06.763' AS DateTime), N'Dr', 66, 0, 0, 66, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:00:06.763' AS DateTime), CAST(N'2023-01-07T01:00:06.763' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 110, 20, N'Tnx-712023-002', CAST(N'2023-07-13T03:41:09.017' AS DateTime), N'Cr', 0, 66, 1587826, 1587892, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:00:06.763' AS DateTime), CAST(N'2023-02-16T21:16:21.393' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (111, 4, 21, N'Tnx-712023-003', CAST(N'2023-01-07T01:00:45.310' AS DateTime), N'Dr', 3999, 0, 0, 3999, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:00:45.310' AS DateTime), CAST(N'2023-01-07T01:00:45.310' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 111, 22, N'Tnx-712023-003', CAST(N'2023-07-13T03:41:09.030' AS DateTime), N'Cr', 0, 3999, 1587892, 1591891, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:00:45.310' AS DateTime), CAST(N'2023-01-07T01:00:45.310' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (112, 4, 23, N'Tnx-712023-004', CAST(N'2023-01-07T01:01:37.273' AS DateTime), N'Dr', 767078, 0, 0, 767078, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:01:37.273' AS DateTime), CAST(N'2023-01-07T01:01:37.273' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 112, 24, N'Tnx-712023-004', CAST(N'2023-07-13T03:41:09.040' AS DateTime), N'Cr', 0, 767078, 1591891, 2358969, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:01:37.273' AS DateTime), CAST(N'2023-02-05T09:17:59.027' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (113, 4, 25, N'Tnx-712023-005', CAST(N'2023-01-07T01:02:17.787' AS DateTime), N'Dr', 549795, 0, 0, 549795, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:02:17.787' AS DateTime), CAST(N'2023-01-07T01:02:17.787' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 113, 26, N'Tnx-712023-005', CAST(N'2023-07-13T03:41:09.050' AS DateTime), N'Cr', 0, 549795, 2358969, 2908764, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:02:17.787' AS DateTime), CAST(N'2023-01-25T22:23:11.380' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (114, 4, 27, N'Tnx-712023-006', CAST(N'2023-01-07T01:03:01.207' AS DateTime), N'Dr', 23748, 0, 0, 23748, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:03:01.207' AS DateTime), CAST(N'2023-01-07T01:03:01.207' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 114, 28, N'Tnx-712023-006', CAST(N'2023-07-13T03:41:09.063' AS DateTime), N'Cr', 0, 23748, 2908764, 2932512, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:03:01.207' AS DateTime), CAST(N'2023-01-25T22:22:24.257' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (115, 4, 29, N'Tnx-712023-007', CAST(N'2023-01-07T01:03:42.640' AS DateTime), N'Dr', 4924, 0, 0, 4924, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:03:42.640' AS DateTime), CAST(N'2023-01-07T01:03:42.640' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 115, 30, N'Tnx-712023-007', CAST(N'2023-07-13T03:41:09.073' AS DateTime), N'Cr', 0, 4924, 2932512, 2937436, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:03:42.640' AS DateTime), CAST(N'2023-01-07T01:03:42.640' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (116, 4, 31, N'Tnx-712023-008', CAST(N'2023-01-07T01:04:21.200' AS DateTime), N'Dr', 7710, 0, 0, 7710, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:04:21.200' AS DateTime), CAST(N'2023-01-07T01:04:21.200' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 116, 32, N'Tnx-712023-008', CAST(N'2023-07-13T03:41:09.083' AS DateTime), N'Cr', 0, 7710, 2937436, 2945146, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:04:21.200' AS DateTime), CAST(N'2023-01-07T01:04:21.200' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (117, 4, 33, N'Tnx-712023-009', CAST(N'2023-01-07T01:06:41.783' AS DateTime), N'Dr', 92555, 0, 0, 92555, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:06:41.783' AS DateTime), CAST(N'2023-01-07T01:06:41.783' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 117, 34, N'Tnx-712023-009', CAST(N'2023-07-13T03:41:09.097' AS DateTime), N'Cr', 0, 92555, 2945146, 3037701, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:06:41.783' AS DateTime), CAST(N'2023-01-07T01:06:41.783' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (118, 4, 35, N'Tnx-712023-010', CAST(N'2023-01-07T01:47:19.287' AS DateTime), N'Dr', -534600, 0, 0, -534600, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:47:19.287' AS DateTime), CAST(N'2023-01-07T01:47:19.287' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 118, 36, N'Tnx-712023-010', CAST(N'2023-07-13T03:41:09.107' AS DateTime), N'Cr', 0, -534600, 3037701, 2503101, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-07T01:47:19.287' AS DateTime), CAST(N'2023-02-23T16:18:18.670' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (119, 14, 37, N'Tnx-812023-001', CAST(N'2023-01-08T00:08:53.243' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-08T00:08:53.243' AS DateTime), CAST(N'2023-01-08T00:08:53.243' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (14, 119, 38, N'Tnx-812023-001', CAST(N'2023-07-13T03:41:09.120' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-08T00:08:53.243' AS DateTime), CAST(N'2023-02-16T21:18:24.817' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (120, 42, 39, N'Tnx-1112023-001', CAST(N'2023-01-11T11:45:18.927' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-11T11:45:18.927' AS DateTime), CAST(N'2023-01-11T11:45:18.927' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (42, 120, 40, N'Tnx-1112023-001', CAST(N'2023-07-13T03:41:09.137' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-11T11:45:18.927' AS DateTime), CAST(N'2023-01-24T15:23:33.510' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (121, 35, 41, N'Tnx-1212023-001', CAST(N'2023-01-12T09:26:21.243' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T09:26:21.243' AS DateTime), CAST(N'2023-01-12T09:26:21.243' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (35, 121, 42, N'Tnx-1212023-001', CAST(N'2023-07-13T03:41:09.150' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T09:26:21.243' AS DateTime), CAST(N'2023-01-12T09:26:21.243' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (122, 21, 43, N'Tnx-1212023-002', CAST(N'2023-01-12T09:26:52.677' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T09:26:52.677' AS DateTime), CAST(N'2023-01-12T09:26:52.677' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (21, 122, 44, N'Tnx-1212023-002', CAST(N'2023-07-13T03:41:09.163' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T09:26:52.677' AS DateTime), CAST(N'2023-01-12T09:26:52.677' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (123, 49, 45, N'Tnx-1322023-001', CAST(N'2023-02-13T00:05:59.453' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-13T00:05:59.453' AS DateTime), CAST(N'2023-02-13T00:05:59.453' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (49, 123, 46, N'Tnx-1322023-001', CAST(N'2023-07-13T03:41:09.180' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-13T00:05:59.453' AS DateTime), CAST(N'2023-02-16T21:26:10.510' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (124, 63, 47, N'Tnx-1722023-001', CAST(N'2023-02-17T11:51:28.920' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-17T11:51:28.920' AS DateTime), CAST(N'2023-02-17T11:51:28.920' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (63, 124, 48, N'Tnx-1722023-001', CAST(N'2023-07-13T03:41:09.193' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-17T11:51:28.920' AS DateTime), CAST(N'2023-02-17T11:51:28.920' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (125, 70, 49, N'Tnx-1532023-001', CAST(N'2023-03-15T13:06:13.220' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-15T13:06:13.220' AS DateTime), CAST(N'2023-03-15T13:06:13.220' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (70, 125, 50, N'Tnx-1532023-001', CAST(N'2023-07-13T03:41:09.207' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-15T13:06:13.220' AS DateTime), CAST(N'2023-03-15T13:06:13.220' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (126, 77, 51, N'Tnx-2232023-001', CAST(N'2023-03-22T19:19:04.687' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-22T19:19:04.687' AS DateTime), CAST(N'2023-03-22T19:19:04.687' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (77, 126, 52, N'Tnx-2232023-001', CAST(N'2023-07-13T03:41:09.220' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-22T19:19:04.687' AS DateTime), CAST(N'2023-03-22T19:19:04.687' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (127, 84, 53, N'Tnx-2432023-001', CAST(N'2023-03-24T17:43:54.320' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-24T17:43:54.320' AS DateTime), CAST(N'2023-03-24T17:43:54.320' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (84, 127, 54, N'Tnx-2432023-001', CAST(N'2023-07-13T03:41:09.233' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-24T17:43:54.320' AS DateTime), CAST(N'2023-03-24T17:43:54.320' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (128, 4, 55, N'Tnx-2052023-001', CAST(N'2023-05-20T10:16:25.987' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-05-20T10:16:25.987' AS DateTime), CAST(N'2023-05-20T10:16:25.987' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 128, 56, N'Tnx-2052023-001', CAST(N'2023-07-13T03:41:09.250' AS DateTime), N'Cr', 0, 0, 2503101, 2503101, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-05-20T10:16:25.987' AS DateTime), CAST(N'2023-05-20T10:16:25.987' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (129, 28, 57, N'Tnx-2162023-001', CAST(N'2023-06-21T15:04:04.533' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-06-21T15:04:04.533' AS DateTime), CAST(N'2023-06-21T15:04:04.533' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 129, 58, N'Tnx-2162023-001', CAST(N'2023-07-13T03:41:09.263' AS DateTime), N'Cr', 0, 0, 26362.14, 26362.14, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-06-21T15:04:04.533' AS DateTime), CAST(N'2023-06-21T15:04:04.533' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (130, 28, 59, N'Tnx-1212023-003', CAST(N'2023-01-12T15:34:30.790' AS DateTime), N'Dr', 417, 0, 0, 417, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:30.790' AS DateTime), CAST(N'2023-01-12T15:34:30.790' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 130, 60, N'Tnx-1212023-003', CAST(N'2023-07-13T03:41:09.357' AS DateTime), N'Cr', 0, 417, 26362.14, 26779.14, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:30.790' AS DateTime), CAST(N'2023-01-22T11:02:27.317' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (131, 28, 61, N'Tnx-1212023-004', CAST(N'2023-01-12T15:34:36.653' AS DateTime), N'Dr', 24, 0, 0, 24, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:36.653' AS DateTime), CAST(N'2023-01-12T15:34:36.653' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 131, 62, N'Tnx-1212023-004', CAST(N'2023-07-13T03:41:09.370' AS DateTime), N'Cr', 0, 24, 26779.14, 26803.14, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:36.653' AS DateTime), CAST(N'2023-01-12T15:34:36.653' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (132, 28, 63, N'Tnx-1212023-005', CAST(N'2023-01-12T15:34:41.450' AS DateTime), N'Dr', 5843, 0, 0, 5843, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:41.450' AS DateTime), CAST(N'2023-01-12T15:34:41.450' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 132, 64, N'Tnx-1212023-005', CAST(N'2023-07-13T03:41:09.380' AS DateTime), N'Cr', 0, 5843, 26803.14, 32646.14, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:41.450' AS DateTime), CAST(N'2023-01-12T15:34:41.450' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (133, 28, 65, N'Tnx-1212023-006', CAST(N'2023-01-12T15:34:47.260' AS DateTime), N'Dr', 4173, 0, 0, 4173, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:47.260' AS DateTime), CAST(N'2023-01-12T15:34:47.260' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 133, 66, N'Tnx-1212023-006', CAST(N'2023-07-13T03:41:09.387' AS DateTime), N'Cr', 0, 4173, 32646.14, 36819.14, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:47.260' AS DateTime), CAST(N'2023-01-12T15:34:47.260' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (134, 28, 67, N'Tnx-1212023-007', CAST(N'2023-01-12T15:34:52.677' AS DateTime), N'Dr', 91, 0, 0, 91, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:52.677' AS DateTime), CAST(N'2023-01-12T15:34:52.677' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 134, 68, N'Tnx-1212023-007', CAST(N'2023-07-13T03:41:09.397' AS DateTime), N'Cr', 0, 91, 36819.14, 36910.14, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:52.677' AS DateTime), CAST(N'2023-01-23T11:25:18.163' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (135, 4, 69, N'Tnx-1212023-008', CAST(N'2023-01-12T15:34:57.487' AS DateTime), N'Dr', 1817793, 0, 0, 1817793, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:57.487' AS DateTime), CAST(N'2023-01-12T15:34:57.487' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 135, 70, N'Tnx-1212023-008', CAST(N'2023-07-13T03:41:09.403' AS DateTime), N'Cr', 0, 1817793, 2503101, 4320894, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:57.487' AS DateTime), CAST(N'2023-02-14T21:08:54.713' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (136, 4, 71, N'Tnx-1212023-009', CAST(N'2023-01-12T15:35:24.243' AS DateTime), N'Dr', 666542, 0, 0, 666542, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:24.243' AS DateTime), CAST(N'2023-01-12T15:35:24.243' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 136, 72, N'Tnx-1212023-009', CAST(N'2023-07-13T03:41:09.413' AS DateTime), N'Cr', 0, 666542, 4320894, 4987436, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:24.243' AS DateTime), CAST(N'2023-01-12T15:35:24.243' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (137, 4, 73, N'Tnx-1212023-010', CAST(N'2023-01-12T15:35:29.070' AS DateTime), N'Dr', 255459, 0, 0, 255459, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:29.070' AS DateTime), CAST(N'2023-01-12T15:35:29.070' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 137, 74, N'Tnx-1212023-010', CAST(N'2023-07-13T03:41:09.420' AS DateTime), N'Cr', 0, 255459, 4987436, 5242895, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:29.070' AS DateTime), CAST(N'2023-01-31T19:34:02.373' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (138, 4, 75, N'Tnx-1212023-011', CAST(N'2023-01-12T15:35:37.577' AS DateTime), N'Dr', 39984, 0, 0, 39984, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:37.577' AS DateTime), CAST(N'2023-01-12T15:35:37.577' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 138, 76, N'Tnx-1212023-011', CAST(N'2023-07-13T03:41:09.430' AS DateTime), N'Cr', 0, 39984, 5242895, 5282879, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:37.577' AS DateTime), CAST(N'2023-01-12T15:35:37.577' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (139, 4, 77, N'Tnx-1212023-012', CAST(N'2023-01-12T15:35:52.103' AS DateTime), N'Dr', 5256, 0, 0, 5256, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:52.103' AS DateTime), CAST(N'2023-01-12T15:35:52.103' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 139, 78, N'Tnx-1212023-012', CAST(N'2023-07-13T03:41:09.440' AS DateTime), N'Cr', 0, 5256, 5282879, 5288135, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:52.103' AS DateTime), CAST(N'2023-01-12T15:35:52.103' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (140, 4, 79, N'Tnx-1212023-013', CAST(N'2023-01-12T15:35:56.930' AS DateTime), N'Dr', 348693, 0, 0, 348693, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:56.930' AS DateTime), CAST(N'2023-01-12T15:35:56.930' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 140, 80, N'Tnx-1212023-013', CAST(N'2023-07-13T03:41:09.447' AS DateTime), N'Cr', 0, 348693, 5288135, 5636828, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:56.930' AS DateTime), CAST(N'2023-01-12T15:35:56.930' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (141, 4, 81, N'Tnx-1212023-014', CAST(N'2023-01-12T15:36:02.077' AS DateTime), N'Dr', 106401, 0, 0, 106401, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:02.077' AS DateTime), CAST(N'2023-01-12T15:36:02.077' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 141, 82, N'Tnx-1212023-014', CAST(N'2023-07-13T03:41:09.457' AS DateTime), N'Cr', 0, 106401, 5636828, 5743229, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:02.077' AS DateTime), CAST(N'2023-01-12T15:36:02.077' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (142, 4, 83, N'Tnx-1212023-015', CAST(N'2023-01-12T15:36:06.907' AS DateTime), N'Dr', 167485, 0, 0, 167485, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:06.907' AS DateTime), CAST(N'2023-01-12T15:36:06.907' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 142, 84, N'Tnx-1212023-015', CAST(N'2023-07-13T03:41:09.467' AS DateTime), N'Cr', 0, 167485, 5743229, 5910714, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:06.907' AS DateTime), CAST(N'2023-01-31T20:19:07.557' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (143, 4, 85, N'Tnx-1212023-016', CAST(N'2023-01-12T15:36:11.753' AS DateTime), N'Dr', 300318, 0, 0, 300318, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:11.753' AS DateTime), CAST(N'2023-01-12T15:36:11.753' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 143, 86, N'Tnx-1212023-016', CAST(N'2023-07-13T03:41:09.480' AS DateTime), N'Cr', 0, 300318, 5910714, 6211032, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:11.753' AS DateTime), CAST(N'2023-01-20T10:23:11.913' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (144, 4, 87, N'Tnx-1212023-017', CAST(N'2023-01-12T15:36:16.600' AS DateTime), N'Dr', 1962, 0, 0, 1962, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:16.600' AS DateTime), CAST(N'2023-01-12T15:36:16.600' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 144, 88, N'Tnx-1212023-017', CAST(N'2023-07-13T03:41:09.490' AS DateTime), N'Cr', 0, 1962, 6211032, 6212994, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:16.600' AS DateTime), CAST(N'2023-01-12T15:36:16.600' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (145, 4, 89, N'Tnx-1212023-018', CAST(N'2023-01-12T15:36:21.440' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:21.440' AS DateTime), CAST(N'2023-01-12T15:36:21.440' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 145, 90, N'Tnx-1212023-018', CAST(N'2023-07-13T03:41:09.500' AS DateTime), N'Cr', 0, 0, 6212994, 6212994, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:21.440' AS DateTime), CAST(N'2023-03-01T03:08:46.917' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (146, 4, 91, N'Tnx-1212023-019', CAST(N'2023-01-12T15:36:26.300' AS DateTime), N'Dr', 817076, 0, 0, 817076, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:26.300' AS DateTime), CAST(N'2023-01-12T15:36:26.300' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 146, 92, N'Tnx-1212023-019', CAST(N'2023-07-13T03:41:09.513' AS DateTime), N'Cr', 0, 817076, 6212994, 7030070, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:26.300' AS DateTime), CAST(N'2023-01-12T15:36:26.300' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (147, 4, 93, N'Tnx-1212023-020', CAST(N'2023-01-12T15:36:31.147' AS DateTime), N'Dr', 4808334, 0, 0, 4808334, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:31.147' AS DateTime), CAST(N'2023-01-12T15:36:31.147' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 147, 94, N'Tnx-1212023-020', CAST(N'2023-07-13T03:41:09.527' AS DateTime), N'Cr', 0, 4808334, 7030070, 11838404, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:31.147' AS DateTime), CAST(N'2023-02-17T20:48:34.080' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (148, 4, 95, N'Tnx-1212023-021', CAST(N'2023-01-12T15:36:35.993' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:35.993' AS DateTime), CAST(N'2023-01-12T15:36:35.993' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 148, 96, N'Tnx-1212023-021', CAST(N'2023-07-13T03:41:09.537' AS DateTime), N'Cr', 0, 0, 11838404, 11838404, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:35.993' AS DateTime), CAST(N'2023-02-17T11:33:27.367' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (149, 4, 97, N'Tnx-1212023-022', CAST(N'2023-01-12T15:36:40.857' AS DateTime), N'Dr', 111596, 0, 0, 111596, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:40.857' AS DateTime), CAST(N'2023-01-12T15:36:40.857' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 149, 98, N'Tnx-1212023-022', CAST(N'2023-07-13T03:41:09.547' AS DateTime), N'Cr', 0, 111596, 11838404, 11950000, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:40.857' AS DateTime), CAST(N'2023-01-12T15:36:40.857' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (150, 4, 99, N'Tnx-1212023-023', CAST(N'2023-01-12T15:36:45.717' AS DateTime), N'Dr', 2478, 0, 0, 2478, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:45.717' AS DateTime), CAST(N'2023-01-12T15:36:45.717' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 150, 100, N'Tnx-1212023-023', CAST(N'2023-07-13T03:41:09.557' AS DateTime), N'Cr', 0, 2478, 11950000, 11952478, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:45.717' AS DateTime), CAST(N'2023-01-12T15:36:45.717' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (151, 28, 101, N'Tnx-1212023-024', CAST(N'2023-01-12T15:36:50.577' AS DateTime), N'Dr', -181472, 0, 0, -181472, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:50.577' AS DateTime), CAST(N'2023-01-12T15:36:50.577' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 151, 102, N'Tnx-1212023-024', CAST(N'2023-07-13T03:41:09.570' AS DateTime), N'Cr', 0, -181472, 36910.14, -144561.86, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:50.577' AS DateTime), CAST(N'2023-02-17T20:52:51.440' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (152, 28, 103, N'Tnx-1212023-025', CAST(N'2023-01-12T15:37:10.377' AS DateTime), N'Dr', -4232.25, 0, 0, -4232.25, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:37:10.377' AS DateTime), CAST(N'2023-01-12T15:37:10.377' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 152, 104, N'Tnx-1212023-025', CAST(N'2023-07-13T03:41:09.580' AS DateTime), N'Cr', 0, -4232.25, -144561.86, -148794.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:37:10.377' AS DateTime), CAST(N'2023-02-23T16:24:18.590' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (153, 28, 105, N'Tnx-1312023-001', CAST(N'2023-01-13T01:59:50.260' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T01:59:50.260' AS DateTime), CAST(N'2023-01-13T01:59:50.260' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 153, 106, N'Tnx-1312023-001', CAST(N'2023-07-13T03:41:09.597' AS DateTime), N'Cr', 0, 0, -148794.11, -148794.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T01:59:50.260' AS DateTime), CAST(N'2023-01-13T01:59:50.260' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (154, 4, 107, N'Tnx-1312023-002', CAST(N'2023-01-13T03:17:43.637' AS DateTime), N'Dr', -2000000, 0, 0, -2000000, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:17:43.637' AS DateTime), CAST(N'2023-01-13T03:17:43.637' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 154, 108, N'Tnx-1312023-002', CAST(N'2023-07-13T03:41:09.610' AS DateTime), N'Cr', 0, -2000000, 11952478, 9952478, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:17:43.637' AS DateTime), CAST(N'2023-01-23T11:13:41.640' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (155, 28, 109, N'Tnx-1312023-003', CAST(N'2023-01-13T03:34:23.487' AS DateTime), N'Dr', -175, 0, 0, -175, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:34:23.487' AS DateTime), CAST(N'2023-01-13T03:34:23.487' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 155, 110, N'Tnx-1312023-003', CAST(N'2023-07-13T03:41:09.617' AS DateTime), N'Cr', 0, -175, -148794.11, -148969.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:34:23.487' AS DateTime), CAST(N'2023-02-06T21:25:37.973' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (156, 4, 111, N'Tnx-1312023-004', CAST(N'2023-01-13T03:49:03.697' AS DateTime), N'Dr', 2, 0, 0, 2, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:49:03.697' AS DateTime), CAST(N'2023-01-13T03:49:03.697' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 156, 112, N'Tnx-1312023-004', CAST(N'2023-07-13T03:41:09.627' AS DateTime), N'Cr', 0, 2, 9952478, 9952480, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:49:03.697' AS DateTime), CAST(N'2023-02-17T20:51:14.737' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (157, 28, 113, N'Tnx-1312023-005', CAST(N'2023-01-13T04:02:49.107' AS DateTime), N'Dr', -94869, 0, 0, -94869, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T04:02:49.107' AS DateTime), CAST(N'2023-01-13T04:02:49.107' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 157, 114, N'Tnx-1312023-005', CAST(N'2023-07-13T03:41:09.637' AS DateTime), N'Cr', 0, -94869, -148969.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T04:02:49.107' AS DateTime), CAST(N'2023-02-13T09:55:01.817' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (158, 4, 115, N'Tnx-1612023-001', CAST(N'2023-01-16T06:58:09.373' AS DateTime), N'Dr', -20294, 0, 0, -20294, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T06:58:09.373' AS DateTime), CAST(N'2023-01-16T06:58:09.373' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 158, 116, N'Tnx-1612023-001', CAST(N'2023-07-13T03:41:09.650' AS DateTime), N'Cr', 0, -20294, 9952480, 9932186, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T06:58:09.373' AS DateTime), CAST(N'2023-02-05T09:30:42.143' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (159, 4, 117, N'Tnx-1612023-002', CAST(N'2023-01-16T07:14:07.110' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T07:14:07.110' AS DateTime), CAST(N'2023-01-16T07:14:07.110' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 159, 118, N'Tnx-1612023-002', CAST(N'2023-07-13T03:41:09.663' AS DateTime), N'Cr', 0, 0, 9932186, 9932186, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T07:14:07.110' AS DateTime), CAST(N'2023-01-17T00:58:28.840' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (160, 4, 119, N'Tnx-1612023-003', CAST(N'2023-01-16T23:14:09.340' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T23:14:09.340' AS DateTime), CAST(N'2023-01-16T23:14:09.340' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 160, 120, N'Tnx-1612023-003', CAST(N'2023-07-13T03:41:09.680' AS DateTime), N'Cr', 0, 0, 9932186, 9932186, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T23:14:09.340' AS DateTime), CAST(N'2023-01-16T23:14:09.340' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (161, 4, 121, N'Tnx-1612023-004', CAST(N'2023-01-16T23:24:07.133' AS DateTime), N'Dr', -134664, 0, 0, -134664, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T23:24:07.133' AS DateTime), CAST(N'2023-01-16T23:24:07.133' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 161, 122, N'Tnx-1612023-004', CAST(N'2023-07-13T03:41:09.693' AS DateTime), N'Cr', 0, -134664, 9932186, 9797522, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T23:24:07.133' AS DateTime), CAST(N'2023-02-17T20:49:55.127' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (162, 4, 123, N'Tnx-1712023-001', CAST(N'2023-01-17T00:02:36.470' AS DateTime), N'Dr', 1921469, 0, 0, 1921469, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-17T00:02:36.470' AS DateTime), CAST(N'2023-01-17T00:02:36.470' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 162, 124, N'Tnx-1712023-001', CAST(N'2023-07-13T03:41:09.707' AS DateTime), N'Cr', 0, 1921469, 9797522, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-17T00:02:36.470' AS DateTime), CAST(N'2023-02-16T01:14:39.417' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (163, 28, 125, N'Tnx-1912023-001', CAST(N'2023-01-19T13:11:34.407' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-19T13:11:34.407' AS DateTime), CAST(N'2023-01-19T13:11:34.407' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 163, 126, N'Tnx-1912023-001', CAST(N'2023-07-13T03:41:09.720' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-19T13:11:34.407' AS DateTime), CAST(N'2023-03-02T13:33:22.543' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (164, 4, 127, N'Tnx-2512023-001', CAST(N'2023-01-25T07:34:19.297' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-25T07:34:19.297' AS DateTime), CAST(N'2023-01-25T07:34:19.297' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 164, 128, N'Tnx-2512023-001', CAST(N'2023-07-13T03:41:09.733' AS DateTime), N'Cr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-25T07:34:19.297' AS DateTime), CAST(N'2023-01-25T07:34:44.840' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (165, 4, 129, N'Tnx-1622023-001', CAST(N'2023-02-16T01:22:12.183' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-16T01:22:12.183' AS DateTime), CAST(N'2023-02-16T01:22:12.183' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 165, 130, N'Tnx-1622023-001', CAST(N'2023-07-13T03:41:09.747' AS DateTime), N'Cr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-16T01:22:12.183' AS DateTime), CAST(N'2023-02-17T13:16:01.500' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (166, 4, 131, N'Tnx-2322023-001', CAST(N'2023-02-23T20:23:47.157' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-23T20:23:47.157' AS DateTime), CAST(N'2023-02-23T20:23:47.157' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 166, 132, N'Tnx-2322023-001', CAST(N'2023-07-13T03:41:09.763' AS DateTime), N'Cr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-23T20:23:47.157' AS DateTime), CAST(N'2023-02-23T20:24:07.657' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (167, 28, 133, N'Tnx-2322023-002', CAST(N'2023-02-23T23:51:33.403' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-23T23:51:33.403' AS DateTime), CAST(N'2023-02-23T23:51:33.403' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 167, 134, N'Tnx-2322023-002', CAST(N'2023-07-13T03:41:09.777' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-23T23:51:33.403' AS DateTime), CAST(N'2023-02-23T23:51:33.403' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (168, 4, 135, N'Tnx-2622023-001', CAST(N'2023-02-26T00:05:23.143' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-26T00:05:23.143' AS DateTime), CAST(N'2023-02-26T00:05:23.143' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 168, 136, N'Tnx-2622023-001', CAST(N'2023-07-13T03:41:09.790' AS DateTime), N'Cr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-26T00:05:23.143' AS DateTime), CAST(N'2023-02-26T00:05:23.143' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (169, 4, 137, N'Tnx-2622023-002', CAST(N'2023-02-26T13:59:34.150' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-26T13:59:34.150' AS DateTime), CAST(N'2023-02-26T13:59:34.150' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 169, 138, N'Tnx-2622023-002', CAST(N'2023-07-13T03:41:09.800' AS DateTime), N'Cr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-26T13:59:34.150' AS DateTime), CAST(N'2023-02-26T13:59:34.150' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (170, 28, 139, N'Tnx-2822023-001', CAST(N'2023-02-28T16:37:30.827' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-28T16:37:30.827' AS DateTime), CAST(N'2023-02-28T16:37:30.827' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 170, 140, N'Tnx-2822023-001', CAST(N'2023-07-13T03:41:09.813' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-28T16:37:30.827' AS DateTime), CAST(N'2023-02-28T16:37:30.827' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (171, 28, 141, N'Tnx-132023-001', CAST(N'2023-03-01T19:41:17.823' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-01T19:41:17.823' AS DateTime), CAST(N'2023-03-01T19:41:17.823' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 171, 142, N'Tnx-132023-001', CAST(N'2023-07-13T03:41:09.827' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-01T19:41:17.823' AS DateTime), CAST(N'2023-03-01T22:54:52.430' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (172, 28, 143, N'Tnx-232023-001', CAST(N'2023-03-02T00:28:33.660' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T00:28:33.660' AS DateTime), CAST(N'2023-03-02T00:28:33.660' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 172, 144, N'Tnx-232023-001', CAST(N'2023-07-13T03:41:09.840' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T00:28:33.660' AS DateTime), CAST(N'2023-03-02T00:28:33.660' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (173, 28, 145, N'Tnx-232023-002', CAST(N'2023-03-02T12:28:15.760' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T12:28:15.760' AS DateTime), CAST(N'2023-03-02T12:28:15.760' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 173, 146, N'Tnx-232023-002', CAST(N'2023-07-13T03:41:09.857' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T12:28:15.760' AS DateTime), CAST(N'2023-03-02T12:28:15.760' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (174, 28, 147, N'Tnx-232023-003', CAST(N'2023-03-02T23:21:51.783' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T23:21:51.783' AS DateTime), CAST(N'2023-03-02T23:21:51.783' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 174, 148, N'Tnx-232023-003', CAST(N'2023-07-13T03:41:09.867' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T23:21:51.783' AS DateTime), CAST(N'2023-03-02T23:21:51.783' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (175, 4, 149, N'Tnx-642023-001', CAST(N'2023-04-06T17:50:39.450' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-06T17:50:39.450' AS DateTime), CAST(N'2023-04-06T17:50:39.450' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 175, 150, N'Tnx-642023-001', CAST(N'2023-07-13T03:41:09.880' AS DateTime), N'Cr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-06T17:50:39.450' AS DateTime), CAST(N'2023-04-12T18:42:34.667' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (176, 28, 151, N'Tnx-742023-001', CAST(N'2023-04-07T02:11:57.050' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-07T02:11:57.050' AS DateTime), CAST(N'2023-04-07T02:11:57.050' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 176, 152, N'Tnx-742023-001', CAST(N'2023-07-13T03:41:09.900' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-07T02:11:57.050' AS DateTime), CAST(N'2023-04-07T02:11:57.050' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (177, 28, 153, N'Tnx-1142023-001', CAST(N'2023-04-11T22:20:22.890' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-11T22:20:22.890' AS DateTime), CAST(N'2023-04-11T22:20:22.890' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 177, 154, N'Tnx-1142023-001', CAST(N'2023-07-13T03:41:09.917' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-11T22:20:22.890' AS DateTime), CAST(N'2023-04-11T22:20:22.890' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (178, 28, 155, N'Tnx-2042023-001', CAST(N'2023-04-20T15:02:32.483' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-20T15:02:32.483' AS DateTime), CAST(N'2023-04-20T15:02:32.483' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 178, 156, N'Tnx-2042023-001', CAST(N'2023-07-13T03:41:09.937' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-20T15:02:32.483' AS DateTime), CAST(N'2023-04-20T15:02:32.483' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (179, 28, 157, N'Tnx-2642023-001', CAST(N'2023-04-26T19:55:15.640' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-26T19:55:15.640' AS DateTime), CAST(N'2023-04-26T19:55:15.640' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 179, 158, N'Tnx-2642023-001', CAST(N'2023-07-13T03:41:09.947' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-26T19:55:15.640' AS DateTime), CAST(N'2023-04-26T19:55:15.640' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (180, 28, 159, N'Tnx-2452023-001', CAST(N'2023-05-24T17:29:52.340' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-05-24T17:29:52.340' AS DateTime), CAST(N'2023-05-24T17:29:52.340' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 180, 160, N'Tnx-2452023-001', CAST(N'2023-07-13T03:41:09.963' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-05-24T17:29:52.340' AS DateTime), CAST(N'2023-05-24T17:29:52.340' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (181, 28, 161, N'Tnx-2452023-002', CAST(N'2023-05-24T17:33:08.197' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-05-24T17:33:08.197' AS DateTime), CAST(N'2023-05-24T17:33:08.197' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 181, 162, N'Tnx-2452023-002', CAST(N'2023-07-13T03:41:09.973' AS DateTime), N'Cr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-05-24T17:33:08.197' AS DateTime), CAST(N'2023-05-24T17:33:08.197' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (182, 4, 163, N'Tnx-1962023-001', CAST(N'2023-06-19T19:21:50.073' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-06-19T19:21:50.073' AS DateTime), CAST(N'2023-06-19T19:21:50.073' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 182, 164, N'Tnx-1962023-001', CAST(N'2023-07-13T03:41:09.990' AS DateTime), N'Cr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-06-19T19:21:50.073' AS DateTime), CAST(N'2023-06-19T19:21:50.073' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (183, 28, 165, N'Tnx-1212023-026', CAST(N'2023-01-12T15:34:33.813' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:33.813' AS DateTime), CAST(N'2023-01-12T15:34:33.813' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 183, 166, N'Tnx-1212023-026', CAST(N'2023-07-13T03:41:10.103' AS DateTime), N'Dr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:33.813' AS DateTime), CAST(N'2023-01-19T00:23:31.357' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (184, 28, 167, N'Tnx-1212023-027', CAST(N'2023-01-12T15:34:43.587' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:43.587' AS DateTime), CAST(N'2023-01-12T15:34:43.587' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 184, 168, N'Tnx-1212023-027', CAST(N'2023-07-13T03:41:10.117' AS DateTime), N'Dr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:43.587' AS DateTime), CAST(N'2023-01-12T15:34:43.587' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (185, 28, 169, N'Tnx-1212023-028', CAST(N'2023-01-12T15:34:49.703' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:49.703' AS DateTime), CAST(N'2023-01-12T15:34:49.703' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 185, 170, N'Tnx-1212023-028', CAST(N'2023-07-13T03:41:10.123' AS DateTime), N'Dr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:34:49.703' AS DateTime), CAST(N'2023-01-12T15:34:49.703' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (186, 4, 171, N'Tnx-1212023-029', CAST(N'2023-01-12T15:35:21.563' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:21.563' AS DateTime), CAST(N'2023-01-12T15:35:21.563' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 186, 172, N'Tnx-1212023-029', CAST(N'2023-07-13T03:41:10.137' AS DateTime), N'Dr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:21.563' AS DateTime), CAST(N'2023-01-12T15:35:21.563' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (187, 4, 173, N'Tnx-1212023-030', CAST(N'2023-01-12T15:35:26.383' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:26.383' AS DateTime), CAST(N'2023-01-12T15:35:26.383' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 187, 174, N'Tnx-1212023-030', CAST(N'2023-07-13T03:41:10.147' AS DateTime), N'Dr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:26.383' AS DateTime), CAST(N'2023-01-12T15:35:26.383' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (188, 4, 175, N'Tnx-1212023-031', CAST(N'2023-01-12T15:35:31.220' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:31.220' AS DateTime), CAST(N'2023-01-12T15:35:31.220' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 188, 176, N'Tnx-1212023-031', CAST(N'2023-07-13T03:41:10.150' AS DateTime), N'Dr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:31.220' AS DateTime), CAST(N'2023-01-31T19:33:05.550' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (189, 4, 177, N'Tnx-1212023-032', CAST(N'2023-01-12T15:35:39.720' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:39.720' AS DateTime), CAST(N'2023-01-12T15:35:39.720' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 189, 178, N'Tnx-1212023-032', CAST(N'2023-07-13T03:41:10.160' AS DateTime), N'Dr', 0, 0, 11718991, 11718991, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:39.720' AS DateTime), CAST(N'2023-01-12T15:35:39.720' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (190, 4, 179, N'Tnx-1212023-033', CAST(N'2023-01-12T15:35:49.407' AS DateTime), N'Cr', 0, -187449, 0, -187449, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:49.407' AS DateTime), CAST(N'2023-01-12T15:35:49.407' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 190, 180, N'Tnx-1212023-033', CAST(N'2023-07-13T03:41:10.170' AS DateTime), N'Dr', -187449, 0, 11718991, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:49.407' AS DateTime), CAST(N'2023-02-23T20:24:07.657' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (191, 4, 181, N'Tnx-1212023-034', CAST(N'2023-01-12T15:35:54.250' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:54.250' AS DateTime), CAST(N'2023-01-12T15:35:54.250' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 191, 182, N'Tnx-1212023-034', CAST(N'2023-07-13T03:41:10.180' AS DateTime), N'Dr', 0, 0, 11906440, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:54.250' AS DateTime), CAST(N'2023-01-12T15:35:54.250' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (192, 4, 183, N'Tnx-1212023-035', CAST(N'2023-01-12T15:35:59.073' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:59.073' AS DateTime), CAST(N'2023-01-12T15:35:59.073' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 192, 184, N'Tnx-1212023-035', CAST(N'2023-07-13T03:41:10.193' AS DateTime), N'Dr', 0, 0, 11906440, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:35:59.073' AS DateTime), CAST(N'2023-01-12T15:35:59.073' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (193, 4, 185, N'Tnx-1212023-036', CAST(N'2023-01-12T15:36:04.217' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:04.217' AS DateTime), CAST(N'2023-01-12T15:36:04.217' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 193, 186, N'Tnx-1212023-036', CAST(N'2023-07-13T03:41:10.200' AS DateTime), N'Dr', 0, 0, 11906440, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:04.217' AS DateTime), CAST(N'2023-01-12T15:36:04.217' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (194, 4, 187, N'Tnx-1212023-037', CAST(N'2023-01-12T15:36:09.053' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:09.053' AS DateTime), CAST(N'2023-01-12T15:36:09.053' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 194, 188, N'Tnx-1212023-037', CAST(N'2023-07-13T03:41:10.213' AS DateTime), N'Dr', 0, 0, 11906440, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:09.053' AS DateTime), CAST(N'2023-02-06T21:36:03.693' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (195, 4, 189, N'Tnx-1212023-038', CAST(N'2023-01-12T15:36:13.907' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:13.907' AS DateTime), CAST(N'2023-01-12T15:36:13.907' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 195, 190, N'Tnx-1212023-038', CAST(N'2023-07-13T03:41:10.227' AS DateTime), N'Dr', 0, 0, 11906440, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:13.907' AS DateTime), CAST(N'2023-01-22T11:57:19.553' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (196, 4, 191, N'Tnx-1212023-039', CAST(N'2023-01-12T15:36:18.750' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:18.750' AS DateTime), CAST(N'2023-01-12T15:36:18.750' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 196, 192, N'Tnx-1212023-039', CAST(N'2023-07-13T03:41:10.240' AS DateTime), N'Dr', 0, 0, 11906440, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:18.750' AS DateTime), CAST(N'2023-01-12T15:36:18.750' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (197, 4, 193, N'Tnx-1212023-040', CAST(N'2023-01-12T15:36:23.593' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:23.593' AS DateTime), CAST(N'2023-01-12T15:36:23.593' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 197, 194, N'Tnx-1212023-040', CAST(N'2023-07-13T03:41:10.253' AS DateTime), N'Dr', 0, 0, 11906440, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:23.593' AS DateTime), CAST(N'2023-02-16T01:14:39.417' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (198, 4, 195, N'Tnx-1212023-041', CAST(N'2023-01-12T15:36:28.453' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:28.453' AS DateTime), CAST(N'2023-01-12T15:36:28.453' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 198, 196, N'Tnx-1212023-041', CAST(N'2023-07-13T03:41:10.267' AS DateTime), N'Dr', 0, 0, 11906440, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:28.453' AS DateTime), CAST(N'2023-01-12T15:36:28.453' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (199, 4, 197, N'Tnx-1212023-042', CAST(N'2023-01-12T15:36:33.293' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:33.293' AS DateTime), CAST(N'2023-01-12T15:36:33.293' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 199, 198, N'Tnx-1212023-042', CAST(N'2023-07-13T03:41:10.277' AS DateTime), N'Dr', 0, 0, 11906440, 11906440, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:33.293' AS DateTime), CAST(N'2023-01-12T15:36:33.293' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (200, 4, 199, N'Tnx-1212023-043', CAST(N'2023-01-12T15:36:38.147' AS DateTime), N'Cr', 0, -9286, 0, -9286, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:38.147' AS DateTime), CAST(N'2023-01-12T15:36:38.147' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 200, 200, N'Tnx-1212023-043', CAST(N'2023-07-13T03:41:10.287' AS DateTime), N'Dr', -9286, 0, 11906440, 11915726, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:38.147' AS DateTime), CAST(N'2023-02-17T11:33:27.350' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (201, 4, 201, N'Tnx-1212023-044', CAST(N'2023-01-12T15:36:43.010' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:43.010' AS DateTime), CAST(N'2023-01-12T15:36:43.010' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 201, 202, N'Tnx-1212023-044', CAST(N'2023-07-13T03:41:10.303' AS DateTime), N'Dr', 0, 0, 11915726, 11915726, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:43.010' AS DateTime), CAST(N'2023-01-12T15:36:43.010' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (202, 4, 203, N'Tnx-1212023-045', CAST(N'2023-01-12T15:36:47.877' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:47.877' AS DateTime), CAST(N'2023-01-12T15:36:47.877' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 202, 204, N'Tnx-1212023-045', CAST(N'2023-07-13T03:41:10.320' AS DateTime), N'Dr', 0, 0, 11915726, 11915726, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:47.877' AS DateTime), CAST(N'2023-01-12T15:36:47.877' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (203, 28, 205, N'Tnx-1212023-046', CAST(N'2023-01-12T15:36:56.470' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:56.470' AS DateTime), CAST(N'2023-01-12T15:36:56.470' AS DateTime), NULL, N'rukucse11@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 203, 206, N'Tnx-1212023-046', CAST(N'2023-07-13T03:41:10.330' AS DateTime), N'Dr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:36:56.470' AS DateTime), CAST(N'2023-03-30T08:13:58.630' AS DateTime), NULL, N'rukucse11@gmail.com', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (204, 28, 207, N'Tnx-1212023-047', CAST(N'2023-01-12T15:37:54.693' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:37:54.693' AS DateTime), CAST(N'2023-01-12T15:37:54.693' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 204, 208, N'Tnx-1212023-047', CAST(N'2023-07-13T03:41:10.343' AS DateTime), N'Dr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-12T15:37:54.693' AS DateTime), CAST(N'2023-01-12T15:37:54.693' AS DateTime), NULL, N'System', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (205, 28, 209, N'Tnx-1312023-006', CAST(N'2023-01-13T01:59:50.273' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T01:59:50.273' AS DateTime), CAST(N'2023-01-13T01:59:50.273' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 205, 210, N'Tnx-1312023-006', CAST(N'2023-07-13T03:41:10.360' AS DateTime), N'Dr', 0, 0, -243838.11, -243838.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T01:59:50.273' AS DateTime), CAST(N'2023-01-13T01:59:50.273' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (206, 28, 211, N'Tnx-1312023-007', CAST(N'2023-01-13T02:06:14.187' AS DateTime), N'Cr', 0, 16576, 0, 16576, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T02:06:14.187' AS DateTime), CAST(N'2023-01-13T02:06:14.187' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 206, 212, N'Tnx-1312023-007', CAST(N'2023-07-13T03:41:10.377' AS DateTime), N'Dr', 16576, 0, -243838.11, -260414.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T02:06:14.187' AS DateTime), CAST(N'2023-02-17T21:04:15.567' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (207, 4, 213, N'Tnx-1312023-008', CAST(N'2023-01-13T02:23:55.387' AS DateTime), N'Cr', 0, 100774, 0, 100774, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T02:23:55.387' AS DateTime), CAST(N'2023-01-13T02:23:55.387' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 207, 214, N'Tnx-1312023-008', CAST(N'2023-07-13T03:41:10.387' AS DateTime), N'Dr', 100774, 0, 11915726, 11814952, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T02:23:55.387' AS DateTime), CAST(N'2023-04-12T18:42:34.633' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (208, 4, 215, N'Tnx-1312023-009', CAST(N'2023-01-13T02:47:15.823' AS DateTime), N'Cr', 0, -56802, 0, -56802, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T02:47:15.823' AS DateTime), CAST(N'2023-01-13T02:47:15.823' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 208, 216, N'Tnx-1312023-009', CAST(N'2023-07-13T03:41:10.400' AS DateTime), N'Dr', -56802, 0, 11814952, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T02:47:15.823' AS DateTime), CAST(N'2023-02-23T16:27:53.153' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (209, 4, 217, N'Tnx-1312023-010', CAST(N'2023-01-13T03:01:03.510' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:01:03.510' AS DateTime), CAST(N'2023-01-13T03:01:03.510' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 209, 218, N'Tnx-1312023-010', CAST(N'2023-07-13T03:41:10.410' AS DateTime), N'Dr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:01:03.510' AS DateTime), CAST(N'2023-02-17T21:01:23.863' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (210, 28, 219, N'Tnx-1312023-011', CAST(N'2023-01-13T03:22:52.020' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:22:52.020' AS DateTime), CAST(N'2023-01-13T03:22:52.020' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 210, 220, N'Tnx-1312023-011', CAST(N'2023-07-13T03:41:10.430' AS DateTime), N'Dr', 0, 0, -260414.11, -260414.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T03:22:52.020' AS DateTime), CAST(N'2023-01-13T03:22:52.020' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (211, 28, 221, N'Tnx-1312023-012', CAST(N'2023-01-13T04:02:49.107' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T04:02:49.107' AS DateTime), CAST(N'2023-01-13T04:02:49.107' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 211, 222, N'Tnx-1312023-012', CAST(N'2023-07-13T03:41:10.440' AS DateTime), N'Dr', 0, 0, -260414.11, -260414.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-13T04:02:49.107' AS DateTime), CAST(N'2023-02-13T09:55:25.770' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (212, 28, 223, N'Tnx-1612023-005', CAST(N'2023-01-16T02:13:30.780' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T02:13:30.780' AS DateTime), CAST(N'2023-01-16T02:13:30.780' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 212, 224, N'Tnx-1612023-005', CAST(N'2023-07-13T03:41:10.460' AS DateTime), N'Dr', 0, 0, -260414.11, -260414.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T02:13:30.780' AS DateTime), CAST(N'2023-02-17T21:05:42.680' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (213, 4, 225, N'Tnx-1612023-006', CAST(N'2023-01-16T03:26:04.303' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T03:26:04.303' AS DateTime), CAST(N'2023-01-16T03:26:04.303' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 213, 226, N'Tnx-1612023-006', CAST(N'2023-07-13T03:41:10.480' AS DateTime), N'Dr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T03:26:04.303' AS DateTime), CAST(N'2023-02-17T21:02:10.613' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (214, 4, 227, N'Tnx-1612023-007', CAST(N'2023-01-16T09:47:52.607' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T09:47:52.607' AS DateTime), CAST(N'2023-01-16T09:47:52.607' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 214, 228, N'Tnx-1612023-007', CAST(N'2023-07-13T03:41:10.490' AS DateTime), N'Dr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T09:47:52.607' AS DateTime), CAST(N'2023-01-26T21:52:45.727' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (215, 4, 229, N'Tnx-1612023-008', CAST(N'2023-01-16T23:24:07.167' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T23:24:07.167' AS DateTime), CAST(N'2023-01-16T23:24:07.167' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 215, 230, N'Tnx-1612023-008', CAST(N'2023-07-13T03:41:10.503' AS DateTime), N'Dr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-16T23:24:07.167' AS DateTime), CAST(N'2023-01-16T23:24:07.167' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (216, 28, 231, N'Tnx-1912023-002', CAST(N'2023-01-19T13:11:34.390' AS DateTime), N'Cr', 0, 1, 0, 1, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-19T13:11:34.390' AS DateTime), CAST(N'2023-01-19T13:11:34.390' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 216, 232, N'Tnx-1912023-002', CAST(N'2023-07-13T03:41:10.517' AS DateTime), N'Dr', 1, 0, -260414.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-19T13:11:34.390' AS DateTime), CAST(N'2023-03-02T13:32:35.953' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (217, 28, 233, N'Tnx-2312023-001', CAST(N'2023-01-23T11:22:00.347' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-23T11:22:00.347' AS DateTime), CAST(N'2023-01-23T11:22:00.347' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 217, 234, N'Tnx-2312023-001', CAST(N'2023-07-13T03:41:10.533' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-23T11:22:00.347' AS DateTime), CAST(N'2023-01-23T11:25:18.163' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (218, 4, 235, N'Tnx-1622023-002', CAST(N'2023-02-16T01:21:13.560' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-16T01:21:13.560' AS DateTime), CAST(N'2023-02-16T01:21:13.560' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 218, 236, N'Tnx-1622023-002', CAST(N'2023-07-13T03:41:10.547' AS DateTime), N'Dr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-16T01:21:13.560' AS DateTime), CAST(N'2023-02-17T13:16:01.500' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (219, 28, 237, N'Tnx-2322023-003', CAST(N'2023-02-23T23:51:33.390' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-23T23:51:33.390' AS DateTime), CAST(N'2023-02-23T23:51:33.390' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 219, 238, N'Tnx-2322023-003', CAST(N'2023-07-13T03:41:10.557' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-23T23:51:33.390' AS DateTime), CAST(N'2023-02-23T23:51:33.390' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (220, 4, 239, N'Tnx-2622023-003', CAST(N'2023-02-26T00:05:23.160' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-26T00:05:23.160' AS DateTime), CAST(N'2023-02-26T00:05:23.160' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 220, 240, N'Tnx-2622023-003', CAST(N'2023-07-13T03:41:10.577' AS DateTime), N'Dr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-26T00:05:23.160' AS DateTime), CAST(N'2023-02-26T00:05:23.160' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (221, 4, 241, N'Tnx-2622023-004', CAST(N'2023-02-26T13:59:34.133' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-26T13:59:34.133' AS DateTime), CAST(N'2023-02-26T13:59:34.133' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 221, 242, N'Tnx-2622023-004', CAST(N'2023-07-13T03:41:10.593' AS DateTime), N'Dr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-26T13:59:34.133' AS DateTime), CAST(N'2023-02-26T13:59:34.133' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (222, 28, 243, N'Tnx-2822023-002', CAST(N'2023-02-28T16:37:30.810' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-28T16:37:30.810' AS DateTime), CAST(N'2023-02-28T16:37:30.810' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 222, 244, N'Tnx-2822023-002', CAST(N'2023-07-13T03:41:10.607' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-02-28T16:37:30.810' AS DateTime), CAST(N'2023-02-28T16:37:30.810' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (223, 28, 245, N'Tnx-132023-002', CAST(N'2023-03-01T19:41:17.980' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-01T19:41:17.980' AS DateTime), CAST(N'2023-03-01T19:41:17.980' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 223, 246, N'Tnx-132023-002', CAST(N'2023-07-13T03:41:10.620' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-01T19:41:17.980' AS DateTime), CAST(N'2023-03-01T19:41:17.980' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (224, 28, 247, N'Tnx-232023-004', CAST(N'2023-03-02T00:28:33.673' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T00:28:33.673' AS DateTime), CAST(N'2023-03-02T00:28:33.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 224, 248, N'Tnx-232023-004', CAST(N'2023-07-13T03:41:10.637' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T00:28:33.673' AS DateTime), CAST(N'2023-03-02T00:28:33.673' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (225, 28, 249, N'Tnx-232023-005', CAST(N'2023-03-02T12:28:15.773' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T12:28:15.773' AS DateTime), CAST(N'2023-03-02T12:28:15.773' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 225, 250, N'Tnx-232023-005', CAST(N'2023-07-13T03:41:10.653' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T12:28:15.773' AS DateTime), CAST(N'2023-03-02T12:28:15.773' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (226, 28, 251, N'Tnx-232023-006', CAST(N'2023-03-02T23:21:51.800' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T23:21:51.800' AS DateTime), CAST(N'2023-03-02T23:21:51.800' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 226, 252, N'Tnx-232023-006', CAST(N'2023-07-13T03:41:10.667' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-02T23:21:51.800' AS DateTime), CAST(N'2023-03-02T23:21:51.800' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (227, 42, 253, N'Tnx-1032023-001', CAST(N'2023-03-10T08:50:59.010' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-10T08:50:59.010' AS DateTime), CAST(N'2023-03-10T08:50:59.010' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (42, 227, 254, N'Tnx-1032023-001', CAST(N'2023-07-13T03:41:10.687' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-03-10T08:50:59.010' AS DateTime), CAST(N'2023-03-10T08:50:59.010' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (228, 28, 255, N'Tnx-742023-002', CAST(N'2023-04-07T02:11:57.113' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-07T02:11:57.113' AS DateTime), CAST(N'2023-04-07T02:11:57.113' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 228, 256, N'Tnx-742023-002', CAST(N'2023-07-13T03:41:10.713' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-07T02:11:57.113' AS DateTime), CAST(N'2023-04-07T02:11:57.113' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (229, 28, 257, N'Tnx-1142023-002', CAST(N'2023-04-11T22:20:22.953' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-11T22:20:22.953' AS DateTime), CAST(N'2023-04-11T22:20:22.953' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 229, 258, N'Tnx-1142023-002', CAST(N'2023-07-13T03:41:10.743' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-11T22:20:22.953' AS DateTime), CAST(N'2023-04-11T22:20:22.953' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (230, 28, 259, N'Tnx-2042023-002', CAST(N'2023-04-20T15:02:32.543' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-20T15:02:32.543' AS DateTime), CAST(N'2023-04-20T15:02:32.543' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 230, 260, N'Tnx-2042023-002', CAST(N'2023-07-13T03:41:10.760' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-20T15:02:32.543' AS DateTime), CAST(N'2023-04-20T15:02:32.543' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (231, 28, 261, N'Tnx-2642023-002', CAST(N'2023-04-26T19:55:15.703' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-26T19:55:15.703' AS DateTime), CAST(N'2023-04-26T19:55:15.703' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 231, 262, N'Tnx-2642023-002', CAST(N'2023-07-13T03:41:10.777' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-04-26T19:55:15.703' AS DateTime), CAST(N'2023-04-26T19:55:15.703' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (232, 28, 263, N'Tnx-2452023-003', CAST(N'2023-05-24T17:33:08.207' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-05-24T17:33:08.207' AS DateTime), CAST(N'2023-05-24T17:33:08.207' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 232, 264, N'Tnx-2452023-003', CAST(N'2023-07-13T03:41:10.793' AS DateTime), N'Dr', 0, 0, -260415.11, -260415.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-05-24T17:33:08.207' AS DateTime), CAST(N'2023-05-24T17:33:08.207' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (233, 4, 265, N'Tnx-1962023-002', CAST(N'2023-06-19T19:21:50.133' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-06-19T19:21:50.133' AS DateTime), CAST(N'2023-06-19T19:21:50.133' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 233, 266, N'Tnx-1962023-002', CAST(N'2023-07-13T03:41:10.810' AS DateTime), N'Dr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-06-19T19:21:50.133' AS DateTime), CAST(N'2023-06-19T19:21:50.133' AS DateTime), NULL, N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (234, 4, 267, N'Tnx-612023-009', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.843' AS DateTime), CAST(N'2023-07-13T03:41:10.843' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 234, 268, N'Tnx-612023-009', CAST(N'2023-07-13T03:41:10.843' AS DateTime), N'Cr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-06T13:53:33.037' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (235, 4, 269, N'Tnx-612023-010', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.850' AS DateTime), CAST(N'2023-07-13T03:41:10.850' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 235, 270, N'Tnx-612023-010', CAST(N'2023-07-13T03:41:10.850' AS DateTime), N'Cr', 0, 0, 11871754, 11871754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-06T13:54:03.330' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (236, 28, 271, N'Tnx-612023-011', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Cr', 0, 70916, 0, 70916, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.887' AS DateTime), CAST(N'2023-07-13T03:41:10.887' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 236, 272, N'Tnx-612023-011', CAST(N'2023-07-13T03:41:10.887' AS DateTime), N'Dr', 70916, 0, -260415.11, -331331.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-17T07:51:12.200' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (237, 4, 273, N'Tnx-612023-012', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Cr', 0, 1600000, 0, 1600000, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.900' AS DateTime), CAST(N'2023-07-13T03:41:10.900' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 237, 274, N'Tnx-612023-012', CAST(N'2023-07-13T03:41:10.900' AS DateTime), N'Dr', 1600000, 0, 11871754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-17T07:50:28.457' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (238, 4, 275, N'Tnx-612023-013', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.910' AS DateTime), CAST(N'2023-07-13T03:41:10.910' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 238, 276, N'Tnx-612023-013', CAST(N'2023-07-13T03:41:10.913' AS DateTime), N'Dr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-03-07T15:09:58.373' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (239, 28, 277, N'Tnx-612023-014', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.920' AS DateTime), CAST(N'2023-07-13T03:41:10.920' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 239, 278, N'Tnx-612023-014', CAST(N'2023-07-13T03:41:10.923' AS DateTime), N'Cr', 0, 0, -331331.11, -331331.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-06T09:43:53.670' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (240, 4, 279, N'Tnx-612023-015', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.927' AS DateTime), CAST(N'2023-07-13T03:41:10.927' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 240, 280, N'Tnx-612023-015', CAST(N'2023-07-13T03:41:10.930' AS DateTime), N'Dr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-23T19:10:47.693' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (241, 28, 281, N'Tnx-612023-016', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.937' AS DateTime), CAST(N'2023-07-13T03:41:10.937' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 241, 282, N'Tnx-612023-016', CAST(N'2023-07-13T03:41:10.937' AS DateTime), N'Cr', 0, 0, -331331.11, -331331.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-05T11:09:37.560' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (242, 28, 283, N'Tnx-612023-017', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.947' AS DateTime), CAST(N'2023-07-13T03:41:10.947' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 242, 284, N'Tnx-612023-017', CAST(N'2023-07-13T03:41:10.947' AS DateTime), N'Cr', 0, 0, -331331.11, -331331.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-11T00:05:54.410' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (243, 4, 285, N'Tnx-612023-018', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.953' AS DateTime), CAST(N'2023-07-13T03:41:10.953' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 243, 286, N'Tnx-612023-018', CAST(N'2023-07-13T03:41:10.957' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-17T06:39:46.910' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (244, 4, 287, N'Tnx-612023-019', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.963' AS DateTime), CAST(N'2023-07-13T03:41:10.963' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 244, 288, N'Tnx-612023-019', CAST(N'2023-07-13T03:41:10.967' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-17T06:46:00.840' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (245, 4, 289, N'Tnx-612023-020', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.973' AS DateTime), CAST(N'2023-07-13T03:41:10.973' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 245, 290, N'Tnx-612023-020', CAST(N'2023-07-13T03:41:10.977' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-30T04:29:50.713' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (246, 4, 291, N'Tnx-612023-021', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.980' AS DateTime), CAST(N'2023-07-13T03:41:10.980' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 246, 292, N'Tnx-612023-021', CAST(N'2023-07-13T03:41:10.983' AS DateTime), N'Dr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-02-26T08:45:43.100' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (247, 4, 293, N'Tnx-612023-022', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:10.990' AS DateTime), CAST(N'2023-07-13T03:41:10.990' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 247, 294, N'Tnx-612023-022', CAST(N'2023-07-13T03:41:10.990' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-04T12:04:35.627' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (248, 4, 295, N'Tnx-612023-023', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.000' AS DateTime), CAST(N'2023-07-13T03:41:11.000' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 248, 296, N'Tnx-612023-023', CAST(N'2023-07-13T03:41:11.000' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-26T06:52:57.693' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (249, 4, 297, N'Tnx-612023-024', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.010' AS DateTime), CAST(N'2023-07-13T03:41:11.010' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 249, 298, N'Tnx-612023-024', CAST(N'2023-07-13T03:41:11.010' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-04T12:05:20.610' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (250, 28, 299, N'Tnx-612023-025', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.017' AS DateTime), CAST(N'2023-07-13T03:41:11.017' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 250, 300, N'Tnx-612023-025', CAST(N'2023-07-13T03:41:11.020' AS DateTime), N'Cr', 0, 0, -331331.11, -331331.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-01-26T10:31:16.577' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (251, 4, 301, N'Tnx-612023-026', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.030' AS DateTime), CAST(N'2023-07-13T03:41:11.030' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 251, 302, N'Tnx-612023-026', CAST(N'2023-07-13T03:41:11.030' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-02-12T22:20:56.247' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (252, 28, 303, N'Tnx-612023-027', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.043' AS DateTime), CAST(N'2023-07-13T03:41:11.043' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (28, 252, 304, N'Tnx-612023-027', CAST(N'2023-07-13T03:41:11.043' AS DateTime), N'Dr', 0, 0, -331331.11, -331331.11, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-02-17T01:55:11.777' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (253, 4, 305, N'Tnx-612023-028', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Cr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.047' AS DateTime), CAST(N'2023-07-13T03:41:11.047' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 253, 306, N'Tnx-612023-028', CAST(N'2023-07-13T03:41:11.050' AS DateTime), N'Dr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-02-17T01:56:14.823' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (254, 4, 307, N'Tnx-612023-029', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.060' AS DateTime), CAST(N'2023-07-13T03:41:11.060' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 254, 308, N'Tnx-612023-029', CAST(N'2023-07-13T03:41:11.063' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-05T18:24:22.573' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (255, 4, 309, N'Tnx-612023-030', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.070' AS DateTime), CAST(N'2023-07-13T03:41:11.070' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 255, 310, N'Tnx-612023-030', CAST(N'2023-07-13T03:41:11.073' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-06-04T12:06:16.887' AS DateTime), NULL, N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (256, 4, 311, N'Tnx-612023-031', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.083' AS DateTime), CAST(N'2023-07-13T03:41:11.083' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 256, 312, N'Tnx-612023-031', CAST(N'2023-07-13T03:41:11.083' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-03-07T12:06:12.483' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (257, 4, 313, N'Tnx-612023-032', CAST(N'2023-01-06T13:53:32.957' AS DateTime), N'Dr', 0, 0, 0, 0, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-07-13T03:41:11.097' AS DateTime), CAST(N'2023-07-13T03:41:11.097' AS DateTime), NULL, N'', N'System')
GO
INSERT [dbo].[TransactionHistories] ([LedgerID], [AccountID], [PkTransactionId], [TransactionID], [TransactionDate], [TransactionType], [Debit], [Credit], [OpeningBalance], [ClosingBalance], [TransactionSource], [TransactionReference], [ReferenceID], [Remarks], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (4, 257, 314, N'Tnx-612023-032', CAST(N'2023-07-13T03:41:11.097' AS DateTime), N'Cr', 0, 0, 10271754, 10271754, N'Opening Balance', N'', 0, N'Opening Balance', 1, CAST(N'2023-01-06T13:53:32.957' AS DateTime), CAST(N'2023-04-12T11:12:22.110' AS DateTime), NULL, N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[TransactionHistories] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserTypeID], [LedgerID], [CurrencyID], [PkUserId], [UserName], [FullName], [ProfileImage], [NickName], [Gender], [UserTokenConfirmation], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy], [Countries_PkCountryId]) VALUES (1, 7, 1, 1, N'm.sarfuddin1981@gmail.com', N'Rukunujjaman Miaji', N'/Resources/UserImage/Rukunujjaman Miaji_1.JPG', N'', N'Male', N'', 1, CAST(N'2023-07-12T16:40:42.763' AS DateTime), CAST(N'2023-07-12T16:40:42.763' AS DateTime), N'', N'', N'System', NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 
GO
INSERT [dbo].[UserTypes] ([PkUserTypelId], [UserTypeName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (1, N'Admin', 1, CAST(N'2023-07-13T03:40:12.530' AS DateTime), CAST(N'2023-07-13T03:40:12.530' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[UserTypes] ([PkUserTypelId], [UserTypeName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (2, N'Sales Manager', 1, CAST(N'2023-07-13T03:40:12.533' AS DateTime), CAST(N'2023-07-13T03:40:12.533' AS DateTime), N'', N'', N'System')
GO
INSERT [dbo].[UserTypes] ([PkUserTypelId], [UserTypeName], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (3, N'Purchase Manager', 1, CAST(N'2023-07-13T03:40:12.533' AS DateTime), CAST(N'2023-07-13T03:40:12.533' AS DateTime), N'', N'', N'System')
GO
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendors] ON 
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (183, 4, 51, NULL, NULL, 1, N'S-00001', N'Elias Dhaka-AED', NULL, N'Dhaka', NULL, 1, CAST(N'2023-01-12T15:34:33.813' AS DateTime), CAST(N'2023-01-19T00:23:31.357' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (184, 4, NULL, NULL, NULL, 2, N'S-00002', N'Tareq Bagina AED', NULL, NULL, N'Dubai', 1, CAST(N'2023-01-12T15:34:43.587' AS DateTime), CAST(N'2023-01-12T15:34:43.587' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (185, 4, NULL, NULL, NULL, 3, N'S-00003', N'Obaiyed Bhai AED', NULL, NULL, N'Ajman', 1, CAST(N'2023-01-12T15:34:49.703' AS DateTime), CAST(N'2023-01-12T15:34:49.703' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (186, 1, NULL, NULL, NULL, 4, N'S-00004', N'Alamin Gulshan- BDT', NULL, N'Al Amin', NULL, 1, CAST(N'2023-01-12T15:35:21.563' AS DateTime), CAST(N'2023-01-12T15:35:21.563' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (187, 1, NULL, NULL, NULL, 5, N'S-00005', N'Azad UAE -BDT', NULL, N'Azher Uddin', NULL, 1, CAST(N'2023-01-12T15:35:26.383' AS DateTime), CAST(N'2023-01-12T15:35:26.383' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (188, 1, NULL, NULL, NULL, 6, N'S-00006', N'Bahar Alain- BDT', NULL, N'Bahar Uddin', NULL, 1, CAST(N'2023-01-12T15:35:31.220' AS DateTime), CAST(N'2023-01-31T19:33:05.550' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (189, 1, NULL, NULL, NULL, 7, N'S-00007', N'Dayal Alain- BDT', NULL, NULL, N'ALAIN', 1, CAST(N'2023-01-12T15:35:39.720' AS DateTime), CAST(N'2023-01-12T15:35:39.720' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (190, 1, NULL, NULL, NULL, 8, N'S-00008', N'ILYAS Dubai-BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:35:49.407' AS DateTime), CAST(N'2023-02-23T20:24:07.657' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (191, 1, NULL, NULL, NULL, 9, N'S-00009', N'Jahir Hor Al ANZ- BDT', NULL, NULL, N'Dubai', 1, CAST(N'2023-01-12T15:35:54.250' AS DateTime), CAST(N'2023-01-12T15:35:54.250' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (192, 1, NULL, NULL, NULL, 10, N'S-00010', N'Mainuddin- Brother', NULL, NULL, N'Raipur', 1, CAST(N'2023-01-12T15:35:59.073' AS DateTime), CAST(N'2023-01-12T15:35:59.073' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (193, 1, NULL, NULL, NULL, 11, N'S-00011', N'Masud Dubai- BDT', NULL, NULL, N'Dubai', 1, CAST(N'2023-01-12T15:36:04.217' AS DateTime), CAST(N'2023-01-12T15:36:04.217' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (194, 1, NULL, NULL, NULL, 12, N'S-00012', N'Melon Ajman- BDT', NULL, NULL, N'Ajman', 1, CAST(N'2023-01-12T15:36:09.053' AS DateTime), CAST(N'2023-02-06T21:36:03.693' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (195, 1, NULL, NULL, NULL, 13, N'S-00013', N'Mohan-BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:13.907' AS DateTime), CAST(N'2023-01-22T11:57:19.553' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (196, 1, NULL, NULL, NULL, 14, N'S-00014', N'Sajid Emirates- BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:18.750' AS DateTime), CAST(N'2023-01-12T15:36:18.750' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (197, 1, NULL, NULL, NULL, 15, N'S-00015', N'Sarfu-BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:23.593' AS DateTime), CAST(N'2023-02-16T01:14:39.417' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (198, 1, NULL, NULL, NULL, 16, N'S-00016', N'Shamim Dhaka -BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:28.453' AS DateTime), CAST(N'2023-01-12T15:36:28.453' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (199, 1, NULL, NULL, NULL, 17, N'S-00017', N'Emran STD EXCH- BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:33.293' AS DateTime), CAST(N'2023-01-12T15:36:33.293' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (200, 1, NULL, NULL, NULL, 18, N'S-00018', N'Sumon Badar Zayed- BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:38.147' AS DateTime), CAST(N'2023-02-17T11:33:27.350' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (201, 1, NULL, NULL, NULL, 19, N'S-00019', N'Tareq Bagina BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:43.010' AS DateTime), CAST(N'2023-01-12T15:36:43.010' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (202, 1, NULL, NULL, NULL, 20, N'S-00020', N'Tareq Panpara- BDT', NULL, NULL, NULL, 1, CAST(N'2023-01-12T15:36:47.877' AS DateTime), CAST(N'2023-01-12T15:36:47.877' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (203, 4, NULL, NULL, NULL, 21, N'S-00021', N'Rafiq DXB (AED)', N'0', N'Rafiq', N'Dubai', 1, CAST(N'2023-01-12T15:36:56.470' AS DateTime), CAST(N'2023-03-30T08:13:58.630' AS DateTime), N'', N'rukucse11@gmail.com', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (204, 4, NULL, NULL, NULL, 22, N'S-00022', N'Mizan-Alain', N'0', N'Mizanur Rahman', N'Alain', 1, CAST(N'2023-01-12T15:37:54.693' AS DateTime), CAST(N'2023-01-12T15:37:54.693' AS DateTime), N'', N'System', N'System')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (205, 4, NULL, NULL, NULL, 23, N'S-00023', N'Mahfuj', N'0', N'Mahfuj', N'Dubai', 1, CAST(N'2023-01-13T01:59:50.273' AS DateTime), CAST(N'2023-01-13T01:59:50.273' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (206, 4, NULL, NULL, NULL, 24, N'S-00024', N'Abir Dhaka', N'0', N'Abir', N'Dubai', 1, CAST(N'2023-01-13T02:06:14.187' AS DateTime), CAST(N'2023-02-17T21:04:15.567' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (207, 1, NULL, NULL, NULL, 25, N'S-00025', N'Bahar Khawaniz', N'0', N'Bahar Khawaniz', N'Dhaka', 1, CAST(N'2023-01-13T02:23:55.387' AS DateTime), CAST(N'2023-04-12T18:42:34.633' AS DateTime), N'', N'ria@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (208, 1, NULL, NULL, NULL, 26, N'S-00026', N'Ershad Alain', N'0', N'Ershad Alain', N'Alain', 1, CAST(N'2023-01-13T02:47:15.823' AS DateTime), CAST(N'2023-02-23T16:27:53.153' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (209, 1, NULL, NULL, NULL, 27, N'S-00027', N'Hasan Bhai Pran', N'0', N'Hasan Bhai Pran', N'Dhaka', 1, CAST(N'2023-01-13T03:01:03.510' AS DateTime), CAST(N'2023-02-17T21:01:23.863' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (210, 4, NULL, NULL, NULL, 28, N'S-00028', N'Mahbub Afrz', N'0', N'Mahbub Afrz', N'Dubai', 1, CAST(N'2023-01-13T03:22:52.020' AS DateTime), CAST(N'2023-01-13T03:22:52.020' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (211, 4, NULL, NULL, NULL, 29, N'S-00029', N'Mohan AED', N'0', N'Mohan AED', N'Dubai', 1, CAST(N'2023-01-13T04:02:49.107' AS DateTime), CAST(N'2023-02-13T09:55:25.770' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (212, 4, NULL, NULL, NULL, 30, N'S-00030', N'Shabahat Canada', N'0', N'Shabahat Canada', N'Canada', 1, CAST(N'2023-01-16T02:13:30.780' AS DateTime), CAST(N'2023-02-17T21:05:42.680' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (213, 1, NULL, NULL, NULL, 31, N'S-00031', N'Rubayet', N'0', N'Rubayet', N'Dhaka', 1, CAST(N'2023-01-16T03:26:04.303' AS DateTime), CAST(N'2023-02-17T21:02:10.613' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (214, 1, NULL, NULL, NULL, 32, N'S-00032', N'Saiful Dhaka', N'0', N'Saiful Dhaka', N'Dhaka', 1, CAST(N'2023-01-16T09:47:52.607' AS DateTime), CAST(N'2023-01-26T21:52:45.727' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (215, 1, NULL, NULL, NULL, 33, N'S-00033', N'ZAD', N'0', N'ZAD', N'Dhaka', 1, CAST(N'2023-01-16T23:24:07.167' AS DateTime), CAST(N'2023-01-16T23:24:07.167' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (216, 4, NULL, NULL, NULL, 34, N'S-00034', N'Naveed', N'0', N'Naveed', N'Dhaka', 1, CAST(N'2023-01-19T13:11:34.390' AS DateTime), CAST(N'2023-03-02T13:32:35.953' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (217, 4, NULL, NULL, NULL, 35, N'S-00035', N'kabir Saeed', NULL, NULL, NULL, 1, CAST(N'2023-01-23T11:22:00.347' AS DateTime), CAST(N'2023-01-23T11:25:18.163' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (218, 1, NULL, NULL, NULL, 36, N'S-00036', N'BABU Bhai Dhaka', N'01500000', N'Rashed', N'Dhaka', 1, CAST(N'2023-02-16T01:21:13.560' AS DateTime), CAST(N'2023-02-17T13:16:01.500' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (219, 4, NULL, NULL, NULL, 37, N'S-00037', N'Mijan Ref Hasan (AED)', NULL, NULL, NULL, 1, CAST(N'2023-02-23T23:51:33.390' AS DateTime), CAST(N'2023-02-23T23:51:33.390' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (220, 1, NULL, NULL, NULL, 38, N'S-00038', N'Prince', N'0', N'Prince', N'Dhaka', 1, CAST(N'2023-02-26T00:05:23.160' AS DateTime), CAST(N'2023-02-26T00:05:23.160' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (221, 1, NULL, NULL, NULL, 39, N'S-00039', N'Cash Customer & Vendor', N'017', NULL, N'dhaka', 1, CAST(N'2023-02-26T13:59:34.133' AS DateTime), CAST(N'2023-02-26T13:59:34.133' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (222, 4, NULL, NULL, NULL, 40, N'S-00040', N'Ershad Alain(AED)', N'0', NULL, N'Dhaka', 1, CAST(N'2023-02-28T16:37:30.810' AS DateTime), CAST(N'2023-02-28T16:37:30.810' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (223, 4, NULL, NULL, NULL, 41, N'S-00041', N'Khokan Bhai', NULL, NULL, NULL, 1, CAST(N'2023-03-01T19:41:17.980' AS DateTime), CAST(N'2023-03-01T19:41:17.980' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (224, 4, NULL, NULL, NULL, 42, N'S-00042', N'Cash Customer & Vendor (AED)', NULL, NULL, NULL, 1, CAST(N'2023-03-02T00:28:33.673' AS DateTime), CAST(N'2023-03-02T00:28:33.673' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (225, 4, NULL, NULL, NULL, 43, N'S-00043', N'Sumon Badar Zayed (AED)', NULL, NULL, NULL, 1, CAST(N'2023-03-02T12:28:15.773' AS DateTime), CAST(N'2023-03-02T12:28:15.773' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (226, 4, NULL, NULL, NULL, 44, N'S-00044', N'Style Badge', NULL, NULL, NULL, 1, CAST(N'2023-03-02T23:21:51.800' AS DateTime), CAST(N'2023-03-02T23:21:51.800' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (227, 6, NULL, NULL, NULL, 45, N'S-00045', N'Tahir Bhai Ref Ijaz', NULL, NULL, N'LHR', 1, CAST(N'2023-03-10T08:50:59.010' AS DateTime), CAST(N'2023-03-10T08:50:59.010' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (228, 4, NULL, NULL, NULL, 46, N'S-00046', N'Rony Ajman', N'050-----', NULL, NULL, 1, CAST(N'2023-04-07T02:11:57.113' AS DateTime), CAST(N'2023-04-07T02:11:57.113' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (229, 4, NULL, NULL, NULL, 47, N'S-00047', N'Melon Alain', N'0', N'Melon Ajman', N'Alain', 1, CAST(N'2023-04-11T22:20:22.953' AS DateTime), CAST(N'2023-04-11T22:20:22.953' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (230, 4, NULL, NULL, NULL, 48, N'S-00048', N'Mitul', N'0', N'Mitul', N'Dhaka', 1, CAST(N'2023-04-20T15:02:32.543' AS DateTime), CAST(N'2023-04-20T15:02:32.543' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (231, 4, NULL, NULL, NULL, 49, N'S-00049', N'Aziz Ref Melon', N'0', N'Aziz Ref Melon', N'Alain', 1, CAST(N'2023-04-26T19:55:15.703' AS DateTime), CAST(N'2023-04-26T19:55:15.703' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (232, 4, NULL, NULL, NULL, 50, N'S-00050', N'Hasan Bhai Pran AED', N'0', N'Hasan', N'Dhaka', 1, CAST(N'2023-05-24T17:33:08.207' AS DateTime), CAST(N'2023-05-24T17:33:08.207' AS DateTime), N'', N'm.sarfuddin1981@gmail.com', N'm.sarfuddin1981@gmail.com')
GO
INSERT [dbo].[Vendors] ([LedgerID], [CurrencyID], [CustomerLedgerID], [SupplierLedgerID1], [SupplierLedgerID2], [PkVendorId], [VendorCode], [VendorName], [Mobile], [ContactPersons], [Address], [Status], [CreatedAt], [UpdatedAt], [DeletedBy], [UpdatedBy], [CreatedBy]) VALUES (233, 1, NULL, NULL, NULL, 51, N'S-00051', N'Himel Dhaka', N'0', N'Himel', N'Dhaka', 1, CAST(N'2023-06-19T19:21:50.133' AS DateTime), CAST(N'2023-06-19T19:21:50.133' AS DateTime), N'', N'ria@gmail.com', N'ria@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Vendors] OFF
GO
ALTER TABLE [dbo].[BankAccounts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BankAccounts_dbo.Currencies_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[BankAccounts] CHECK CONSTRAINT [FK_dbo.BankAccounts_dbo.Currencies_CurrencyID]
GO
ALTER TABLE [dbo].[BankAccounts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BankAccounts_dbo.Ledgers_LedgerID] FOREIGN KEY([LedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[BankAccounts] CHECK CONSTRAINT [FK_dbo.BankAccounts_dbo.Ledgers_LedgerID]
GO
ALTER TABLE [dbo].[BillAttachmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BillAttachmentDetails_dbo.Bills_BillID] FOREIGN KEY([BillID])
REFERENCES [dbo].[Bills] ([PkBillId])
GO
ALTER TABLE [dbo].[BillAttachmentDetails] CHECK CONSTRAINT [FK_dbo.BillAttachmentDetails_dbo.Bills_BillID]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bills_dbo.Currencies_CreditCurrencyID] FOREIGN KEY([CreditCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_dbo.Bills_dbo.Currencies_CreditCurrencyID]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bills_dbo.Currencies_DebitCurrencyID] FOREIGN KEY([DebitCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_dbo.Bills_dbo.Currencies_DebitCurrencyID]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bills_dbo.Ledgers_CreditLedgerID] FOREIGN KEY([CreditLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_dbo.Bills_dbo.Ledgers_CreditLedgerID]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Bills_dbo.Ledgers_DebitLedgerID] FOREIGN KEY([DebitLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_dbo.Bills_dbo.Ledgers_DebitLedgerID]
GO
ALTER TABLE [dbo].[CashPurchases]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashPurchases_dbo.Currencies_PaidCurrencyID] FOREIGN KEY([PaidCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[CashPurchases] CHECK CONSTRAINT [FK_dbo.CashPurchases_dbo.Currencies_PaidCurrencyID]
GO
ALTER TABLE [dbo].[CashPurchases]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashPurchases_dbo.Currencies_PurchaseCurrencyID] FOREIGN KEY([PurchaseCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[CashPurchases] CHECK CONSTRAINT [FK_dbo.CashPurchases_dbo.Currencies_PurchaseCurrencyID]
GO
ALTER TABLE [dbo].[CashPurchases]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashPurchases_dbo.Ledgers_BankLedgerID] FOREIGN KEY([BankLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[CashPurchases] CHECK CONSTRAINT [FK_dbo.CashPurchases_dbo.Ledgers_BankLedgerID]
GO
ALTER TABLE [dbo].[CashPurchases]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashPurchases_dbo.Ledgers_DebitLedgerID] FOREIGN KEY([DebitLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[CashPurchases] CHECK CONSTRAINT [FK_dbo.CashPurchases_dbo.Ledgers_DebitLedgerID]
GO
ALTER TABLE [dbo].[CashPurchases]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashPurchases_dbo.Ledgers_SupplierLedgerID] FOREIGN KEY([SupplierLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[CashPurchases] CHECK CONSTRAINT [FK_dbo.CashPurchases_dbo.Ledgers_SupplierLedgerID]
GO
ALTER TABLE [dbo].[CashSales]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSales_dbo.Currencies_PaidCurrencyID] FOREIGN KEY([PaidCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[CashSales] CHECK CONSTRAINT [FK_dbo.CashSales_dbo.Currencies_PaidCurrencyID]
GO
ALTER TABLE [dbo].[CashSales]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSales_dbo.Currencies_SaleCurrencyID] FOREIGN KEY([SaleCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[CashSales] CHECK CONSTRAINT [FK_dbo.CashSales_dbo.Currencies_SaleCurrencyID]
GO
ALTER TABLE [dbo].[CashSales]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSales_dbo.Ledgers_BankLedgerID] FOREIGN KEY([BankLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[CashSales] CHECK CONSTRAINT [FK_dbo.CashSales_dbo.Ledgers_BankLedgerID]
GO
ALTER TABLE [dbo].[CashSales]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSales_dbo.Ledgers_CreditLedgerID] FOREIGN KEY([CreditLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[CashSales] CHECK CONSTRAINT [FK_dbo.CashSales_dbo.Ledgers_CreditLedgerID]
GO
ALTER TABLE [dbo].[CashSales]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CashSales_dbo.Ledgers_DebitLedgerID] FOREIGN KEY([DebitLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[CashSales] CHECK CONSTRAINT [FK_dbo.CashSales_dbo.Ledgers_DebitLedgerID]
GO
ALTER TABLE [dbo].[CreditNotes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CreditNotes_dbo.Currencies_PaidCurrencyID] FOREIGN KEY([PaidCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[CreditNotes] CHECK CONSTRAINT [FK_dbo.CreditNotes_dbo.Currencies_PaidCurrencyID]
GO
ALTER TABLE [dbo].[CreditNotes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CreditNotes_dbo.Ledgers_CreditLedgerID] FOREIGN KEY([CreditLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[CreditNotes] CHECK CONSTRAINT [FK_dbo.CreditNotes_dbo.Ledgers_CreditLedgerID]
GO
ALTER TABLE [dbo].[CreditNotes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CreditNotes_dbo.Ledgers_DebitLedgerID] FOREIGN KEY([DebitLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[CreditNotes] CHECK CONSTRAINT [FK_dbo.CreditNotes_dbo.Ledgers_DebitLedgerID]
GO
ALTER TABLE [dbo].[CurrencyRateHistories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CurrencyRateHistories_dbo.Currencies_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[CurrencyRateHistories] CHECK CONSTRAINT [FK_dbo.CurrencyRateHistories_dbo.Currencies_CurrencyID]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customers_dbo.Areas_AreaID] FOREIGN KEY([AreaID])
REFERENCES [dbo].[Areas] ([PkAreaId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_dbo.Customers_dbo.Areas_AreaID]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customers_dbo.Currencies_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_dbo.Customers_dbo.Currencies_CurrencyID]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customers_dbo.Ledgers_CustomerLedgerID1] FOREIGN KEY([CustomerLedgerID1])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_dbo.Customers_dbo.Ledgers_CustomerLedgerID1]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customers_dbo.Ledgers_CustomerLedgerID2] FOREIGN KEY([CustomerLedgerID2])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_dbo.Customers_dbo.Ledgers_CustomerLedgerID2]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customers_dbo.Ledgers_LedgerID] FOREIGN KEY([LedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_dbo.Customers_dbo.Ledgers_LedgerID]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Customers_dbo.Ledgers_SupplierLedgerID] FOREIGN KEY([SupplierLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_dbo.Customers_dbo.Ledgers_SupplierLedgerID]
GO
ALTER TABLE [dbo].[CustomerSuppliers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CustomerSuppliers_dbo.Currencies_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[CustomerSuppliers] CHECK CONSTRAINT [FK_dbo.CustomerSuppliers_dbo.Currencies_CurrencyID]
GO
ALTER TABLE [dbo].[CustomerSuppliers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CustomerSuppliers_dbo.Ledgers_LedgerID] FOREIGN KEY([LedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[CustomerSuppliers] CHECK CONSTRAINT [FK_dbo.CustomerSuppliers_dbo.Ledgers_LedgerID]
GO
ALTER TABLE [dbo].[DevicesHistories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DevicesHistories_dbo.IPAddresses_CLientIPAddress_PkIPAddressId] FOREIGN KEY([CLientIPAddress_PkIPAddressId])
REFERENCES [dbo].[IPAddresses] ([PkIPAddressId])
GO
ALTER TABLE [dbo].[DevicesHistories] CHECK CONSTRAINT [FK_dbo.DevicesHistories_dbo.IPAddresses_CLientIPAddress_PkIPAddressId]
GO
ALTER TABLE [dbo].[DevicesHistories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DevicesHistories_dbo.Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([PkUserId])
GO
ALTER TABLE [dbo].[DevicesHistories] CHECK CONSTRAINT [FK_dbo.DevicesHistories_dbo.Users_UserID]
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Emails_dbo.Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([PkUserId])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_dbo.Emails_dbo.Users_UserID]
GO
ALTER TABLE [dbo].[ExpenseAttachmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExpenseAttachmentDetails_dbo.Expenses_ExpenseID] FOREIGN KEY([ExpenseID])
REFERENCES [dbo].[Expenses] ([PkExpenseId])
GO
ALTER TABLE [dbo].[ExpenseAttachmentDetails] CHECK CONSTRAINT [FK_dbo.ExpenseAttachmentDetails_dbo.Expenses_ExpenseID]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Expenses_dbo.Currencies_ExpenseCurrencyID] FOREIGN KEY([ExpenseCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_dbo.Expenses_dbo.Currencies_ExpenseCurrencyID]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Expenses_dbo.Ledgers_CreditAccountID] FOREIGN KEY([CreditAccountID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_dbo.Expenses_dbo.Ledgers_CreditAccountID]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Expenses_dbo.Ledgers_DebitAccountID] FOREIGN KEY([DebitAccountID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_dbo.Expenses_dbo.Ledgers_DebitAccountID]
GO
ALTER TABLE [dbo].[InvoiceAttachmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.InvoiceAttachmentDetails_dbo.Invoices_InvoiceID] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([PkInvoiceId])
GO
ALTER TABLE [dbo].[InvoiceAttachmentDetails] CHECK CONSTRAINT [FK_dbo.InvoiceAttachmentDetails_dbo.Invoices_InvoiceID]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Invoices_dbo.Currencies_CreditCurrencyID] FOREIGN KEY([CreditCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_dbo.Invoices_dbo.Currencies_CreditCurrencyID]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Invoices_dbo.Currencies_DebitCurrencyID] FOREIGN KEY([DebitCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_dbo.Invoices_dbo.Currencies_DebitCurrencyID]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Invoices_dbo.Ledgers_CreditLedgerID] FOREIGN KEY([CreditLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_dbo.Invoices_dbo.Ledgers_CreditLedgerID]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Invoices_dbo.Ledgers_DebitLedgerID] FOREIGN KEY([DebitLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_dbo.Invoices_dbo.Ledgers_DebitLedgerID]
GO
ALTER TABLE [dbo].[Ledgers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Ledgers_dbo.Currencies_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Ledgers] CHECK CONSTRAINT [FK_dbo.Ledgers_dbo.Currencies_CurrencyID]
GO
ALTER TABLE [dbo].[LoginHistories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.LoginHistories_dbo.Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([PkUserId])
GO
ALTER TABLE [dbo].[LoginHistories] CHECK CONSTRAINT [FK_dbo.LoginHistories_dbo.Users_UserID]
GO
ALTER TABLE [dbo].[ManualJournalAttachmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ManualJournalAttachmentDetails_dbo.ManualJournals_JournalID] FOREIGN KEY([JournalID])
REFERENCES [dbo].[ManualJournals] ([PkJournalId])
GO
ALTER TABLE [dbo].[ManualJournalAttachmentDetails] CHECK CONSTRAINT [FK_dbo.ManualJournalAttachmentDetails_dbo.ManualJournals_JournalID]
GO
ALTER TABLE [dbo].[ManualJournals]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ManualJournals_dbo.Currencies_CreditCurrencyID] FOREIGN KEY([CreditCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[ManualJournals] CHECK CONSTRAINT [FK_dbo.ManualJournals_dbo.Currencies_CreditCurrencyID]
GO
ALTER TABLE [dbo].[ManualJournals]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ManualJournals_dbo.Currencies_DebitCurrencyID] FOREIGN KEY([DebitCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[ManualJournals] CHECK CONSTRAINT [FK_dbo.ManualJournals_dbo.Currencies_DebitCurrencyID]
GO
ALTER TABLE [dbo].[ManualJournals]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ManualJournals_dbo.Ledgers_CreditLedgerID] FOREIGN KEY([CreditLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[ManualJournals] CHECK CONSTRAINT [FK_dbo.ManualJournals_dbo.Ledgers_CreditLedgerID]
GO
ALTER TABLE [dbo].[ManualJournals]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ManualJournals_dbo.Ledgers_DebitLedgerID] FOREIGN KEY([DebitLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[ManualJournals] CHECK CONSTRAINT [FK_dbo.ManualJournals_dbo.Ledgers_DebitLedgerID]
GO
ALTER TABLE [dbo].[MobileNumbers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MobileNumbers_dbo.Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([PkUserId])
GO
ALTER TABLE [dbo].[MobileNumbers] CHECK CONSTRAINT [FK_dbo.MobileNumbers_dbo.Users_UserID]
GO
ALTER TABLE [dbo].[Passwords]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Passwords_dbo.Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([PkUserId])
GO
ALTER TABLE [dbo].[Passwords] CHECK CONSTRAINT [FK_dbo.Passwords_dbo.Users_UserID]
GO
ALTER TABLE [dbo].[PaymentAttachmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PaymentAttachmentDetails_dbo.Payments_PaymentsID] FOREIGN KEY([PaymentsID])
REFERENCES [dbo].[Payments] ([PkPaymentsId])
GO
ALTER TABLE [dbo].[PaymentAttachmentDetails] CHECK CONSTRAINT [FK_dbo.PaymentAttachmentDetails_dbo.Payments_PaymentsID]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Payments_dbo.Currencies_ReceiveCurrencyID] FOREIGN KEY([ReceiveCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_dbo.Payments_dbo.Currencies_ReceiveCurrencyID]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Payments_dbo.Ledgers_CreditLedgerID] FOREIGN KEY([CreditLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_dbo.Payments_dbo.Ledgers_CreditLedgerID]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Payments_dbo.Ledgers_DebitLedgerID] FOREIGN KEY([DebitLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_dbo.Payments_dbo.Ledgers_DebitLedgerID]
GO
ALTER TABLE [dbo].[PaymentsMadeAttachmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PaymentsMadeAttachmentDetails_dbo.PaymentsMades_PaymentsMadeID] FOREIGN KEY([PaymentsMadeID])
REFERENCES [dbo].[PaymentsMades] ([PkPaymentsMadeId])
GO
ALTER TABLE [dbo].[PaymentsMadeAttachmentDetails] CHECK CONSTRAINT [FK_dbo.PaymentsMadeAttachmentDetails_dbo.PaymentsMades_PaymentsMadeID]
GO
ALTER TABLE [dbo].[PaymentsMades]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PaymentsMades_dbo.Currencies_PaymentCurrencyID] FOREIGN KEY([PaymentCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[PaymentsMades] CHECK CONSTRAINT [FK_dbo.PaymentsMades_dbo.Currencies_PaymentCurrencyID]
GO
ALTER TABLE [dbo].[PaymentsMades]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PaymentsMades_dbo.Ledgers_CreditLedgerID] FOREIGN KEY([CreditLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[PaymentsMades] CHECK CONSTRAINT [FK_dbo.PaymentsMades_dbo.Ledgers_CreditLedgerID]
GO
ALTER TABLE [dbo].[PaymentsMades]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PaymentsMades_dbo.Ledgers_DebitLedgerID] FOREIGN KEY([DebitLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[PaymentsMades] CHECK CONSTRAINT [FK_dbo.PaymentsMades_dbo.Ledgers_DebitLedgerID]
GO
ALTER TABLE [dbo].[PemissionManagers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PemissionManagers_dbo.Modules_ModuleID] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Modules] ([PkModuleId])
GO
ALTER TABLE [dbo].[PemissionManagers] CHECK CONSTRAINT [FK_dbo.PemissionManagers_dbo.Modules_ModuleID]
GO
ALTER TABLE [dbo].[PemissionManagers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PemissionManagers_dbo.UserTypes_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTypes] ([PkUserTypelId])
GO
ALTER TABLE [dbo].[PemissionManagers] CHECK CONSTRAINT [FK_dbo.PemissionManagers_dbo.UserTypes_UserID]
GO
ALTER TABLE [dbo].[TransactionHistories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionHistories_dbo.Ledgers_AccountID] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[TransactionHistories] CHECK CONSTRAINT [FK_dbo.TransactionHistories_dbo.Ledgers_AccountID]
GO
ALTER TABLE [dbo].[TransactionHistories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TransactionHistories_dbo.Ledgers_LedgerID] FOREIGN KEY([LedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[TransactionHistories] CHECK CONSTRAINT [FK_dbo.TransactionHistories_dbo.Ledgers_LedgerID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Countries_Countries_PkCountryId] FOREIGN KEY([Countries_PkCountryId])
REFERENCES [dbo].[Countries] ([PkCountryId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Countries_Countries_PkCountryId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Currencies_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Currencies_CurrencyID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Ledgers_LedgerID] FOREIGN KEY([LedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Ledgers_LedgerID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.UserTypes_UserTypeID] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserTypes] ([PkUserTypelId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.UserTypes_UserTypeID]
GO
ALTER TABLE [dbo].[VendorDebitAttachmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VendorDebitAttachmentDetails_dbo.VendorDebits_DebitNoteID] FOREIGN KEY([DebitNoteID])
REFERENCES [dbo].[VendorDebits] ([PkDebitNoteId])
GO
ALTER TABLE [dbo].[VendorDebitAttachmentDetails] CHECK CONSTRAINT [FK_dbo.VendorDebitAttachmentDetails_dbo.VendorDebits_DebitNoteID]
GO
ALTER TABLE [dbo].[VendorDebits]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VendorDebits_dbo.Currencies_ReturnCurrencyID] FOREIGN KEY([ReturnCurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[VendorDebits] CHECK CONSTRAINT [FK_dbo.VendorDebits_dbo.Currencies_ReturnCurrencyID]
GO
ALTER TABLE [dbo].[VendorDebits]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VendorDebits_dbo.Ledgers_CreditLedgerID] FOREIGN KEY([CreditLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[VendorDebits] CHECK CONSTRAINT [FK_dbo.VendorDebits_dbo.Ledgers_CreditLedgerID]
GO
ALTER TABLE [dbo].[VendorDebits]  WITH CHECK ADD  CONSTRAINT [FK_dbo.VendorDebits_dbo.Ledgers_DebitLedgerID] FOREIGN KEY([DebitLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[VendorDebits] CHECK CONSTRAINT [FK_dbo.VendorDebits_dbo.Ledgers_DebitLedgerID]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Vendors_dbo.Currencies_CurrencyID] FOREIGN KEY([CurrencyID])
REFERENCES [dbo].[Currencies] ([PkCurrencyId])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_dbo.Vendors_dbo.Currencies_CurrencyID]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Vendors_dbo.Ledgers_CustomerLedgerID] FOREIGN KEY([CustomerLedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_dbo.Vendors_dbo.Ledgers_CustomerLedgerID]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Vendors_dbo.Ledgers_LedgerID] FOREIGN KEY([LedgerID])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_dbo.Vendors_dbo.Ledgers_LedgerID]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Vendors_dbo.Ledgers_SupplierLedgerID1] FOREIGN KEY([SupplierLedgerID1])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_dbo.Vendors_dbo.Ledgers_SupplierLedgerID1]
GO
ALTER TABLE [dbo].[Vendors]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Vendors_dbo.Ledgers_SupplierLedgerID2] FOREIGN KEY([SupplierLedgerID2])
REFERENCES [dbo].[Ledgers] ([PkLedgerId])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_dbo.Vendors_dbo.Ledgers_SupplierLedgerID2]
GO
