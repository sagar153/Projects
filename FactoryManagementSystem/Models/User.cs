using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool AdminModule { get; set; }
        public bool UserModule { get; set; }
        public bool FullAccess { get; set; }
        public bool FactoryOnly { get; set; }
        public bool isActive { get; set; }
    }
}