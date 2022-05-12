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
        public int MaxSize { get; set; }
        public List<User> Participants { get; set; }
        //public Location Area { get; set; }
        public string Area { get; set; }

        public Boolean IsFull { get; set; }
        public Boolean IsDone { get; set; }

        public Group()
        {
            Id = 0;
            Name = "default";
            Description = "default";
            MaxSize = 5;
            Participants = new List<User>();
            Area = "default"; //new Location(0, 0);
            IsFull = true;
            IsDone = true;
        }
    }
}