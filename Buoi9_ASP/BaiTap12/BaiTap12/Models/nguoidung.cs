namespace BaiTap12.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("nguoidung")]
    public partial class nguoidung
    {
        [Key]
        public int manguoidung { get; set; }

        [Required]
        [StringLength(30)]
        public string hoten { get; set; }

        [Required]
        [StringLength(50)]
        public string matkhau { get; set; }

        [Required]
        [StringLength(50)]
        public string email { get; set; }
    }
}
