CREATE TABLE [AP].[Vendor]
(
	[VendorId]			BIGINT NOT NULL 
		CONSTRAINT PK_Vendor 
			PRIMARY KEY CLUSTERED
,	[VendorName]		VARCHAR(50) NOT NULL
,	[BankRoutingNumber]	BIGINT NULL
,	[BankAccountNumber]	BIGINT NULL
,	[LoadDate]			SMALLDATETIME NOT NULL
		CONSTRAINT DF_Vendor_LoadDate
			DEFAULT GETDATE()
)
