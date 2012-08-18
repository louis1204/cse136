using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _136MVC.Models
{
    public class ProductVariationList
    {
        List<ProductVariationInfo> product_variations = new List<ProductVariationInfo>();

        public ProductVariationList()
        {
            for (int i = 0; i < 10; i++)
            {
                product_variations.Add(new ProductVariationInfo(i,i,i,i,i,i,new char[1]{'M'},"XL",i,(float)i,new char[1]{'a'}));
            }
        }

        public List<ProductVariationInfo> GetProductVariationList()
        {
            return product_variations;
        }

        public ProductVariationInfo GetProductVariationDetail(int producuct_variation_id)
        {
            return product_variations[producuct_variation_id];
        }
    }
}