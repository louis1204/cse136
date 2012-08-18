CREATE TABLE [dbo].[order_item](
	[order_id] [int] NOT NULL,
	[product_variation_id] [int] IDENTITY(1,1) NOT NULL,
	[tax] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[sale_price] [float] NOT NULL,
	[condition] [char](1) NOT NULL,
 CONSTRAINT [PK_order_item] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_variation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]





