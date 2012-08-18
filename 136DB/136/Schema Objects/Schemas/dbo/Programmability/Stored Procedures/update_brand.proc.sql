-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_brand] 
	-- Add the parameters for the stored procedure here
	@brand_id int,
	@brand_name varchar(60)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @brand_id_count int,
			@name_duplicate_count int
	
	select @name_duplicate_count = @@rowcount(select brand_name from brand where lower(@brand_name) = lower(brand_name))
	
	select @brand_id_count = count(brand_id)
	from brand
	
	if(@brand_id <= 0 or @brand_id > @brand_id_count)
		begin
			RAISERROR ('Error while trying to update brand. Brand id does not fall in range', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else
	
	if(@name_duplicate_count > 0)
		begin
			RAISERROR ('Error while trying to update brand. Brand name is already defined', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );				
		end
	else	

	begin try
		-- inside the "try" block, add the "begin transaction" and "commit"
		begin tran
			-- Insert statements for procedure here
			update brand
			
			set brand_name = @brand_name
			
			where brand_id = @brand_id
		commit
	end try
	
	begin catch
		IF (@@TRANCOUNT > 0)
		    rollback

			RAISERROR ('Error while trying to update brand.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
	end catch
END





