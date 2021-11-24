namespace BaiTap12.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Hang")]
    public partial class Hang
    {
        [Key]
        [StringLength(10)]
        public string MaHang { get; set; }

        [Required]
        [StringLength(10)]
        public string MaNCC { get; set; }

        [Required]
        [StringLength(255)]
        public string TenHang { get; set; }

        public decimal? Gia { get; set; }

        public decimal LuongCo { get; set; }

        [StringLength(1000)]
        public string MoTa { get; set; }

        public decimal? ChietKhau { get; set; }

        [StringLength(100)]
        public string HinhAnh { get; set; }

        public virtual Nha_CC Nha_CC { get; set; }
    }
}
