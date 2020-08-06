CREATE TABLE [dbo].[Customer]
(
	[CustomerKey]		BIGINT NOT NULL 
		CONSTRAINT PK_Customer
			PRIMARY KEY CLUSTERED
,	[CustomerName]		VARCHAR(50) NOT NULL
)
