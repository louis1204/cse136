/****** Object:  Check [ck_gender]    Script Date: 08/16/2012 00:04:57 ******/
/****** Object:  Check [ck_gender]    Script Date: 08/16/2012 18:09:19 ******/
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [ck_gender] CHECK  (([gender]='U' OR [gender]='M' OR [gender]='F'))





GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [ck_gender]

