-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_orders] 
	@order_id int
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
	
	if(@count = 0)
		begin
			RAISERROR ('Error while trying to create a order item. Order id does not exist', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end		
	else 
		begin

			--declare the cursor to fetch data from flat_table
			declare curs1 cursor
			for
			select
					product_variation_id,
					quantity
			
			from
					order_item
			where condition = 'a' and order_id = @order_id
					
			open curs1
			
			--point the cursor to the flat table columns
			fetch next from curs1 into 			
					@product_variation_id,
					@quantity
					

			--while we have not reached the end of the flat table, fetch the data
			while(@@FETCH_STATUS = 0)
			begin
				
				-- update stock level --
				update product_variation
					set stock += @quantity
					where product_variation_id = @product_variation_id
					
				-- update order item only item has not been mark as deleted --
				update order_item
					set condition = 'd'
					where order_id = @order_id and 
						product_variation_id = @product_variation_id
						
				fetch next from curs1 into 			
						@product_variation_id,
						@quantity
					
			end

			-- close the cursor
			close curs1
			deallocate curs1
			

			-- update orders --
			update orders
				set condition ='d'
				where condition = 'a' and order_id = @order_id
							  
		end
	
	select * from orders where order_id = @order_id
	select * from order_item where order_id = @order_id
	select * from product_variation where product_variation_id in(
		select product_variation_id from order_item where order_id = @order_id )
	
END





