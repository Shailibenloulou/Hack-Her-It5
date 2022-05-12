using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;



namespace WebApplication2
{
    public class Place
    {
        public string Name { get; set; }
        public string Data { get; set; }

        public static ICollection GetAllPlaces()
        {
            return XmlTools.LoadListFromXMLSerializer<Place>(@"C:\Users\שילי\source\repos\Hack-Her-It5\WebApplication2\test.xml");
        }
    }

    
}