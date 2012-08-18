using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _136MVC.Models;
namespace _136MVC.Controllers
{
    public class ProductVariationController : Controller
    {
        ProductVariationList product_variations = new ProductVariationList();

        // GET: /ProductVariation/

        public ActionResult Index()
        {
            List<ProductVariationInfo> myProductVariations = product_variations.GetProductVariationList();
            return View("Index", myProductVariations);
        }

        public ActionResult Details(int product_variation_id)
        {
            ProductVariationInfo pv = product_variations.GetProductVariationDetail(product_variation_id);
            return View("Details", pv);
        }
    }
}
