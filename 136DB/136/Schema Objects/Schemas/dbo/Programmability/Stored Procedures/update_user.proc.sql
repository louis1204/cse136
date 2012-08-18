-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[update_user]
	-- Add the parameters for the stored procedure here
	@users_id int,
	@customer_id int,
	@password varchar(MAX),
	@email varchar(250)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @count int;
	declare @count2 int;
	declare @count3 int;

	SELECT @count = COUNT(users_id) FROM users WHERE users_id = @users_id
	SELECT @count2 = COUNT(customer_id) FROM customer WHERE customer_id = @customer_id
	SELECT @count3 = COUNT(email) FROM users WHERE lower(email) = lower(@email) and users_id != @users_id
	
    IF (@count = 0)
		BEGIN
			RAISERROR ('cannot update user. users_id does not exist', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE IF (@count2 = 0)
		BEGIN
			RAISERROR ('cannot update user. customer_id does not exist', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE IF (@count3 > 0)
		BEGIN
			RAISERROR ('cannot update user. email exists', -- Message text.
							   16, -- Severity.
							   1 -- State.
							   );		
		END
	ELSE
		BEGIN
			begin try
				begin tran
    -- Insert statements for procedure here
					UPDATE users
						
					SET
						customer_id = @customer_id,
						password = @password,
						email = lower(@email)
					
					WHERE users_id = @users_id
					
					set @users_id = SCOPE_IDENTITY();
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
		select * from users where users_id = @users_id	
END





