CREATE TABLE [dbo].[customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](255) NOT NULL,
	[last_name] [nvarchar](255) NOT NULL,
	[address1] [nvarchar](255) NOT NULL,
	[city] [nvarchar](255) NOT NULL,
	[state] [nvarchar](255) NOT NULL,
	[zip] [float] NOT NULL,
	[age] [float] NOT NULL,
	[gender] [nvarchar](255) NOT NULL,
	[hobby] [nvarchar](255) NOT NULL,
	[income] [float] NOT NULL,
	[children] [float] NOT NULL,
	[degree] [nvarchar](255) NOT NULL,
	[ownHouse] [float] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]





