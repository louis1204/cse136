/****** Object:  Check [ck_sex]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  Check [ck_sex]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[product_variation]  WITH CHECK ADD  CONSTRAINT [ck_sex] CHECK  (([sex]='M' OR [sex]='F' OR [sex]='U'))





GO
ALTER TABLE [dbo].[product_variation] CHECK CONSTRAINT [ck_sex]

