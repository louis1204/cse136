-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_product] 
	-- Add the parameters for the stored procedure here
	@product_id int,
	@product_name varchar(255)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @product_id_count int,
			@name_duplicate_count int
	
	select @name_duplicate_count = @@rowcount(select product_name from product where lower(@product_name) = lower(product_name))
	
	select @product_id_count = count(product_id)
	from product
	
	if(@product_id <= 0 or @product_id > @product_id_count)
		begin
			RAISERROR ('Error while trying to update product. Product id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else
	
	if(@name_duplicate_count > 0)
		begin
			RAISERROR ('Error while trying to update brand. Product name is already defined', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	
	begin try
		-- inside the "try" block, add the "begin transaction" and "commit"
		begin tran
			-- Insert statements for procedure here
			update product
			
			set product_name = @product_name
			
			where product_id = @product_id
		commit
	end try
	
	begin catch
		IF (@@TRANCOUNT > 0)
		    rollback

			RAISERROR ('Error while trying to update product.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
	end catch
END





