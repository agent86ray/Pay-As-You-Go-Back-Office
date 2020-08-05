CREATE PROCEDURE [AP].[LoadVendorsFromCSV]
	@P_CSV_FILE_NAME	VARCHAR(256)
AS
BEGIN
	DECLARE
		@EXECUTION_ID	BIGINT;

	EXEC SSISDB.catalog.create_execution 
		@folder_name = N''
	,	@project_name = N''
	,	@package_name = N''
	,	@reference_id = 1
	,	@execution_id = @EXECUTION_ID OUTPUT;
END
