using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.Models
{
    public class FactoryIntake
    {
        public int FactoryIntakeId { get; set; }
        public int CompanyId { get; set; }
        public string Year { get; set; }
        public DateTime Date { get; set; }
        public string LorryNo { get; set; }
        public string Variety { get; set; }
        public decimal? Weight { get; set; }
        public decimal? Moist { get; set; }
        public int? Bags { get; set; }
        public int? Lot { get; set; }
        public string Executive { get; set; }
        public int BinId { get; set; }
        public string Remarks { get; set; }
        public bool isActive { get; set; }
    }
}