using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.Models
{
    public class Organisercs
    {
        public int OrganiserId { get; set; }
        public string OrganiserName { get; set; }
        public string FatherName { get; set; }
        public int Mobile { get; set; }
        public string Area { get; set; }
        public string Villlage { get; set; }
        public bool isActive { get; set; }
    }
}