CREATE TABLE [dbo].[users](
	[users_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[username] [varchar](200) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[user_level] [char](1) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[last_login] [datetime] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[condition] [char](1) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[users_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]





