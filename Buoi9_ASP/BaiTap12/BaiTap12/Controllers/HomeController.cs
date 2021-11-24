using BaiTap12.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace BaiTap12.Controllers
{

    public class HomeController : Controller
    {
        private fShopDB db = new fShopDB();
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
        public ActionResult DisplaySuplier(int? page)
        {
            var supplies = db.Nha_CC.Select(s => s);

            //Cần sắp xếp trước khi phân trang
            supplies = supplies.OrderBy(s => s.MaNCC);

            int pageSize = 3; //Kích thước trang
            int pageNumber = (page ?? 1); //Nếu page bằng null thì trả về 1

            return View(supplies.ToPagedList(pageNumber, pageSize)); 
        }
    }
}