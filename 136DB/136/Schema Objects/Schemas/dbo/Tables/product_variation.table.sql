CREATE TABLE [dbo].[product_variation](
	[product_variation_id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[product_id] [int] NOT NULL,
	[product_brand_id] [int] NOT NULL,
	[product_cutting_id] [int] NOT NULL,
	[product_color_id] [int] NOT NULL,
	[product_type_id] [int] NOT NULL,
	[sex] [char](1) NOT NULL,
	[size] [char](3) NOT NULL,
	[stock] [int] NOT NULL,
	[price] [float] NOT NULL,
	[condition] [char](1) NOT NULL,
 CONSTRAINT [PK_product_variation] PRIMARY KEY CLUSTERED 
(
	[product_variation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]





