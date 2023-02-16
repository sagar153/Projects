using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.Models
{
    public class FactoryOutward
    {
        public int FactoryOutWardId { get; set; }
        public string FactoryInTakeId { get; set; }
        public int DCNo { get; set; }
        public string Remarks { get; set; }
        public DateTime ShowingDate { get; set; }
        public decimal ShowinMoist { get; set; }
        public int Hour { get; set; }
        public bool isActive { get; set; }
    }
}