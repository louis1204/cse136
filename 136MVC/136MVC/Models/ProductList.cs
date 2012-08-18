using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _136MVC.Models
{
    public class ProductList
    {
        List<ProductInfo> products = new List<ProductInfo>();

        public ProductList()
        {
            for (int i = 0; i < 10; i++)
            {
                products.Add(new ProductInfo(i, "Nike " + i));
            }
        }

        public List<ProductInfo> GetProductList()
        {
            return products;
        }

        public ProductInfo GetProductDetail(int producuct_id)
        {
            return products[producuct_id];
        }
    }
}