using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication2
{
    public class Group
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public IEnumerable<User> Participants { get; set; }
        public Location Area { get; set; }
        public Boolean IsFull { get; set; }
        public Boolean IsDone { get; set; }

        public Group()
        {

        }
    }
}