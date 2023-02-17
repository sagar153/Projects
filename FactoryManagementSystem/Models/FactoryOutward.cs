using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.Models
{
    public class FactoryOutward
    {
        public int FactoryOutWardId { get; set; }
        public string Year { get; set; }
        public DateTime Date { get; set; }
        public int CompanyId { get; set; }
        public string Variety { get; set; }
        public string LorryNo { get; set; }
        public decimal Weight { get; set; }
        public int Bags { get; set; }
        public int DCNo { get; set; }
        public string CompanyExecutive { get; set; }
        public string Remarks { get; set; }
       
        public bool isActive { get; set; }
    }
}