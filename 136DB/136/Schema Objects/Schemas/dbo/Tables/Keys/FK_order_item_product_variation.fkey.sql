/****** Object:  ForeignKey [FK_order_item_product_variation]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  ForeignKey [FK_order_item_product_variation]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [FK_order_item_product_variation] FOREIGN KEY([product_variation_id])
REFERENCES [dbo].[product_variation] ([product_variation_id])





GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [FK_order_item_product_variation]

