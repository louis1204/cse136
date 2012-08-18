/****** Object:  Check [ck_quantity]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  Check [ck_quantity]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [ck_quantity] CHECK  (([quantity]>(0)))





GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [ck_quantity]

