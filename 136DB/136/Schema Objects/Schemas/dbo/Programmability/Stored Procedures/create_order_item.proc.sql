-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_order_item] 
	@order_id int,
	@product_variation_id int,
	@tax float,
	@quantity int,
	@condition char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @sale_price float,
			@stock int,
			@count int,
			@count2 int
  
	-- insert orders --
	
	select  @stock = stock, 
			@sale_price = price 
		from 
			product_variation 
		where 
			product_variation_id = @product_variation_id
			
	select @count = COUNT(order_id)
		from
			orders
		where order_id = @order_id	
		
	select @count2 = COUNT(order_id)
		from
			order_item
		where order_id = @order_id and product_variation_id = @product_variation_id	
	
	if(@count = 0)
		begin
			RAISERROR ('Error while trying to create a order item. Order id does not exist', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end	
	else if(@count2 > 0)
		begin
			RAISERROR ('Error while trying to create a order item. Duplicate item entry', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end					
	else if(@stock is null)
		begin
			RAISERROR ('Error while trying to create a order item. Product does not exist', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else if(@stock < @quantity)
		-- logic error --
		begin
			RAISERROR ('Error while trying to create a order item. Quantity level > Stock level', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );					
		end
	
	else
		begin
			-- insert order item --
			begin try 
				begin tran	

					insert order_item(
						order_id,
						product_variation_id,
						tax,
						quantity,
						sale_price,
						condition)
					select
						@order_id,
						@product_variation_id,
						@tax,
						@quantity,
						@sale_price,
						@condition
					
					-- update stock --

					update product_variation
						set stock -= @quantity
						where product_variation_id = @product_variation_id

					--update subtotal/grandtotal/taxtotal --						
						
					update orders
						set subtotal += cast((@sale_price * @quantity) as float),
							tax_total += cast((@sale_price * @quantity * @tax) as float),
							grand_total += CAST((@sale_price * @quantity + @sale_price * @quantity * @tax) as float)
						where condition = 'a' and order_id = @order_id

					commit		
					
				end try
			begin catch
					IF (@@TRANCOUNT > 0)
						rollback

					RAISERROR ('Error while trying to create a order item.', -- Message text.
								   16, -- Severity.
								   1 -- State.
								   );				
			end catch

	end
	
	select * from orders where order_id = @order_id
	select * from order_item where order_id = @order_id
	select * from product_variation where product_variation_id = @product_variation_id
	
END





