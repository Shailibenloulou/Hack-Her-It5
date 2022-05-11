using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Clean_App.Models
{
    public class Group
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<string> Participants { get; set; }
        public Location area { get; set; }
        public Boolean IsFull { get; set; }
        public Boolean IsDone { get; set; }

        public Group()
        {
            
        }
    }
}