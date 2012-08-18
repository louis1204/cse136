/****** Object:  Check [ck_saleprice]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  Check [ck_saleprice]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [ck_saleprice] CHECK  (([sale_price]>=(0)))





GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [ck_saleprice]

