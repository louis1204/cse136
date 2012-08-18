/****** Object:  Check [ck_children]    Script Date: 08/16/2012 00:04:57 ******/
/****** Object:  Check [ck_children]    Script Date: 08/16/2012 18:09:19 ******/
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [ck_children] CHECK  (([children]>=(0) AND [children]<=(20)))





GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [ck_children]

