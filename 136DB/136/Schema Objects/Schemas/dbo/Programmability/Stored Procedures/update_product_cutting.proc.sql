-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_product_cutting] 
	-- Add the parameters for the stored procedure here
	@product_cutting_id int,
	@product_cutting_name varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @product_cutting_id_count int,
			@name_duplicate_count int
	
	select @name_duplicate_count = @@rowcount(select product_cutting_name from product_cutting where lower(@product_cutting_name) = lower(product_cutting_name))
	
	select @product_cutting_id_count = count(product_cutting_id)
	from product_cutting
	
	if(@product_cutting_id <= 0 or @product_cutting_id > @product_cutting_id_count)
		begin
			RAISERROR ('Error while trying to update brand. Cutting id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else
	
	if(@name_duplicate_count > 0)
		begin
			RAISERROR ('Error while trying to update brand. Cutting name is already defined', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	
	
	begin try
		-- inside the "try" block, add the "begin transaction" and "commit"
		begin tran
			-- Insert statements for procedure here
			update product_cutting
			
			set product_cutting_name = @product_cutting_name
			
			where product_cutting_id = @product_cutting_id
		commit
	end try
	
	begin catch
		IF (@@TRANCOUNT > 0)
		    rollback

			RAISERROR ('Error while trying to update product cutting.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
	end catch
END





