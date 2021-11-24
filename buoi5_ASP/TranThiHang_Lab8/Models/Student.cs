using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BaiTap8.Models
{
    public class Student
    {
        [DisplayName("Mã sinh viên")]
        public string Id { get; set; }
        [DisplayName("Mật khẩu"), DataType(DataType.Password)]
        public string Password { get; set; }
        [DisplayName("Họ và tên")]
        public string FullName { get; set; }
        [DisplayName("Giới tính")]
         [UIHint("Boolean")]
        public bool Gender { get; set; }
        [DisplayName("Ngày sinh"), DataType(DataType.Date)]
        public DateTime Birthday { get; set; }
        [DisplayName("Ghi chú"), DataType(DataType.MultilineText)]
        public string Notes { get; set; }

    }
}