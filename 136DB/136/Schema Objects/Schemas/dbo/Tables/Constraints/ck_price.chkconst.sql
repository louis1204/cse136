﻿/****** Object:  Check [ck_price]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  Check [ck_price]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[product_variation]  WITH CHECK ADD  CONSTRAINT [ck_price] CHECK  (([price]>=(0)))





GO
ALTER TABLE [dbo].[product_variation] CHECK CONSTRAINT [ck_price]

