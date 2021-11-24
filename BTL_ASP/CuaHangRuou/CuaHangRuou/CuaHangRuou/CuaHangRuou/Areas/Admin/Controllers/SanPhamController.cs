using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CuaHangRuou.Areas.Admin.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: Admin/SanPham
        public ActionResult QuanLySanPham()
        {
            return View();
        }

        public ActionResult CapNhatSanPham()
        {
            return View();
        }
    }
}