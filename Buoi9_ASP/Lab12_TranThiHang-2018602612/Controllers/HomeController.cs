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
        public ActionResult Index()
        {
            return View();
        }

        
        private fShopDB db = new fShopDB();
        public ActionResult DisplaySuplier(int? page)
        {
            var supplies = db.Nha_CC.Select(s => s);

            supplies = supplies.OrderBy(s => s.MaNCC);
            int pageSize = 3;
            int pageNumber = (page ?? 1);

            return View(supplies.ToPagedList(pageNumber, pageSize));
        }
    }
}