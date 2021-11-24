using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BaiTap8.Models
{
    public class Member
    {
        public string FullName { get; set; }
        public string Password { get; set; }
        public string ImagePath { get; set; }
        public HttpPostedFileBase ImageFile { get; set; }
        public bool Single { get; set; }
        public string Gender { get; set; }
        public string City { get; set; }
        public string Active { get; set; }
        public string Description { get; set; }
    }
}