using BaiTap2_TranThiHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaiTap2_TranThiHang.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult MyLink()
        {
            ViewBag.Message = "Liên kết của tôi.";

            return View();
        }
        public ActionResult ViewProduct()
        {
            Product product = new Product();
            product.MASP = 5;
            product.TENSP = "Lập trình ASP.NET MVC";
            product.Gia = 1250;
            product.SoLuong = 10;
            ViewBag.Message = " Xem sản phẩm.";
            return View(product);
        }

    }
}