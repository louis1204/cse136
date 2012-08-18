-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_pv] 
	-- Add the parameters for the stored procedure here
	@product_variation_id int

AS
BEGIN
	declare @count int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select @count = count(product_variation_id)
	from product_variation
	where product_variation_id = @product_variation_id
		and condition = 'a'
	
	if(@count = 0)
		begin
			RAISERROR ('Error while trying to delete a product variation. Product variation id does not exist', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else
	begin try
		-- inside the "try" block, add the "begin transaction" and "commit"
		begin tran
			-- Insert statements for procedure here
			update product_variation
			set 
				condition = 'd'
				
			where product_variation_id = @product_variation_id
			select * from product_variation where product_variation_id = @product_variation_id
		commit
	end try
	begin catch
		IF (@@TRANCOUNT > 0)
		    rollback

			RAISERROR ('Error while trying to delete product_variation.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
	end catch
	
END





