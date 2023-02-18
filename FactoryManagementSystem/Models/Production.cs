using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FactoryManagementSystem.Models
{
    public class Production
    {
        public int ProductionId { get; set; }
        public string Year { get; set; }
        public string FarmerName { get; set; }
        public int OrganiserId { get; set; }
        public string FatherName { get; set; }
        public string Mobile { get; set; }
        public decimal ACRES { get; set; }
        public string Variety { get; set; }
        public string SurveyNo { get; set; }
        public string Village { get; set; }
        public string Area { get; set; }
        public DateTime ShowingDate { get; set; }
        public DateTime HarvestDate { get; set; }
        public decimal TotalTonnage { get; set; }
        public string Remarks { get; set; }
        public bool isActive { get; set; }
        public DateTime AddDate { get; set; }
    }
}
