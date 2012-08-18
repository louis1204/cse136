-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[update_order_item] 
	@order_id int,
	@product_variation_id int,
	@quantity int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare 
			@stock int,
			@sale_price float,
			@old_quantity int,
			@old_tax int,
			@count int,
			@count2 int
			
	declare @new_quantity int
			
	select @count = COUNT(order_id)
		from
			orders
		where order_id = @order_id	
		
	select @count2 = COUNT(order_id)
		from
			order_item
		where order_id = @order_id and product_variation_id = @product_variation_id	
				
  
	-- retrieve price and stock --

	select  @stock = stock 
		from 
			product_variation 
		where 
			product_variation_id = @product_variation_id
	
	-- retrieve old quantity --
	select 	
			@old_quantity = quantity,
			@sale_price = sale_price,
			@old_tax = tax
			from order_item
			where 
				order_id = @order_id and
				product_variation_id = @product_variation_id

	-- compare with new quantity --
	
	if(@count = 0)
		begin
			RAISERROR ('Error while trying to create a order item. Order id does not exist', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end	
	else if(@count2 = 0)
		begin
			RAISERROR ('Error while trying to create a order item. Order item does not exist', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end		
	else if(@old_quantity < @quantity)
		begin
			-- grab some more from stock
			if( (@quantity - @old_quantity) > @stock )
				begin
					RAISERROR ('Error while trying to update a order item. Quantity level > Stock level', -- Message text.
								   16, -- Severity.
								   1 -- State.
								   );						
				end
			else
				begin
					-- safe to do update --
					
					set @new_quantity = @quantity - @old_quantity;
					
					update product_variation
						set stock -= @new_quantity
						where product_variation_id = @product_variation_id
					
					update order_item
						set quantity = @quantity
						where order_id = @order_id and
							  product_variation_id = @product_variation_id and
							  condition = 'a'
							  
					update orders
						set subtotal += cast((@sale_price * @new_quantity) as float),
							tax_total += cast((@sale_price * @new_quantity * @old_tax) as float),
							grand_total += CAST((@sale_price * @new_quantity + @sale_price * @new_quantity * @old_tax) as float)
						where condition = 'a' and order_id = @order_id
							  
				end
		end
	else if(@old_quantity > @quantity)
		begin
			-- return some to stock
			
					set @new_quantity = @old_quantity - @quantity;
					
					update product_variation
						set stock += @new_quantity
						where product_variation_id = @product_variation_id
					
					update order_item
						set quantity = @new_quantity
						where order_id = @order_id and
							  product_variation_id = @product_variation_id and
							  condition = 'a'
							  
					update orders
						set subtotal -= cast((@sale_price * @new_quantity) as float),
							tax_total -= cast((@sale_price * @new_quantity * @old_tax) as float),
							grand_total -= CAST((@sale_price * @new_quantity + @sale_price * @new_quantity * @old_tax) as float)
						where condition = 'a' and order_id = @order_id			
			
		end			

	
	select * from orders where order_id = @order_id
	select * from order_item where order_id = @order_id
	select * from product_variation where product_variation_id = @product_variation_id
	
END





