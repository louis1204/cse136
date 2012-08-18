-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_order_item] 
	@order_id int,
	@product_variation_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare 
			@stock int,
			@sale_price float,
			@old_quantity int,
			@old_tax float,
			@count int,
			@count2 int
			
	select @count = COUNT(order_id)
		from
			orders
		where order_id = @order_id	and
			  condition = 'a'
		
	select @count2 = COUNT(order_id)
		from
			order_item
		where order_id = @order_id and product_variation_id = @product_variation_id	and
			  condition = 'a'

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
	else 
		begin
			
					-- return stock level --
					update product_variation
						set stock += @old_quantity
						where product_variation_id = @product_variation_id
					
					-- mark as delete --
					update order_item
						set condition = 'd'
						where order_id = @order_id and
							  product_variation_id = @product_variation_id and
							  condition = 'a'
					
					-- update subtotal taxtotal grandtotal --
					update orders
						set subtotal -= cast((@sale_price * @old_quantity) as float),
							tax_total -= cast((@sale_price * @old_quantity * @old_tax) as float),
							grand_total -= CAST((@sale_price * @old_quantity + @sale_price * @old_quantity * @old_tax) as float)
						where condition = 'a' and order_id = @order_id
							  
		end
	
	select * from orders where order_id = @order_id
	select * from order_item where order_id = @order_id
	select * from product_variation where product_variation_id = @product_variation_id
	
END





