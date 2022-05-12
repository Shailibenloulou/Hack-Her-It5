using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Xml.Linq;
using System.Xml.Serialization;
using System.Runtime.CompilerServices;
using System.Xml;
using System.Text;

namespace WebApplication2
{
    public partial class Default : System.Web.UI.Page
    {
        static private int GroupId = 1;

        protected void location_TextChanged(object sender, EventArgs e)
        {

        }

        [MethodImpl(MethodImplOptions.Synchronized)]
        protected void creatGroupButton_Click(object sender, EventArgs e)
        {
            var groupList = XmlTools.LoadListFromXMLSerializer<Group>(@"Groups.xml");
            Group g = new Group();


            g.Id = GroupId++;
            g.Name = nameOfGroup.Text;
            g.Description = description.Text;
            g.MaxSize = int.Parse(maxNumOfMemmbers.Text);
            User u = new User();
            u.Id = int.Parse(id.Text);
            u.FirstName = name.Text;
            u.LastName = lastName.Text;
            u.Email = mailAddress.Text;
            u.Phone = phoneNumber.Text;
            g.Participants = new List<User>() { u };
            g.Area = new Location();//to take location from map
            g.IsFull = false;
            g.IsDone = false;

            //check if location is clean

            //check if there is already a group in this area!
            //if yes, pop up "a group already exists in this area. join group, create anyway"

            if (groupList.Exists(x => x.Area.Equals(new Location())))
            { //to take location from map

            }

            groupList.Add(g);

            XmlTools.SaveListToXMLSerializer(groupList, @"C:\Users\chaya\source\repos\Hack-Her-It5\WebApplication2\xml\Groups.xml");
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ICollection<Place> temp = DLXML.beaches;
            ListView1.Items.Add((ListViewDataItem)temp);
        }
    }

    //    XmlTextWriter xmlwriter = new XmlTextWriter(Server.MapPath("App_Data/Employee.xml"), Encoding.UTF8);

    //    xmlwriter.Formatting = Formatting.Indented;

    //    xmlwriter.WriteStartDocument();

    //    xmlwriter.WriteStartElement("Employees");



    //    xmlwriter.WriteStartElement("Employee");

    //    xmlwriter.WriteAttributeString("type", "Permanent");

    //    xmlwriter.WriteElementString("ID", "100");

    //    xmlwriter.WriteElementString("FirstName", "Satheesh");

    //    xmlwriter.WriteElementString("LastName", "Babu");

    //    xmlwriter.WriteElementString("Dept", "IT");

    //    xmlwriter.WriteEndElement();



    //    xmlwriter.WriteEndElement();

    //    xmlwriter.WriteEndDocument();

    //    xmlwriter.Flush();

    //    xmlwriter.Close();

    //}

}

