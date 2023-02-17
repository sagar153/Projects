using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.Models
{
    public class BinMoist
    {
        public int BinMoistId { get; set; }
        public int BinId { get; set; }
        public string BinName { get; set; }
        public DateTime Date { get; set; }
        public string Year { get; set; }
        public int CompanyId { get; set; }
        public string CompanyName { get; set; }
        public string Variety { get; set; }
        public decimal MorningUpMoist { get; set; }
        public decimal MorningDownMoist { get; set; }
        public decimal EvnUpmoist { get; set; }
        public decimal EvnDownMoist { get; set; }
        public bool Shelling { get; set; }
        public DateTime ShellingDate { get; set; }
        public int Lot { get; set; }
        public string Remarks { get; set; }
        public bool isActive { get; set; }
    }
}