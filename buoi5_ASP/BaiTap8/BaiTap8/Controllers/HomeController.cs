using BaiTap8.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaiTap8.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult RegisterForm()
        {
            List<string> Cities = new List<string>
            {
                "Hà Nội", "Hải Phòng","Nam Định","Thái Bình"
            };
            ViewBag.Cities = Cities;
            return View();
        }
        [HttpPost]
        public ActionResult Register(Member mem)
        {
            var f = mem.ImageFile;
            if(f != null && f.ContentLength > 0)
            {
                String FileName = System.IO.Path.GetFileName(f.FileName);
                String UploadPath = Server.MapPath("~/UserImage/" + FileName);
                f.SaveAs(UploadPath);
                mem.ImagePath = "~/UserImage/" + FileName;
            }
            return View(mem);
        }
         public ActionResult Validation()
        {
            return View();
        }
        [ValidateInput(false)]
        public ActionResult Validate(NhanVien nv)
        {
            if (ModelState.IsValid)
            {
                ModelState.AddModelError("", "Chúc mừng bạn đã nhập đúng !");
            }
            return View("Validation");
        }
         
}
}