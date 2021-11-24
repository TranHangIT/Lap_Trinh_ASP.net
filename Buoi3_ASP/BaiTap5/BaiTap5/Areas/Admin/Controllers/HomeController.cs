using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaiTap5.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Charts()
        {
            return View();
        }
        public ActionResult Tables()
        {
            return View();
        }
        public ActionResult Forms()
        {
            return View();
        }

    }
}