/****** Object:  Check [ck_age]    Script Date: 08/16/2012 00:04:57 ******/
/****** Object:  Check [ck_age]    Script Date: 08/16/2012 18:09:19 ******/
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [ck_age] CHECK  (([age]>(0) AND [age]<(200)))





GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [ck_age]

