-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[update_customer]
	-- Add the parameters for the stored procedure here
	@customer_id int,
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
	@ownhouse float
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @count int

	SELECT @count = COUNT(customer_id) FROM customer WHERE customer_id = @customer_id
	IF (@count = 0)
		BEGIN
			RAISERROR ('cannot update customer. customer_id does not exist', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE IF (@age <= 0 OR @age >= 200)
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
					UPDATE customer
				
					SET
						first_name = @first_name,
						last_name = @last_name,
						address1 = @address1,
						city = @city,
						state = @state,
						zip = @zip,
						age = @age, -- 0~200
						gender = @gender, -- F, M, U
						hobby = @hobby,
						income = @income, -- >=0
						children = @children, -- >=0 && <=20
						degree = @degree, -- None, High School, Partial High School, Bachelors, Partial College, Graduate Degree
						ownHouse = @ownhouse
					
					WHERE customer_id = @customer_id
					
					set @customer_id = SCOPE_IDENTITY();
				commit
			end try
			begin catch
				if(@@trancount > 0)
					rollback
				RAISERROR ('cannot update user.', -- Message text.
					   16, -- Severity.
					   1 -- State.
					   );	
			end catch
		END
		select * from customer where customer_id = @customer_id	
END





