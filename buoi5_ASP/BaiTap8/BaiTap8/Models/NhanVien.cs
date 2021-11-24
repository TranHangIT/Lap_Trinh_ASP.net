using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BaiTap8.Models
{
    public class NhanVien
    {
        [DisplayName("Họ và tên")]
        [MinLength(5, ErrorMessage = "Tên phải có ít nhất 5 ký tự")]
        public string HoTen { get; set; }
        [DisplayName("Tuổi")]
        [Required(ErrorMessage = "Không được để trống!")]
        [Range(16, 65, ErrorMessage = "Tuổi phải từ 16 đến 65")]
        public int Tuoi { get; set; }
    }
}