CREATE PROCEDURE [dbo].[ExecuteLoadCustomersSSISPackage]
	@CUSTOMER_FLAT_FILE_NAME	NVARCHAR(50)
,	@EXECUTION_ID				BIGINT OUTPUT
AS
BEGIN
	/*
		-- execute the SSIS package via the stored procedure
		DECLARE @P_EXECUTION_ID	BIGINT;

		EXEC [dbo].[ExecuteLoadCustomersSSISPackage]
			@CUSTOMER_FLAT_FILE_NAME = N''
		,	@EXECUTION_ID = @P_EXECUTION_ID OUTPUT;

		SELECT @P_EXECUTION_ID; 

	*/
	DECLARE
		@PROCEDURE_NAME		SYSNAME
	, 	@FOLDER_NAME		NVARCHAR(128)	
	,	@PROJECT_NAME		NVARCHAR(128)	
	,	@PACKAGE_NAME		NVARCHAR(128)	
	,	@REFERENCE_ID		BIGINT;	

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

	EXEC [SSISDB].[catalog].[create_execution] 
		@folder_name = @FOLDER_NAME
	,	@project_name = @PROJECT_NAME
	,	@package_name = @PACKAGE_NAME
	,	@reference_id = @REFERENCE_ID
	,	@execution_id = @EXECUTION_ID OUTPUT;

	-- set value for Customer_Flat_File_Name package parameter
	EXEC [SSISDB].[catalog].[set_execution_parameter_value]
		@execution_id = @EXECUTION_ID  
    ,   @object_type = 30	-- package parameter  
    ,   @parameter_name = N'Customer_Flat_File_Name'  
    ,   @parameter_value = @CUSTOMER_FLAT_FILE_NAME;
	
	EXEC [SSISDB].[catalog].[start_execution] 
		@execution_id = @EXECUTION_ID;

END
