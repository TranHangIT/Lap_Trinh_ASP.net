namespace Bai11.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MonHoc")]
    public partial class MonHoc
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MonHoc()
        {
            DangKies = new HashSet<DangKy>();
        }

        [Key]
        [StringLength(4)]
        [DisplayName("Mã môn")]
        [Required(ErrorMessage = "Mã môn học không được để trống!")]
        public string MaMon { get; set; }


        [Required(ErrorMessage = "Tên môn học không được để trống!")]
        [DisplayName("Tên môn")]
        [StringLength(50)]
        public string TenMon { get; set; }

        [DisplayName("Số tín chỉ")]
        public int? SoTinChi { get; set; }

        [DisplayName("Số đăng ký")]
        public int? SoDangKy { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DangKy> DangKies { get; set; }
    }
}
