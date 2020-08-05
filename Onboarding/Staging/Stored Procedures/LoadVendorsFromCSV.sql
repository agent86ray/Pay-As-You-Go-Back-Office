CREATE PROCEDURE [AP].[LoadVendorsFromCSV]
	@P_CSV_FILE_NAME	VARCHAR(256)
AS
BEGIN
	DECLARE
		[ProcedureName] = @PROCEDURE_NAME;	SYSNAME
	, 	@FOLDER_NAME	NVARCHAR(128)	
	,	@PROJECT_NAME	NVARCHAR(128)	
	,	@PACKAGE_NAME	NVARCHAR(128)	
	,	@REFERENCE_ID	BIGINT	
	,	@EXECUTION_ID	BIGINT;

	SET @PROCEDURE_NAME = OBJECT_NAME(@@PROCID);

	SELECT 
	 	@FOLDER_NAME  = [FOLDER_NAME]		
	,	@PROJECT_NAME = [PROJECT_NAME]		
	,	@PACKAGE_NAME = [PACKAGE_NAME]		
	,	@REFERENCE_ID = [REFERENCE_ID]	
	FROM [dbo].[ProcedureToCreateExecutionMapping]
	WHERE [ProcedureName] = @PROCEDURE_NAME;

	IF @@ROWCOUNT <> 1
	BEGIN
		-- throw error
		RETURN;
	END


/*
	EXEC SSISDB.catalog.create_execution 
		@folder_name = N''
	,	@project_name = N''
	,	@package_name = N''
	,	@reference_id = 1
	,	@execution_id = @EXECUTION_ID OUTPUT;
*/
END
