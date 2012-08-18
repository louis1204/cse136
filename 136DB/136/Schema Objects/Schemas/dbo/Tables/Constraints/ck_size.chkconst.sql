/****** Object:  Check [ck_size]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  Check [ck_size]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[product_variation]  WITH CHECK ADD  CONSTRAINT [ck_size] CHECK  (([size]='XXL' OR [size]='XL' OR [size]='L' OR [size]='M' OR [size]='S' OR [size]='XS'))





GO
ALTER TABLE [dbo].[product_variation] CHECK CONSTRAINT [ck_size]

