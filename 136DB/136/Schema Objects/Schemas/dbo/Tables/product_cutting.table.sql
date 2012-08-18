CREATE TABLE [dbo].[product_cutting](
	[product_cutting_id] [int] IDENTITY(1,1) NOT NULL,
	[product_cutting_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_product_cutting] PRIMARY KEY CLUSTERED 
(
	[product_cutting_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]





