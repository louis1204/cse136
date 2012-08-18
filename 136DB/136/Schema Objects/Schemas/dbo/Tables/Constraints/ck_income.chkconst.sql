/****** Object:  Check [ck_income]    Script Date: 08/16/2012 00:04:57 ******/
/****** Object:  Check [ck_income]    Script Date: 08/16/2012 18:09:19 ******/
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [ck_income] CHECK  (([income]>=(0)))





GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [ck_income]

