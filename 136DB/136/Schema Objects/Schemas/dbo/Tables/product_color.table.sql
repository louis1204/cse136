CREATE TABLE [dbo].[product_color](
	[product_color_id] [int] IDENTITY(1,1) NOT NULL,
	[product_color_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_product_color] PRIMARY KEY CLUSTERED 
(
	[product_color_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]





