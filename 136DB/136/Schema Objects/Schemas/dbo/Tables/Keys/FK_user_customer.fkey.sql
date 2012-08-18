/****** Object:  ForeignKey [FK_user_customer]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  ForeignKey [FK_user_customer]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_user_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([customer_id])





GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_user_customer]

