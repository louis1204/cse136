using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _136MVC.Models
{
    public class ProductVariationInfo
    {
        int product_variation_id{ get; set; }
        int product_id { get; set; }
        int product_brand_id { get; set; }
        int product_cutting_id { get; set; }
        int product_color_id { get; set; }
        int product_type_id { get; set; }
        char[] sex { get; set; }
        String size { get; set; }
        int stock { get; set; }
        float price { get; set; }
        char[] condition { get; set; }

        public ProductVariationInfo(int product_variation_id_in, int product_id_in,
            int product_brand_id_in, int product_cutting_id_in,
            int product_color_id_in, int product_type_id_in,
            char[] sex_in, String size_in, int stock_in, float price_in, char[] condition_in)
        {
            this.product_variation_id = product_variation_id_in;
            this.product_id = product_color_id_in;
            this.product_brand_id = product_brand_id_in;
            this.product_cutting_id = product_cutting_id_in;
            this.product_color_id = product_color_id_in;
            this.product_type_id = product_type_id_in;
            this.sex = sex_in;
            this.size = size_in;
            this.stock = stock_in;
            this.price = price_in;
            this.condition = condition_in;
        }
    }
}