-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_orders] 
	@order_id int output,
	@customer_id int,
	@condition char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @create_date datetime = GETDATE(),
			@count int
  
	select @count = count(customer_id) from
	customer
	where customer_id = @customer_id
  
    if(@count = 0)
		begin
					RAISERROR ('Error while trying to create a product. Customer id does not exist', -- Message text.
								   16, -- Severity.
								   1 -- State.
								   );				
		end
    else
		begin
			-- insert orders --
			begin try 
				begin tran	
					select @customer_id, @create_date, @condition
					insert orders(
						customer_id,
						subtotal,
						tax_total,
						grand_total,
						date_created,
						condition)
					select
						@customer_id,
						0,
						0,
						0,
						@create_date,
						@condition
						

					
					commit

					-- return id just inserted --
					SET @order_id = SCOPE_IDENTITY();			
					
				end try
			begin catch
					IF (@@TRANCOUNT > 0)
						rollback

					RAISERROR ('Error while trying to create a product.', -- Message text.
								   16, -- Severity.
								   1 -- State.
								   );				
			end catch
		end
END





