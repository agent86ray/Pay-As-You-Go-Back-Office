INSERT [dbo].[ProcedureToCreateExecutionMapping] (
	[ProcedureName]		
,	[FOLDER_NAME]		
,	[PROJECT_NAME]		
,	[PACKAGE_NAME]		
,	[REFERENCE_ID]		
)
VALUES (
	N'LoadVendorsFromCSV'
,	N'OnBoarding'
,	N'Accounts-Payable'
,	N'Load-Vendors.dtsx'
,	1	-- fill in correct number
);
