using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace Lab3_TranThiHang.Models
{
    public class Student
    {
        [Display(Name ="Mã sinh viên")]
        public int ID { get; set; }

        [Display(Name = "Tên sinh viên")]
        public String Name { get; set; }
        [Display(Name = "Điện thoại")]
        public String Phone { get; set; }
        [Display(Name = "Ngày bắt đầu")]
        public DateTime StartDate{ get; set; }
        public Student()
        {
            ID = 2018602612;
            Name = "Trần Thị Hằng";
            Phone = "0982768317";
            StartDate = DateTime.Now;


        }
    }
}