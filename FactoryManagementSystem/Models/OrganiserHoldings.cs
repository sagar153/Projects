using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.Models
{
    public class OrganiserHoldings
    {
        public int Id { get; set; }
        public int OrganiserId { get; set; }
        public string Variety { get; set; }
        public string Area { get; set; }
        public decimal ACRES { get; set; }
        public string PacketsMale { get; set; }
        public string PacketsFemale { get; set; }
        public decimal ActaulTonnage { get; set; }
        public decimal RemainingTonnage { get; set; }
        public bool isActive { get; set; }
    }
}