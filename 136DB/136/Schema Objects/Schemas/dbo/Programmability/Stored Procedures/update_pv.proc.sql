-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_pv] 
	-- Add the parameters for the stored procedure here
	@product_variation_id int,
	@product_id int, 
	@product_brand_id int,
	@product_cutting_id int,
	@product_color_id int,
	@product_type_id int,
	@sex char(1),
	@size char(3),
	@stock int,
	@price float,
	@condition char(1)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @product_variation_id_count int, 
			@product_id_count int,
			@product_brand_id_count int,
			@product_cutting_id_count int,
			@product_color_id_count int,
			@product_type_id_count int
			
	select @product_variation_id_count = count(product_variation_id)
	from product_variation

	select @product_id_count = count(product_id)
	from product_variation
		
	select @product_brand_id_count = count(product_brand_id)
	from product_variation
	
	select @product_cutting_id_count = count(product_cutting_id)
	from product_variation
	
	select @product_color_id_count = count(product_color_id)
	from product_variation
	
	select @product_type_id_count = count(product_type_id)
	from product_variation

	if(@product_variation_id <= 0 or @product_variation_id > @product_variation_id_count)
		begin
			RAISERROR ('Error while trying to update a product variation. Product variation id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else
	if(@product_id <= 0 or @product_id > @product_id_count)
		begin
			RAISERROR ('Error while trying to update a product variation. Product id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	
	if(@product_brand_id <= 0 or @product_brand_id > @product_brand_id_count)
		begin
			RAISERROR ('Error while trying to update a product variation. Product brand id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@product_cutting_id <= 0 or @product_cutting_id > @product_cutting_id_count)
		begin
			RAISERROR ('Error while trying to update a product variation. Product cutting id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@product_color_id <= 0 or @product_color_id > @product_color_id_count)
		begin
			RAISERROR ('Error while trying to update a product variation. Product color id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@product_type_id <= 0 or @product_type_id > @product_type_id_count)
		begin
			RAISERROR ('Error while trying to update a product variation. Product type id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@sex not in ('F','M','U'))
		begin
			RAISERROR ('Error while trying to update a product variation. Sex is not F, M, or U', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@size not in ('XS','S','M','L','XL','XXL'))
		begin
			RAISERROR ('Error while trying to update a product variation. Size is not in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@stock < 0)
		begin
			RAISERROR ('Error while trying to update a product variation. Stock is < 0', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@price < 0)
		begin
			RAISERROR ('Error while trying to update a product variation. Price is < 0', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@condition not in ('a', 's', 'd'))
		begin
			RAISERROR ('Error while trying to update a product variation. Condition does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	begin try
		-- inside the "try" block, add the "begin transaction" and "commit"
		begin tran
			-- Insert statements for procedure here
			update product_variation
			set product_id = @product_id,
				product_brand_id = @product_brand_id,
				product_cutting_id = @product_cutting_id,
				product_color_id = @product_color_id,
				product_type_id = @product_type_id,
				sex = @sex,
				size = @size,
				stock = @stock,
				price = @price,
				condition = @condition
				
			where product_variation_id = @product_variation_id
	
			select * from product_variation 
			where product_variation_id = @product_variation_id
		commit
	end try
	begin catch
		IF (@@TRANCOUNT > 0)
		    rollback

			RAISERROR ('Error while trying to update product_variation.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
	end catch
	
END





