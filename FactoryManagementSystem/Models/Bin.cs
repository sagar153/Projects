using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.Models
{
    public class Bin
    {
        public int BinId { get; set; }
        public string BinName { get; set; }        
        public bool isActive { get; set; }
    }
}