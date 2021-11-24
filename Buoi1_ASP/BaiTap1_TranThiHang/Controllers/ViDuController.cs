using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaiTap1.Controllers
{
    public class ViDuController : Controller
    {
      
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Welcome(String name, int id = 1)
        {
            ViewBag.Message = " Xin chào " + name;
            ViewBag.NumTimes = id;
            return View();
        }
    }
}