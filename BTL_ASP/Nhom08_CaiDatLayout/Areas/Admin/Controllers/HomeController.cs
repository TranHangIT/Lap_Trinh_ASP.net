using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LayoutNhom8.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult QuanlyDanhmucSanpham()
        {
            return View();
        }
        public ActionResult QuanlyDonhang()
        {
            return View();
        }
        public ActionResult QuanlySanpham()
        {
            return View();
        }
        public ActionResult QuanlyTaikhoan()
        {
            return View();
        }
        public ActionResult ThongtinDangnhap()
        {
            return View();
        }
        public ActionResult Dangnhap()
        {
            return View();
        }
    }
}