namespace Bai11.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SinhVien")]
    public partial class SinhVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SinhVien()
        {
            DangKies = new HashSet<DangKy>();
        }
        [Key]
        [StringLength(15)]
        [Required(ErrorMessage = "Mã sv không được để trống!")]
        [DisplayName("Mã sinh viên")]
        public string MaSV { get; set; }


        [Required(ErrorMessage = "Tên sv không được để trống!")]
        [DisplayName("Tên sinh viên")]
        [StringLength(30)]
        public string TenSV { get; set; }


        [Required(ErrorMessage = "Địa chỉ không được để trống!")]
        [DisplayName("Địa chỉ")]
        [StringLength(50)]
        public string DiaChi { get; set; }


        [Required(ErrorMessage = "Số điện thoại không được để trống!")]
        [DisplayName("SĐT")]
        [StringLength(20)]
        public string DienThoai { get; set; }


        [StringLength(50)]
        [EmailAddress(ErrorMessage = "Email không đúng định dạng!")]
        [DisplayName("Email")]
        public string Email { get; set; }

        [DisplayName("Ảnh")]
        [StringLength(50)]
        public string Anh { get; set; }


        [StringLength(40)]
        [DisplayName("Tên đăng nhập")]
        public string TenDN { get; set; }


        [StringLength(50)]
        [DisplayName("Mật khẩu")]
        public string MatKhau { get; set; }

        [DisplayName("Khoá")]
        public bool? Khoa { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DangKy> DangKies { get; set; }
    }
}
