-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_pv] 
	-- Add the for the stored procedure here
	@product_id int, 
	@product_brand_id int,
	@product_cutting_id int,
	@product_color_id int,
	@product_type_id int,
	@sex char(1),
	@size char(3),
	@stock int,
	@price float,
	@condition char(1),
	@product_variation_id_output int output
	
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
	from product
	
	select @product_brand_id_count = count(brand_id)
	from brand
	
	select @product_cutting_id_count = count(product_cutting_id)
	from product_cutting
	
	select @product_color_id_count = count(product_color_id)
	from product_color
	
	select @product_type_id_count = count(product_type_id)
	from product_type
	
	if(@product_id <= 0 or @product_id > @product_id_count)
		begin
			RAISERROR ('Error while trying to create a product variation. Product id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	
	if(@product_brand_id <= 0 or @product_brand_id > @product_brand_id_count)
		begin
			RAISERROR ('Error while trying to create a product variation. Product brand id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@product_cutting_id <= 0 or @product_cutting_id > @product_cutting_id_count)
		begin
			RAISERROR ('Error while trying to create a product variation. Product cutting id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@product_color_id <= 0 or @product_color_id > @product_color_id_count)
		begin
			RAISERROR ('Error while trying to create a product variation. Product color id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@product_type_id <= 0 or @product_type_id > @product_type_id_count)
		begin
			RAISERROR ('Error while trying to create a product variation. Product type id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@sex not in ('F','M','U'))
		begin
			RAISERROR ('Error while trying to create a product variation. Sex is not F, M, or U', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@size not in ('XS','S','M','L','XL','XXL'))
		begin
			RAISERROR ('Error while trying to create a product variation. Size is not in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@stock < 0)
		begin
			RAISERROR ('Error while trying to create a product variation. Stock is < 0', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@price < 0)
		begin
			RAISERROR ('Error while trying to create a product variation. Price is < 0', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	if(@condition not in ('a', 's', 'd'))
		begin
			RAISERROR ('Error while trying to create a product variation. Condition does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	
	SELECT	@product_variation_id_output = -1
	begin try 
		begin tran
			select	@product_id, 
					@product_brand_id,
					@product_cutting_id,
					@product_color_id,
					@product_type_id,
					@sex,
					@size,
					@stock,
					@price,
					@condition
			
			insert product_variation
			(
					product_id,
					product_brand_id,
					product_cutting_id,
					product_color_id,
					product_type_id,
					sex,
					size,
					stock,
					price,
					condition
			)

			select
				@product_id, 
				@product_brand_id,
				@product_cutting_id,
				@product_color_id,
				@product_type_id,
				@sex,
				@size,
				@stock,
				@price,
				@condition
			
			commit

			-- return id just inserted --
			set @product_variation_id_output = scope_identity();
			select * from product_variation

	end try
			begin catch
					IF (@@TRANCOUNT > 0)
						rollback

					RAISERROR ('Error while trying to create a product_variation.', -- Message text.
								   16, -- Severity.
								   1 -- State.
								   );				
			end catch
END





