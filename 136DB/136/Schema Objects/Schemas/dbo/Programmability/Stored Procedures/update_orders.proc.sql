-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_orders] 
	@order_id int,
	@condition char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare 
			@product_variation_id int,
			@quantity int,
			@count int
			
	select @count = COUNT(order_id)
		from
			orders
		where order_id = @order_id	
			and condition ='a'

	-- compare with new quantity --
	
	if(@condition not in ('a','s'))
		begin
			RAISERROR ('Error while trying to update a order item. Condition must be either "a" or "s"', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end		
	else 
		begin

			-- update orders --
			update orders
				set condition =@condition
				where order_id = @order_id
							  
		end
	
	select * from orders where order_id = @order_id
	select * from order_item where order_id = @order_id
	select * from product_variation where product_variation_id in(
		select product_variation_id from order_item where order_id = @order_id )
	
END





