using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.Models
{
    public class OrgAdvance
    {
        public int OrganiserAdvanceId { get; set; }
        public int OrganiserId { get; set; }
        public string Year { get; set; }
        public decimal Advance { get; set; }
        public DateTime AdvanceDate { get; set; }
        public string Mode { get; set; }
        public string Remarks { get; set; }
        public bool isActive { get; set; }
    }
}