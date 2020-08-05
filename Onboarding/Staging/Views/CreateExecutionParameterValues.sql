CREATE VIEW [dbo].[CreateExecutionParameterValues]
AS 
	SELECT 
	 	[FOLDER_NAME]		
	,	[PROJECT_NAME]		
	,	[PACKAGE_NAME]		
	,	[REFERENCE_ID]		
	FROM [dbo].[ProcedureToCreateExecutionMapping];

