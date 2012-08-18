-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_product_type] 
	-- Add the parameters for the stored procedure here
	@product_type_id int,
	@product_type_name varchar(30)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @product_type_id_count int,
			@name_duplicate_count int
	
	select @name_duplicate_count = @@rowcount(select product_type_name from product_type where lower(@product_type_name) = lower(product_type_name))
	
	select @product_type_id_count = count(product_type_id)
	from product_type
	
	if(@product_type_id <= 0 or @product_type_id > @product_type_id_count)
		begin
			RAISERROR ('Error while trying to update product_type. product_type id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else
	
	if(@name_duplicate_count > 0)
		begin
			RAISERROR ('Error while trying to update product_type. product_type name is already defined', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	
	
	begin try
		-- inside the "try" block, add the "begin transaction" and "commit"
		begin tran
			-- Insert statements for procedure here
			update product_type
			
			set product_type_name = @product_type_name
			
			where product_type_id = @product_type_id
		commit
	end try
	
	begin catch
		IF (@@TRANCOUNT > 0)
		    rollback

			RAISERROR ('Error while trying to update product type.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
	end catch
END





