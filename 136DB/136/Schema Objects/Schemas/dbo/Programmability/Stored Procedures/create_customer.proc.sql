-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[create_customer]
	-- Add the parameters for the stored procedure here
	@first_name nvarchar(255),
	@last_name nvarchar(255),
	@address1 nvarchar(255),
	@city nvarchar(255),
	@state nvarchar(255),
	@zip float,
	@age float,
	@gender nvarchar(255),
	@hobby nvarchar(255),
	@income float,
	@children float,
	@degree nvarchar(255),
	@ownHouse float,
	@customer_id int output
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF (@age <= 0 OR @age >= 200)
		BEGIN
			RAISERROR ('cannot update customer. invalid age', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE IF (@gender not in ('F', 'M', 'U'))
		BEGIN
			RAISERROR ('cannot update customer. invalid gender', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE IF (@income < 0)
		BEGIN
			RAISERROR ('cannot update customer. invalid income', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE IF (@children < 0 OR @children > 20)
		BEGIN
			RAISERROR ('cannot update customer. invalid number of children', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE IF (@degree not in ('None', 'High School', 'Partial High School', 'Bachelors', 'Partial College', 'Graduate Degree'))
		BEGIN
			RAISERROR ('cannot update customer. invalid degree', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE IF (@ownHouse < 0)
		BEGIN
			RAISERROR ('cannot update customer. invalid number of houses', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE
		BEGIN
			begin try
				begin tran
    -- Insert statements for procedure here
					INSERT 	customer (first_name,
										last_name,
										address1,
										city,
										state,
										zip,
										age,
										gender,
										hobby,
										income,
										children,
										degree,
										ownHouse)
					SELECT 	@first_name,
							@last_name,
							@address1,
							@city,
							@state,
							@zip,
							@age,
							@gender,
							@hobby,
							@income,
							@children,
							@degree,
							@ownHouse
					set @customer_id = SCOPE_IDENTITY();
				commit
			end try
			begin catch
				if(@@trancount > 0)
					rollback
				RAISERROR ('cannot create customer.', -- Message text.
					   16, -- Severity.
					   1 -- State.
					   );	
			end catch
			
		
		END
		
	select * from customer where customer_id = @customer_id	
END





