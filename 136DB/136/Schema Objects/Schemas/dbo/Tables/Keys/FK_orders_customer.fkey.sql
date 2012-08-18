/****** Object:  ForeignKey [FK_orders_customer]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  ForeignKey [FK_orders_customer]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])





GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customer]

