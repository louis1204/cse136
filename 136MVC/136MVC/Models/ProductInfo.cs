using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _136MVC.Models
{
    public class ProductInfo
    {
        int product_id { get; set; }
        String product_name { get; set; }

        public ProductInfo(int product_id_in, String product_name_in)
        {
            this.product_id = product_id_in;
            this.product_name = product_name_in;
        }
    }
}