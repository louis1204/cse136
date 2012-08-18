-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[delete_user]
	-- Add the parameters for the stored procedure here
	@users_id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @count int
	
	SELECT @count = COUNT(users_id) from users where users_id = @users_id AND condition = 'a'
    IF (@count = 0)
		BEGIN
			RAISERROR ('users_id does not exist', -- Message text.
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
						condition = 'd'
					
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

		select * from users where users_id = @users_id
		END
	
END





