using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BaiTap9.Models
{
    public class Member
    {
        [DisplayName("Ảnh")]
        public string ImagePath{ get; set; }
        [DisplayName("Tên đăng nhập")]
        [Required(ErrorMessage = "Không được để trống!")]
        [MinLength(3, ErrorMessage = "Tên đăng nhập phải có ít nhất 3 ký tự")]
        public string Username{ get; set; }
        [DisplayName("Mật khẩu"), DataType(DataType.Password)]
        [Required(ErrorMessage = "Không được để trống!")]
        [MinLength(3, ErrorMessage = "Mật khẩu có độ dài từ 3-8 kí tự")]
        [MaxLength(8, ErrorMessage = "Mật khẩu có độ dài từ 3-8 kí tự")]
        public string Password{ get; set; }
        [DisplayName("Họ và tên")]
        [Required(ErrorMessage = "Không được để trống!")]
        public string Fullname{ get; set; }
        [DisplayName("Ngày sinh"), DataType(DataType.Date)]
        [Required(ErrorMessage = "Không được để trống!")]
        public DateTime Birthday{ get; set; }
        
        [DisplayName("Giới tính")]
        [UIHint("Boolean")]
        
        public bool Gender{ get; set; }
        [DisplayName("Địa chỉ")]
        [UIHint("Adress")]
        public string Address{ get; set; }
        [DisplayName("Địa chỉ email"), DataType(DataType.EmailAddress)]
        [EmailAddress(ErrorMessage ="Email phải nhập đúng định dạng")]
        public string Email{ get; set; }
    }
}