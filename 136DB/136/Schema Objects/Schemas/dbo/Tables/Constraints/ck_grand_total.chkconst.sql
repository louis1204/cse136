/****** Object:  Check [ck_grand_total]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  Check [ck_grand_total]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [ck_grand_total] CHECK  (([grand_total]>(0)))





GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [ck_grand_total]

