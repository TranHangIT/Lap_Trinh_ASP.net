using BaiTap9.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaiTap9.Controllers
{
    public class MemberController : Controller
    {
        // GET: Member
        public ActionResult Index()
        {
            return View();
        }

        // GET: Member/Details/5
        public ActionResult Details(Member mem)
        {
            if(mem.ImagePath == null)
            {
                mem.ImagePath = "~/wwwroot/khongcoanh.png";
            }
            return View(mem);
        }

        // GET: Member/Create
        [HttpGet]
        public ActionResult Create()
        {
            List<string> Cities = new List<string>
            {
                "Hà Nội", "Hải Phòng", "Nam Định", "Thái Bình", "Huế", "Đà Nẵng", "TP Hồ Chí Minh", "Trần Thị Hằng"
            };
            ViewBag.Cities = Cities;
            return View();
            
        }

        // POST: Member/Create
        [HttpPost]
        public ActionResult Create(Member mem)
        {
            var f = Request.Files["ImageFile"];
            if (f != null && f.ContentLength > 0)
            {
                string FileName = System.IO.Path.GetFileName(f.FileName);
                string UploadPath = Server.MapPath("~/wwwroot/" + FileName);
                f.SaveAs(UploadPath);
                mem.ImagePath = "~/wwwroot/" + FileName;
            }
            try
            {
                return RedirectToAction("Details", mem);
            }
            catch
            {

                return View(mem);
            }

        }
        

        // GET: Member/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Member/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Member/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Member/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
