using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LayoutNhom08.Controllers
{
    public class SanPhamController : Controller
    {
        // GET: SanPham
        public ActionResult XemSanPhamTheoDanhMuc()
        {
            return View();
        }
        public ActionResult ChiTietSanPham()
        {
            return View();
        }
        public ActionResult GioHang()
        {
            return View();
        }
        public ActionResult DatHang()
        {
            return View();
        }
        public ActionResult TimKiemSanPham()
        {
            return View();
        }
    }
}