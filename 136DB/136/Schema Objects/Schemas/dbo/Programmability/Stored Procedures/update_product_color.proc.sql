-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_product_color] 
	-- Add the parameters for the stored procedure here
	@product_color_id int,
	@product_color_name varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @color_id_count int,
			@name_duplicate_count int
	
	select @name_duplicate_count = @@rowcount(select product_color_name from product_color where lower(@product_color_name) = lower(product_color_name))
	
	select @color_id_count = count(product_color_id)
	from product_color
	
	if(@product_color_id <= 0 or @product_color_id > @color_id_count)
		begin
			RAISERROR ('Error while trying to update brand. Color id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else
	
	if(@name_duplicate_count > 0)
		begin
			RAISERROR ('Error while trying to update color. Color name is already defined', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	
	
	begin try
		-- inside the "try" block, add the "begin transaction" and "commit"
		begin tran
			-- Insert statements for procedure here
			update product_color
			
			set product_color_name = @product_color_name
			
			where product_color_id = @product_color_id
		commit
	end try
	
	begin catch
		IF (@@TRANCOUNT > 0)
		    rollback

			RAISERROR ('Error while trying to update product color.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
	end catch
END





