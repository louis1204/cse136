-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[create_user]
	-- Add the parameters for the stored procedure here
	@username varchar(200),
	@password varchar(MAX),
	@customer_id int,
	@users_id int output,
	@email varchar(250),
	@user_level char(1)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @count int,
			@count2 int,
			@count3 int,
			@last_login datetime = GETDATE(),
			@create_date datetime = GETDATE()
	
	SELECT @count = COUNT(customer_id) FROM customer WHERE customer_id = @customer_id
	SELECT @count2 = COUNT(users_id) from users where lower(username) = lower(@username)
	SELECT @count3 = COUNT(users_id) from users where lower(email) = lower(@email)
	IF (@count = 0)
		BEGIN
			RAISERROR ('cannot create user, customer_id does not exist', -- Message text.
					   16, -- Severity.
					   1 -- State.
					   );		
		END
	ELSE if (@count2 > 0)
		begin
			RAISERROR ('cannot create user, duplicate username', -- Message text.
					   16, -- Severity.
					   1 -- State.
					   );	
		end
	ELSE if (@count3 > 0)
		begin
			RAISERROR ('cannot create user, email exists', -- Message text.
					   16, -- Severity.
					   1 -- State.
					   );
		end
	ELSE IF (@user_level not in ('u', 'a'))
		begin
			RAISERROR ('cannot create user, invalid user level (u or a)', -- Message text.
					   16, -- Severity.
					   1 -- State.
					   );
		end
	ELSE
		BEGIN
			begin try
				begin tran
    -- Insert statements for procedure here
				INSERT users (customer_id,
								username,
								password,
								user_level,
								email,
								last_login,
								create_date,
								condition)
				SELECT @customer_id,
						@username,
						@password,
						@user_level,
						@email,
						@last_login,
						@create_date,
						'a'
				set @users_id = SCOPE_IDENTITY();
				commit
			end try
			begin catch
				if(@@trancount > 0)
					rollback
				RAISERROR ('cannot create user.', -- Message text.
					   16, -- Severity.
					   1 -- State.
					   );	
			end catch
			
		
		END
		
	select * from users where users_id = @users_id	
END





