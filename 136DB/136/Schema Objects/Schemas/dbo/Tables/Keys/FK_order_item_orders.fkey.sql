/****** Object:  ForeignKey [FK_order_item_orders]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  ForeignKey [FK_order_item_orders]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [FK_order_item_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])





GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [FK_order_item_orders]

