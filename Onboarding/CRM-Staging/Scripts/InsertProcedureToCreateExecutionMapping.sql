-- get the folder id
SELECT *
FROM [SSISDB].[catalog].[folders]
WHERE [name] = 'CRM';
-- [folder_id] = 2

-- get the environment id
SELECT *
FROM [SSISDB].[catalog].[environments]
WHERE [folder_id] = 2;
-- [environment_id] = 3


INSERT [dbo].[ProcedureToCreateExecutionMapping] (
	[ProcedureName]		
,	[FOLDER_NAME]		
,	[PROJECT_NAME]		
,	[PACKAGE_NAME]		
,	[REFERENCE_ID]		
)
VALUES (
	N'ExecuteLoadCustomersSSISPackage'
,	N'CRM'
,	N'CRM_OnBoarding'
,	N'LoadCustomers.dtsx'
,	3	-- [environment_id]
);