/****** Object:  ForeignKey [FK_product_variation_product]    Script Date: 08/16/2012 00:04:59 ******/
/****** Object:  ForeignKey [FK_product_variation_product]    Script Date: 08/16/2012 18:09:21 ******/
ALTER TABLE [dbo].[product_variation]  WITH CHECK ADD  CONSTRAINT [FK_product_variation_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])





GO
ALTER TABLE [dbo].[product_variation] CHECK CONSTRAINT [FK_product_variation_product]

