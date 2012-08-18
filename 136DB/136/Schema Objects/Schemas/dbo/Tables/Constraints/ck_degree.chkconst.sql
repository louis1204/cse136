/****** Object:  Check [ck_degree]    Script Date: 08/16/2012 00:04:57 ******/
/****** Object:  Check [ck_degree]    Script Date: 08/16/2012 18:09:19 ******/
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [ck_degree] CHECK  (([degree]='Graduate Degree' OR [degree]='Partial College' OR [degree]='Bachelors' OR [degree]='Partial High School' OR [degree]='High School' OR [degree]='None'))





GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [ck_degree]

