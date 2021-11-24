using Lab3_TranThiHang.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Lab3_TranThiHang.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Học lập trình MVC";

            return View();
        }

        
        public ActionResult ViewStudent()
        {
            Student student = new Student();
            ViewBag.Message = "Sinh viên";
            return View(student);
        }

    }
}