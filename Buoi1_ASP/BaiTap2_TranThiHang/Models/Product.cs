using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BaiTap2_TranThiHang.Models
{
    public class Product
    {
        public int MASP { get; set; }
        public String TENSP { get; set; }
        public decimal Gia{ get; set; }
        public int SoLuong { get; set; }
        public Product()
        {

        }
    }
}