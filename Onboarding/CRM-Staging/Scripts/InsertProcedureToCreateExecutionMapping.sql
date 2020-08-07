-- get the folder_id
SELECT *
FROM [SSISDB].[catalog].[folders]
WHERE [name] = 'CRM';
-- [folder_id] = 20004

-- get the project_id
SELECT *
FROM [SSISDB].[catalog].[projects]
WHERE [folder_id] = 20004;
-- [project_id] = 40007

-- get the environment reference id
SELECT *
FROM [SSISDB].[catalog].[environment_references]
WHERE [project_id] = 40007;
-- [reference_id] = 30005


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
,	30005	-- [environment_id]
);




SELECT *
FROM [dbo].[ProcedureToCreateExecutionMapping]




