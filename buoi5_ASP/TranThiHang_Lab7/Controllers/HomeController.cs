using BaiTap7.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaiTap7.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Register(Student sv)
        {

            ViewBag.ThongTin = "Mã sinh viên:" + sv.Id + " -Tên sinh viên" + sv.Name + " - Điểm:" + sv.Mark;
            return View();
        }
        /*public ActionResult Register(int Id=0, string Name="",decimal Mark=0)
        {
            
            ViewBag.ThongTin = "Mã sinh viên:" + Id + " -Tên sinh viên" + Name + " - Điểm:" + Mark;
            return View();
        }
        */
        /*public ActionResult Register(FormCollection data)
        {
            int Ma = Convert.ToInt32(data["Id"]);
            string Ten = data["Name"];
            decimal Diem = Convert.ToDecimal(data["Mark"]);
            ViewBag.ThongTin = "Mã sinh viên:" + Ma + " -Tên sinh viên" + Ten + " - Điểm:" + Diem;
            return View();
        }
        */
        /*public ActionResult Register()
        {
            int Ma = Convert.ToInt32(Request["Id"]);
            string Ten = Request["Name"];
            decimal Diem = Convert.ToDecimal(Request["Mark"]);
            ViewBag.ThongTin = "Mã sinh viên:" + Ma + " -Tên sinh viên" + Ten + " - Điểm:" + Diem;
            return View();
        }
        */
    }
}